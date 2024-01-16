import argparse
import sys
import os.path
import requests

SOURCE_GITHUB = "github"
SOURCE_GITLAB = "gitlab"

def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command")

    get_projects_parser = subparsers.add_parser("get_projects")
    get_projects_parser.add_argument("source", choices=[SOURCE_GITHUB, SOURCE_GITLAB])
    get_projects_parser.add_argument("user")
    get_projects_parser.add_argument("-t", "--token", default=None)

    download_projects_parser = subparsers.add_parser("download")
    download_projects_parser.add_argument("source", choices=[SOURCE_GITHUB, SOURCE_GITLAB])
    download_projects_parser.add_argument("user")
    download_projects_parser.add_argument("-d", "--dir", default=".")
    download_projects_parser.add_argument("-t", "--token", default=None)

    args = parser.parse_args()
    if args.command == "get_projects":
        get_projects(args)
    elif args.command == "download":
        download(args)
    else:
        print(f"unknown command: {args.command}")


def get_projects(args):
    projects = []
    if args.source == SOURCE_GITHUB: 
        projects = get_github_projects(args.user, args.token) 
    elif args.source == SOURCE_GITLAB:
        projects = get_gitlab_projects(args.user, args.token)
    else:
        print(f"unknown source: {args.source}")
        sys.exit(1)

    for p in projects:
        print(f"{p[0]},{p[1]},{p[2]},{p[3]}")

def download(args):
    if args.source == SOURCE_GITHUB: 
        projects = get_github_projects(args.user, args.token) 
        download_github_projects(projects, args.dir, args.token)
    elif args.source == SOURCE_GITLAB:
        projects = get_gitlab_projects(args.user, args.token)
        download_gitlab_projects(projects, args.dir, args.token)
    else:
        print(f"unknown source: {args.source}")
        sys.exit(1)

def get_github_projects(user, token):
    url = f"https://api.github.com/users/{user}/repos"
    headers = {
        "Accept": "application/vnd.github+json", 
        "X-GitHub-Api-Version": "2022-11-28",
    }
    if token is not None:
        headers["Authorization"] = f"Bearer {token}"
    params = {"affiliation":"owner", "per_page": 100}
    r = requests.get(url, params=params, headers=headers)
    if r.status_code != 200:
        raise Exception(f"request failed, got response code {r.status_code}")

    result = []
    repos = r.json()
    for repo in repos:
        owner = repo["owner"]["login"]
        name = repo["name"]
        id = repo["id"]
        proj_name = f"{owner}-{name}-{id}"
        archive_url = repo["url"] + "/zipball"
        ssh_url = repo["ssh_url"]
        http_url = repo["clone_url"]
        result.append((proj_name, archive_url, ssh_url, http_url))

    return result 

def get_gitlab_projects(user, token):
    url = f"https://gitlab.com/api/v4/users/{user}/projects"
    headers = {}
    if token is not None:
        headers["PRIVATE-TOKEN"] = token 
    params = {"owned": True}
    r = requests.get(url, params=params, headers=headers)
    if r.status_code != 200:
        raise Exception(f"request failed, got response code {r.status_code}")

    result = []
    repos = r.json()
    for repo in repos:
        id = repo["id"]
        namespace = repo["namespace"]["path"]
        name = repo["path"]
        proj_name = f"{namespace}-{name}-{id}"
        archive_url = f"https://gitlab.com/api/v4/projects/{id}/repository/archive"
        ssh_url = repo["ssh_url_to_repo"]
        http_url = repo["http_url_to_repo"]
        result.append((proj_name, archive_url, ssh_url, http_url))

    return result 

def download_github_projects(projects, dir, token):
    for p in projects:
        proj_name = p[0]
        url = p[1]
        filename = os.path.join(dir, f"{proj_name}.zip")
        print(f"downloading {proj_name} ...")
        try:
            download_github_archive(url, token, filename)
        except requests.HTTPError as err:
            print(f'could not download GitHub project {proj_name}: {err}')

def download_gitlab_projects(projects, dir, token):
    for p in projects:
        proj_name = p[0]
        url = p[1]
        filename = os.path.join(dir, f"{proj_name}.tar.gz")
        print(f"downloading {proj_name} ...")
        try:
            download_gitlab_archive(url, token, filename)
        except requests.HTTPError as err:
            print(f'could not download GitLab project {proj_name}: {err}')


def download_github_archive(url, token, filename):
    headers = {
        "Accept": "application/vnd.github+json", 
        "X-GitHub-Api-Version": "2022-11-28",
    }
    if token is not None:
        headers["Authorization"] = f"Bearer {token}"
    with requests.get(url, headers=headers, stream=True) as r:
        r.raise_for_status()
        save_to_file(r, filename)

def download_gitlab_archive(url, token, filename):
    headers = {}
    if token is not None:
        headers["PRIVATE-TOKEN"] = token 
    with requests.get(url, headers=headers, stream=True) as r:
        r.raise_for_status()
        save_to_file(r, filename)


def save_to_file(r, filename):
    with open(filename, 'wb') as f:
        for chunk in r.iter_content(chunk_size=8192):
            f.write(chunk)

if __name__ == "__main__":
    main()

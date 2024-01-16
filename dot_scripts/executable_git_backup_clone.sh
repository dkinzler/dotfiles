#!/bin/bash

github_user=""
github_token="$(cat .secrets/gh_token)"

gitlab_user=""
gitlab_token="$(cat .secrets/gl_token)"

timestamp=$(date +'%d-%m-%Y-%H-%M')
archive_name="git-backup-${timestamp}"

mkdir -p "${archive_name}"

# pass project, user, token
clone_repo() {
    local repo_name
    # local repo_archive_url
    # local repo_ssh_git_url
    local repo_http_git_url
    local url_with_credentials

    echo "getting ${repo_http_git_url} ..."
    repo_name=$(awk -F, '{print $1}' <<< "$1")
    # repo_archive_url=$(awk -F, '{print $2}' <<< "$1")
    # repo_ssh_git_url=$(awk -F, '{print $3}' <<< "$1")
    repo_http_git_url=$(awk -F, '{print $4}' <<< "$1")
    url_with_credentials="${repo_http_git_url/\/\////"$2":"$3"@}"

    git clone "${url_with_credentials}" "${archive_name}/${repo_name}"
}

readarray -t github_repos < <(python3 git_backup_tools.py get_projects github "${github_user}" -t "${github_token}")

for repo in "${github_repos[@]}"; do
    clone_repo "$repo" "$github_user" "$github_token"
done

readarray -t gitlab_repos < <(python3 git_backup_tools.py get_projects gitlab "${gitlab_user}" -t "${gitlab_token}")

for repo in "${gitlab_repos[@]}"; do
    clone_repo "$repo" "$gitlab_user" "$gitlab_token"
done

zip -r "${archive_name}.zip" "${archive_name}"

rm -rf "${archive_name}"

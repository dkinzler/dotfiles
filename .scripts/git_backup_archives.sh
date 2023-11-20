#!/bin/bash

github_user=""
github_token="$(cat .secrets/gh_token)"

gitlab_user=""
gitlab_token="$(cat .secrets/gl_token)"

timestamp=$(date +'%d-%m-%Y-%H-%M')
archive_name="git-backup-${timestamp}"

mkdir -p "${archive_name}"

python3 git_backup_tools.py download github "${github_user}"  -t "${github_token}" -d "${archive_name}"
python3 git_backup_tools.py download gitlab "${gitlab_user}"  -t "${gitlab_token}" -d "${archive_name}"

zip -r "${archive_name}.zip" "${archive_name}"

rm -rf "${archive_name}"

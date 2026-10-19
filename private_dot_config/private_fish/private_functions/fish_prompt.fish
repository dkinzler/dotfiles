function fish_prompt
    set -l pwd "$(set_color --bold cyan)$(prompt_pwd)$(set_color --reset)"
    set -l git "$(set_color --bold magenta)$(fish_git_prompt ' on %s')$(set_color --reset)"
    set -l prompt "$(set_color --bold green)> $(set_color --reset)"
    printf '\n%s%s\n%s' $pwd $git $prompt
end

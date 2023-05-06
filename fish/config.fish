#bass source ~/.profile
bass source ~/.env
set fish_greeting

set -gx TERM xterm-256color

if status is-interactive
#and not set -q TMUX
#    exec tmux
end

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git

command -qv nvim && alias vim nvim

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

function cd_playground
    cd $PLAYGROUND_DIR
end

function cd_project
    cd $PROJECT_DIR
end

function cd_freelance
    cd $FREELANCE_DIR
end

function cd_infras
    cd $PLAYGROUND_DIR/infrastructure
end

function cd_knowledge
    cd $PLAYGROUND_DIR/my-notes-knowledge
end

function update_all_git_repo
    set CUR_DIRS */
    echo $CUR_DIRS
    for i in $CUR_DIRS
        cd $i
        set CUR_BRANCH (git branch --show-current)
        echo "#### [INFO] Using the Dir $i \n"
        git fetch -p --all
        git stash
        git checkout develop
        git pull origin develop
        git checkout $CUR_BRANCH
        git stash pop
        cd ..
    end
end

function backup_config_linux
    set CUR_PWD (pwd)
    cd
    echo -n "#### [INFO] Copy .ssh key pub and private"
    rsync -av --delete ".ssh/" "$BACKUP_DIR_PERSONAL/personal-laptop/.ssh/"
    rsync -av --delete ".config/nvim" "$BACKUP_DIR_PERSONAL/personal-laptop/nvim"
    yes | cp -a "custom_shell/." "$BACKUP_DIR_PERSONAL/"
    yes | cp -a ".config/fish" "$BACKUP_DIR_PERSONAL"
    for i in .profile .zshrc .ideavimrc .p10k.zsh .zprofile .gitignore_global .bashrc .viminfo .gitconfig .bash_profile .ideavimrc .vimrc .profile_functions example.env
        echo -n "#### [INFO] do copy file $i \n"
        yes | cp -i "$i" "$BACKUP_DIR_PERSONAL/personal-laptop/$i"
    end
    echo -n "################################################################ \n"
    echo -n "#### [INFO] Copy successfully \n"
    cd $BACKUP_DIR_PERSONAL
    pwd
    set CUR_DATE (date)
    echo -n "Content: $argv[1] - Commit to git on $CUR_DATE"
    git status
    git add .
    git commit -m "Content: $argv - Commit to git on $CUR_DATE"
    git push origin master
    git push bitbucket master
    cd $CUR_PWD
end

function compile_cpp
    rm -rf temp_file
    g++ -std=c++14 -o temp_file $argv[1]
    ./temp_file
    rm -rf temp_file
end

function git_cfg_custom
   echo "Git config global or local repo"
   read IS_GIT_GLOBAL
   if [ -n $IS_GIT_GLOBAL  ]
        set GIT_GLOBAL_PARAM "--global"
   end
   echo "Enter the name of Company you want to config (leave Empty if there is personal): "
   read COMPANY
   set GIT_TARGET_USR $GIT_FORMAL_NAME
   switch $COMPANY
        case 'B13'
            set GIT_TARGET_EMAIL $GIT_B13_EMAIL
        case 'b13'
            set GIT_TARGET_EMAIL $GIT_B13_EMAIL
        case 'b13-technology'
            set GIT_TARGET_EMAIL $GIT_B13_EMAIL
        case 'pyco'
            set GIT_TARGET_EMAIL $GIT_PYCO_EMAIL
        case 'ptc'
            set GIT_TARGET_EMAIL $GIT_PYCO_EMAIL
        case 'PYCO'
            set GIT_TARGET_EMAIL $GIT_PYCO_EMAIL
        case 'Pycogroup'
            set GIT_TARGET_EMAIL $GIT_PYCO_EMAIL
        case MCP
            set GIT_TARGET_EMAIL $GIT_MC_EMAIL
        case Michael Page
            set GIT_TARGET_EMAIL $GIT_MC_EMAIL
        case '*'
            echo -n "Use Personal Git configuration"
            set GIT_TARGET_USR $GIT_PERSONAL_NAME
            set GIT_TARGET_EMAIL $GIT_PERSONAL_EMAIL
    end
    echo -n "$GIT_TARGET_USR - $GIT_TARGET_EMAIL with Mode: $GIT_GLOBAL_PARAM"
    git config $GIT_GLOBAL_PARAM user.name "$GIT_TARGET_USR"  
    git config $GIT_GLOBAL_PARAM user.email "$GIT_TARGET_EMAIL"
end

function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

function port_in_use
    lsof -i :$argv[1]
end

function fast_upgrade
    sudo npm update -g
    sudo pacman-key --populate
    pamac update
end

function ide
    tmux split-window -v -p 30
    tmux split-window -h -p 66
    tmux split-window -h -p 50
end

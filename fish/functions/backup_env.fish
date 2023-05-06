function backup_env
    set CUR_PWD (pwd);
    cd;
    echo -n "#### [INFO] Copy .ssh key pub and private";
    rsync -av --delete ".ssh/" "${BACKUP_DIR_PERSONAL}/personal-laptop/.ssh/";
    rsync -av --delete ".config/nvim" "${BACKUP_DIR_PERSONAL}/personal-laptop/nvim";
    yes | cp -a "custom_shell/." "${BACKUP_DIR_PERSONAL}/"

end

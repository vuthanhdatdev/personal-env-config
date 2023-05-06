#!/bin/bash
#
GIT_BACKUP_REPO="git@gitlab.com:vuthanhdat/personal-linux-configuration.git"
echo "#### [INFO] Start the restore config from ${GIT_BACKUP_REPO}";
cd;
git clone ${GIT_BACKUP_REPO}

cd ./personal-linux-configuration/personal-laptop/
for i in .profile .zshrc .ideavimrc .p10k.zsh .zprofile .gitignore_global .bashrc .viminfo .gitconfig .bash_profile .ideavimrc;
	do
		echo "\n#### [INFO] do copy file ${i}";
		yes | cp -i "${i}" "~/${i}";
	done;
echo "#### [INFO] Copy successfully";
cd;
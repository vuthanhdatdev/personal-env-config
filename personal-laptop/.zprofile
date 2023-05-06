export EDITOR=/usr/bin/vim
export PATH=$PATH:/home/vuthanhdat/Software/jdk1.8.0_221/bin:/home/vuthanhdat/.gem/ruby/2.7.0/bin:/snap/bin
export JAVA_HOME=/home/vuthanhdat/Software/jdk1.8.0_221
export ANDROID_SDK_ROOT=/home/vuthanhdat/Android/Sdk

alias maven_ivy_profile='cd /opt/maven/conf; sudo cp -i settings-ivy.xml settings.xml;'
alias maven_origin_profile='cd opt/maven/conf; sudo cp -i settings-origin.xml setting.xml;'
alias cd_freelance='cd ~/Project/Freelance;'
alias cd_ubitec='cd ~/Project/Ubitec'
alias cd_playground='cd ~/Project/playground/;'
alias cd_balboa='cd ~/Project/Ubitec/balboa;'
alias show_all_startup_services='systemctl list-unit-files | grep enabled'
alias show_all_running_services='systemctl | grep running'
alias cd_knowledge='cd ~/Project/playground/my-notes-knowledge'
# edit current file when forgot location or Name
alias edit_zprofile='vim ~/.zprofile'
alias source_zprofile='source ~/.zprofile'

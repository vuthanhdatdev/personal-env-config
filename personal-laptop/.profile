export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
unsetopt auto_name_dirs
export EDITOR=/usr/bin/vim

export PATH=$PATH:/home/vuthanhdat/.gem/ruby/2.7.0/bin:/snap/bin
export ANDROID_SDK_ROOT=/home/vuthanhdat/Android/Sdk

function maven_ivy_profile { cd /opt/maven/conf; sudo cp -i settings-ivy.xml settings.xml; }
function maven_origin_profile { cd /opt/maven/conf; sudo cp -i settings-origin.xml settings.xml; }
function cd_freelance() { cd ${FREELANCE_DIR}; return 0; }
function cd_software() { cd ${SOFTWARE_DIR}; return 0; }
function cd_playground() { cd ${PLAYGROUND_DIR}; return 0; }
function cd_project() { cd ${PROJECT_DIR}; return 0; }
function cd_balboa() { cd ${PROJECT_DIR}/Ubitec/balboa; return 0; }
function cd_knowledge() { cd ${PLAYGROUND_DIR}/my-notes-knowledge; return 0;}
function cd_infras() { cd ${PLAYGROUND_DIR}/infrastructure; return 0;}

function balboa_full() { cd_balboa; balboa_master; balboa_build; }
function ssh_balboa_dev() { ssh ${BALBOA_URL} }
function fix_skype_issue() { sudo sysctl -w kernel.unprivileged_userns_clone=1 }
function fix_skype_issue_chrome_sandbox() { sudo chmod 4755 /usr/share/skypeforlinux/chrome-sandbox }
function cd_kafka() { cd cd ${SOFTWARE_DIR}/kafka_2.12-2.3.0/ }
function fix_teamviewer { sudo teamviewer daemon restart }
function git_unchange { git update-index --assume-unchanged $1 }

function git_diff_unpushed { git diff origin/$1..HEAD }
function git_log_unpushed { git log origin/$1..HEAD }
function exec_1111 { python ${PLAYGROUND_DIR}/1111/1111.py }

function ssh_patient_pack() { sshpass -p ${PP_PWD} ssh ${PP_URL}; }
function ssh_substrakt_test() { sshpass -p ${SUBSTRAKT_TEST_PWD} ssh ${SUBSTRAKT_TEST_URL}; }
function ssh_substrakt_dev() { sshpass -p ${SUBSTRAKT_DEV_PWD} ssh ${SUBSTRAKT_DEV_URL}; }
function ssh_aos_dev() { sshpass -p ${AOS_DEV_PWD} ssh ${AOS_DEV_URL}; }
alias set_fish_as_default="chsh -s $(which fish)"
alias set_z_as_default="chsh -s $(which zsh)"

alias mvn_skip_test="mvn install -DskipTests"
alias mvn_spring_boot="mvn spring-boot:run"
alias mvn_less="mvn org.lesscss:lesscss-maven-plugin:1.7.0.1.1:compile"



# Added by Toolbox App
export PATH="$PATH:/home/vuthanhdat/.local/share/JetBrains/Toolbox/scripts"


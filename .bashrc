export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Bizon aliases - v1.2

alias bizonhelp='
echo v1.2 - 03-2020
echo -e "\033[0;34m-----------------Bizontool------------------------------\033[0m"
echo -e bizonapp ---------------"\033[31;1mLaunch the Bizonapp\033[0m"
echo -e cpu-ram ----------------"\033[31;1mStress CPU + RAM at 100%\033[0m"
echo -e gpu-dl ---------------"\033[31;1mWill run a Pytorch 2.0 training job to test your GPUs and give you an score, the lower the score the better\033[0m"
echo -e dl-SOCram ---------------"\033[31;1mWill run a YOLOv8 vision DL test to stress GPUs and Memory area SOCvrm as well\033[0m"
echo -e gpu-burn ------------"\033[31;1mWill run GPU burn test for 1h  to test your GPUs\033[0m"
echo -e nvidia-bug ------------"\033[31;1mWill run a GPU tool to analize the nvidia-bug-report.sh file\033[0m"
echo -e Nvlink -----------------"\033[31;1mWill check the status of Nvlinks\033[0m"
echo -e Nvidia-full ------------"\033[31;1mWill provide full info list about Nvidia GPUs\033[0m"
echo -e jupyter-local ----------"\033[31;1mStart a local jupyter notebook\033[0m"
echo -e jupyter-remote ---------"\033[31;1mStart a remote notebook server\033[0m"
echo -e jupyter-help -----------"\033[31;1mUsefull commands and remote client config to access the notebook\033[0m"
echo
#echo -e "\033[0;34m----------------Bizonapps-------------------------------\033[0m"
#echo
#echo -e "\033[0;34m---------------GPU_Monitoring---------------\033[0m"
#echo -e bizonmon ---------------"\033[31;1mInstall web monitoring UI to check GPU statistics\033[0m"
#echo -e bizonmon-start-temp ----"\033[31;1mStart the monitoring app service until cancel\033[0m"
#echo -e bizonmon-start ---------"\033[31;1mStart the monitoring app service on the background\033[0m"
#echo -e bizonmon-stop ----------"\033[31;1mWill stop the process of reporting GPU status completly\033[0m"
echo
#echo -e "\033[0;34m---------------WebUI-Remote_control---------------\033[0m"
#echo -e bizonweb-start ---------"\033[31;1mWill start the webUI app\033[0m"
#echo -e bizonweb-status --------"\033[31;1mProvide status of the webUI\033[0m"
#echo -e bizonweb-stop   --------"\033[31;1mStop the webUI process\033[0m"
#echo -e bizonweb-help ----------"\033[31;1mUsefull Information about the webUI\033[0m"
#echo
#echo -e "\033[0;34m-----------------DL-Frameworks-------------------------------\033[0m"
#echo -e tensorflow -----"\033[31;1mOpen Tensorflow NGC container\033[0m"
#echo -e pytorch --------"\033[31;1mOpen Pytorch NGC container\033[0m"
#echo -e Theano ---------"\033[31;1mOpen Theano NGC container\033[0m"
#echo -e caffe2 ---------"\033[31;1mOpen Caffe2 NGC container\033[0m"
#echo -e digits ---------"\033[31;1mOpen Digits NGC container\033[0m"
#echo
#echo -e "\033[31;1m-----------------Beta-features---------------------------\033[0m"
#echo -e tensorflow-jupyter ----------"\033[0;34mOpen a tensorflow NGC container with Jupyter UI\033[0m"
#echo -e Importan: After launchin tensorflow-jupyter need to type jupyter lab --port=8888 --ip=0.0.0.0 --allow-root --no-browser inside the container
#echo -e tensorflow-1gpu -------------"\033[0;34mOpen tensorflow container with 1x GPU available\033[0m"
#echo note: to use multiple gpus just type the number of GPUs you want to use'





#Tensorflow NGC

alias tensorflow='sudo docker run --gpus all -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33'
alias tensorflow-1gpu='sudo docker run --gpus 0  -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33'
alias tensorflow-2gpu='sudo docker run --gpus device=0,1  -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33'
alias tensorflow-3gpu='sudo docker run --gpus device=0,1,2  -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33'
alias tensorflow-4gpu='sudo docker run --gpus device=0,1,2,3  -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33'

#Pytorch NGC
alias pytorch=''

#Theano NGC
alias theano=''

#Caffe2 NGC
alias caffe2=''

#Digits NGC
alias digits=''

#Temp - Change to bash script for bizonhelp

alias tensorflow-jupyter='
sudo docker run --gpu all -p "8888:8888" -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33'


#How to start jupyter notebook inside a container (Nvidia conatiner, tensorflow)

#Link: https://devtalk.nvidia.com/default/topic/1032202/using-a-jupyter-notebook-within-a-docker-container/?offset=11

#Example of running a tensorflow container with the notebook
#sudo nvidia-docker run -p "8888:8888" -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm 621fd859db33
#Once inside the container
#jupyter lab --port=8888 --ip=0.0.0.0 --allow-root --no-browser
#Open a webbrowser on the client machine
#http://(hostip):8888/tree
#Replace (hostip) for your hist machine IP

#Insert the token on the host and enjoy your notebook

#------WebUI
alias nvidia-bug='
cd /home/bizon/nvidia_bug_report_tool
python3 app.py'

alias bizonweb-start='
sudo systemctl enable cockpit.socket
sudo systemctl start cockpit.socket'
alias bizonweb-status='sudo systemctl status cockpit.socket'
alias bizonweb-stop='
sudo systemctl disable cockpit.service cockpit.socket
sudo reboot'
alias bizonweb-help='
echo -Access webUi http://hostip:9090'

alias bizonmon='pip install git+https://github.com/fgaim/gpuview.git@master'
alias bizonmon-start-temp='gpuview run --safe-zone'
alias bizonmon-start='
gpuview service --safe-zone
echo open web browser and type host ip and port 9988 to access the dashboard'
alias bizonmon-stop='sudo supervisorctl stop gpuview'
alias bizonmon-help='
echo check status on a web browser http://localhost:9988
echo Find more info at:
echo www.bizon-tech.com/bizonmon-doc'

alias cpu-ram='stress-ng --cpu 0 --cpu-method all --vm 0 --vm-bytes 100% --aggressive --verify -t 1h'

alias bizonapp='
conda deactivate
cd /home/bizon/Downloads/bizon_full_app
python3 main.py'

alias gpu-dl='
cd /home/bizon/Pytroch2.0_GPU_benchmark
conda activate pytorch2.0
python3 trainer.py'

alias gpu-burn='
docker run --rm --gpus all gpu_burn
'

alias Nvlink='nvidia-smi nvlink --status'

alias Nvidia-full='nvidia-smi -i 0 -q'

alias jupyter-local='jupyter notebook'

alias jupyter-remote='jupyter notebook --no-browser --port=8889'

alias jupyter-help='
echo For remote config follow the steps:
echo 1- run the command Jupyter-remote
echo 2- on the client need to run this command on a terminal:
echo ssh -N -f -L localhost:8888:localhost:8889 user@domain
echo The host will give you a token, then when opening a webrowser and typing
echo http://localhost:8888/tree on the client machine, insert your token
echo Enjoy your notebook from any location
echo To get access out of your local network need to configure router porforwarding'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bizon/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bizon/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bizon/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bizon/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

dl-SOCram() {  read -p 'Enter GPUs to use (e.g., 0,1,2,3): ' GPUs;  read -p 'Enter batch size (e.g., 8): ' batch_size;  read -p 'Enter number of epochs (e.g., 60): ' epochs;  cd /home/bizon/healthcheck/ultralytics && python train_test.py --batch $batch_size --device $GPUs --epochs $epochs;}
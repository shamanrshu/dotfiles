#######

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi


# Для начала определить некоторые цвета:
red='\e[0;31m' # Красный, темнее след.
RED='\e[1;31m' # Красный, светлее пред.
blue='\e[0;34m' # Синий, темнее след.
BLUE='\e[1;34m' # Синий, светлее пред.
cyan='\e[0;36m' # Циановый, темнее след.
CYAN='\e[1;36m' # Циановый, светлее пред.
NC='\e[0m' # No Color (нет цвета)

# Определил 2 раза для удобства :)
Black='\e[0;30m'
DarkGray='\e[1;30m'
Blue='\e[0;34m'
LightBlue='\e[1;34m'
Green='\e[0;32m'
LightGreen='\e[1;32m'
Cyan='\e[0;36m'
LightCyan='\e[1;36m'
Red='\e[0;31m'
LightRed='\e[1;31m'
Purple='\e[0;35m'
LightPurple='\e[1;35m'
Brown='\e[0;33m'
Yellow='\e[1;33m'
LightGray='\e[0;37m'
White='\e[1;37m'
NoColor='\e[0m'

# Лучше выглядит на черном фоне.....
echo -en "${red}"
date "+%A, %d %B %Yг. %H:%M:%S (%:::z - %Z)"
echo -en "$NC\n"

if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # сделает наш день более интересным.... :-)
fi



export HISTSIZE=1000 # Длина истории команд
export HISTFILE=~/.bash_history # Где хранить историю команд
export HISTCONTROL="ignoredups" # Не дублировать команды

# Разрешающие настройки:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob

# Запрещающие настройки:
shopt -u mailwarn
unset MAILCHECK

ulimit -S -c 0          # Запрет на создание файлов coredump
set -o notify
set -o noclobber
set -o ignoreeof


PROMPT_COMMAND='history -a'



# ---=== ALIASES ===---
alias poweroff="sudo shutdown -h now"
alias reboot="sudo reboot"

alias ERR='2>>( sed -ue "s/.*/$fg_bold[red]&$reset_color/" 1>&2 )'
alias now='date "+%A, %d %B, %G%t%H:%M %Z(%z)"'
alias today='date "+%d %h %y"'
alias msgs='tail -f /var/log/messages'
alias logc="grc cat"
alias logt="grc tail"
alias logh="grc head"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


alias ls="/bin/ls --color=auto --group-directories-first"
alias ll="/bin/ls -lh --color --group-directories-first"				# Отображает символьную инфу о типе файла
alias l1="/bin/ls -1Fh --color --group-directories-first"			# Вывод содержимого каталога в один столбец + отображение символьной инфы о типах файлов
alias lr="/bin/ls -Rh --color --group-directories-first"				# Вывод содержимого с подкаталогами
alias la="/bin/ls -lAh --color --group-directories-first"			# Подробный пывод содержимого каталога, включая скрытые файлы
alias ls='/bin/ls -hFh --color --group-directories-first'			# выделить различные типы файлов цветом
alias lx='/bin/ls -lXBh --color --group-directories-first'			# сортировка по расширению
alias lk='/bin/ls -lSrh --color --group-directories-first'			# сортировка по размеру
alias lc='/bin/ls -lcrh --color --group-directories-first'			# сортировка по времени изменения
alias lu='/bin/ls -lurh --color --group-directories-first'			# сортировка по времени последнего обращения
alias lt='/bin/ls -ltrh --color --group-directories-first'			# сортировка по дате
alias lm='/bin/ls -lAh --color --group-directories-first | more'	# вывод через 'more'
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias lls="ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g'  -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'" # C цифровым выводом прав
alias lsr="tree -Csu"

alias gclo='git clone'
alias gst='git status'
alias glog="git log --format='%Cgreen%h%Creset %C(yellow)%an%Creset - %s' --graph"
alias gpul='git pull'
alias gpus='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias g='git'
alias gcount='git shortlog -sn'
alias gss='git status -s'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias gca='git commit -a'
alias gsa='git submodule add'

alias pwn="sudo chown -R $USER:$USER"
alias chm="sudo chmod"
alias chm7="sudo chmod 777"
alias chm75="sudo chmod 755"
alias chmr="sudo chmod -R"
alias chmr7="sudo chmod -R 777"
alias chmr75="sudo chmod -R 755"
alias cho="sudo chown"
alias chor="sudo chown -R"
alias chg="sudo chgrp"
alias chgr="sudo chgrp -R"

alias md="/bin/mkdir"
alias mds="sudo /bin/mkdir"
alias mkdirs="sudo /bin/mkdir"
alias mdp="/bin/mkdir -p"
alias mdps="sudo /bin/mkdir -p"

alias cp="/bin/cp -iv"
alias cps="sudo /bin/cp -irv"
alias cpi="/bin/cp -v"
alias cpis="sudo /bin/cp -v"
alias cpR="/bin/cp -Rv"
alias cpRs="sudo /bin/cp -Rv"
alias cpr="/bin/cp -Riv"
alias cprs="sudo /bin/cp -Riv"

alias mv="/bin/mv -ivrf"
alias mvs="sudo /bin/mv -iv"
alias mvi="/bin/mv -v"
alias mvis="sudo /bin/mv -v"

alias rm="/bin/rm -ivrf"
alias rms="sudo /bin/rm -iv"
alias rmi="/bin/rm -v"
alias rmis="sudo /bin/rm -v"
alias rmr="/bin/rm -Rfiv"
alias rmrs="sudo /bin/rm -Rfiv"
alias rmri="/bin/rm -Rfv"
alias rmris="sudo /bin/rm -Rfv"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cls="/usr/bin/clear" # Если ты привык к консоле винды, то тебе это поможет
alias h='history' # История команд
alias j='jobs -l' # Задания
alias path='echo -e ${PATH//:/\\n}' # Значение переменной окружения $PATH
alias recfg='. ~/.bashrc' # Перечитать настройки BASH (иногда бывает полезно, особенно для отладки)

alias du='/usr/bin/du -kh' # Размер всех подкаталогов в каталоге (включая др. ф.с.)
alias duS='/usr/bin/du -khxS' # Размер всех папок в каталоге (не переходить в др. ф.с.)
alias dus='/usr/bin/du -khxs' # Размер каталога (не переходить в др. ф.с.)
alias df='/bin/df -kTH' # Занятое пространство на диске
alias df='df -h | grep sd |\
        sed -e "s_/dev/sda[1-9]_\x1b[34m&\x1b[0m_" |\
        sed -e "s_/dev/sd[b-z][1-9]_\x1b[33m&\x1b[0m_" |\
        sed -e "s_[,0-9]*[MG]_\x1b[36m&\x1b[0m_" |\
        sed -e "s_[0-9]*%_\x1b[32m&\x1b[0m_" |\
        sed -e "s_9[0-9]%_\x1b[31m&\x1b[0m_" |\
        sed -e "s_/mnt/[-_A-Za-z0-9]*_\x1b[34;1m&\x1b[0m_"'
alias duch='du -ch | grep insgesamt |\
        sed -e "s_[0-9]*,[0-9]*[B|G|K|M|T]_\x1b[32m&\x1b[0m_"'

alias upgrade='sudo apt-get update ; sudo apt-get dist-upgrade' # Обновление пакетов
alias apt_search='sudo apt-cache search ' # Поиск пакетов в репозиториях
alias apt_install='sudo apt-get install ' # Установить пакет из репозитория
alias apt_remove='sudo apt-get remove ' # Удалить пакет из системы
alias apt_purge='sudo apt-get purge ' # Удалить пакет из системы и его конф. файлы
alias apt_autoremove='sudo apt-get autoremove' # Автоматически удалить не нужные пакеты из системы

alias 'cd-'='cd -' # Перейти в последнюю дирректорию (бывает забываю пробем поставить)

alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

alias sbcl="rlwrap -pred -r -s 65536 -m -i -c -D 2 sbcl"
alias pong="ping -c 3 www.google.com"
alias bc="bc -l"
alias ports="netstat -tulanp"
alias get='wget -t0 -c'
alias ports='netstat -nape --inet'
alias ports2='netstat lnptu'
alias ping='ping -c 4'
alias ns='netstat -alnp --protocol=inet'


function dfp() # Сколько занято на опр. ф.с. в %

{

 /bin/df -kh | /bin/grep $1 | /usr/bin/cut -c41-43

}



function lg() # ls -lAh --color <path> | grep <filter>

{

if [ "$1" = "" ] && [ "$2" = "" ]; then

echo -en "\n${Blue}Команда$NC ${LightRed}lg$NC ${Blue}выводит список файлов с фильтрацией (тоже самое, что ${LightRed}ls -lA$NoColor ${Red}<patn>${NoColor} ${LightRed}| grep${NoColor} ${Red}<filtet>${NoColor}${Blue})${NoColor}"

echo -en "\n${Cyan}Использование:$NC ${LightRed}lg$NC ${Red}[path] <filter>$NC"

echo -en "\n${Cyan}Если$NC ${Red}[path]$NC ${Cyan}не задан, то используется текущая дирректория.$NC\n\n"

elif [ "$1" != "" ] && [ "$2" = "" ]; then

 /bin/ls -lAh --color $(/bin/pwd) | /bin/grep $1

else

 /bin/ls -lAh --color $1 | /bin/grep $2

fi

}



function my_ip() # IP адрес

{

MY_IP=$(/sbin/ifconfig wlan0 | /usr/bin/awk '/inet/ { print $2 } ' | /bin/sed -e s/addr://)

MY_ISP=$(/sbin/ifconfig wlan0 | /usr/bin/awk '/P-t-P/ { print $3 } ' | /bin/sed -e s/P-t-P://)

}



function ii() # Дополнительные сведения о системе

{
echo -e "\nВы находитесь на ${RED}$HOSTNAME"
echo -e "\nДополнительная информация:$NC " ; /bin/uname -a
echo -e "\n${RED}В системе работают пользователи:$NC " ; /usr/bin/w -h
echo -e "\n${RED}Дата:$NC " ; /bin/date +"%A, %d %B %Yг. %H:%M:%S (%:::z - %Z)"
echo -e "\n${RED}Время, прошедшее с момента последней перезагрузки :$NC " ; /usr/bin/uptime
echo -e "\n${RED}Память :$NC " ; /usr/bin/free
 my_ip 2>&- ;
echo -e "\n${RED}IP адрес:$NC" ; echo ${MY_IP:-"Соединение не установлено"}
echo -e "\n${RED}Адрес провайдера (ISP):$NC" ; wget -q -O - checkip.dyndns.com/ | awk '{print $6}'| sed 's/<.*>//'
echo
}



function swap() # меняет 2 файла местами

{

if [ "$1" = "" ] || [ "$2" = "" ]; then

echo ""

echo -e "${blue}Команда$NC ${RED}swap$NC ${blue}меняет 2 файла местами$NC"

echo -e "${cyan}Использование:$NC ${RED}swap$NC ${red}<file1> <file2>$NC"

echo ""

else

local TMPFILE=tmp.$$

 /bin/mv -v "$1" $TMPFILE

 /bin/mv -v "$2" "$1"

 /bin/mv -v $TMPFILE "$2"

fi

}



function sswap() # меняет 2 файла местами с правами root'a

{

if [ "$1" = "" ] || [ "$2" = "" ]; then

echo ""

echo -e "${blue}Команда$NC ${RED}sswap$NC ${blue}меняет 2 файла местами с правами root'а$NC"

echo -e "${cyan}Использование:$NC ${RED}sswap$NC ${red}<file1> <file2>$NC"

echo ""

else

local TMPFILE=tmp.$$

 sudo /bin/mv -v "$1" $TMPFILE

 sudo /bin/mv -v "$2" "$1"

 sudo /bin/mv -v $TMPFILE "$2"

fi

}



function myps()

{

 ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ;

}

function pp()

{

 myps f | /usr/bin/awk '!/awk/ && $0~var' var=${1:-".*"} ;

}





function lowercase() # перевести имя файла в нижний регистр

{

for file ; do

filename=${file##*/}

case "$filename" in

 */*) dirname==${file%/*} ;;

 *) dirname=.;;

esac

nf=$(echo $filename | tr A-Z a-z)

newname="${dirname}/${nf}"

if [ "$nf" != "$filename" ]; then

 /bin/mv "$file" "$newname"

echo "lowercase: $file --> $newname"

else

echo "lowercase: имя файла $file не было изменено."

fi

done

}





# Поиск файла по шаблону:

function ff()

{

if [ "$1" = "" ]; then

echo ""

echo -e "${blue}Команда$NC ${RED}ff$NC ${blue}ищет файл по шаблону в текущем каталоге$NC"

echo -e "${cyan}Использование:$NC ${RED}ff$NC ${red}<шаблон>$NC"

echo ""

else

 /usr/bin/find . -type f -iname '*'$*'*' -ls ;

fi

}





# Поиск файла по шаблону в $1 и запуск команды в $2 с ним:

function fe()

{

if [ "$1" = "" ] || [ "$2" = "" ]; then

echo ""

echo -e "${blue}Команда$NC ${RED}fe$NC ${blue}ищет файл по шаблону в текущем каталоге и выполняет заданную команду над ним$NC"

echo -e "${cyan}Использование:$NC ${RED}ff$NC ${red}<шаблон> <команда>$NC"

echo ""

else

 /usr/bin/find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \; ;

fi

}





# поиск строки в файлах:

function fstr_help()

{

echo -en "\n${blue}Команда$NC ${RED}fstr$NC ${blue}ищет заданную строку в файлах из текущего католога и его подкаталогах$NC\n"

echo -en "${cyan}Использование:$NC ${RED}fstr$NC ${red}[-i] \"шаблон_строки_для_поиска\" [\"шаблон_имени_файла\"]$NC\n"

echo -en " ${red}-i$NC ${blue}- не учитывать регистр$NC\n"

echo -en " ${blue}если$NC ${red}\"шаблон_имени_файла\"$NC ${blue}не задан, то поиск ведется по всем файлам$NC\n\n"

}





function fstr()

{

OPTIND=1

local case=""

local usage="${blue}Команда$NC ${RED}fstr$NC ${blue}ищет заданную строку в файлах из текущего католога и его подкаталогах$NC

${cyan}Использование:$NC ${RED}fstr$NC ${red}[-i] \"шаблон_строки_для_поиска\" [\"шаблон_имени_файла\"]$NC

${red}-i$NC - не учитывать регистр

если \"шаблон_имени_файла\" не задан, то поиск ведется по всем файлам"

while getopts :it opt

do

case "$opt" in

 i) case="-i " ;;

#*) echo "$usage"; return;;

 *) fstr_help; return;

esac

done

shift $(( $OPTIND - 1 ))

if [ "$#" -lt 1 ]; then

#echo "$usage"

 fstr_help

return;

fi

local SMSO=$(tput smso)

local RMSO=$(tput rmso)

 /usr/bin/find . -type f -name "${2:-*}" -print0 | /usr/bin/xargs -0 /bin/grep -sn ${case} "$1" 2>&- | /bin/sed "s/$1/${SMSO}\0${RMSO}/gI" | /bin/more

}

if [ `id -un` = root ]; then
PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
   else
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
fi

function _exit()        # функция, запускающаяся при выходе из оболочки
{
    echo -e "${RED}Аста ла виста, бэби ${NC}"
}
trap _exit EXIT

#-----------------------------------
# Функции для работы с файлами и строками:
#-----------------------------------

# Поиск файла по шаблону:
function ff() { find . -type f -iname '*'$*'*' -ls ; }
# Поиск файла по шаблону в $1 и запуск команды в $2 с ним:
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }
# поиск строки по файлам:
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: поиск строки в файлах.
Порядок использования: fstr [-i] \"шаблон\" [\"шаблон_имени_файла\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    local SMSO=$(tput smso)
    local RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sn ${case} "$1" 2>&- | \
sed "s/$1/${SMSO}\0${RMSO}/gI" | more
}

function cuttail() # удалить последние n строк в файле, по-умолчанию 10
{
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}

function lowercase()  # перевести имя файла в нижний регистр
{
    for file ; do
        filename=${file##*/}
        case "$filename" in
        */*) dirname==${file%/*} ;;
        *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: имя файла $file не было изменено."
        fi
    done
}

function swap()         # меняет 2 файла местами
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}


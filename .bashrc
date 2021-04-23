## +--------------------------------+
## | BASHRC by Kaverin S. Alexander |
## +--------------------------------+
##
## Необходимо установить пакеты: yay -S exa tree git fortune-mod-ru grc bc bat metasploit (?!)

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# Переключение раскладки Win+Space
setxkbmap "us,ru" ",winkeys" "grp:win_space_toggle"

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

# Приветствие при логине
echo -en "${LightRed}"
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
set bell-style                 none
set bind-tty-special-chars     on
set completion-ignore-case     on
set completion-map-case        on
set completion-query-items     200
set convert-meta               off
set echo-control-characters    off
set enable-keypad              on
set enable-meta-key            on
set history-preserve-point     off
set history-size               1000
set horizontal-scroll-mode     off
set input-meta                 on
set mark-directories           on
set mark-modified-lines        off
set mark-symlinked-directories on
set match-hidden-files         off
set meta-flag                  on
set output-meta                on
set page-completions           on
set show-all-if-ambiguous      on
set show-all-if-unmodified     on
set skip-completed-text        on
set visible-stats              on
set colored-stats on
set completion-prefix-display-length 3



PROMPT_COMMAND='history -a'



# ---=== ALIASES ===---
#alias msfconsole="msfconsole --quiet -x \"db_connect msf@msf\""

alias poweroff="sudo shutdown -h now"
alias reboot="sudo reboot"

alias ERR='2>>( sed -ue "s/.*/$fg_bold[red]&$reset_color/" 1>&2 )'	# Вывод ошибок в цвете
alias now='date "+%A, %d %B, %G%t%H:%M %Z(%z)"'				# Текущая дата и время
alias today='date "+%d %h %y"'						# Текущая дата
alias cat="grc --colour=auto cat"					# Цветной cat
alias less="bat"							# Цветной less
alias tail="grc --colour=auto tail"					# Цветной tail
alias head="grc --colour=auto head"					# Цветной head
alias grep='grep --color=auto'						# Цветной grep
alias fgrep='fgrep --color=auto'					# Цветной fgrep
alias egrep='egrep --color=auto'					# Цветной egrep

# Лучшее отображение листинга. Необходимо установить exa
alias ll="exa -lh --color=auto --group-directories-first"			# Отображает символьную инфу о типе файла
alias l1="exa -1Fh --color=auto --group-directories-first"			# Вывод содержимого каталога в один столбец + отображение символьной инфы о типах файлов
alias lr="exa -Rh --color=auto --group-directories-first"			# Вывод содержимого с подкаталогами
alias la="exa -lah --color=auto --group-directories-first"			# Подробный пывод содержимого каталога, включая скрытые файлы
alias ls='exa -hFh --color=auto --group-directories-first'			# выделить различные типы файлов цветом
alias lx='exa -xBh --color=auto --group-directories-first'			# сортировка по расширению
alias lk='exa -lSrh --color=auto --group-directories-first'			# сортировка по размеру
alias lu='exa -lurh --color=auto --group-directories-first'			# сортировка по времени последнего обращения
alias lt='exa -ltrh --time=accessed --color=auto --group-directories-first'	# сортировка по дате
alias lm='exa -lah --color=auto --group-directories-first | more'		# вывод через 'more'
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias lls="exa -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g'  -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'" # C цифровым выводом прав
alias lsr="tree -Csu"								# вывод файлов деревом со всеми подкаталогами

# Работа с github
alias gclo='git clone'				# Клонирование репозитория
alias gst='git status'				# Какие файлы в каком состоянии находятся
alias glog="git log --format='%Cgreen%h%Creset %C(yellow)%an%Creset - %s' --graph"	# Вывод логов
alias gpul='git pull'				# Получение изменений из репозиториев
alias gpus='git push'				# Помещение изменений в репозиторий
alias gc='git commit -v'			# Коммит изменений в репозиторий
alias gca='git commit -v -a'			# Коммит изменений в репозиторий по всем файлам
alias gco='git checkout'			# Создание отдельной ветки
alias gcob='git checkout -b'			# Создание отдельной ветки и переключение на нее
alias gcm='git checkout master'			# Создание отдельной ветки от master
alias gb='git branch'				# Показывает все ветки
alias gba='git branch -a'			# Показывает все ветки и сравнивает с репозиторием
alias ga='git add'				# Добавить содержимое директории в индекс
alias gm='git merge'				# Произвести слияние веток
alias grh='git reset HEAD'			# Перевести указатель на последний коммит ветки master
alias grhh='git reset HEAD --hard'		# Вне зависимости от всего перевести указатель на последний коммит ветки master
alias g='git'					# Сокращение git
alias gcount='git shortlog -sn'			# Отображение лога изменений
alias gss='git status -s'			# Отображение статуса репозитоиия
alias gcp='git cherry-pick'			# Взять изменения, внесённые каким-либо коммитом, и попытаться применить их заново в виде нового коммита наверху текущей ветки
alias glg='git log --stat --max-count=5'	# Отображение пяти последних изменений
alias glgg='git log --graph --max-count=5'	# Отображение пяти последних изменений в виде дерева
alias gca='git commit -a'			# Коммит изменений в репозиторий
alias gsa='git submodule add'			# Добавление нового подмодуля в проект

# Работа с правами
alias pwn="sudo chown -R $USER:$USER"	# Рекурсивное изменение владельца файлов
alias chm="sudo chmod"			# Изменение разрешений файла
alias chm7="sudo chmod 777"		# Установка всех разрешений всем
alias chm75="sudo chmod 755"		# Все могут читать и запускать, владелец только читать
alias chmr="sudo chmod -R"		# Рекурсивное изменение разрешений файлов
alias chmr7="sudo chmod -R 777"		# Рекурсивная установка разрешений всем RWX
alias chmr75="sudo chmod -R 755"	# Рекурсивная установка разрешений всем на чтение и выполнение, а владельцу и на запись
alias cho="sudo chown"			# Изменение владельца файла
alias chor="sudo chown -R"		# Рекурсивное изменение владельца файла
alias chg="sudo chgrp"			# Изменение группы файла
alias chgr="sudo chgrp -R"		# Рекурсивное изменение группы файла

# Создание каталогов
alias md="/bin/mkdir"			# Создание каталога
alias mds="sudo /bin/mkdir"		# Создание каталога от превилегированного пользователя
alias mkdirs="sudo /bin/mkdir"		# Создание каталога от превилегированного пользователя
alias mdp="/bin/mkdir -p"		# Создание каталога без вывода ошибок
alias mdps="sudo /bin/mkdir -p"		# Создание каталога от превилегированного пользователя без вывода ошибок

# Копирование файлов
alias cp="/bin/cp -iv"		# Копирование, спрашивать перезапись
alias cps="sudo /bin/cp -irv"	# Копирование от root, спрашивать перезапись
alias cpi="/bin/cp -v"		# Копирование
alias cpis="sudo /bin/cp -v"	# Копирование от root
alias cpR="/bin/cp -Rv"		# Рекурсивное копирование
alias cpRs="sudo /bin/cp -Rv"	# Рекурсивное копирование от root
alias cpr="/bin/cp -Riv"	# Рекурсивное копирование, спрашивать перезапись
alias cprs="sudo /bin/cp -Riv"	# Рекурсивное копирование от root, спрашивать перезапись

# Перемещение файлов
alias mv="/bin/mv -iv"		# Перемещение, спрашивать перезапись
alias mvs="sudo /bin/mv -iv"	# Перемещение от root, спрашивать перезапись
alias mvi="/bin/mv -v"		# Перемещение
alias mvis="sudo /bin/mv -v"	# Перемещение от root

# Удаление файлов
alias rm="/bin/rm -vrf"		# Рекурсивное удаление, ничего не спрашивать
alias rms="sudo /bin/rm -iv"	# Удаление от root
alias rmi="/bin/rm -v"		# 

# Опечатки при переходе по каталогам
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Разное
alias cls="/usr/bin/clear" # Очистка экрана
alias h='history' # История команд
alias j='jobs -l' # Задания
alias path='echo -e ${PATH//:/\\n}' # Значение переменной окружения $PATH
alias recfg='. ~/.bashrc' # Перечитать настройки BASH (иногда бывает полезно, особенно для отладки)
alias ip="ip -c" # Информация о сети в цвете

# Определение занимаемого места
alias du='/usr/bin/du -kh'	# Размер всех подкаталогов в каталоге (включая др. ф.с.)
alias duS='/usr/bin/du -khxS'	# Размер всех папок в каталоге (не переходить в др. ф.с.)
alias dus='/usr/bin/du -khxs'	# Размер каталога (не переходить в др. ф.с.)
alias df='/bin/df -kTH'		# Занятое пространство на диске

# Сведения о свободном месте на примонтированных файловых системах
alias df='echo "Диск:            ФС:        Всего:      Зан.:  Св.:           %:  (.):" ;\
	df -kTH | grep sd |\
	sed -e "s_/dev/sda[1-9]_\x1b[34m&\x1b[0m_" |\
        sed -e "s_/dev/sd[b-z][1-9]_\x1b[33m&\x1b[0m_" |\
        sed -e "s_[,0-9]*[MG]_\x1b[36m&\x1b[0m_" |\
        sed -e "s_[0-9]*%_\x1b[32m&\x1b[0m_" |\
        sed -e "s_9[0-9]%_\x1b[31m&\x1b[0m_" |\
        sed -e "s_/mnt/[-_A-Za-z0-9]*_\x1b[34;1m&\x1b[0m_"'

alias duch='du -ch | grep insgesamt |\
        sed -e "s_[0-9]*,[0-9]*[B|G|K|M|T]_\x1b[32m&\x1b[0m_"'

# Обновление ОС
alias upgrade='yay -Syyuuu && sudo pacman -Scc && sudo pacman -Rsn $(pacman -Qdtq) && sudo rm -rf ~/.cache/thumbnails/'

# Исправление частых опечаток
alias 'cd-'='cd -'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

# Работа с сетью
alias pong="grc --colour=auto ping -c 3 www.google.com"		# Проверка доступности Интернет по ICMP
alias bc="grc --colour=auto bc -l"
alias get='wget -t0 -c'						# Скачивание фаулов
alias ports='grc --colour=auto netstat -nape --inet'		# Открытые порты
alias ping='grc --colour=auto ping -c 4'			# Проверка доступности узла по ICMP
alias ns='grc --colour=auto netstat -alnp --protocol=inet'	# Открытые порты
alias anyconnect='sudo /opt/cisco/anyconnect/bin/vpnui &'	# Cisco AnyConnect

function renum() {
	x=$1
	for file in `ls`; do
  		mv ./${file} ./$x${file}
		((x+=1))
	done

}


function myip() { # Внешний IP адрес
	lwp-request -o text checkip.dyndns.org | awk '{ print "Внешний IP: " $NF }'
}


function ii() # Дополнительные сведения о системе
{
	echo -e "\n${CYAN}Вы находитесь на ${RED}$HOSTNAME"
	echo -e "\n${CYAN}Дополнительная информация:$NC " ; /bin/uname -a
	echo -e "\n${CYAN}В системе работают пользователи:$NC " ; /usr/bin/w -h
	echo -e "\n${CYAN}Дата:$NC " ; /bin/date +"%A, %d %B %Yг. %H:%M:%S (%:::z - %Z)"
	echo -e "\n${CYAN}Время, прошедшее с момента последней перезагрузки :$NC " ; /usr/bin/uptime
	echo -e "\n${CYAN}Память :$NC " ; /usr/bin/free my_ip 2>&- ;
	echo -e "\n${CYAN}Адрес провайдера (ISP):$NC" ; wget -q -O - checkip.dyndns.com/ | awk '{print $6}'| sed 's/<.*>//'
echo
}


# Показывает все запущенные процессы текущего пользователя
function myps() {
	grc --colour=auto ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ;
}

function pp() {
	myps f | /usr/bin/awk '!/awk/ && $0~var' var=${1:-".*"} ;
}


function lowercase() { # перевести имя файла в нижний регистр
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


# Поиск файла по шаблону:
function ff() {
	if [ "$1" = "" ]; then
		echo ""
		echo -e "${blue}Команда$NC ${RED}ff$NC ${blue}ищет файл по шаблону в текущем каталоге$NC"
		echo -e "${cyan}Использование:$NC ${RED}ff$NC ${red}<шаблон>$NC"
		echo ""
	else
		find . -type f -iname '*'$*'*' -ls ;
	fi
}


# Поиск файла по шаблону в $1 и запуск команды в $2 с ним:
function fe() {
	if [ "$1" = "" ] || [ "$2" = "" ]; then
		echo ""
		echo -e "${blue}Команда$NC ${RED}fe$NC ${blue}ищет файл по шаблону в текущем каталоге и выполняет заданную команду над ним$NC"
		echo -e "${cyan}Использование:$NC ${RED}ff$NC ${red}<шаблон> <команда>$NC"
		echo ""
	else
		find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \; ;
	fi
}


# Поиск строки в файлах:
function fstr_help() {
	echo -en "\n${blue}Команда$NC ${RED}fstr$NC ${blue}ищет заданную строку в файлах из текущего католога и его подкаталогах$NC\n"
	echo -en "${cyan}Использование:$NC ${RED}fstr$NC ${red}[-i] \"шаблон_строки_для_поиска\" [\"шаблон_имени_файла\"]$NC\n"
	echo -en " ${red}-i$NC ${blue}- не учитывать регистр$NC\n"
	echo -en " ${blue}если$NC ${red}\"шаблон_имени_файла\"$NC ${blue}не задан, то поиск ведется по всем файлам$NC\n\n"
}


function fstr() {
	OPTIND=1
	local case=""
	local usage="${blue}Команда$NC ${RED}fstr$NC ${blue}ищет заданную строку в файлах из текущего католога и его подкаталогах$NC
	${cyan}Использование:$NC ${RED}fstr$NC ${red}[-i] \"шаблон_строки_для_поиска\" [\"шаблон_имени_файла\"]$NC
	${red}-i$NC - не учитывать регистр если \"шаблон_имени_файла\" не задан, то поиск ведется по всем файлам"
	while getopts :it opt
	do
		case "$opt" in
			i) case="-i " ;;
			*) fstr_help; return;
		esac
	done
	shift $(( $OPTIND - 1 ))
	if [ "$#" -lt 1 ]; then
		fstr_help
		return;
	fi
	local SMSO=$(tput smso)
	local RMSO=$(tput rmso)
	find . -type f -name "${2:-*}" -print0 | /usr/bin/xargs -0 /bin/grep -sn ${case} "$1" 2>&- | /bin/sed "s/$1/${SMSO}\0${RMSO}/gI" | /bin/more
}

# Настройка приглашения командной строки
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

# Тестирование производительности хоста online
function pcbench () {
	wget -qO- bench.sh | bash
}

# Альтернативный тести производительности хоста online
function pcbench2 {
	wget -qO- wget.racing/nench.sh | bash
}


# Для запуска Armitage
function Armitage {
	sudo systemctl start postgresql.service
	sudo msfrpcd -U msf -P msf -S
	export MSF_DATABASE_CONFIG="`ls ~/.msf4/database.yml`"
	sudo -E armitage
	sudo pkill -f msfrpcd
	sudo systemctl stop postgresql.service
}

# Поиск NSE скриптов в nmap

nsearch() {
	find /usr/share/nmap/scripts/ | grep $1;
}

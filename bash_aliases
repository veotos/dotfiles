# Colores
negro='\e[0;30m'
rojo='\e[0;31m'
verde='\e[0;32m'
amarillo='\e[1;33m'
azul='\e[0;34m'
purpura='\e[0;35m'
cian='\e[0;36m'
marron='\e[0;33m'
gris='\e[0;37m'
celeste='\e[1;34m'
blanco='\e[1;37m'
original="\033[0m"

# Alias de trabajo
#alias tutex='cd ~/Documents/TUSAT/TUSAT-ADCS-MAG'
#alias patex='cd ~/Documents/PAPER/paper-mixed-latex-en'
#alias aero='cd ~/Documents/PAPER/AEROSAILS'
#alias tumatlab='cd ~/Documents/TUSAT/TUSAT-ADCS-MAG/matlab && ~/Matlab/bin/matlab'
#alias hackopter='cd ~/Documents/HACKOPTER'
#alias escritorio='cd ~/Desktop'
#alias qbito='cd /home/veotos/Dropbox/Qbito/ADCS_SW/MatlabScripts/Mains/embedded_Matlab_functions && ~/Matlab/bin/matlab'
#alias learning='cd ~/Scripts/Learning'
#alias gtd='vim  ~/Dropbox/gtd'
#alias qbitotime='cd ~/Documents/QBITO/MatlabScripts/Time'
#alias qbitocoor='cd ~/Documents/QBITO/MatlabScripts/Coordinates'
#alias arduinomatlab='cd ~/Documents/MATLAB/ArduinoMatlab && ~/Matlab/bin/matlab'
alias development='tmux -f ~/.tmux/development.conf attach '
alias killdevelopment='tmux kill-session -t development '
# Alias mejora presentación de listado de archivos y directorios
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias l='ls -l'
alias gmesh='/home/veotos/Documents/QBITO/gmsh-2.8.2-Linux/bin/gmsh'
# Alias de apt
alias instalar='sudo apt-get install'
alias desinstalar='sudo apt-get remove'
alias reinstalar='sudo apt-get --reinstall install'
alias buscar='apt-cache search'
alias actualizarSistema='sudo apt-get update && sudo apt-get upgrade'
# Alias of Mutt
alias gmailmutt='mutt -F .mutt-gmail'
alias eusocmutt='mutt -F .mutt-eusoc'
#
# PATH para texlive
export PATH=$PATH:/usr/local/texlive/2012/bin/i386-linux 
# PATH para scripts propios
export PATH=$PATH:/home/veotos/Scripts/Mantenimiento
export PATH=$PATH:/home/veotos/Scripts/Internet
export PATH=$PATH:/home/veotos/Scripts/Latex
export PATH=$PATH:/home/veotos/Scripts/Learning
# PATH for learning python with scripting book
export PATH=$PATH:/home/veotos/Documents/PYTHON/scripting/src/app/oscillator/F77/

# Simple Backup function
function backup()  {
    newname=$1.`date +%Y%m%d.%H%M.bak`;
    mv $1 $newname;
    echo "Backed up $1 to $newname.";
    cp -p $newname $1;
}
#--------------------------------------------------------------------////
# Inicio de sesión
#--------------------------------------------------------------------////
echo -e "${amarillo}"; figlet -c -f mini "Bienvenido $USER";
echo -e "${rojo}Hoy es:\t\t\t${celeste}" `date`; echo -e "\e[0m";
#echo -e "${rojo}Información del sistema:\t${celeste}"`uname -a`
#ccal

if [ -x /usr/games/fortune ]; then
fortune -a | cowsay -n  -f www;
fi
# Set keyboard input in VIM mode
set -o vi

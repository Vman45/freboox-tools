#!/bin/bash
config_file=$HOME/.config/freebox/remote_control
if [ ! -f ${config_file} ]
then
    echo "Please $config_file not present, create file with remote control code"
    exit 1
fi

cmd=$1
code=$(cat $config_file) 
commands="


power : la touche rouge on/off 
list : la touche d’affichage de la liste des chaînes entre power et tv 
tv : la touche verte TV de commutation péritel. 
 
0 à 9 : les touches 0 à 9 
 
back : la touche jaune en dessous du 7 
swap : la touche en dessous du 9 
 
info, mail, help, pip : les touches bleues à droite des numéros de chaîne 
epg, media, options : les fonctionnalités \"secondaires\" de ces mêmes touches 
 
vol_inc, vol_dec : volume+ et volume- 
prgm_inc, prgm_dec : program+ et program- 
ok : touche OK 
up, right, down, left : les touches directionnelles entourant le OK 
 
mute : la touche de mise en sourdine 
home : la touche free 
rec : la touche d’enregistrement 
bwd : la touche de retour en arrière (<<) 
prev : la touche \"précédent\" (|<<) 
play : la touche lecture/pause 
fwd : la touche d’avance rapide (>>) 
next : la touche \"suivant\" (>>|) 

(grabbed from : http://www.universfreebox.com/article/10808/Comment-creer-un-telecommande-virtuelle-pour-la-Freebox)
"

case ${cmd} in
    -h|--help)
        echo "command '${cmd}' not supported try : ${commands}"
        ;;
    *)
        curl --silent --show-error "http://hd1.freebox.fr/pub/remote_control?code=${code}&key=${cmd}"
        ;;
esac


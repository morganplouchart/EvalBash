#! bin/bash

function menu() {
    printf '\033[1;34;40m'
    echo "                                                                    "
    echo "-----> BIENVENU SUR VOTRE SERVEUR <----"
    echo "                                                                    "
    printf '\033[0m'                                                                 
PS3="Quel est votre choix ? : "
OPTIONS=("Install php" "Install mysql" "Install phpmyadmin" "Quitter le logiciel")
select opt in "${OPTIONS[@]}"; do
    case $opt in
            "Install php")
            sudo apt-get install php7.0 -y
            menu
            ;;
            "Install mysql")
            sudo apt-get install mysql -y
            sudo apt-get install php7.0-mysql -y
            menu
            ;;
            "Install phpmyadmin")
            sudo apt-get install phpmyadmin
            menu
            ;;
            "Quitter le logiciel")
            printf '\033[43m'
            read -p "Voulez vous vraiment quitter le logiciel oui ou non  " decision
            printf '\033[0m'
            if [ $decision = "oui" ]
            then
                exit
            else
                menu
            fi
            ;;
            *) echo "invalid option";;
    esac
done
}
menu
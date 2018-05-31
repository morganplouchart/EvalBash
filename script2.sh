#! bin/bash
#read -p "Voulez-vous installer php? repondez par oui ou non  " decision
#if [ $decision = "oui" ]
#then 
#    sudo apt-get install php7.0 -y
#else
#    echo "Ok on install pas php"
#fi

function menu() {
PS3="Quel est votre choix ? : "
OPTIONS=("Install php" "install mysql" "Install phpmyadmin" "Quitter votre serveur" "Quit")
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
            sudo apt-get install phpmyadmin -y
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
            "Quit")
                exit
                ;;
            *) echo "invalid option";;
    esac
done
}
menu
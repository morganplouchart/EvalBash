#! bin/bash

function writeVagrantfile {

 echo "Vagrant.configure('2') do |config|
        config.vm.box = '"$box"'
        config.vm.synced_folder '"$data"','"$html"'
        config.vm.network '"private_network"', ip: '"$ip"'
        end" > Vagrantfile

}

function menu {
                touch Vagrantfile
                printf '\033[1;34;40m'
                echo "                                                                    "
                echo "-----> VOUS AVEZ CHOISI DE CONTINUER A VIVRE DANS LA MATRIX VIRTUELLE <----"
                echo "                                                                    "
                printf '\033[0m'
                read -p "Quel est le nom de la VirtualBox à installer ex:ubuntu/xenial64  " box
                echo "----------------------------------------------------------------"
                printf '\033[43m'
                read -p "La box choisi est $box voulez-vous continuez oui ou non ?  " choix
                printf '\033[0m'
                echo "----------------------------------------------------------------"
                if [ $choix = "oui" ]
                then
                    read -p "Quel est le nom de votre dossier local ex: data ?  " data
                    mkdir $data
                    echo "-----------------------------------------"
                    read -p "Quel est le chemin de votre dossier sur le serveur distant ex: /var/www/html ?  " html
                    echo "-----------------------------------------" 
                    read -p "quel ip avez-vous choisi  " ip
                    writeVagrantfile
                    mv script2.sh $data
                    vagrant up
                    vagrant ssh -c "cd /var/www/html && bash script2.sh";
                elif [ $choix = "non" ]
                then
                    menu
                fi
               }



function ready {
sudo apt-get install eog
eog neo.jpg
PS3="Quel est votre choix ? : "
OPTIONS=("Pilulle rouge" "Pilulle bleu")
select opt in "${OPTIONS[@]}"; do
    case $opt in
        
            "Pilulle rouge")
            echo "Si vous prenez la pillule rouge tout s'arrête, la vérité éclate, et rien ne sera comme avant  "
            read -p "Prendre la pillule rouge ? oui ou non:  " decision
            if [ $decision = "oui" ]
            then
                Pillulebleu
            elif [ $decision = "non" ]
            then
                menu
            fi
            ;;

            "Pilulle bleu")
                echo "vous avez pris la pillule bleu, votre vie continu...."
                menu
            ;;
            *) echo "invalid option";;
    esac
done

}
ready


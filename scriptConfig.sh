#!/bin/bash
# faire 4 fichier template

path="config.xml"
VAR3="nim.chcolat.fr"
ip="10.129.63.122"

read -p "Bridge (yes/no) : " bridge
while ! [[ "$bridge" =~ ^(yes|no)$ ]]; do
    read -p "Bridge (yes/no) : " bridge
done


if [ "$bridge" == "yes" ]; then
    cp templateBridge.xml config.xml
    read -p "Entrez la nouvelle adresse IP pour le bridge : " bridge_ip
    while ! [[ $bridge_ip =~ ^([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$ ]]; do
        read -p "L'adresse IP doit être au format xxx.xxx.xxx.xxx. Entrez la nouvelle adresse IP pour le bridge : " bridge_ip
    done
    sed -i "s/$ip/$bridge_ip/g" "$path"

    else cp templateNoBridge.xml config.xml
fi
read -p "Entrez la valeur du nouvel octet (3 chiffres) : " var2
while [[ ! $var2 =~ ^[0-9]{3}$ ]]; do
    read -p "La valeur doit contenir 3 chiffres. Entrez la valeur du nouvel octet (3 chiffres) : " var2
done



read -p "Entrez le nouveau site (ex: tol pour Toulon) : " VAR4
while [[ ! $VAR4 =~ ^[a-zA-Z]{3}$ ]]; do
    read -p "Le site doit contenir 3 lettres. Entrez le nouveau site (ex: tol pour Toulon) : " VAR4
done
VAR4="$VAR4.chcolat.fr"

sed -i "s/10\.5\.117\./10.5.$var2./g" "$path"
sed -i "s/$VAR3/$VAR4/g" "$path"




echo "Le fichier config.xml a été modifié avec succès."

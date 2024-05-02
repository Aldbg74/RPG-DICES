#!/bin/bash

roll_die() {
    faces=$1
    echo $(($RANDOM % $faces + 1))
}

is_integer() {
    [[ $1 =~ ^[0-9]+$ ]]
}

read -p "Entrez le nombre de dés: " num_dice

if ! is_integer $num_dice; then
    echo "Veuillez entrer un nombre entier valide."
    exit 1
fi
s
read -p "Entrez le nombre de faces par dé: " num_faces

if ! is_integer $num_faces; then
    echo "Veuillez entrer un nombre entier valide."
    exit 1
fi

while true; do
    echo "Résultats des lancers de dés :"
    for ((i=1; i<=$num_dice; i++)); do
        result=$(roll_die $num_faces)
        echo "Dé $i : $result"
    done

    read -p "Voulez-vous lancer à nouveau les dés ? (Tapez 'CHANGE1' pour changer le nombre de dés, 'CHANGE2' pour changer le nombre de faces, ou 'END' pour quitter): " input

    if [[ $input == "END" ]]; then
        echo "Au revoir !"
        exit 0
    fi

    if [[ $input == "CHANGE1" ]]; then
        read -p "Entrez le nouveau nombre de dés: " num_dice
        continue
    fi

    if [[ $input == "CHANGE2" ]]; then
        read -p "Entrez le nouveau nombre de faces par dé: " num_faces
        continue
    fi

    # Si l'entrée n'est pas valide
    echo "Entrée invalide. Veuillez taper 'CHANGE1' pour changer le nombre de dés, 'CHANGE2' pour changer le nombre de faces, ou 'END' pour quitter."
done

#!/bin/bash

NUM1=10
NUM2=30

SUM=$(($NUM1+$NUM2))
echo "Sum of $NUM1 and $NUM2 is $SUM"

#Array
MOVIES=("Inception" "Interstellar" "The Dark Knight")
echo "First movie is ${MOVIES[0]}"
echo "All movies are ${MOVIES[@]}"
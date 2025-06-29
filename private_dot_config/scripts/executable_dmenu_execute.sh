#!/bin/bash
SCRIPT_DIR=$1

SELECTED=$(ls $SCRIPT_DIR | dmenu -b)

bash $SCRIPT_DIR/$SELECTED


#!/bin/bash

read -p "Old version: " oldVersion
read -p "New version: " newVersion

phplist=$(apt list --installed | grep php$oldVersion | awk -F '[/:]' '{print $1}')
sudo apt install ${phplist//$oldVersion/$newVersion}

read -p "Do you want to remove PHP $oldVersion? [y/N]" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
  then
    sudo apt remove php$oldVersion*
fi

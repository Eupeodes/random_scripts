#!/bin/bash

oldVersion=7.0
newVersion=7.3

phplist=$(apt list --installed | grep php$oldVersion | awk -F '[/:]' '{print $1}')
sudo apt install ${phplist//$oldVersion/$newVersion}

sudo apt remove php$oldVersion*

#!/bin/bash
# mkprj.sh: create a new project based on the template

read -p "Project name: " p_name
cp -r _template $p_name
cd $p_name

sed -i -e "s/tmpl/${p_name}/g" CMakeLists.txt
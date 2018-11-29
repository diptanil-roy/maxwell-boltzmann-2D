#! /bin/bash

chmod +x main.sh
for d in */ ; do
    cd $d;
    chmod +x Simulate
    cd ..
done

if [ $(dpkg-query -W -f='${Status}' python2.7 2>/dev/null | grep -c "ok installed") -eq 1 ] || [ $(dpkg-query -W -f='${Status}' python3 2>/dev/null | grep -c "ok installed") -eq 1 ] || [ $(dpkg-query -W -f='${Status}' python3.1 2>/dev/null | grep -c "ok installed") -eq 1 ] || [ $(dpkg-query -W -f='${Status}' python3.2 2>/dev/null | grep -c "ok installed") -eq 1 ] || [ $(dpkg-query -W -f='${Status}' python3.3 2>/dev/null | grep -c "ok installed") -eq 1 ];
then
  python_ver= $(echo python -V | sed ':a;N;$!ba;s/\n/ /g')

  echo -e "$python_ver is installed! Good to go!\n";
else
  echo -e "You don't have Python installed, please install Python by typing:\nsudo apt-get install python2.7 ";
  exit 1;
fi

if [ $(dpkg-query -W -f='${Status}' python-pip 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	if [ $(dpkg-query -W -f='${Status}' python2.7 2>/dev/null | grep -c "ok installed") -eq 0 ];
	    then
		sudo apt-get install python3-pip
		PIP=pip3;
	    else
		sudo apt-get install python-pip
		PIP=pip;
	    fi
else
	if [ $(dpkg-query -W -f='${Status}' python2.7 2>/dev/null | grep -c "ok installed") -eq 0 ];
	    then
		PIP=pip3;
	    else
		PIP=pip;
	    fi
fi


echo "Let's check if you have pygame installed:"
if [ $(sudo -H $PIP install pygame| grep -c "already satisfied") -eq 0 ];
then
     sudo -H $PIP install pygame  &> /dev/null 
    echo -e "Did you encounter any error? (Yes/ No)"
      read choice
      if [ $choice = yes ] || [ $choice = Yes ];
	then 
		echo -e "Then follow this link to install PyGame: https://askubuntu.com/questions/401342/how-to-download-pygame-in-python3-3 .\n"
		exit 1
      	fi	
 else
 	echo "PyGame is installed.";
 fi

echo "We are ready to start the program."

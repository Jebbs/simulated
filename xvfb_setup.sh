if [[ "$OSTYPE" == "linux-gnu" ]]
	then
  		sh -e /etc/init.d/xvfb start
  		sleep 3 # give xvfb some time to start
fi
rm -rf var/*
rm -rf pub/static/*
rm -rf generated/*
chmod 777 var -R
chmod 777 pub/static -R
chmod 777 pub/media -R
chmod 777 generated -R
echo "Cache folders removed... \n"

if [ "$1" = "-u" ]
	then
	/opt/lampp/bin/php bin/magento setup:upgrade
	chmod 777 var -R
	chmod 777 pub/static -R
	chmod 777 pub/media -R
	echo "Setup Upgraded... \n"
fi

if [ "$1" = "-f" ]
	then
	/opt/lampp/bin/php bin/magento cache:flush
	echo "\nCache Flushed... \n"
fi

if [ "$1" = "-d" ]
	then
	/opt/lampp/bin/php bin/magento setup:static-content:deploy en_US en_GB -f
fi

chmod 777 var -R
chmod 777 pub/static -R
chmod 777 pub/media -R
chmod 777 generated -R
echo "Clean up complete! \n"
notify-send "Its Clean!" "Cleaned up magento"

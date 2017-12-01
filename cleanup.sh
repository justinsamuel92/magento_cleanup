rm -rf var/*
rm -rf pub/static/*
rm -rf generated/*
chmod 777 var -R
chmod 777 pub/static -R
chmod 777 pub/media -R
echo "Cache folders removed... \n"

if [ "$1" = "-u" ]
	then
	rm -rf app/code/Mgt/Varnish/etc/module.xml
	rm -rf app/code/Mgt/Varnish/registration.php
	/opt/lampp/bin/php bin/magento setup:upgrade
	echo "Setup Upgraded... \n"
fi

if [ "$1" = "-f" ]
	then
	/opt/lampp/bin/php bin/magento cache:flush
	echo "\nCache Flushed... \n"
	chmod 777 var -R
	chmod 777 pub/static -R
	chmod 777 pub/media -R
	chmod 777 generated -R
fi

if [ "$1" = "-d" ]
	then
	/opt/lampp/bin/php bin/magento setup:static-content:deploy -f
fi

echo "Clean up complete! \n"
notify-send "Its Clean!" "Cleaned up magento"

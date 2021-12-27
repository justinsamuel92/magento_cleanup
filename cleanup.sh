sudo rm -rf var/*
sudo rm -rf pub/static/* 
sudo rm -rf generated/*
sudo chmod 777 var -R
sudo chmod 777 pub/static -R
sudo chmod 777 pub/media -R
sudo chmod 777 generated -R
echo "Cache folders removed... \n"

if [ "$1" = "-u" ]
	then
	sudo rm -rf app/code/Mgt/Varnish/etc/module.xml
	sudo rm -rf app/code/Mgt/Varnish/registration.php
	sudo /opt/lampp/bin/php -dmemory_limit=5G bin/magento setup:upgrade
	sudo chmod 777 var -R
	sudo chmod 777 pub/static -R
	sudo chmod 777 pub/media -R
	echo "Setup Upgraded... \n"
	notify-send "Setup Upgraded" "Upgraded Magento Schema"
fi

if [ "$1" = "-f" ]
	then
	sudo /opt/lampp/bin/php bin/magento cache:flush
	echo "\nCache Flushed... \n"
	notify-send "Cache Flushed" "Cleared Magento Cache"
fi

if [ "$1" = "-d" ]
	then
	/opt/lampp/bin/php -dmemory_limit=5G bin/magento setup:static-content:deploy en_US en_GB fr_FR -f
	notify-send "Deployed" "Deployed static-content"
fi

if [ "$1" = "-dg" ]
	then
	/opt/lampp/bin/php -dmemory_limit=5G bin/magento setup:static-content:deploy en_GB -f
	notify-send "Deployed" "Deployed static-content"
fi

if [ "$1" = "-df" ]
	then
	/opt/lampp/bin/php -dmemory_limit=5G bin/magento setup:static-content:deploy fr_FR -f
	notify-send "Deployed FR" "Deployed FR static-content"

fi

if [ "$1" = "-i" ]
	then
	/opt/lampp/bin/php bin/magento indexer:reindex
	notify-send "Reindexed" "Re-indexed site data"

fi

sudo chmod 777 var -R
sudo chmod 777 pub/static -R
sudo chmod 777 pub/media -R
sudo chmod 777 generated -R
echo "Clean up complete! \n"

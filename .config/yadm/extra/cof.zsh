PATH=$PATH:/usr/sbin
if [ -f /usr/local/cof/bin/cofproxy ]
then source /usr/local/cof/bin/cofproxy > /dev/null 2>&1
fi

if [[ ! -v ALL_PROXY ]]
then cofproxy on
fi

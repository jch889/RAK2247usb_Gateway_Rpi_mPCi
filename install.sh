#!/bin/bash

# Stop on the first sign of trouble
set -e

if [ $UID != 0 ]; then
    echo "ERROR: Operation not permitted. Forgot sudo?"
    exit 1
fi

#$1=create_img

SCRIPT_COMMON_FILE=$(pwd)/rak/rak/shell_script/rak_common.sh
source $SCRIPT_COMMON_FILE


rpi_model=`do_get_rpi_model`

ARGS=`getopt -o "" -l "help,img,chirpstack:" -- "$@"`

eval set -- "${ARGS}"

INSTALL_CHIRPSTACK=1

CREATE_IMG=""


# select gw model
#./choose_model.sh $CREATE_IMG
JSON_FILE=./rak/rak/rak_gw_model.json
RAK_GW_JSON=./rak/rak/gateway-config-info.json
INSTALL_LTE=0

echo_yellow "RAK2247(USB)"
GW_MODEL=RAK2247
do_set_spi_to_json 0

linenum=`sed -n "/gw_model/=" $JSON_FILE`
sed -i "${linenum}c\\\\t\"gw_model\": \"$GW_MODEL\"," $JSON_FILE

linenum=`sed -n "/install_lte/=" $RAK_GW_JSON`
sed -i "${linenum}c\\\\t\"install_lte\": \"$INSTALL_LTE\"," $RAK_GW_JSON

function do_set_spi_to_json()
{
    JSON_FILE=./rak/rak/rak_gw_model.json
    
    linenum=`sed -n "/spi/=" $JSON_FILE`
    sed -i "${linenum}c\\\\t\"spi\": \"$1\"" $JSON_FILE
}


apt update
pushd rak
./install.sh $CREATE_IMG
sleep 1
popd
set +e
write_json_chirpstack_install $INSTALL_CHIRPSTACK
set -e

if [ "$INSTALL_CHIRPSTACK" = 1 ]; then
    pushd chirpstack
    ./install.sh $CREATE_IMG
    sleep 1
    popd
fi

pushd lora
./install.sh $CREATE_IMG
sleep 1
popd

echo_success "*********************************************************"
echo_success "*  The RAKwireless gateway is successfully installed!   *"
echo_success "*********************************************************"

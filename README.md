# RAK2247usb_Gateway_Rpi_mPCi

##	Introduction 

WishLink-Lora RAK2247 (USB) 915Mhz
The aim of this project is to help users set up a LoRa network easily. The User Guide can be get from our Web.

##	Supported platforms

This project currently provides support for the below platforms.
* RAK2247(USB)

##	Changelog
2020-07-15 V1.0

* 1.Some naming changes.

##	Installation procedure

step1 : Use "sudo raspi-config" command, enable i2c interface, disable login shell over serial and enable serial port hardware.

step3 : Clone the installer and start the installation (More installation options can be found in "sudo ./install.sh --help").

      $ sudo apt update; sudo apt install git -y
      $ git clone https://github.com/jch889/RAK2247usb_Gateway_Rpi_mPCi.git ~/RAK2247usb_Gateway_Rpi_mPCi
      $ cd ~/RAK2247usb_Gateway_Rpi_mPCi
      $ sudo ./install.sh

step4 : Next you will see some messages as follow. Please select the corresponding hardware model.

      Please select your gateway model:
      *	1.RAK831
      *	2.RAK2245
      *	3.RAK7243/RAK7244 no LTE
      *	4.RAK7243/RAK7244 with LTE
      *	5.RAK833(USB)
      *	6.RAK2247(USB)
      *	7.RAK833(SPI)
      *	8.RAK2247(SPI)
      *	9.RAK2246
      *	10.RAK2287
      Please enter 1-10 to select the model:

step5 : Wait a moment and the installation is complete.If your gateway uses a wired connection, please reconfigure the LAN's IP address using "sudo gateway-config" after the installation is complete.

step6 : For more other features, please use "sudo gateway-config".




##  Note: The following content is contributed by @x893:

For DietPi OS need add
apt install build-essential net-tools -y
in rak/install.sh (for example before apt install git ppp dialog jq minicom monit -y)
and need check hciuart enabled because
systemctl disable hciuart
not installed and script fail.

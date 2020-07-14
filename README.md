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

step3 : Clone the installer and start the installation.

      $ sudo apt update; sudo apt install git -y
      $ git clone https://github.com/jch889/RAK2247usb_Gateway_Rpi_mPCi.git ~/RAK2247usb_Gateway_Rpi_mPCi
      $ cd ~/RAK2247usb_Gateway_Rpi_mPCi
      $ chmod 755 install.sh
      $ sudo ./install.sh

step4 : Wait a moment and the installation is complete.If your gateway uses a wired connection, please configure the region frequency using "sudo gateway-config" after the installation is complete.

step6 : For more other features, please use "sudo gateway-config".

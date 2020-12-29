# deploy FLD

echo "\n Erase flash"
esptool.py --port /dev/ttyUSB0 erase_flash
sleep 3
echo "\n Load firmware"
esptool.py --chip esp32 --port /dev/ttyUSB0 write_flash -z 0x1000 esp32-idf3-20200902-v1.13.bin
sleep 3
echo "\n load embedded software"
python pyboard.py --device /dev/ttyUSB0 -f cp boot.py secret.py webrepl_cfg.py main.py app :
sleep 3
echo "\n Display Sensor ID (mac adresse)"
python pyboard.py --device /dev/ttyUSB0 -c 'import machine'
sleep 2
python pyboard.py --device /dev/ttyUSB0 -c 'machine.reset()'
sleep 5
python pyboard.py --device /dev/ttyUSB0 -c 'print(script.mac_addr)'
sleep 3
echo "\n Success :-)"

# deploy FLD

echo "\n Erase flash"
esptool.py --port /dev/ttyUSB0 erase_flash
sleep 3
echo "\n Load firmware"
esptool.py --chip esp32 --port /dev/ttyUSB0 write_flash -z 0x1000 esp32-idf3-20200902-v1.13.bin
sleep 3
echo "\n load embedded software"
python pyboard.py --device /dev/ttyUSB0 -f mkdir app
python pyboard.py --device /dev/ttyUSB0 -c 'import machine'
sleep 2
python pyboard.py --device /dev/ttyUSB0 -c 'machine.reset()'
python pyboard.py --device /dev/ttyUSB0 -f cp boot.py  webrepl_cfg.py main.py :
python pyboard.py --device /dev/ttyUSB0 -f cp app/__init__.py :app/__init__.py
python pyboard.py --device /dev/ttyUSB0 -f cp app/secrets.py :app/secrets.py
python pyboard.py --device /dev/ttyUSB0 -f cp app/httoclient.py:app/httoclient.py
python pyboard.py --device /dev/ttyUSB0 -f cp app/ota_updater.py:app/ota_updater.py
python pyboard.py --device /dev/ttyUSB0 -f cp app/start.py:app/start.py
sleep 3
echo "\n Display Sensor ID (mac adresse)"
python pyboard.py --device /dev/ttyUSB0 -c 'import machine'
sleep 2
python pyboard.py --device /dev/ttyUSB0 -c 'machine.reset()'
sleep 5
python pyboard.py --device /dev/ttyUSB0 -c 'print(script.mac_addr)'
sleep 3
echo "\n Success :-)"

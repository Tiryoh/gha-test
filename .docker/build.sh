#!/bin/bash
set -eu
pio run
mkdir -p ./build
mv $(ls -t ./.pio/build/*/firmware.bin | head -n1) ./build/
mv $(ls -t ./.pio/build/*/partitions.bin | head -n1) ./build/
cp /.platformio/packages/framework-arduinoespressif32/tools/sdk/bin/bootloader_qio_80m.bin ./build/
cp /.platformio/packages/framework-arduinoespressif32/tools/partitions/boot_app0.bin ./build/
echo "esptool.py --chip esp32 --port /dev/ttyUSB0 write_flash --flash_mode dio -z 0xe000 boot_app0.bin 0x1000 bootloader_qio_80m.bin 0x10000 firmware.bin 0x8000 partitions.bin" > ./build/example_flash_command.sh
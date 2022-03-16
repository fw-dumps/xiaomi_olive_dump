#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:43c5f0379c0ce3e971c4c7b298f45d7393f2fcd4 > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:b85ccf0bcab1de581b2b88bdf52c46068991909a \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:43c5f0379c0ce3e971c4c7b298f45d7393f2fcd4 >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi

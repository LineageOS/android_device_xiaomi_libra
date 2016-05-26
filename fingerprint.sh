#!/system/bin/sh

# Copyright (C) 2016, Ketut Putu Kumajaya

model=`getprop ro.product.model`

if [ "$model" = "Mi-4c" ]; then
    echo "Disable fingerprint service"
    setprop service.fingerprint.enable 0
fi

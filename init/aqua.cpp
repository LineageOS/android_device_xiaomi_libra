/*
 * Copyright (C) 2016, The CyanogenMod Project
 * Copyright (C) 2016, Ketut Putu Kumajaya
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "aqua"
#define KLOG_LEVEL 6

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>

#include <cutils/klog.h>

#include <functional>

static int get_variant()
{
    int i = -1;
    char buf[6];

    FILE *f = fopen("/sys/bootinfo/hw_version", "r");
    if (f != NULL) {
        fscanf(f, "%s", buf);
        fclose(f);
    } else {
        return i;
    }

    if (strstr(buf, "0x23")) {
        i = 0;
        /* KLOG_ERROR(LOG_TAG, "This is libra variant, hw_version: %s\n", buf); */
    } else /* if (strstr(buf, "0x34")) */ {
        i = 1;
        /* KLOG_ERROR(LOG_TAG, "This is aqua variant, hw_version: %s\n", buf); */
    }

    return i;
}

static int update_fstab(const char *fstab)
{
    int i = 0;

    if (get_variant() <= 0) {
        KLOG_ERROR(LOG_TAG, "Only aqua variant need fstab update\n");
        return i;
    }

    FILE *f = fopen(fstab, "a");
    if (f != NULL) {
        fprintf(f, "/devices/soc.0/f98a4900.sdhci/mmc_host*"
            "                             auto         auto"
            "    defaults    voldmanaged=sdcard1:auto,encryptable=userdata\n");
        i = 1;
        fclose(f);
    } else {
        KLOG_ERROR(LOG_TAG, "Update %s failed\n", fstab);
    }

    return i;
}

int main(int argc, char **argv)
{
    int i = -1, ch;

    while ((ch = getopt(argc, argv, "vnr")) != -1) {
        switch (ch) {
        case 'v': /* variant */
            i = get_variant();
            break;
        case 'n': /* normal boot */
            i = update_fstab("/fstab.libra");
            break;
        case 'r': /* recovery */
            i = update_fstab("/fstab.libra");
            i += update_fstab("/etc/recovery.fstab");
            break;
        case '?':
        default:
            KLOG_ERROR(LOG_TAG, "Unrecognized aqua option: %c\n",
                        optopt);
            exit(1);
        }
    }

    return i;
}

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

static const char *aqua_line =
    "/devices/soc.0/f98a4900.sdhci/mmc_host*                             "
    "auto         auto    defaults    "
    "voldmanaged=sdcard1:auto,encryptable=userdata\n";

static int get_variant()
{
    char buf[6];

    FILE *f = fopen("/sys/bootinfo/hw_version", "r");
    if (f != NULL) {
        fscanf(f, "%s", buf);
        fclose(f);
    } else {
        return -1;
    }

    if (strstr(buf, "0x23")) {
        return 0;
    } else /* if (strstr(buf, "0x34")) */ {
        return 1;
    }

    return -1;
}

static void update_fstab(const char *fstab, const char *line)
{
    FILE *f = fopen(fstab, "a");
    if (f != NULL) {
        fprintf(f, line);
        fclose(f);
        KLOG_ERROR(LOG_TAG, "Update %s successfully\n", fstab);
    } else {
        KLOG_ERROR(LOG_TAG, "Update %s failed\n", fstab);
    }
}

int main(int argc, char **argv)
{
    int i = -1, ch;

    while ((ch = getopt(argc, argv, "vu")) != -1) {
        switch (ch) {
        case 'v': /* variant */
            i = get_variant();
            break;
        case 'u': /* update */
            i = get_variant();
            if (i == 1) {
                update_fstab("/fstab.libra", aqua_line);
                update_fstab("/etc/recovery.fstab", aqua_line);
            } else {
                KLOG_ERROR(LOG_TAG, "Only aqua variant need fstab update\n");
            }
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

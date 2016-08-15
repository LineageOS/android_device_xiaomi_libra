/*
 * Copyright (C) 2016, The CyanogenMod Project
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

#include <stdio.h>

extern int qmi_nv_read_wlan_mac(unsigned char** mac);
extern int qmi_nv_read_bd_addr(unsigned char** addr);

int main() {
    unsigned char *buf = NULL; int i = -1;
    FILE *f = fopen("/data/misc/wifi/wlan_mac.bin", "w");
    if (f != NULL) {
        i = qmi_nv_read_wlan_mac(&buf);
        if (i == 0) {
            fprintf(f, "Intf0MacAddress=%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx\n",
                    buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
            /* Extended MAC, buf[5]-1 known for bluetooth */
            fprintf(f, "Intf1MacAddress=%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx\n",
                    buf[0], buf[1], buf[2], buf[3], buf[4], buf[5] > 252 ? buf[5]-2 : buf[5]+1);
            fprintf(f, "Intf2MacAddress=%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx\n",
                    buf[0], buf[1], buf[2], buf[3], buf[4], buf[5] > 252 ? buf[5]-3 : buf[5]+2);
            fprintf(f, "Intf3MacAddress=%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx\nEND\n",
                    buf[0], buf[1], buf[2], buf[3], buf[4], buf[5] > 252 ? buf[5]-4 : buf[5]+3);
        } else {
            printf("Error reading WLAN MAC address from NV\n");
        }
        fclose(f);
    } else {
        printf("Error opening /data/misc/wifi/wlan_mac.bin\n");
    }

    buf = NULL, i = -1;
    f = fopen("/data/misc/bluetooth/bdaddr.txt", "w");
    if (f != NULL) {
        i = qmi_nv_read_bd_addr(&buf);
        if (i == 0) {
            fprintf(f, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx\n",
                    buf[5], buf[4], buf[3], buf[2], buf[1], buf[0]);
        } else {
            printf("Error reading BT MAC address from NV\n");
        }
        fclose(f);
    } else {
        printf("Error opening /data/misc/bluetooth/bdaddr.txt\n");
    }

    return 0;
}

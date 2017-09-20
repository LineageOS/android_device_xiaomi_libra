/*
 * Copyright (C) 2016 The Android Open Source Project
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

#define LOG_TAG "ConsumerIrService"

#include <hardware/consumerir.h>
#include <hardware/hardware.h>

#include <linux/lirc.h>
#include <fcntl.h>

#include <log/log.h>

#include "ConsumerIr.h"

namespace android {
namespace hardware {
namespace ir {
namespace V1_0 {
namespace implementation {

#define LIRC_DEV_PATH       "/dev/lirc0"
#define LIRC_DUTY_CYCLE     33

static hidl_vec<ConsumerIrFreqRange> freqRangeVec {
    {.min = 30000, .max = 60000},
};

static int openLircDev() {
    int fd = open(LIRC_DEV_PATH, O_RDWR);

    if (fd < 0) {
        ALOGE("failed to open %s, error %d", LIRC_DEV_PATH, fd);
    }

    return fd;
}

ConsumerIr::ConsumerIr() {}

Return<bool> ConsumerIr::transmit(int32_t carrierFreq, const hidl_vec<int32_t>& pattern) {
    size_t entries = pattern.size();
    int lircFd;
    int rc = 0;

    lircFd = openLircDev();
    if (lircFd < 0) {
        return lircFd;
    }

    rc = ioctl(lircFd, LIRC_SET_SEND_CARRIER, &carrierFreq);
    if (rc < 0) {
        ALOGE("failed to set carrier %d error %d", carrierFreq, rc);
        goto out_close;
    }

    rc = ioctl(lircFd, LIRC_SET_SEND_DUTY_CYCLE, LIRC_DUTY_CYCLE);
    if (rc < 0) {
        ALOGE("failed to set duty cycle %d error %d", LIRC_DUTY_CYCLE, rc);
        goto out_close;
    }

    if (entries & 1) {
        rc = write(lircFd, pattern.data(), sizeof(int32_t) * entries);
    } else {
        rc = write(lircFd, pattern.data(), sizeof(int32_t) * (entries - 1));
        usleep(pattern[entries - 1]);
    }

    if (rc < 0) {
        ALOGE("failed to write pattern %zu error %d", pattern.size(), rc);
        goto out_close;
    }

out_close:
    close(lircFd);

    return !rc;
}

Return<void> ConsumerIr::getCarrierFreqs(getCarrierFreqs_cb _hidl_cb) {
    _hidl_cb(true, freqRangeVec);
    return Void();
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace ir
}  // namespace hardware
}  // namespace android

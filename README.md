### Simple Flash
```bash
# LiteBoot 
# CSC/PIT
ws 0 CSC/gpt.img 
# BL
w sbl1 BL/sbl1.img 
w tz BL/tz.img 
w sdi BL/sdi.img 
w rpm BL/rpm.img 
w aboot BL/aboot.img 
# CP
w modem CP/modem.img 
w modemst1 CP/modemst1.img 
w modemst2 CP/modemst2.img 

# Addition 
# AP
fastboot flash boot boot.img
fastboot flash recovery recovery.img
fastboot flash system system.img
fastboot flash userdata userdata.img
fastboot flash cache cache.img
# MISC
fastboot flash persist persist.img
fastboot flash oeminfo oeminfo.mbn
fastboot flash fsg fs_image.tar.gz.mbn.img
fastboot flash log log.img

# "Fastboot boot , rather than reboot"
fastboot boot boot.img
```

### Facts
Lumia 535 - UART3 \
Common droid - UART2 
1. Same the SBL transfer the **DAL_PLATFORM_INFO**, tell like <8016 4> as plat_type/subtype \
it also reserves the precious CDT/DDR info?
2. It's curious that SDM200/400/600/800's 1st generation, have reused IP, thus it's not rare to see msm8x12 has **hsusb-otg** \
(similar as the 8x74's device-tree)\
Refer: https://wiki.onakasuita.org/pukiwiki/?Chipidea
4. Unluckily Lumia's **PIL-Image** seems encrypted, well we can't bear the adsp/wcnss's MBN.
   can I use the 535's dump SSD-Partition?

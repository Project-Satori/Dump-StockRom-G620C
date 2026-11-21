
### Facts
Lumia 535 - UART3 \
Common droid - UART2 
1. Same the SBL transfer the **DAL_PLATFORM_INFO**, tell like <8016 4> as plat_type/subtype \
it also reserves the precious CDT/DDR info?
2. SDM200/400/600/800's 1st generation, have reused IP to see msm8x12 has **hsusb-otg** \
(similar as the 8x74's device-tree)\
Refer: https://wiki.onakasuita.org/pukiwiki/?Chipidea
3. For Disk/Partition, we must align them with **BCD entry's GUID**
4. Lumia's **PIL-Image** seems encrypted, well we can't bear the adsp/wcnss's MBN.\
   can I use the 535's dumped SSD-Partition?
5. Why I need to "flash msimage.mbn" before using rawprogram0.xml/patch0.xml with QFIL\
   I guess some tableItems or tools' patch0 process bugs\
   **New GPT need an old valid GPT, curiously need fixes**
6. **"D+ gnd"** EDL cable is disabled functionally, but not fused forever.

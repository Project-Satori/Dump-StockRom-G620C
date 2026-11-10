/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembly of csrt.acp
 *
 * ACPI Data Table [CSRT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "CSRT"    [Core System Resource Table]
[004h 0004 004h]                Table Length : 00000094
[008h 0008 001h]                    Revision : 00
[009h 0009 001h]                    Checksum : 00     /* Incorrect checksum, should be B1 */
[00Ah 0010 006h]                      Oem ID : "QCOM  "
[010h 0016 008h]                Oem Table ID : "QCOMEDK2"
[018h 0024 004h]                Oem Revision : 00000001
[01Ch 0028 004h]             Asl Compiler ID : "QCOM"
[020h 0032 004h]       Asl Compiler Revision : 00000001


[024h 0036 004h]                      Length : 00000038
[028h 0040 004h]                   Vendor ID : 4D4F4351
[02Ch 0044 004h]                Subvendor ID : 00000000
[030h 0048 002h]                   Device ID : 100B
[032h 0050 002h]                Subdevice ID : 0000
[034h 0052 002h]                    Revision : 0000
[036h 0054 002h]                    Reserved : 0000
[038h 0056 004h]          Shared Info Length : 00000000

[03Ch 0060 002h]               Major Version : 0020
[03Eh 0062 002h]               Minor Version : 0000
[040h 0064 004h]       MMIO Base Address Low : 00000002
[044h 0068 004h]      MMIO Base Address High : 00000001
[048h 0072 004h]               GSI Interrupt : 00000002
[04Ch 0076 001h]          Interrupt Polarity : 00
[04Dh 0077 001h]              Interrupt Mode : 70
[04Eh 0078 001h]                Num Channels : 01
[04Fh 0079 001h]           DMA Address Width : F9
[050h 0080 002h]           Base Request Line : 0000
[052h 0082 002h]       Num Handshake Signals : 0000
[054h 0084 004h]              Max Block Size : 00007FFD

[03Ch 0060 004h]                      Length : 00000020
[040h 0064 002h]                        Type : 0002
[042h 0066 002h]                     Subtype : 0000
[044h 0068 004h]                         UID : 00000001
[048h 0072 014h]                ResourceInfo : 43 53 52 54 94 00 00 00 00 00 51 43 4F 4D 20 20 /* CSRT......QCOM   */\
/* 058h 0088   4 */                            51 43 4F 4D                                     /* QCOM */\

[05Ch 0092 004h]                      Length : 00000038
[060h 0096 004h]                   Vendor ID : 4D4F4351
[064h 0100 004h]                Subvendor ID : 00000000
[068h 0104 002h]                   Device ID : 100A
[06Ah 0106 002h]                Subdevice ID : 0000
[06Ch 0108 002h]                    Revision : 0000
[06Eh 0110 002h]                    Reserved : 0000
[070h 0112 004h]          Shared Info Length : 00000000

[074h 0116 002h]               Major Version : 0020
[076h 0118 002h]               Minor Version : 0000
[078h 0120 004h]       MMIO Base Address Low : 00000002
[07Ch 0124 004h]      MMIO Base Address High : 00000001
[080h 0128 004h]               GSI Interrupt : 00000001
[084h 0132 001h]          Interrupt Polarity : 00
[085h 0133 001h]              Interrupt Mode : 10
[086h 0134 001h]                Num Channels : 02
[087h 0135 001h]           DMA Address Width : F9
[088h 0136 002h]           Base Request Line : 0000
[08Ah 0138 002h]       Num Handshake Signals : 0000
[08Ch 0140 004h]              Max Block Size : 0124F800

[074h 0116 004h]                      Length : 00000020
[078h 0120 002h]                        Type : 0002
[07Ah 0122 002h]                     Subtype : 0000
[07Ch 0124 004h]                         UID : 00000001
[080h 0128 014h]                ResourceInfo : 43 53 52 54 94 00 00 00 00 00 51 43 4F 4D 20 20 /* CSRT......QCOM   */\
/* 090h 0144   4 */                            51 43 4F 4D                                     /* QCOM */\

Raw Table Data: Length 148 (0x94)

    0000: 43 53 52 54 94 00 00 00 00 00 51 43 4F 4D 20 20  // CSRT......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 01 00 00 00 51 43 4F 4D  // QCOMEDK2....QCOM
    0020: 01 00 00 00 38 00 00 00 51 43 4F 4D 00 00 00 00  // ....8...QCOM....
    0030: 0B 10 00 00 00 00 00 00 00 00 00 00 20 00 00 00  // ............ ...
    0040: 02 00 00 00 01 00 00 00 02 00 00 00 00 70 01 F9  // .............p..
    0050: 00 00 00 00 FD 7F 00 00 23 00 00 00 38 00 00 00  // ........#...8...
    0060: 51 43 4F 4D 00 00 00 00 0A 10 00 00 00 00 00 00  // QCOM............
    0070: 00 00 00 00 20 00 00 00 02 00 00 00 01 00 00 00  // .... ...........
    0080: 01 00 00 00 00 10 02 F9 00 00 00 00 00 F8 24 01  // ..............$.
    0090: 28 00 00 00                                      // (...

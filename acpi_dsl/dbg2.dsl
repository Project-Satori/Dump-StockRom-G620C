/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembly of dbg2.acp
 *
 * ACPI Data Table [DBG2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "DBG2"    [Debug Port Table type 2]
[004h 0004 004h]                Table Length : 000001DE
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 00     /* Incorrect checksum, should be BA */
[00Ah 0010 006h]                      Oem ID : "QCOM  "
[010h 0016 008h]                Oem Table ID : "QCOMEDK2"
[018h 0024 004h]                Oem Revision : 00000001
[01Ch 0028 004h]             Asl Compiler ID : "QCOM"
[020h 0032 004h]       Asl Compiler Revision : 00000001

[024h 0036 004h]                 Info Offset : 0000002C
[028h 0040 004h]                  Info Count : 00000003

[02Ch 0044 001h]                    Revision : 01
[02Dh 0045 002h]                      Length : 0046
[02Fh 0047 001h]              Register Count : 01
[030h 0048 002h]             Namepath Length : 000A
[032h 0050 002h]             Namepath Offset : 0026
[034h 0052 002h]             OEM Data Length : 0000 [Optional field not present]
[036h 0054 002h]             OEM Data Offset : 0000 [Optional field not present]
[038h 0056 002h]                   Port Type : 8000
[03Ah 0058 002h]                Port Subtype : 0004
[03Ch 0060 002h]                    Reserved : 0000
[03Eh 0062 002h]         Base Address Offset : 0016
[040h 0064 002h]         Address Size Offset : 0022

[042h 0066 00Ch]       Base Address Register : [Generic Address Structure]
[042h 0066 001h]                    Space ID : 00 [SystemMemory]
[043h 0067 001h]                   Bit Width : 20
[044h 0068 001h]                  Bit Offset : 00
[045h 0069 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[046h 0070 008h]                     Address : 00000000F991F000

[04Eh 0078 004h]                Address Size : 00001000

[052h 0082 00Ah]                    Namepath : "\_SB.UAR1"

[072h 0114 001h]                    Revision : 01
[073h 0115 002h]                      Length : 00B2
[075h 0117 001h]              Register Count : 01
[076h 0118 002h]             Namepath Length : 000A
[078h 0120 002h]             Namepath Offset : 0026
[07Ah 0122 002h]             OEM Data Length : 006C
[07Ch 0124 002h]             OEM Data Offset : 0046
[07Eh 0126 002h]                   Port Type : 8003
[080h 0128 002h]                Port Subtype : 5143
[082h 0130 002h]                    Reserved : 0000
[084h 0132 002h]         Base Address Offset : 0016
[086h 0134 002h]         Address Size Offset : 0022

[088h 0136 00Ch]       Base Address Register : [Generic Address Structure]
[088h 0136 001h]                    Space ID : 00 [SystemMemory]
[089h 0137 001h]                   Bit Width : 20
[08Ah 0138 001h]                  Bit Offset : 00
[08Bh 0139 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[08Ch 0140 008h]                     Address : 00000000F9A55000

[094h 0148 004h]                Address Size : 00000300

[098h 0152 00Ah]                    Namepath : "\_SB.UFN1"
[046h 0070 06Ch]                    OEM Data : 01 B2 00 01 0A 00 26 00 6C 00 46 00 03 80 43 51 /* ......&.l.F...CQ */\
/* 056h 0086  16 */                            00 00 16 00 22 00 00 20 00 20 00 50 A5 F9 00 00 /* ....".. . .P.... */\
/* 066h 0102  16 */                            00 00 00 03 00 00 5C 5F 53 42 2E 55 46 4E 31 00 /* ......\_SB.UFN1. */\
/* 076h 0118  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 086h 0134  16 */                            00 00 00 00 00 00 03 00 00 00 31 58 49 46 06 00 /* ..........1XIF.. */\
/* 096h 0150  16 */                            00 00 00 00 90 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 0A6h 0166  12 */                            98 00 00 00 00 00 08 00 00 00 00 00             /* ............ */\

[124h 0292 001h]                    Revision : 01
[125h 0293 002h]                      Length : 00BA
[127h 0295 001h]              Register Count : 01
[128h 0296 002h]             Namepath Length : 000A
[12Ah 0298 002h]             Namepath Offset : 0026
[12Ch 0300 002h]             OEM Data Length : 0074
[12Eh 0302 002h]             OEM Data Offset : 0046
[130h 0304 002h]                   Port Type : 8002
[132h 0306 002h]                Port Subtype : 0004
[134h 0308 002h]                    Reserved : 0000
[136h 0310 002h]         Base Address Offset : 0016
[138h 0312 002h]         Address Size Offset : 0022

[13Ah 0314 00Ch]       Base Address Register : [Generic Address Structure]
[13Ah 0314 001h]                    Space ID : 00 [SystemMemory]
[13Bh 0315 001h]                   Bit Width : 20
[13Ch 0316 001h]                  Bit Offset : 00
[13Dh 0317 001h]        Encoded Access Width : 20 [Unknown Width Encoding]
[13Eh 0318 008h]                     Address : 00000000F9A55000

[146h 0326 004h]                Address Size : 000001AF

[14Ah 0330 00Ah]                    Namepath : "\_SB.UFN1"
[046h 0070 074h]                    OEM Data : 01 BA 00 01 0A 00 26 00 74 00 46 00 02 80 04 00 /* ......&.t.F..... */\
/* 056h 0086  16 */                            00 00 16 00 22 00 00 20 00 20 00 50 A5 F9 00 00 /* ....".. . .P.... */\
/* 066h 0102  16 */                            00 00 AF 01 00 00 5C 5F 53 42 2E 55 46 4E 31 00 /* ......\_SB.UFN1. */\
/* 076h 0118  16 */                            00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 /* ................ */\
/* 086h 0134  16 */                            00 00 00 00 00 00 74 00 00 00 00 50 A5 F9 00 00 /* ......t....P.... */\
/* 096h 0150  16 */                            00 00 00 10 00 00 06 00 00 00 90 00 00 00 98 00 /* ................ */\
/* 0A6h 0166  16 */                            00 00 9C 00 00 00 70 01 00 00 A0 00 00 00 40 01 /* ......p.......@. */\
/* 0B6h 0182   4 */                            00 00 00 00                                     /* .... */\

Raw Table Data: Length 478 (0x1DE)

    0000: 44 42 47 32 DE 01 00 00 01 00 51 43 4F 4D 20 20  // DBG2......QCOM  
    0010: 51 43 4F 4D 45 44 4B 32 01 00 00 00 51 43 4F 4D  // QCOMEDK2....QCOM
    0020: 01 00 00 00 2C 00 00 00 03 00 00 00 01 46 00 01  // ....,........F..
    0030: 0A 00 26 00 00 00 00 00 00 80 04 00 00 00 16 00  // ..&.............
    0040: 22 00 00 20 00 20 00 F0 91 F9 00 00 00 00 00 10  // ".. . ..........
    0050: 00 00 5C 5F 53 42 2E 55 41 52 31 00 00 00 00 00  // ..\_SB.UAR1.....
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 01 B2 00 01 0A 00 26 00 6C 00 46 00 03 80  // ........&.l.F...
    0080: 43 51 00 00 16 00 22 00 00 20 00 20 00 50 A5 F9  // CQ....".. . .P..
    0090: 00 00 00 00 00 03 00 00 5C 5F 53 42 2E 55 46 4E  // ........\_SB.UFN
    00A0: 31 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // 1...............
    00B0: 00 00 00 00 00 00 00 00 03 00 00 00 31 58 49 46  // ............1XIF
    00C0: 06 00 00 00 00 00 90 00 00 00 00 00 00 00 00 00  // ................
    00D0: 00 00 98 00 00 00 00 00 08 00 00 00 00 00 9C 00  // ................
    00E0: 00 00 00 00 B0 0C 00 00 00 00 70 01 00 00 00 00  // ..........p.....
    00F0: 03 00 96 60 00 00 A0 00 00 00 00 00 80 00 00 00  // ...`............
    0100: 00 00 40 01 00 00 00 00 00 00 00 02 00 00 00 00  // ..@.............
    0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0120: 00 00 00 00 01 BA 00 01 0A 00 26 00 74 00 46 00  // ..........&.t.F.
    0130: 02 80 04 00 00 00 16 00 22 00 00 20 00 20 00 50  // ........".. . .P
    0140: A5 F9 00 00 00 00 AF 01 00 00 5C 5F 53 42 2E 55  // ..........\_SB.U
    0150: 46 4E 31 00 00 00 00 00 00 00 00 00 00 00 00 00  // FN1.............
    0160: 00 00 00 00 00 00 00 00 00 00 74 00 00 00 00 50  // ..........t....P
    0170: A5 F9 00 00 00 00 00 10 00 00 06 00 00 00 90 00  // ................
    0180: 00 00 98 00 00 00 9C 00 00 00 70 01 00 00 A0 00  // ..........p.....
    0190: 00 00 40 01 00 00 00 00 00 00 00 00 00 00 00 00  // ..@.............
    01A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01B0: 00 00 08 00 00 00 B0 0C 00 00 03 00 96 60 80 00  // .............`..
    01C0: 00 00 00 00 00 02 00 00 00 00 00 00 00 00 00 00  // ................
    01D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00        // ..............

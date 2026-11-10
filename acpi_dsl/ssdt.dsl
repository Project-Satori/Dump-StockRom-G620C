/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000A0A (2570)
 *     Revision         0x01
 *     Checksum         0x36
 *     OEM ID           "NOKIA "
 *     OEM Table ID     "MSM8212 "
 *     OEM Revision     0x00000003 (3)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x04000000 (67108864)
 */
DefinitionBlock ("", "SSDT", 1, "NOKIA ", "MSM8212 ", 0x00000003)
{
    External (_SB_.ABD_.AVBL, IntObj)
    External (_SB_.I2C3, DeviceObj)
    External (_SB_.I2C3.AVBL, UnknownObj)
    External (_SB_.PEP0, UnknownObj)
    External (_SB_.PM01, UnknownObj)
    External (_SB_.PMIC, UnknownObj)
    External (_SB_.PRXY, UnknownObj)
    External (_SB_.PRXY.FLD0, UnknownObj)
    External (DBFL, UnknownObj)
    External (ESNL, UnknownObj)

    Scope (\_SB)
    {
        Device (NREG)
        {
            Name (_HID, "ODDT_REG")  // _HID: Hardware ID
        }

        Device (VIB2)
        {
            Name (_HID, "ODDT_VIB")  // _HID: Hardware ID
            Name (_CID, "ACPIODDT_VIB")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.VIB2._CRS.RBUF */
            }
        }

        Device (NCPU)
        {
            Name (_HID, "ODDT_CPU")  // _HID: Hardware ID
        }

        Device (EGP0)
        {
            Name (_HID, "ENOGPIO")  // _HID: Hardware ID
            Name (_CID, "ENOGPIO")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x011A)
                {
                    /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x01, 0x01, 0x00, 0x08,  // . ......
                    /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x2A,  // ...#...*
                    /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49,  // .\_SB.GI
                    /* 0020 */  0x4F, 0x30, 0x00, 0x8C, 0x20, 0x00, 0x01, 0x01,  // O0.. ...
                    /* 0028 */  0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23, 0x00,  // ......#.
                    /* 0038 */  0x00, 0x00, 0x48, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ..H.\_SB
                    /* 0040 */  0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x8C, 0x20,  // .GIO0.. 
                    /* 0048 */  0x00, 0x01, 0x01, 0x01, 0x00, 0x08, 0x00, 0x02,  // ........
                    /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x19,  // ........
                    /* 0058 */  0x00, 0x23, 0x00, 0x00, 0x00, 0x41, 0x00, 0x5C,  // .#...A.\
                    /* 0060 */  0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D, 0x30, 0x31,  // _SB.PM01
                    /* 0068 */  0x00, 0x8C, 0x20, 0x00, 0x01, 0x01, 0x01, 0x00,  // .. .....
                    /* 0070 */  0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17,  // ........
                    /* 0078 */  0x00, 0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00,  // ....#...
                    /* 0080 */  0x49, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47,  // I.\_SB.G
                    /* 0088 */  0x49, 0x4F, 0x30, 0x00, 0x8C, 0x20, 0x00, 0x01,  // IO0.. ..
                    /* 0090 */  0x01, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0098 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 00A0 */  0x00, 0x00, 0x00, 0x4A, 0x00, 0x5C, 0x5F, 0x53,  // ...J.\_S
                    /* 00A8 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x8C,  // B.GIO0..
                    /* 00B0 */  0x20, 0x00, 0x01, 0x01, 0x01, 0x00, 0x08, 0x00,  //  .......
                    /* 00B8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00,  // ........
                    /* 00C0 */  0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x40, 0x00,  // ..#...@.
                    /* 00C8 */  0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D, 0x30,  // \_SB.PM0
                    /* 00D0 */  0x31, 0x00, 0x8C, 0x20, 0x00, 0x01, 0x01, 0x01,  // 1.. ....
                    /* 00D8 */  0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 00E0 */  0x17, 0x00, 0x00, 0x19, 0x00, 0x23, 0x00, 0x00,  // .....#..
                    /* 00E8 */  0x00, 0x18, 0x06, 0x5C, 0x5F, 0x53, 0x42, 0x2E,  // ...\_SB.
                    /* 00F0 */  0x50, 0x4D, 0x30, 0x31, 0x00, 0x8C, 0x20, 0x00,  // PM01.. .
                    /* 00F8 */  0x01, 0x01, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00,  // ........
                    /* 0100 */  0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00,  // ........
                    /* 0108 */  0x23, 0x00, 0x00, 0x00, 0x28, 0x00, 0x5C, 0x5F,  // #...(.\_
                    /* 0110 */  0x53, 0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00,  // SB.GIO0.
                    /* 0118 */  0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.EGP0._CRS.RBUF */
            }
        }

        Device (ACC1)
        {
            Name (_HID, "SQUARE")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.I2C3, , 
                \_SB.PRXY, , 
                \_SB.PEP0, 
            })
            Method (PRIM, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x01                                             // .
                })
                Return (RBUF) /* \_SB_.ACC1.PRIM.RBUF */
            }

            Scope (\_SB.I2C3)
            {
                OperationRegion (ACC1, GenericSerialBus, Zero, 0x0100)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Field (\_SB.I2C3.ACC1, BufferAcc, NoLock, Preserve)
                {
                    Connection (
                        I2cSerialBusV2 (0x0018, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.I2C3",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    ), 
                    AccessAs (BufferAcc, AttribByte), 
                    FLD0,   8
                }

                If (!\_SB.I2C3.AVBL)
                {
                    Return (One)
                }

                Name (BUFF, Buffer (0x03){})
                CreateByteField (BUFF, Zero, STAT)
                CreateByteField (BUFF, 0x02, DATA)
                BUFF = FLD0 /* \_SB_.ACC1._STA.FLD0 */
                If ((STAT != Zero))
                {
                    Return (Zero)
                }
                ElseIf ((DATA == 0xF9))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x64)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x18, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // ..\_SB.I
                    /* 0018 */  0x32, 0x43, 0x33, 0x00, 0x8C, 0x20, 0x00, 0x01,  // 2C3.. ..
                    /* 0020 */  0x00, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0030 */  0x00, 0x00, 0x00, 0x51, 0x00, 0x5C, 0x5F, 0x53,  // ...Q.\_S
                    /* 0038 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x8C,  // B.GIO0..
                    /* 0040 */  0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x08, 0x00,  //  .......
                    /* 0048 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00,  // ........
                    /* 0050 */  0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x52, 0x00,  // ..#...R.
                    /* 0058 */  0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49, 0x4F,  // \_SB.GIO
                    /* 0060 */  0x30, 0x00, 0x79, 0x00                           // 0.y.
                })
                Return (RBUF) /* \_SB_.ACC1._CRS.RBUF */
            }

            Method (ROTM, 0, NotSerialized)
            {
                Name (RBUF, Package (0x03)
                {
                    "1 0 0", 
                    "0 1 0", 
                    "0 0 -1"
                })
                Return (RBUF) /* \_SB_.ACC1.ROTM.RBUF */
            }
        }

        Device (ACC2)
        {
            Name (_HID, "SQUAREK")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.I2C3, , 
                \_SB.PRXY, , 
                \_SB.PEP0, 
            })
            Method (PRIM, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x01                                             // .
                })
                Return (RBUF) /* \_SB_.ACC2.PRIM.RBUF */
            }

            Scope (\_SB.I2C3)
            {
                OperationRegion (ACC2, GenericSerialBus, Zero, 0x0100)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Field (\_SB.I2C3.ACC2, BufferAcc, NoLock, Preserve)
                {
                    Connection (
                        I2cSerialBusV2 (0x001E, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.I2C3",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    ), 
                    AccessAs (BufferAcc, AttribByte), 
                    Offset (0x0F), 
                    FLD0,   8
                }

                If (!\_SB.I2C3.AVBL)
                {
                    Return (One)
                }

                Name (BUFF, Buffer (0x03){})
                CreateByteField (BUFF, Zero, STAT)
                CreateByteField (BUFF, 0x02, DATA)
                BUFF = FLD0 /* \_SB_.ACC2._STA.FLD0 */
                If ((STAT != Zero))
                {
                    Return (Zero)
                }
                ElseIf (((DATA == 0x14) || (DATA == 0x15)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x64)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x1E, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // ..\_SB.I
                    /* 0018 */  0x32, 0x43, 0x33, 0x00, 0x8C, 0x20, 0x00, 0x01,  // 2C3.. ..
                    /* 0020 */  0x00, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0030 */  0x00, 0x00, 0x00, 0x51, 0x00, 0x5C, 0x5F, 0x53,  // ...Q.\_S
                    /* 0038 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x8C,  // B.GIO0..
                    /* 0040 */  0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x08, 0x00,  //  .......
                    /* 0048 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00,  // ........
                    /* 0050 */  0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x52, 0x00,  // ..#...R.
                    /* 0058 */  0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49, 0x4F,  // \_SB.GIO
                    /* 0060 */  0x30, 0x00, 0x79, 0x00                           // 0.y.
                })
                Return (RBUF) /* \_SB_.ACC2._CRS.RBUF */
            }

            Method (ROTM, 0, NotSerialized)
            {
                Name (RBUF, Package (0x03)
                {
                    "1 0 0", 
                    "0 1 0", 
                    "0 0 -1"
                })
                Return (RBUF) /* \_SB_.ACC2.ROTM.RBUF */
            }
        }

        Device (ACC3)
        {
            Name (_HID, "Kxtj2")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Scope (\_SB.I2C3)
            {
                OperationRegion (ACC3, GenericSerialBus, Zero, 0x0100)
            }

            Name (PGID, Buffer (0x0A)
            {
                "\\_SB.ACC3"
            })
            Name (DBUF, Buffer (0x0D){})
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x41)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x0E, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // ..\_SB.I
                    /* 0018 */  0x32, 0x43, 0x33, 0x00, 0x8C, 0x20, 0x00, 0x01,  // 2C3.. ..
                    /* 0020 */  0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0030 */  0x00, 0x00, 0x00, 0x51, 0x00, 0x5C, 0x5F, 0x53,  // ...Q.\_S
                    /* 0038 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x79,  // B.GIO0.y
                    /* 0040 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.ACC3._CRS.RBUF */
            }

            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00,  // (.....0.
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            })
            Method (ROTM, 0, NotSerialized)
            {
                Name (RBUF, Package (0x03)
                {
                    "-1 0 0", 
                    "0 1 0", 
                    "0 0 1"
                })
                Return (RBUF) /* \_SB_.ACC3.ROTM.RBUF */
            }
        }

        Device (NRSD)
        {
            Name (_HID, "NRSD0001")  // _HID: Hardware ID
            Name (_CID, "ACPINRSD0001")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PRXY, 
            })
            Name (PGID, Buffer (0x0A)
            {
                "\\_SB.NRSD"
            })
            Name (DBUF, Buffer (DBFL){})
            CreateByteField (DBUF, Zero, STAT)
            CreateByteField (DBUF, 0x02, DVAL)
            CreateField (DBUF, 0x18, 0xA0, DEID)
            Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
            {
                Return (0x03)
            }

            Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
            {
                Return (0x03)
            }

            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                Return (0x03)
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                DEID = Buffer (ESNL){}
                DVAL = Zero
                DEID = PGID /* \_SB_.NRSD.PGID */
                If (\_SB.ABD.AVBL)
                {
                    \_SB.PRXY.FLD0 = DBUF /* \_SB_.NRSD.DBUF */
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                DEID = Buffer (ESNL){}
                DVAL = 0x03
                DEID = PGID /* \_SB_.NRSD.PGID */
                If (\_SB.ABD.AVBL)
                {
                    \_SB.PRXY.FLD0 = DBUF /* \_SB_.NRSD.DBUF */
                }
            }
        }

        Device (NEDD)
        {
            Name (_HID, "NOKI0B00")  // _HID: Hardware ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PM01, , 
                \_SB.PMIC, 
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x6B)
                {
                    /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0D,  // . ......
                    /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x90,  // ...#....
                    /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D,  // .\_SB.PM
                    /* 0020 */  0x30, 0x31, 0x00, 0x8C, 0x20, 0x00, 0x01, 0x00,  // 01.. ...
                    /* 0028 */  0x01, 0x00, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23, 0x00,  // ......#.
                    /* 0038 */  0x00, 0x00, 0x9A, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ....\_SB
                    /* 0040 */  0x2E, 0x50, 0x4D, 0x30, 0x31, 0x00, 0x8C, 0x20,  // .PM01.. 
                    /* 0048 */  0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x03,  // ........
                    /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x19,  // ........
                    /* 0058 */  0x00, 0x23, 0x00, 0x00, 0x00, 0x08, 0x07, 0x5C,  // .#.....\
                    /* 0060 */  0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D, 0x30, 0x31,  // _SB.PM01
                    /* 0068 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.NEDD._CRS.RBUF */
            }

            Method (NIRQ, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    "BATT_PRES", 
                    "CHG_GONE"
                })
            }

            Method (NGIO, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    "WC_EN"
                })
            }
        }

        Device (PRX1)
        {
            Name (_HID, "STK3210_PRX")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Scope (\_SB.I2C3)
            {
                OperationRegion (PRX1, GenericSerialBus, Zero, 0x0100)
            }

            Name (PGID, Buffer (0x0A)
            {
                "\\_SB.PRX1"
            })
            Name (DBUF, Buffer (0x0D){})
            CreateByteField (DBUF, Zero, STAT)
            CreateField (DBUF, 0x10, 0x50, DEID)
            CreateByteField (DBUF, 0x0C, DVAL)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x41)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x48, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // H.\_SB.I
                    /* 0018 */  0x32, 0x43, 0x33, 0x00, 0x8C, 0x20, 0x00, 0x01,  // 2C3.. ..
                    /* 0020 */  0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0030 */  0x00, 0x00, 0x00, 0x50, 0x00, 0x5C, 0x5F, 0x53,  // ...P.\_S
                    /* 0038 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x79,  // B.GIO0.y
                    /* 0040 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.PRX1._CRS.RBUF */
            }

            Method (MODE, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x02                                             // .
                })
                Return (RBUF) /* \_SB_.PRX1.MODE.RBUF */
            }
        }

        Device (ALS1)
        {
            Name (_HID, "STK3210_ALS")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Scope (\_SB.I2C3)
            {
                OperationRegion (ALS1, GenericSerialBus, Zero, 0x0100)
            }

            Name (PGID, Buffer (0x0A)
            {
                "\\_SB.ALS1"
            })
            Name (DBUF, Buffer (0x0D){})
            CreateByteField (DBUF, Zero, STAT)
            CreateField (DBUF, 0x10, 0x50, DEID)
            CreateByteField (DBUF, 0x0C, DVAL)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x1E)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x48, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // H.\_SB.I
                    /* 0018 */  0x32, 0x43, 0x33, 0x00, 0x79, 0x00               // 2C3.y.
                })
                Return (RBUF) /* \_SB_.ALS1._CRS.RBUF */
            }

            Method (MODE, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x01                                             // .
                })
                Return (RBUF) /* \_SB_.ALS1.MODE.RBUF */
            }
        }
    }
}


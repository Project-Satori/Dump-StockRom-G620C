/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20160729-32
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt.aml, Sun Nov 15 09:57:11 2026
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
                Name (RBUF, ResourceTemplate ()
                {
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
                Name (RBUF, ResourceTemplate ()
                {
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x002A
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0048
                        }
                    GpioIo (Shared, PullDown, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0041
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0049
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x004A
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0040
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0618
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0028
                        }
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
                \_SB.I2C3, 
                \_SB.PRXY, 
                \_SB.PEP0
            })
            Method (PRIM, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x01                                             /* . */
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

                Name (BUFF, Buffer (0x03) {})
                CreateByteField (BUFF, Zero, STAT)
                CreateByteField (BUFF, 0x02, DATA)
                BUFF = FLD0 /* \_SB_.ACC1._STA.FLD0 */
                If (STAT != Zero)
                {
                    Return (Zero)
                }
                ElseIf (DATA == 0xF9)
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
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0018, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2C3",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveHigh, Shared, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0051
                        }
                    GpioInt (Level, ActiveHigh, Shared, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0052
                        }
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
                \_SB.I2C3, 
                \_SB.PRXY, 
                \_SB.PEP0
            })
            Method (PRIM, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x01                                             /* . */
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

                Name (BUFF, Buffer (0x03) {})
                CreateByteField (BUFF, Zero, STAT)
                CreateByteField (BUFF, 0x02, DATA)
                BUFF = FLD0 /* \_SB_.ACC2._STA.FLD0 */
                If (STAT != Zero)
                {
                    Return (Zero)
                }
                ElseIf ((DATA == 0x14) || (DATA == 0x15))
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
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x001E, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2C3",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveHigh, Shared, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0051
                        }
                    GpioInt (Level, ActiveHigh, Shared, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0052
                        }
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
            Name (DBUF, Buffer (0x0D) {})
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x000E, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2C3",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Edge, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0051
                        }
                })
                Return (RBUF) /* \_SB_.ACC3._CRS.RBUF */
            }

            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  /* ........ */
                    /* 0008 */  0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00,  /* (.....0. */
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           /* .... */
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
                \_SB.PRXY
            })
            Name (PGID, Buffer (0x0A)
            {
                "\\_SB.NRSD"
            })
            Name (DBUF, Buffer (DBFL) {})
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
                DEID = Buffer (ESNL) {}
                DVAL = Zero
                DEID = PGID /* \_SB_.NRSD.PGID */
                If (\_SB.ABD.AVBL)
                {
                    \_SB.PRXY.FLD0 = DBUF /* \_SB_.NRSD.DBUF */
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                DEID = Buffer (ESNL) {}
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
                \_SB.PM01, 
                \_SB.PMIC
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0090
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x009A
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0708
                        }
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
            Name (DBUF, Buffer (0x0D) {})
            CreateByteField (DBUF, Zero, STAT)
            CreateField (DBUF, 0x10, 0x50, DEID)
            CreateByteField (DBUF, 0x0C, DVAL)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0048, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2C3",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0050
                        }
                })
                Return (RBUF) /* \_SB_.PRX1._CRS.RBUF */
            }

            Method (MODE, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x02                                             /* . */
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
            Name (DBUF, Buffer (0x0D) {})
            CreateByteField (DBUF, Zero, STAT)
            CreateField (DBUF, 0x10, 0x50, DEID)
            CreateByteField (DBUF, 0x0C, DVAL)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0048, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2C3",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (RBUF) /* \_SB_.ALS1._CRS.RBUF */
            }

            Method (MODE, 0, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x01                                             /* . */
                })
                Return (RBUF) /* \_SB_.ALS1.MODE.RBUF */
            }
        }
    }
}


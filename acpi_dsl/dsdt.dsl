/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.aml
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00014B53 (84819)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x67
 *     OEM ID           "QCOMM "
 *     OEM Table ID     "MSM8960 "
 *     OEM Revision     0x00000003 (3)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x04000000 (67108864)
 */
DefinitionBlock ("", "DSDT", 1, "QCOMM ", "MSM8960 ", 0x00000003)
{
    External (_SB_.NEDD, UnknownObj)
    External (_SB_.TZ1_.VPSV, UnknownObj)
    External (PCF1, IntObj)

    Scope (\_SB)
    {
        Name (SOID, "8612000000000000")
        Device (ABD)
        {
            Name (_HID, "QCOM2431")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            OperationRegion (ROP1, GenericSerialBus, Zero, 0x0100)
            Name (AVBL, Zero)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x09))
                {
                    AVBL = Arg1
                }
            }
        }

        Device (PMIC)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.SPMI, 
            })
            Name (_HID, "QCOM2455")  // _HID: Hardware ID
            Method (PMCF, 0, NotSerialized)
            {
                Name (CFG0, Package (0x02)
                {
                    One, 
                    Package (0x02)
                    {
                        Zero, 
                        One
                    }
                })
                Return (CFG0) /* \_SB_.PMIC.PMCF.CFG0 */
            }
        }

        Device (PM01)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMIC, 
            })
            Name (_HID, "QCOM2458")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0B)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x09, 0x01, 0xDE, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.PM01._CRS.RBUF */
            }

            Method (PMIO, 0, NotSerialized)
            {
                Name (CFG0, Package (0x0B)
                {
                    Zero, 
                    Zero, 
                    0x1040, 
                    0x40, 
                    0x04, 
                    0xC0, 
                    0x04, 
                    0xA0, 
                    0xFC4C0000, 
                    0x00100000, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PM01.PMIO.CFG0 */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.PM01._DSM._T_0 */
                    If ((_T_0 == ToUUID ("4f248f40-d5e2-499f-834c-27758ea1cd3f") /* GPIO Controller */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (Package (0x04)
                                {
                                    0x40, 
                                    0x41, 
                                    0x1001, 
                                    0x1002
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    Break
                }
            }
        }

        Device (PBMS)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PMIC, , 
                \_SB.ADC1, 
            })
            Name (_HID, "QCOM2454")  // _HID: Hardware ID
            Method (PMCF, 0, NotSerialized)
            {
                Name (CFG0, Package (0x33)
                {
                    0x2710, 
                    0x012C, 
                    0x0C80, 
                    Zero, 
                    0x64, 
                    0x0771, 
                    Zero, 
                    0x0DAC, 
                    0x3C, 
                    Zero, 
                    0x07D0, 
                    0x19C8, 
                    0x0B, 
                    Zero, 
                    0x02, 
                    One, 
                    0x06, 
                    0x06, 
                    0x03, 
                    0x05, 
                    0x06, 
                    0x0001FBD0, 
                    0xAFC8, 
                    0x4E20, 
                    0x000249F0, 
                    Zero, 
                    0x0E9F, 
                    0x0EE7, 
                    0x1E, 
                    0xFA, 
                    0x0CE4, 
                    0x09C4, 
                    0xD9, 
                    0x0207, 
                    0x14, 
                    0xEA60, 
                    Zero, 
                    0x0708, 
                    One, 
                    0xC8, 
                    0x003976F0, 
                    0x01F4, 
                    0x044C, 
                    0x0C80, 
                    Zero, 
                    0x0A, 
                    0x28, 
                    0x0190, 
                    0x05DC, 
                    0x3840, 
                    Zero
                })
                Return (CFG0) /* \_SB_.PBMS.PMCF.CFG0 */
            }
        }

        Device (PMAP)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.ABD, , 
                \_SB.PMIC, , 
                \_SB.SCM0, 
            })
            Name (_HID, "QCOM2457")  // _HID: Hardware ID
            Method (GEPT, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x04){})
                CreateByteField (BUFF, Zero, STAT)
                CreateWordField (BUFF, 0x02, DATA)
                DATA = 0x02
                Return (DATA) /* \_SB_.PMAP.GEPT.DATA */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PMAP._CRS.RBUF */
            }
        }

        Device (PRTC)
        {
            Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                "\\_SB.PMAP"
            })
            Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
            {
                Return (0x04)
            }

            Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
            {
                Connection (
                    I2cSerialBusV2 (0x0002, ControllerInitiated, 0x00000000,
                        AddressingMode7Bit, "\\_SB.ABD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                ), 
                AccessAs (BufferAcc, AttribRawBytes (0x10)), 
                FLD0,   128
            }

            Method (_GRT, 0, NotSerialized)  // _GRT: Get Real Time
            {
                Name (BUFF, Buffer (0x12){})
                CreateField (BUFF, 0x10, 0x80, TME1)
                BUFF = FLD0 /* \_SB_.PRTC.FLD0 */
                Return (TME1) /* \_SB_.PRTC._GRT.TME1 */
            }

            Method (_SRT, 1, NotSerialized)  // _SRT: Set Real Time
            {
                Name (BUFF, Buffer (0x12){})
                CreateByteField (BUFF, Zero, STAT)
                CreateField (BUFF, 0x10, 0x80, TME1)
                TME1 = Arg0
                BUFF = FLD0 = BUFF /* \_SB_.PRTC._SRT.BUFF */
                If ((STAT != Zero))
                {
                    Return (One)
                }

                Return (Zero)
            }
        }

        Name (ESNL, 0x14)
        Name (DBFL, 0x17)
        Device (PEP0)
        {
            Name (_HID, "QCOM2425")  // _HID: Hardware ID
            Name (_CID, "PNP0D80" /* Windows-compatible System Power Management Controller */)  // _CID: Compatible ID
            Name (_CRS, Buffer (0x3B)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x89, 0x06, 0x00, 0x13, 0x01, 0xD8, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x80, 0x42,  // .......B
                /* 0010 */  0xFC, 0x00, 0x40, 0x00, 0x00, 0x89, 0x06, 0x00,  // ..@.....
                /* 0018 */  0x03, 0x01, 0xC8, 0x00, 0x00, 0x00, 0x89, 0x06,  // ........
                /* 0020 */  0x00, 0x03, 0x01, 0xC9, 0x00, 0x00, 0x00, 0x89,  // ........
                /* 0028 */  0x06, 0x00, 0x03, 0x01, 0xCB, 0x00, 0x00, 0x00,  // ........
                /* 0030 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x2F, 0x00, 0x00,  // ...../..
                /* 0038 */  0x00, 0x79, 0x00                                 // .y.
            })
            Method (SOCI, 1, NotSerialized)
            {
                If ((Arg0 == 0x93))
                {
                    \_SB.SOID = "MSM8610"
                }
                ElseIf ((Arg0 == 0xA5))
                {
                    \_SB.SOID = "MSM8612"
                }
                ElseIf ((Arg0 == 0xA2))
                {
                    \_SB.SOID = "MSM8210"
                }
                ElseIf ((Arg0 == 0xA4))
                {
                    \_SB.SOID = "MSM8212"
                }
                ElseIf ((Arg0 == 0xE4))
                {
                    \_SB.SOID = "APQ8012"
                }
                Else
                {
                    \_SB.SOID = "UNEXPECTED"
                }

                Return (\_SB.SOID)
            }

            Name (ROST, Zero)
            Method (NPUR, 1, NotSerialized)
            {
                \_SB.AGR0._PUR [One] = Arg0
                Notify (\_SB.AGR0, 0x80) // Status Change
            }

            Method (VTYP, 1, NotSerialized)
            {
                While (One)
                {
                    Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_0 = ToInteger (Arg0)
                    If ((_T_0 == One))
                    {
                        \_SB.TZ1.VPSV = 0x0D66
                    }
                    Else
                    {
                        \_SB.TZ1.VPSV = 0x0DFC
                    }

                    Break
                }

                Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
            }

            Method (INTR, 0, NotSerialized)
            {
                Name (RBUF, Package (0x18)
                {
                    0x02, 
                    One, 
                    0x03, 
                    One, 
                    0x06, 
                    0xF9011008, 
                    One, 
                    Zero, 
                    0x0D900000, 
                    0x00100000, 
                    Zero, 
                    Zero, 
                    0xFC428000, 
                    0x4000, 
                    Zero, 
                    Zero, 
                    0xFE802FF0, 
                    0x10, 
                    Zero, 
                    Zero, 
                    0xF9011008, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (RBUF) /* \_SB_.PEP0.INTR.RBUF */
            }

            Method (INDX, 0, NotSerialized)
            {
                Return (IDXC) /* \_SB_.PEP0.IDXC */
            }

            Name (IDXC, Package (0x0F)
            {
                "DMPP", 
                "DMPO", 
                "DMPM", 
                "DMPA", 
                "DMPC", 
                "DMPB", 
                "DMPG", 
                "DMPS", 
                "DMCS", 
                "DMPL", 
                "DMRC", 
                "DMMS", 
                "DMMT", 
                "DMDQ", 
                "DMUA"
            })
            Method (PGEC, 0, NotSerialized)
            {
                Return (ECFG) /* \_SB_.PEP0.ECFG */
            }

            Name (ECFG, Package (0x03)
            {
                "XMPL", 
                "XNES", 
                "XMPT"
            })
            Method (ADCN, 0, NotSerialized)
            {
                Return (VADL) /* \_SB_.PEP0.VADL */
            }

            Name (VADL, Package (0x03)
            {
                "PA_THERM", 
                "BATT_THERM", 
                "PMIC_THERM"
            })
            Name (CCFG, Package (0x04)
            {
                Package (0x02)
                {
                    "\\_SB.CPU0", 
                    0x10
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU1", 
                    0x11
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU2", 
                    0x12
                }, 

                Package (0x02)
                {
                    "\\_SB.CPU3", 
                    0x13
                }
            })
            Method (PGCC, 0, NotSerialized)
            {
                Return (CCFG) /* \_SB_.PEP0.CCFG */
            }

            Name (DCVS, Zero)
            Method (PGDS, 0, NotSerialized)
            {
                Return (DCVS) /* \_SB_.PEP0.DCVS */
            }

            Scope (\_SB.PEP0)
            {
                Name (DVMP, Package (0x01)
                {
                    Package (0x04)
                    {
                        "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                        "PPP_RESOURCE_TYPE_DISCRETE_PMIC_GPIO", 
                        Package (0x02)
                        {
                            "PM_DISCRETE_VREG_STATE_ON", 
                            Package (0x0A)
                            {
                                Zero, 
                                One, 
                                Zero, 
                                0x02, 
                                One, 
                                Zero, 
                                0x02, 
                                Zero, 
                                One, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "PM_DISCRETE_VREG_STATE_OFF", 
                            Package (0x0A)
                            {
                                Zero, 
                                One, 
                                Zero, 
                                0x02, 
                                Zero, 
                                Zero, 
                                0x02, 
                                Zero, 
                                One, 
                                0x05
                            }
                        }
                    }
                })
                Method (DVMM, 0, NotSerialized)
                {
                    Return (DVMP) /* \_SB_.PEP0.DVMP */
                }
            }

            Name (PPPP, Package (0xA8)
            {
                "PPP_RESOURCE_ID_SMPS1_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_SMPS2_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_SMPS3_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_SMPS4_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO1_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO2_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO3_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO4_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO5_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO6_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO7_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO8_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO9_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO10_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO11_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO12_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO13_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO14_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO15_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO16_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO17_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO18_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO19_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO20_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO21_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_LDO22_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK1_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK1_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_SLEEPCLK1_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_RPM_TEST", 
                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_PMIC_GPIO_DV2", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_PMIC_GPIO_DV3", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_PMIC_MPP_DV1", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_PMIC_MPP_DV2", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_PMIC_MPP_DV3", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_TLMM_GPIO_DV1", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF_TEST", 
                "PPP_RESOURCE_ID_TLMM_GPIO_DV2", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF_TEST", 
                "PPP_RESOURCE_ID_TLMM_GPIO_DV3", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_TLMM_KMDF_TEST", 
                "PPP_RESOURCE_ID_DIV_CLK_1_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_DIV_CLK_2_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST", 
                "PPP_RESOURCE_ID_DIV_CLK_3_A", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF", 
                "PM_RESOURCE_SERVICE_INTERFACE_TYPE_PMIC_KMDF_TEST"
            })
            Method (PPPM, 0, NotSerialized)
            {
                Return (PPPP) /* \_SB_.PEP0.PPPP */
            }

            Name (PRRP, Package (0x21)
            {
                "PPP_RESOURCE_RANGE_INFO_SMPS_A", 
                "PPP_RESOURCE_ID_SMPS1_A", 
                "PPP_RESOURCE_ID_SMPS4_A", 
                "PPP_RESOURCE_RANGE_INFO_SMPS_B", 
                "PPP_RESOURCE_ID_SMPS1_B", 
                "PPP_RESOURCE_ID_SMPS8_B", 
                "PPP_RESOURCE_RANGE_INFO_LDO_A", 
                "PPP_RESOURCE_ID_LDO1_A", 
                "PPP_RESOURCE_ID_LDO24_A", 
                "PPP_RESOURCE_RANGE_INFO_LVS_A", 
                "PPP_RESOURCE_ID_LVS1_A", 
                "PPP_RESOURCE_ID_LVS3_A", 
                "PPP_RESOURCE_RANGE_INFO_MVS_A", 
                "PPP_RESOURCE_ID_MVS_OTG_A", 
                "PPP_RESOURCE_ID_MVS_HDMI_A", 
                "PPP_RESOURCE_RANGE_INFO_CXO_BUFFERS_A", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK1_A", 
                "PPP_RESOURCE_ID_CXO_BUFFERS_DIVCLK3_A", 
                "PPP_RESOURCE_RANGE_INFO_CXO_CLOCK_A", 
                "PPP_RESOURCE_ID_CXO_CLOCK_A", 
                "PPP_RESOURCE_ID_CXO_CLOCK_A", 
                "PPP_RESOURCE_RANGE_INFO_PMIC_GPIO_DV", 
                "PPP_RESOURCE_ID_PMIC_GPIO_DV1", 
                "PPP_RESOURCE_ID_PMIC_GPIO_DV3", 
                "PPP_RESOURCE_RANGE_INFO_PMIC_MPP_DV", 
                "PPP_RESOURCE_ID_PMIC_MPP_DV1", 
                "PPP_RESOURCE_ID_PMIC_MPP_DV3", 
                "PPP_RESOURCE_RANGE_INFO_TLMM_GPIO_DV", 
                "PPP_RESOURCE_ID_TLMM_GPIO_DV1", 
                "PPP_RESOURCE_ID_TLMM_GPIO_DV3", 
                "PPP_RESOURCE_RANGE_INFO_DIV_CLK_A", 
                "PPP_RESOURCE_ID_DIV_CLK_1_A", 
                "PPP_RESOURCE_ID_DIV_CLK_3_A"
            })
            Method (PPRR, 0, NotSerialized)
            {
                Return (PRRP) /* \_SB_.PEP0.PRRP */
            }

            Method (PGSD, 0, NotSerialized)
            {
                Return (SDFR) /* \_SB_.PEP0.SDFR */
            }

            Name (FPDP, Zero)
            Method (FPMD, 0, NotSerialized)
            {
                Return (FPDP) /* \_SB_.PEP0.FPDP */
            }

            Name (PPPC, Zero)
            Method (PGPC, 0, NotSerialized)
            {
                Return (PPPC) /* \_SB_.PEP0.PPPC */
            }

            Name (CPRD, Package (0x03)
            {
                "CPR ACPI config table", 
                0x03, 
                Package (0x03)
                {
                    0xA5, 
                    One, 
                    Package (0x0D)
                    {
                        0x05, 
                        0x1388, 
                        One, 
                        One, 
                        0x0F, 
                        0x0001E848, 
                        0x00036EE8, 
                        0xF9000000, 
                        0x00018164, 
                        0xFC4B8000, 
                        0x4604, 
                        Zero, 
                        0x0A
                    }
                }
            })
            Method (CPRM, 0, NotSerialized)
            {
                Return (CPRD) /* \_SB_.PEP0.CPRD */
            }
        }

        Device (PRXY)
        {
            Name (_HID, "QCOM2427")  // _HID: Hardware ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.ABD, , 
                \_SB.PEP0, 
            })
            Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
            {
                Connection (
                    I2cSerialBusV2 (0x0001, ControllerInitiated, 0x00000000,
                        AddressingMode7Bit, "\\_SB.ABD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                ), 
                AccessAs (BufferAcc, AttribRawBytes (0x15)), 
                FLD0,   168
            }

            Method (GEPT, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x04){})
                CreateByteField (BUFF, Zero, STAT)
                CreateWordField (BUFF, 0x02, DATA)
                DATA = One
                Return (DATA) /* \_SB_.PRXY.GEPT.DATA */
            }
        }

        Device (STAT)
        {
            Name (_HID, "QCOM2489")  // _HID: Hardware ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (APMD, 0, NotSerialized)
            {
                Return (APCC) /* \_SB_.PEP0.APCC */
            }

            Name (APCC, Package (0x02)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.ADSP.ADCM.AUDD", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    0x001CFDE0, 
                                    0x00072BF0, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO6_A", 
                                    One, 
                                    0x001B7740, 
                                    0x3A98, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO4_A", 
                                    One, 
                                    0x00124F80, 
                                    0x1388, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    0x002EEBB8, 
                                    0x1388, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO6_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO4_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }
                    }
                }, 

                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.ADSP.ADCM.AUDD.MBHC", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    0x001CFDE0, 
                                    0x00072BF0, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO6_A", 
                                    One, 
                                    0x001B7740, 
                                    0x1388, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO4_A", 
                                    One, 
                                    0x00124F80, 
                                    0x07D0, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    0x002EEBB8, 
                                    0x07D0, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO6_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO4_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (GPMD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x07)
                    {
                        "DEVICE", 
                        "\\_SB.GPU0", 
                        Package (0x0D)
                        {
                            "COMPONENT", 
                            Zero, 
                            Package (0x02)
                            {
                                "FSTATE", 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "FSTATE", 
                                One, 
                                Package (0x0E)
                                {
                                    "ENTER", 
                                    Package (0x01)
                                    {
                                        "PSTATE_SAVE"
                                    }, 

                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x06, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x02, 
                                            0x07
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x03, 
                                            0x07
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x04, 
                                            0x20
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x05, 
                                            0x08
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0A)
                                        {
                                            "PPP_RESOURCE_ID_LDO4_A", 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0A)
                                        {
                                            "PPP_RESOURCE_ID_LDO14_A", 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0A)
                                        {
                                            "PPP_RESOURCE_ID_LDO19_A", 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0E)
                                        {
                                            "PPP_RESOURCE_ID_SMPS3_A", 
                                            0x02, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            0x05, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0E)
                                        {
                                            "PPP_RESOURCE_ID_SMPS4_A", 
                                            0x02, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            0x05, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICWLED", 
                                        Package (0x03)
                                        {
                                            "IOCTL_PM_WLED_MODULE_ENABLE", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "TLMMGPIO", 
                                        Package (0x06)
                                        {
                                            0x0C, 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            One, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x08)
                                {
                                    "EXIT", 
                                    Package (0x01)
                                    {
                                        "PSTATE_RESTORE"
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0E)
                                        {
                                            "PPP_RESOURCE_ID_SMPS3_A", 
                                            0x02, 
                                            0x00149970, 
                                            0x0016E360, 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            0x05, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0E)
                                        {
                                            "PPP_RESOURCE_ID_SMPS4_A", 
                                            0x02, 
                                            0x001B7740, 
                                            0x0016E360, 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            0x05, 
                                            Zero, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0A)
                                        {
                                            "PPP_RESOURCE_ID_LDO4_A", 
                                            One, 
                                            0x00124F80, 
                                            0x4E20, 
                                            One, 
                                            Zero, 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0A)
                                        {
                                            "PPP_RESOURCE_ID_LDO19_A", 
                                            One, 
                                            0x002B7CD0, 
                                            0x000249F0, 
                                            One, 
                                            Zero, 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "PMICVREGVOTE", 
                                        Package (0x0A)
                                        {
                                            "PPP_RESOURCE_ID_LDO14_A", 
                                            One, 
                                            0x001B7740, 
                                            0x07D0, 
                                            One, 
                                            Zero, 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "TLMMGPIO", 
                                        Package (0x06)
                                        {
                                            0x0C, 
                                            One, 
                                            One, 
                                            Zero, 
                                            Zero, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "STOP_FSTATE", 
                                Zero
                            }, 

                            Package (0x05)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_axi_clk", 
                                            0x05, 
                                            Zero, 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x05)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE", 
                                    One
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    One
                                }
                            }, 

                            Package (0x0B)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x00030D40
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x000249F0
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x02, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x000186A0
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x03, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x000124F8
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x04, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0xC350
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x05, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x927C
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x06, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x4B00
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x07, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    0x04
                                }
                            }, 

                            Package (0x0B)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x00030D40
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x000249F0
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x02, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x000186A0
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x03, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x000124F8
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x04, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0xC350
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x05, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x927C
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x06, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0x4B00
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x07, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    0x04
                                }
                            }, 

                            Package (0x24)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0E808000, 
                                            0x0D2F0000
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0D2F0000, 
                                            0x0BDD8000
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x02, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0BDD8000, 
                                            0x0AADC000
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x03, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0AADC000, 
                                            0x099C6000
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x04, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x099C6000, 
                                            0x08A65667
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x05, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x08A65667, 
                                            0x07C8E75D
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x06, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x07C8E75D, 
                                            0x07019D07
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x07, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x07019D07, 
                                            0x064E4086
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x08, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x064E4086, 
                                            0x05ACD3AC
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x09, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x05ACD3AC, 
                                            0x051B8B4E
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x0A, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x051B8B4E, 
                                            0x0498CA2C
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x0B, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0498CA2C, 
                                            0x04231C5C
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x0C, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x04231C5C, 
                                            0x03B93320
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x0D, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x03B93320, 
                                            0x0359E136
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x0E, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0359E136, 
                                            0x0304177E
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x0F, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0304177E, 
                                            0x02B6E1F1
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x10, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x02B6E1F1, 
                                            0x027164F3
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x11, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x027164F3, 
                                            0x0232DADB
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x12, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0232DADB, 
                                            0x01FA91C5
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x13, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x01FA91C5, 
                                            0x01C7E998
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x14, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x01C7E998, 
                                            0x019A523C
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x15, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x019A523C, 
                                            0x01714A03
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x16, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x01714A03, 
                                            0x014C5C36
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x17, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x014C5C36, 
                                            0x012B1FCA
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x18, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x012B1FCA, 
                                            0x010D3636
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x19, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x010D3636, 
                                            0x00F24A64
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x1A, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x00F24A64, 
                                            0x00DA0FC0
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x1B, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x00DA0FC0, 
                                            0x00C44160
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x1C, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x00C44160, 
                                            0x00B0A13D
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x1D, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x00B0A13D, 
                                            0x009EF784
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x1E, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x009EF784, 
                                            0x008F11F6
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x1F, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x008F11F6, 
                                            0x0080C35D
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x20, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    0x08
                                }
                            }, 

                            Package (0x0C)
                            {
                                "PSTATE_SET", 
                                0x05, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x7F22FF40, 
                                            0x7F22FF40
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x5F5E1000, 
                                            0x5F5E1000
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x02, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x47868C00, 
                                            0x47868C00
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x03, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            0x2FAF0800
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x04, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x23C34600, 
                                            0x23C34600
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x05, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x17D78400, 
                                            0x17D78400
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x06, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x11E1A300, 
                                            0x11E1A300
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x07, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x0927C000, 
                                            0x0927C000
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x08, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP1", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    0x04
                                }
                            }, 

                            Package (0x05)
                            {
                                "PSTATE_SET", 
                                0x06, 
                                Package (0x0E)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mmss_mmssnoc_ahb_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_ahb_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_axi_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_dsi_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_vsync_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_ahb_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_byte_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_pclk_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_esc_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_ahb", 
                                            0x9C40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/clk/mmnoc_axi", 
                                            0xC350
                                        }
                                    }
                                }, 

                                Package (0x0E)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            Zero, 
                                            "/clk/mmnoc_axi", 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "REQUIRED_RESOURCE", 
                                        Package (0x03)
                                        {
                                            Zero, 
                                            "/clk/mmnoc_ahb", 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_ahb_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_axi_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_dsi_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mdp_vsync_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_ahb_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_byte_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_pclk_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "dsi_esc_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mmss_mmssnoc_ahb_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x0B)
                        {
                            "COMPONENT", 
                            One, 
                            Package (0x02)
                            {
                                "FSTATE", 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "FSTATE", 
                                One, 
                                Package (0x06)
                                {
                                    "ENTER", 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gmem_gfx3d_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_ahb_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "bimc_gfx_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gcc_bimc_smmu_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x06)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gcc_bimc_smmu_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "bimc_gfx_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_ahb_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gmem_gfx3d_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "FSTATE", 
                                0x02, 
                                Package (0x0B)
                                {
                                    "ENTER", 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gmem_gfx3d_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_ahb_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x01)
                                    {
                                        "PSTATE_SAVE"
                                    }, 

                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x03, 
                                            0x03
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x02)
                                        {
                                            "VDD_OXILI", 
                                            0x02
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "bimc_gfx_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gcc_bimc_smmu_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mmss_mmssnoc_ahb_clk", 
                                            0x02, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_GFX3D_CFG", 
                                            Zero, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x0A)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "mmss_mmssnoc_ahb_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gcc_bimc_smmu_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "bimc_gfx_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x02)
                                        {
                                            "VDD_OXILI", 
                                            One
                                        }
                                    }, 

                                    Package (0x01)
                                    {
                                        "PSTATE_RESTORE"
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_ahb_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "gmem_gfx3d_clk", 
                                            One, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_GFX3D_CFG", 
                                            0x11E1A300, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "STOP_FSTATE", 
                                0x02
                            }, 

                            Package (0x05)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x09)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "bimc_gfx_clk", 
                                            0x0A, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x0A, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_ahb_clk", 
                                            0x0A, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "DELAY", 
                                        Package (0x01)
                                        {
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "bimc_gfx_clk", 
                                            0x0B, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x0B, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_ahb_clk", 
                                            0x0B, 
                                            Zero, 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x05)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x02)
                                        {
                                            "VDD_OXILI", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x02)
                                        {
                                            "VDD_OXILI", 
                                            0x02
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    One
                                }
                            }, 

                            Package (0x06)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x03, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x03, 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x02, 
                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x03, 
                                            0x02
                                        }
                                    }
                                }, 

                                Package (0x03)
                                {
                                    "PSTATE", 
                                    0x03, 
                                    Package (0x02)
                                    {
                                        "PSTATE_ADJUST", 
                                        Package (0x02)
                                        {
                                            0x03, 
                                            0x03
                                        }
                                    }
                                }
                            }, 

                            Package (0x07)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x03, 
                                            0x17D78400, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_GFX3D", 
                                            "ICBID_SLAVE_EBI1", 
                                            0xFE277A00, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x04)
                                {
                                    "PSTATE", 
                                    One, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x03, 
                                            0x11E1A300, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_GFX3D", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x5F5E1000, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x04)
                                {
                                    "PSTATE", 
                                    0x02, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x03, 
                                            0x08F0D180, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_GFX3D", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x04)
                                {
                                    "PSTATE", 
                                    0x03, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x04)
                                        {
                                            "oxili_gfx3d_clk", 
                                            0x03, 
                                            Zero, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_GFX3D", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x07)
                        {
                            "COMPONENT", 
                            0x02, 
                            Package (0x02)
                            {
                                "FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "STOP_FSTATE", 
                                Zero
                            }, 

                            Package (0x05)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE", 
                                    One
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x05)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE", 
                                    One
                                }, 

                                Package (0x02)
                                {
                                    "STOP_PSTATE", 
                                    One
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "COMPONENT", 
                            0x03, 
                            Package (0x02)
                            {
                                "FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "STOP_FSTATE", 
                                Zero
                            }
                        }, 

                        Package (0x06)
                        {
                            "COMPONENT", 
                            0x04, 
                            Package (0x02)
                            {
                                "FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "STOP_FSTATE", 
                                One
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.GPMD.GPCC */
            }
        }

        Scope (\_SB.PEP0)
        {
            Method (MPMD, 0, NotSerialized)
            {
                Return (MPCC) /* \_SB_.PEP0.MPCC */
            }

            Name (MPCC, Package (0x00){})
        }

        Scope (\_SB.PEP0)
        {
            Method (OPMD, 0, NotSerialized)
            {
                Return (OPCC) /* \_SB_.PEP0.OPCC */
            }

            Name (OPCC, Package (0x02)
            {
                Package (0x06)
                {
                    "DEVICE", 
                    "\\_SB.DISP", 
                    Package (0x05)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0E)
                            {
                                "PPP_RESOURCE_ID_SMPS4_A", 
                                0x02, 
                                0x00200B20, 
                                0x000927C0, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x05, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0x32C8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0x0001ADB0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0E)
                            {
                                "PPP_RESOURCE_ID_SMPS4_A", 
                                0x02, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x05, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.NRSD", 
                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (CRMD, 0, NotSerialized)
            {
                Return (CRCC) /* \_SB_.PEP0.CRCC */
            }

            Name (CRCC, Package (0x01)
            {
                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.QBCC", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x04)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/pnoc", 
                                    0x000124F8
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_prng_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/pnoc", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_prng_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "COMPONENT", 
                        One, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_axi_clk", 
                                    One, 
                                    Zero, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    One, 
                                    Zero, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_axi_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0BEBC200, 
                                    0x0BEBC200
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x05F5E100, 
                                    0x05F5E100
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    0x03, 
                                    0x02FAF080, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x02FAF080, 
                                    0x02FAF080
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    0x03, 
                                    0x02FAF080, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    0x03, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (SPMD, 0, NotSerialized)
            {
                Return (SPCC) /* \_SB_.PEP0.SPCC */
            }

            Name (SPCC, Package (0x03)
            {
                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.AMSS", 
                    Package (0x06)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x05)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_mx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_boot_rom_ahb_clk", 
                                    One, 
                                    Zero, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_mx", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_boot_rom_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            0x02
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.ADSP", 
                    Package (0x05)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.RIVA", 
                    Package (0x05)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x12)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS3_A", 
                                    0x02, 
                                    0x00149970, 
                                    0x0016E360, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    0x0020CE70, 
                                    0x0016E360, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_mx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO6_A", 
                                    One, 
                                    0x001B7740, 
                                    0x59D8, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO10_A", 
                                    One, 
                                    0x001B7740, 
                                    0x2648, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO13_A", 
                                    One, 
                                    0x001B7740, 
                                    0x1388, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO16_A", 
                                    One, 
                                    0x002DC6C0, 
                                    0x00061A80, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO5_A", 
                                    One, 
                                    0x0013D620, 
                                    0x000927C0, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO1_A", 
                                    One, 
                                    0x0012B128, 
                                    0x000927C0, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x04)
                                {
                                    "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A", 
                                    0x06, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x17, 
                                    One, 
                                    One, 
                                    One, 
                                    One, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x18, 
                                    One, 
                                    One, 
                                    One, 
                                    One, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x19, 
                                    One, 
                                    One, 
                                    One, 
                                    One, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x1A, 
                                    One, 
                                    One, 
                                    One, 
                                    One, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x1B, 
                                    One, 
                                    One, 
                                    One, 
                                    One, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x0D)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x04)
                                {
                                    "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A", 
                                    0x06, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO1_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO5_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO16_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO13_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO10_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO6_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_mx", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS3_A", 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (PPMD, 0, NotSerialized)
            {
                Return (PPCC) /* \_SB_.PEP0.PPCC */
            }

            Name (PPCC, Package (0x04)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.PRXY", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.STAT", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }
                }, 

                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.UAR1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    0x81, 
                    "\\_SB.GIO0", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x03)
                    {
                        "COMPONENT", 
                        One, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }
                }
            })
            Name (SDFR, Package (0x01)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.SDFR", 
                    Package (0x0B)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x05)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x29)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x04, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x06, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x0F, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x12, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x13, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x15, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x2A, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x30, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x37, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x3F, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x43, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x44, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x46, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x47, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x4B, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x4C, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x4D, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x4E, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x4F, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x50, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x53, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x54, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x55, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x56, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x57, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x58, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x59, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x5A, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x5B, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x5C, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x5D, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x5E, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x5F, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x60, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x61, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x62, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x63, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x06)
                                {
                                    0x65, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PMICGPIO", 
                                Package (0x04)
                                {
                                    "IOCTL_PM_GPIO_SET_EXT_PIN_CONFIG", 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    "IOCTL_PM_GPIO_SET_EXT_PIN_CONFIG", 
                                    Zero, 
                                    One, 
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    "IOCTL_PM_GPIO_SET_EXT_PIN_CONFIG", 
                                    Zero, 
                                    0x02, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICMPP", 
                                Package (0x05)
                                {
                                    "IOCTL_PM_MPP_CONFIG_I_SINK", 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }, 

                        Package (0x03)
                        {
                            "FSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/dcvs.ena", 
                                    One
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            0x03
                        }, 

                        Package (0x04)
                        {
                            "FSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "FSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/pnoc", 
                                    0x4B00
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    0x002EEBB8, 
                                    0x3E80, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO10_A", 
                                    One, 
                                    0x001B7740, 
                                    0x4A38, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            0x06
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            0x07
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (SMMD, 0, NotSerialized)
            {
                Return (SMCC) /* \_SB_.PEP0.SMCC */
            }

            Name (SMCC, Package (0x01)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.SMMU", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x0A)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mmssnoc_ahb_clk", 
                                    One, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_ahb_clk", 
                                    One, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_axi_clk", 
                                    One, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mdp_ahb_clk", 
                                    One, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mdp_axi_clk", 
                                    One, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "oxili_ahb_clk", 
                                    One, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "bimc_gfx_clk", 
                                    One, 
                                    0x05F5E100, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_lpass_q6_axi_clk", 
                                    One, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x0A)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_ahb_clk", 
                                    0x02, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_axi_clk", 
                                    0x02, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mdp_ahb_clk", 
                                    0x02, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mdp_axi_clk", 
                                    0x02, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "oxili_ahb_clk", 
                                    0x02, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "bimc_gfx_clk", 
                                    0x02, 
                                    0x05F5E100, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_lpass_q6_axi_clk", 
                                    0x02, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mmss_mmssnoc_ahb_clk", 
                                    0x02, 
                                    0x04C4B400, 
                                    0x03
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (SCMD, 0, NotSerialized)
            {
                Return (SCCC) /* \_SB_.PEP0.SCCC */
            }

            Name (SCCC, Package (0x01)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.SCM0", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x0BEBC200, 
                                    0x0BEBC200
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_axi_clk", 
                                    One, 
                                    Zero, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    0x08, 
                                    0x05F5E100, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_CRYPTO_CORE0", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_axi_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_ce1_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LMPM, 0, NotSerialized)
            {
                Return (NMPM) /* \_SB_.PEP0.NMPM */
            }

            Name (NMPM, Package (0x03)
            {
                Package (0x02)
                {
                    "MPM_SCALAR_CONFIG", 
                    Package (0x05)
                    {
                        0xFC428000, 
                        0x4000, 
                        0xF9000000, 
                        0x00012000, 
                        0x01D0
                    }
                }, 

                Package (0x02)
                {
                    "MPM_INTERRUPT_CONFIG", 
                    Package (0x06)
                    {
                        0x3F, 
                        Package (0x02)
                        {
                            0x2A, 
                            0x9B
                        }, 

                        Package (0x02)
                        {
                            0x2B, 
                            0x9C
                        }, 

                        Package (0x02)
                        {
                            0x31, 
                            0xAC
                        }, 

                        Package (0x02)
                        {
                            0x3A, 
                            0xAC
                        }, 

                        Package (0x02)
                        {
                            0x3E, 
                            0xDE
                        }
                    }
                }, 

                Package (0x02)
                {
                    "MPM_GPIO_CONFIG", 
                    Package (0x26)
                    {
                        0x3F, 
                        Package (0x04)
                        {
                            0x03, 
                            0x02, 
                            0x66, 
                            0xFF
                        }, 

                        Package (0x04)
                        {
                            0x04, 
                            0x02, 
                            One, 
                            0xFF
                        }, 

                        Package (0x04)
                        {
                            0x05, 
                            0x02, 
                            0x05, 
                            0x2A
                        }, 

                        Package (0x04)
                        {
                            0x06, 
                            0x02, 
                            0x09, 
                            0x2B
                        }, 

                        Package (0x04)
                        {
                            0x07, 
                            0x02, 
                            0x12, 
                            0x2C
                        }, 

                        Package (0x04)
                        {
                            0x08, 
                            0x02, 
                            0x14, 
                            0x2D
                        }, 

                        Package (0x04)
                        {
                            0x09, 
                            0x02, 
                            0x18, 
                            0x04
                        }, 

                        Package (0x04)
                        {
                            0x0A, 
                            0x02, 
                            0x1B, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x0B, 
                            0x02, 
                            0x1C, 
                            0x08
                        }, 

                        Package (0x04)
                        {
                            0x0C, 
                            0x02, 
                            0x22, 
                            0x09
                        }, 

                        Package (0x04)
                        {
                            0x0D, 
                            0x02, 
                            0x2A, 
                            0x0A
                        }, 

                        Package (0x04)
                        {
                            0x0E, 
                            0x02, 
                            0x25, 
                            0x0C
                        }, 

                        Package (0x04)
                        {
                            0x10, 
                            0x02, 
                            0x2C, 
                            0x0E
                        }, 

                        Package (0x04)
                        {
                            0x11, 
                            0x02, 
                            0x2E, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x12, 
                            0x02, 
                            0x32, 
                            One
                        }, 

                        Package (0x04)
                        {
                            0x13, 
                            0x02, 
                            0x36, 
                            0x25
                        }, 

                        Package (0x04)
                        {
                            0x14, 
                            0x02, 
                            0x3B, 
                            0x26
                        }, 

                        Package (0x04)
                        {
                            0x15, 
                            0x02, 
                            0x3D, 
                            0x02
                        }, 

                        Package (0x04)
                        {
                            0x16, 
                            0x02, 
                            0x3E, 
                            0x03
                        }, 

                        Package (0x04)
                        {
                            0x17, 
                            0x02, 
                            0x40, 
                            0x23
                        }, 

                        Package (0x04)
                        {
                            0x18, 
                            0x02, 
                            0x41, 
                            0x24
                        }, 

                        Package (0x04)
                        {
                            0x19, 
                            0x02, 
                            0x42, 
                            0xFF
                        }, 

                        Package (0x04)
                        {
                            0x1A, 
                            0x02, 
                            0x43, 
                            0xFF
                        }, 

                        Package (0x04)
                        {
                            0x1B, 
                            0x02, 
                            0x44, 
                            0xFF
                        }, 

                        Package (0x04)
                        {
                            0x1C, 
                            0x02, 
                            0x47, 
                            0x20
                        }, 

                        Package (0x04)
                        {
                            0x1D, 
                            0x02, 
                            0x48, 
                            0x05
                        }, 

                        Package (0x04)
                        {
                            0x1E, 
                            0x02, 
                            0x49, 
                            0x22
                        }, 

                        Package (0x04)
                        {
                            0x1F, 
                            0x02, 
                            0x4A, 
                            0x21
                        }, 

                        Package (0x04)
                        {
                            0x20, 
                            0x02, 
                            0x4B, 
                            0x27
                        }, 

                        Package (0x04)
                        {
                            0x21, 
                            0x02, 
                            0x4D, 
                            0x1E
                        }, 

                        Package (0x04)
                        {
                            0x22, 
                            0x02, 
                            0x4F, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x23, 
                            0x02, 
                            0x50, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x24, 
                            0x02, 
                            0x52, 
                            0x18
                        }, 

                        Package (0x04)
                        {
                            0x25, 
                            0x02, 
                            0x56, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x26, 
                            0x02, 
                            0x5C, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x27, 
                            0x02, 
                            0x5D, 
                            0xFF
                        }, 

                        Package (0x04)
                        {
                            0x28, 
                            0x02, 
                            0x5F, 
                            0x19
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LVDD, 0, NotSerialized)
            {
                Return (NVDD) /* \_SB_.PEP0.NVDD */
            }

            Name (NVDD, Package (0x03)
            {
                Package (0x02)
                {
                    "PEP_VDD_CX", 
                    Package (0x0B)
                    {
                        "PPP_RESOURCE_ID_SMPS1_A", 
                        0x02, 
                        0x07, 
                        0x04, 
                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x02, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x03, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x04, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero
                        }, 

                        Package (0x0C)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x05, 
                            Zero, 
                            Zero, 
                            0x06, 
                            Zero
                        }
                    }
                }, 

                Package (0x02)
                {
                    "PEP_VDD_MX", 
                    Package (0x0B)
                    {
                        "PPP_RESOURCE_ID_LDO3_A", 
                        One, 
                        0x07, 
                        0x06, 
                        Package (0x08)
                        {
                            0x000B71B0, 
                            0x03E8, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x000B71B0, 
                            0x03E8, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x00100590, 
                            0x000927C0, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x00100590, 
                            0x000927C0, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x00118C30, 
                            0x000927C0, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x00137478, 
                            0x000927C0, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x00137478, 
                            0x000927C0, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            One, 
                            Zero
                        }
                    }
                }, 

                Package (0x02)
                {
                    "PEP_VDD_HFPLL", 
                    Package (0x07)
                    {
                        "PPP_RESOURCE_ID_LDO10_A", 
                        One, 
                        0x03, 
                        One, 
                        Package (0x08)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x001B7740, 
                            0x0708, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            0x001B7740, 
                            0x4A38, 
                            One, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (QDMD, 0, NotSerialized)
            {
                Return (QDSC) /* \_SB_.PEP0.QDSC */
            }

            Name (QDSC, Package (0x01)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.QDSS", 
                    Package (0x06)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x03)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "REQUIRED_RESOURCE", 
                                    Package (0x03)
                                    {
                                        One, 
                                        "/clk/qdss", 
                                        Zero
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "REQUIRED_RESOURCE", 
                                    Package (0x03)
                                    {
                                        One, 
                                        "/clk/qdss", 
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "REQUIRED_RESOURCE", 
                                    Package (0x03)
                                    {
                                        One, 
                                        "/clk/qdss", 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "REQUIRED_RESOURCE", 
                                    Package (0x03)
                                    {
                                        One, 
                                        "/clk/qdss", 
                                        0x03
                                    }
                                }
                            }
                        }, 

                        Package (0x06)
                        {
                            "PSTATE_SET", 
                            One, 
                            Package (0x14)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x10F0, 
                                        0x01C8, 
                                        0x01C8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1100, 
                                        0x01C8, 
                                        0x01C8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1110, 
                                        0x01C8, 
                                        0x01C8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1120, 
                                        0x01C8, 
                                        0x01C8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1130, 
                                        0x01D4, 
                                        0x01D4
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1140, 
                                        0x01D4, 
                                        0x01D4
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1150, 
                                        0x01D4, 
                                        0x01D4
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1160, 
                                        0x01D4, 
                                        0x01D4
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1170, 
                                        0x01D8, 
                                        0x01D8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1180, 
                                        0x01D8, 
                                        0x01D8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1190, 
                                        0x01D8, 
                                        0x01D8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x11A0, 
                                        0x01DC, 
                                        0x01DC
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x11B0, 
                                        0x01DC, 
                                        0x01DC
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x11C0, 
                                        0x01D4, 
                                        0x01D4
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1590, 
                                        0x01C8, 
                                        0x01C8
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x15A0, 
                                        0x01CC, 
                                        0x01CC
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x15B0, 
                                        0x01CC, 
                                        0x01CC
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x15C0, 
                                        0x01CC, 
                                        0x01CC
                                    }
                                }
                            }, 

                            Package (0x14)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x10F0, 
                                        0x01C8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1100, 
                                        0x01C8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1110, 
                                        0x01C8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1120, 
                                        0x01C8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1130, 
                                        0x01D4, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1140, 
                                        0x01D4, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1150, 
                                        0x01D4, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1160, 
                                        0x01D4, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1170, 
                                        0x01D8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1180, 
                                        0x01D8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1190, 
                                        0x01D8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x11A0, 
                                        0x01DC, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x11B0, 
                                        0x01DC, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x11C0, 
                                        0x01D4, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x1590, 
                                        0x01C8, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x15A0, 
                                        0x01CC, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x15B0, 
                                        0x01CC, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x15C0, 
                                        0x01CC, 
                                        Zero
                                    }
                                }
                            }, 

                            Package (0x06)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x2048, 
                                        0x016D, 
                                        0x016D
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x2014, 
                                        One, 
                                        One
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO21_A", 
                                        One, 
                                        0x002D0370, 
                                        0x2328, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO13_A", 
                                        One, 
                                        0x002D0370, 
                                        0x06, 
                                        One, 
                                        Zero, 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }
                            }, 

                            Package (0x06)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x2048, 
                                        0x016D, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "TLMMPORT", 
                                    Package (0x03)
                                    {
                                        0x2014, 
                                        One, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO21_A", 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PMICVREGVOTE", 
                                    Package (0x0A)
                                    {
                                        "PPP_RESOURCE_ID_LDO13_A", 
                                        One, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (SENX, 0, NotSerialized)
            {
                Return (LNES) /* \_SB_.PEP0.LNES */
            }

            Name (LNES, Package (0x00){})
        }

        Scope (\_SB.PEP0)
        {
            Method (CPMD, 0, NotSerialized)
            {
                Return (CPCC) /* \_SB_.PEP0.CPCC */
            }

            Name (CPCC, Package (0x04)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.CAMP", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x0A)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/clk/mmnoc_ahb", 
                                    0x00013880
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x10, 
                                    One, 
                                    One, 
                                    One, 
                                    0x03, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x11, 
                                    One, 
                                    One, 
                                    One, 
                                    0x03, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS3_A", 
                                    0x02, 
                                    0x00149970, 
                                    0x0016E360, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO4_A", 
                                    One, 
                                    0x00124F80, 
                                    0x4E20, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_qup6_i2c_apps_clk", 
                                    0x08, 
                                    0x0124F800, 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x0A)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_qup6_i2c_apps_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO4_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS3_A", 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x11, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x10, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    Zero, 
                                    "/clk/mmnoc_ahb", 
                                    Zero
                                }
                            }
                        }
                    }
                }, 

                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.CAMS", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x12)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO22_A", 
                                    One, 
                                    0x002B7CD0, 
                                    0x00015F90, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    0x0020CE70, 
                                    0x0016E360, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO14_A", 
                                    One, 
                                    0x001B7740, 
                                    0xD6D8, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0_clk", 
                                    0x08, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0phytimer_clk", 
                                    0x08, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi0phy_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0phy_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi0pix_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0pix_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi0rdi_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0rdi_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mclk0_clk", 
                                    0x08, 
                                    0x00927C00, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x0D, 
                                    One, 
                                    One, 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x05
                                }
                            }
                        }, 

                        Package (0x12)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x0D, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0rdi_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi0rdi_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0pix_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi0pix_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mclk0_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0phy_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi0phy_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0phytimer_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi0_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO14_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO22_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x0A
                                }
                            }
                        }
                    }
                }, 

                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.CAMF", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x14)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO22_A", 
                                    One, 
                                    0x002AB980, 
                                    0x00015F90, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    0x0020CE70, 
                                    0x0016E360, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO14_A", 
                                    One, 
                                    0x001B7740, 
                                    0xD6D8, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1_clk", 
                                    0x08, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1phytimer_clk", 
                                    0x08, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi1phy_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1phy_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mclk1_clk", 
                                    0x08, 
                                    0x00927C00, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi1pix_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1pix_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi1rdi_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1rdi_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x0E, 
                                    One, 
                                    One, 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x14, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x05
                                }
                            }
                        }, 

                        Package (0x13)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x14, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x0E, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1rdi_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi1rdi_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1pix_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi1pix_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "mclk1_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1phy_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x05)
                                {
                                    "csi1phy_clk", 
                                    0x09, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1phytimer_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi1_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO14_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0E)
                                {
                                    "PPP_RESOURCE_ID_SMPS4_A", 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x05, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO22_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x0A
                                }
                            }
                        }
                    }
                }, 

                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.VFE0", 
                    Package (0x0B)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x08)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VFE", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x77359400, 
                                    0x3B9ACA00
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x08, 
                                    0x023C3460, 
                                    0x03
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_ahb_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_axi_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi_vfe_clk", 
                                    One, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VFE", 
                                    One
                                }
                            }
                        }, 

                        Package (0x08)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "FOOTSWITCH", 
                                Package (0x02)
                                {
                                    "VDD_VFE", 
                                    0x02
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "csi_vfe_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_axi_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x02, 
                                    Zero, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_VFE", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x03, 
                                    0x1312D000, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x03, 
                                    0x0FE502AB, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x03, 
                                    0x07ED6B40, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x03, 
                                    0x02FAF080, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "vfe_clk", 
                                    0x03, 
                                    0x023C3460, 
                                    0x03
                                }
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LPMX, 0, NotSerialized)
            {
                Return (LPXC) /* \_SB_.PEP0.LPXC */
            }

            Name (LPXC, Package (0x02)
            {
                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.TSC1", 
                    Package (0x08)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0x2710, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0x2710, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                Zero, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x19
                            }
                        }
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x04)
                {
                    "DEVICE", 
                    "\\_SB.TSC2", 
                    Package (0x06)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0x2710, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x14
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0x2710, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            })
            Method (BPMD, 0, NotSerialized)
            {
                Return (BPCC) /* \_SB_.PEP0.BPCC */
            }

            Name (BPCC, Package (0x07)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.I2C1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                One, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup1_i2c_apps_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x0927C000, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x02, 
                                One, 
                                0x03, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x03, 
                                One, 
                                0x03, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                0x02, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup1_i2c_apps_clk", 
                                0x02, 
                                0x0124F800, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x03, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x02, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.UFN1", 
                    Package (0x09)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x08)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_system_clk", 
                                    0x08, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_ahb_clk", 
                                    0x08, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_USB_HS1", 
                                    "ICBID_SLAVE_EBI1", 
                                    0x5DC00000, 
                                    0x03C00000
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    0x002EEBB8, 
                                    0x3E80, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/hfpll1", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            One
                        }, 

                        Package (0x08)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_system_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_ahb_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_USB_HS1", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/hfpll1", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x08)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_system_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_ahb_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_USB_HS1", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/hfpll1", 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x08)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_system_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_ahb_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_USB_HS1", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    0x04
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    0x002EEBB8, 
                                    0x03E8, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/hfpll1", 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x08)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_system_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_usb_hs_ahb_clk", 
                                    0x02, 
                                    0x03938700, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "BUSARB", 
                                Package (0x05)
                                {
                                    0x03, 
                                    "ICBID_MASTER_USB_HS1", 
                                    "ICBID_SLAVE_EBI1", 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/rail_cx", 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO20_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "REQUIRED_RESOURCE", 
                                Package (0x03)
                                {
                                    One, 
                                    "/pmic/client/hfpll1", 
                                    Zero
                                }
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.I2C3", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                One, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup3_i2c_apps_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x0927C000, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x0A, 
                                One, 
                                0x03, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x0B, 
                                One, 
                                0x03, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                0x02, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup3_i2c_apps_clk", 
                                0x02, 
                                0x0124F800, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x0B, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x0A, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.I2C5", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x06)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                One, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup5_i2c_apps_clk", 
                                0x08, 
                                0x0124F800, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x0927C000, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2050, 
                                Ones, 
                                0x03C00000
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                0x02, 
                                0x05F5E100, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup5_i2c_apps_clk", 
                                0x02, 
                                0x0124F800, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_BLSP_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.SPI4", 
                    Package (0x07)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_qup4_spi_apps_clk", 
                                    0x03, 
                                    0x00989680, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_qup4_spi_apps_clk", 
                                    0x03, 
                                    0x00989680, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_qup4_spi_apps_clk", 
                                    0x03, 
                                    0x00989680, 
                                    0x03
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_qup4_spi_apps_clk", 
                                    0x03, 
                                    0x00989680, 
                                    0x03
                                }
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                One, 
                                Zero, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup4_spi_apps_clk", 
                                One, 
                                Zero, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x56, 
                                One, 
                                One, 
                                One, 
                                One, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x57, 
                                One, 
                                One, 
                                Zero, 
                                One, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x58, 
                                One, 
                                One, 
                                One, 
                                0x03, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x59, 
                                One, 
                                One, 
                                One, 
                                0x03, 
                                One
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x08)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_ahb_clk", 
                                0x02, 
                                Zero, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_blsp1_qup4_spi_apps_clk", 
                                0x02, 
                                Zero, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x56, 
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x57, 
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x58, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x59, 
                                Zero, 
                                Zero, 
                                Zero, 
                                One, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.SDC1", 
                    Package (0x1A)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x00061A80, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x017D7840, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x017D7840, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x018CBA80, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x02FAF080, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x02FAF080, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x03197500, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x0632EA00, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc1_apps_clk", 
                                    0x03, 
                                    0x0C65D400, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }
                    }, 

                    Package (0x08)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO17_A", 
                                One, 
                                0x002D0370, 
                                0x00061A80, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO6_A", 
                                One, 
                                0x001B7740, 
                                0xEA60, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2044, 
                                0x7FFF, 
                                0x1F52
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_SDCC_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x17D78400, 
                                0x0BEBC200
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc1_ahb_clk", 
                                One, 
                                0x05F5E100, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk", 
                                0x08, 
                                0x0BEBC200, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x06)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc1_ahb_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_SDCC_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2044, 
                                0x7FFF, 
                                0x1E00
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.SDC2", 
                    Package (0x1C)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x00061A80, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x017D7840, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x017D7840, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x018CBA80, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x02FAF080, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x02FAF080, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x03197500, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x0632EA00, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x05F5E100, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x0BEBC200, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_sdcc2_apps_clk", 
                                    0x03, 
                                    0x0C65D400, 
                                    0x02
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    One
                                }
                            }
                        }, 

                        Package (0x08)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO18_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO21_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x23
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO18_A", 
                                    One, 
                                    0x002D0370, 
                                    0x00061A80, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO21_A", 
                                    One, 
                                    0x002D0370, 
                                    0xC350, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x23
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            0x15, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO21_A", 
                                    One, 
                                    0x001C3A90, 
                                    0xC350, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x23
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "PSTATE", 
                            0x16, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO18_A", 
                                    One, 
                                    0x002D0370, 
                                    0x00061A80, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO21_A", 
                                    One, 
                                    0x002D0370, 
                                    0xC350, 
                                    One, 
                                    Zero, 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x23
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "PSTATE", 
                            0x17, 
                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO18_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PMICVREGVOTE", 
                                Package (0x0A)
                                {
                                    "PPP_RESOURCE_ID_LDO21_A", 
                                    One, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "DELAY", 
                                Package (0x01)
                                {
                                    0x23
                                }
                            }
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                0x16
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2048, 
                                0x7FFF, 
                                0x1F6D
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_SDCC_2", 
                                "ICBID_SLAVE_EBI1", 
                                0x17D78400, 
                                0x0BEBC200
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_ahb_clk", 
                                One, 
                                0x05F5E100, 
                                0x04
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x08, 
                                0x0BEBC200, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x07)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_ahb_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk", 
                                0x02, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_SDCC_2", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMPORT", 
                            Package (0x03)
                            {
                                0x2048, 
                                0x7FFF, 
                                0x0A00
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                0x17
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (LPMD, 0, NotSerialized)
            {
                Return (LPCC) /* \_SB_.PEP0.LPCC */
            }

            Name (LPCC, Package (0x06)
            {
                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.ACC1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0xB9, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0x07D0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x05
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.ACC2", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0xB9, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0x07D0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x0F
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.ACC3", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0xB9, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0x07D0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x0F
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.ALS1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0x000186A0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0xD6D8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x05)
                {
                    "DEVICE", 
                    "\\_SB.PRX1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002B7CD0, 
                                0x000186A0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0xD6D8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.APS1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                0x001B7740, 
                                0x32C8, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                0x002C4020, 
                                0x000493E0, 
                                One, 
                                Zero, 
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x05
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO19_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x0A)
                            {
                                "PPP_RESOURCE_ID_LDO14_A", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (AUMD, 0, NotSerialized)
            {
                Return (DMCC) /* \_SB_.PEP0.DMCC */
            }

            Name (DMCC, Package (0x01)
            {
                Package (0x03)
                {
                    "DEVICE", 
                    "\\_SB.UAR3", 
                    Package (0x18)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x09, 
                                    One, 
                                    0x02, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x08, 
                                    One, 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x09, 
                                    One, 
                                    0x02, 
                                    Zero, 
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "TLMMGPIO", 
                                Package (0x06)
                                {
                                    0x08, 
                                    One, 
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x02, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x03, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x04, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    One, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x05, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x02, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x06, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    One, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x07, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_ahb_clk", 
                                    0x02, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x08, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    One, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x09, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x02, 
                                    Zero, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0A, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x00708000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0B, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x00E10000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0C, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x00F42400, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0D, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x016E3600, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0E, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x01E84800, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x0F, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x02625A00, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x10, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x02DC6C00, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x11, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x030D4000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x12, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x03567E00, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x13, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x03840000, 
                                    0x04
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "PSTATE", 
                            0x14, 
                            Package (0x02)
                            {
                                "CLOCK", 
                                Package (0x04)
                                {
                                    "gcc_blsp1_uart3_apps_clk", 
                                    0x03, 
                                    0x03D09000, 
                                    0x04
                                }
                            }
                        }
                    }
                }
            })
        }

        Device (BAM0)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x40, 0x40, 0xFD,  // .....@@.
                    /* 0008 */  0x00, 0x90, 0x00, 0x00, 0x89, 0x06, 0x00, 0x03,  // ........
                    /* 0010 */  0x01, 0xEF, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.BAM0._CRS.RBUF */
            }
        }

        Device (BAM1)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x40, 0x90, 0xF9,  // .....@..
                    /* 0008 */  0x00, 0x90, 0x01, 0x00, 0x89, 0x06, 0x00, 0x03,  // ........
                    /* 0010 */  0x01, 0x0E, 0x01, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.BAM1._CRS.RBUF */
            }
        }

        Device (BAM2)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x0C)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x40, 0xA4, 0xF9,  // .....@..
                    /* 0008 */  0x00, 0x10, 0x01, 0x00, 0x89, 0x06, 0x00, 0x03,  // ........
                    /* 0010 */  0x01, 0xA7, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.BAM2._CRS.RBUF */
            }
        }

        Device (BAM3)
        {
            Name (_HID, "QCOM2401")  // _HID: Hardware ID
            Name (_UID, 0x0E)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x40, 0x83, 0xFC,  // .....@..
                    /* 0008 */  0x00, 0x70, 0x00, 0x00, 0x89, 0x06, 0x00, 0x03,  // .p......
                    /* 0010 */  0x01, 0x3D, 0x00, 0x00, 0x00, 0x79, 0x00         // .=...y.
                })
                Return (RBUF) /* \_SB_.BAM3._CRS.RBUF */
            }
        }

        Device (CDI)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PILC, , 
                \_SB.RPEN, 
            })
            Name (_HID, "QCOM245B")  // _HID: Hardware ID
        }

        Device (RPEN)
        {
            Name (_HID, "QCOM245C")  // _HID: Hardware ID
        }

        Device (PILC)
        {
            Name (_HID, "QCOM2429")  // _HID: Hardware ID
            Name (IMEM, Package (0x01)
            {
                Package (0x02)
                {
                    0xFE805000, 
                    0x094C
                }
            })
        }

        Device (ADSP)
        {
            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.PEP0, , 
                \_SB.PILC, , 
                \_SB.SMD0, , 
                \_SB.RPEN, 
            })
            Name (_HID, "QCOM242B")  // _HID: Hardware ID
            Method (MANU, 0, NotSerialized)
            {
                Name (RBUF, Package (0x01)
                {
                    0x06BE0BAF
                })
                Return (RBUF) /* \_SB_.ADSP.MANU.RBUF */
            }

            Method (CHLD, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    Package (0x04)
                    {
                        "ADSP\\QCOM242D", 
                        0x1D, 
                        One, 
                        One
                    }
                })
            }

            Device (ADCM)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (INFO, 0, NotSerialized)
                {
                    Name (RBUF, Package (0x1F)
                    {
                        0x06, 
                        0x0E000000, 
                        0x12000000, 
                        0x60, 
                        0x2000, 
                        Package (0x02)
                        {
                            Zero, 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            0x00010312, 
                            Zero
                        }, 

                        Package (0x03)
                        {
                            0x00012E16, 
                            One, 
                            ToUUID ("6f64adcc-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x03)
                        {
                            0x00010D90, 
                            One, 
                            ToUUID ("6f64adc6-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x03)
                        {
                            0x000106CA, 
                            One, 
                            ToUUID ("6f64adc6-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x05)
                        {
                            0x00010315, 
                            0x03, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x05)
                        {
                            0x00010316, 
                            0x03, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x07)
                        {
                            0x00010F71, 
                            0x05, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbe-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x07)
                        {
                            0x00010F72, 
                            0x05, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbe-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x07)
                        {
                            0x00010F75, 
                            0x05, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbe-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x07)
                        {
                            0x00010F73, 
                            0x05, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbe-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x07)
                        {
                            0x00010F74, 
                            0x05, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbe-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x04)
                        {
                            0x00010313, 
                            0x02, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x05)
                        {
                            0x00010314, 
                            0x03, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x05)
                        {
                            0x00010317, 
                            0x03, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x05)
                        {
                            0x00010704, 
                            0x03, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x05)
                        {
                            0x0001070D, 
                            0x03, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x05)
                        {
                            0x0001070E, 
                            0x03, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x08)
                        {
                            0x00010F77, 
                            0x06, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x04)
                        {
                            0x0001089E, 
                            0x02, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc7-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x04)
                        {
                            0x10000003, 
                            0x02, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc7-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x04)
                        {
                            0x0001089F, 
                            0x02, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc6-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x06)
                        {
                            0x10000004, 
                            0x04, 
                            ToUUID ("6f64adc5-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc6-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x07)
                        {
                            0x10003204, 
                            0x05, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbe-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x07)
                        {
                            0x10003202, 
                            0x05, 
                            ToUUID ("6f64adc2-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbf-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adbe-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adc0-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }, 

                        Package (0x04)
                        {
                            0x10003209, 
                            0x02, 
                            ToUUID ("6f64adcd-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */, 
                            ToUUID ("6f64adce-8211-11e2-8c70-2c27d7f001fa") /* Unknown UUID */
                        }
                    })
                    Return (RBUF) /* \_SB_.ADSP.ADCM.INFO.RBUF */
                }

                Method (CHLD, 0, NotSerialized)
                {
                    Return (Package (0x01)
                    {
                        "ADCM\\QCOM242E"
                    })
                }

                Method (NOKI, 0, NotSerialized)
                {
                    Return (Package (0x01)
                    {
                        One
                    })
                }

                Device (AUDD)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (RBUF, Buffer (0x43)
                        {
                            /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                            /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                            /* 0010 */  0x0D, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // ..\_SB.I
                            /* 0018 */  0x32, 0x43, 0x35, 0x00, 0x8E, 0x19, 0x00, 0x01,  // 2C5.....
                            /* 0020 */  0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x06, 0x00,  // ........
                            /* 0028 */  0x80, 0x1A, 0x06, 0x00, 0x77, 0x00, 0x5C, 0x5F,  // ....w.\_
                            /* 0030 */  0x53, 0x42, 0x2E, 0x49, 0x32, 0x43, 0x35, 0x00,  // SB.I2C5.
                            /* 0038 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x3F, 0x00, 0x00,  // .....?..
                            /* 0040 */  0x00, 0x79, 0x00                                 // .y.
                        })
                        Return (RBUF) /* \_SB_.ADSP.ADCM.AUDD._CRS.RBUF */
                    }

                    Method (BFSZ, 0, NotSerialized)
                    {
                        Name (SIZE, Package (0x01)
                        {
                            0x0800
                        })
                        Return (SIZE) /* \_SB_.ADSP.ADCM.AUDD.BFSZ.SIZE */
                    }

                    Method (PWRC, 0, NotSerialized)
                    {
                        Name (PWRA, Package (0x01)
                        {
                            One
                        })
                        Return (PWRA) /* \_SB_.ADSP.ADCM.AUDD.PWRC.PWRA */
                    }

                    Method (BUSI, 0, NotSerialized)
                    {
                        Name (BUSS, Package (0x02)
                        {
                            One, 
                            0x0200
                        })
                        Return (BUSS) /* \_SB_.ADSP.ADCM.AUDD.BUSI.BUSS */
                    }

                    Method (CIPI, 0, NotSerialized)
                    {
                        Name (CIPD, Package (0x05)
                        {
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Return (CIPD) /* \_SB_.ADSP.ADCM.AUDD.CIPI.CIPD */
                    }

                    Method (RPNF, 0, NotSerialized)
                    {
                        Name (REGV, Package (0x06)
                        {
                            Package (0x05)
                            {
                                0xFD512054, 
                                Ones, 
                                Zero, 
                                One, 
                                Zero
                            }, 

                            Package (0x05)
                            {
                                0xFD512058, 
                                0x00700000, 
                                Zero, 
                                One, 
                                Zero
                            }, 

                            Package (0x05)
                            {
                                0xFE030000, 
                                0x02, 
                                Zero, 
                                0x08, 
                                One
                            }, 

                            Package (0x05)
                            {
                                0xFE031000, 
                                0x02, 
                                Zero, 
                                0x08, 
                                0x02
                            }, 

                            Package (0x05)
                            {
                                0xFE032000, 
                                0x02, 
                                Zero, 
                                0x08, 
                                0x03
                            }, 

                            Package (0x05)
                            {
                                0xFE033000, 
                                0x02, 
                                Zero, 
                                0x08, 
                                0x04
                            }
                        })
                        Return (REGV) /* \_SB_.ADSP.ADCM.AUDD.RPNF.REGV */
                    }

                    Method (GPNF, 0, NotSerialized)
                    {
                        Name (GPIO, Package (0x00){})
                        Return (GPIO) /* \_SB_.ADSP.ADCM.AUDD.GPNF.GPIO */
                    }

                    Method (CHLD, 0, NotSerialized)
                    {
                        Name (CH, Package (0x02)
                        {
                            "AUDD\\QCOM2468", 
                            "AUDD\\QCOM2451"
                        })
                        Return (CH) /* \_SB_.ADSP.ADCM.AUDD.CHLD.CH__ */
                    }

                    Method (PPNF, 0, NotSerialized)
                    {
                        Name (PP, Package (0x01)
                        {
                            Package (0x03)
                            {
                                Zero, 
                                Package (0x03)
                                {
                                    Zero, 
                                    Zero, 
                                    One
                                }, 

                                Package (0x03)
                                {
                                    0x03, 
                                    0x15, 
                                    One
                                }
                            }
                        })
                        Return (PP) /* \_SB_.ADSP.ADCM.AUDD.PPNF.PP__ */
                    }

                    Device (MBHC)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            Name (RBUF, Buffer (0x02)
                            {
                                 0x79, 0x00                                       // y.
                            })
                            Return (RBUF) /* \_SB_.ADSP.ADCM.AUDD.MBHC._CRS.RBUF */
                        }

                        Method (BFSZ, 0, NotSerialized)
                        {
                            Name (SIZE, Package (0x01)
                            {
                                0x0800
                            })
                            Return (SIZE) /* \_SB_.ADSP.ADCM.AUDD.MBHC.BFSZ.SIZE */
                        }

                        Method (GPNF, 0, NotSerialized)
                        {
                            Name (GPIO, Package (0x00){})
                            Return (GPIO) /* \_SB_.ADSP.ADCM.AUDD.MBHC.GPNF.GPIO */
                        }
                    }

                    Device (QCRT)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (MSMT, 0, NotSerialized)
                        {
                            Name (CFG, Package (0x01)
                            {
                                Package (0x01)
                                {
                                    0x02
                                }
                            })
                            Return (CFG) /* \_SB_.ADSP.ADCM.AUDD.QCRT.MSMT.CFG_ */
                        }

                        Method (DEVI, 0, NotSerialized)
                        {
                            Name (CFG, Package (0x21)
                            {
                                Package (0x06)
                                {
                                    0x45, 
                                    0x0B, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x0A, 
                                    0x08, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x09, 
                                    0x08, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x07, 
                                    0x04, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x43, 
                                    Zero, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    Zero, 
                                    Zero, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x0D, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    Zero, 
                                    Zero, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x07, 
                                    0x06, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x27, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x0A, 
                                    0x27, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x25, 
                                    0x24, 
                                    0x1F40, 
                                    0x1F40, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x25, 
                                    0x40, 
                                    0x1F40, 
                                    0x1F40, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x25, 
                                    0x24, 
                                    0x3E80, 
                                    0x3E80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x25, 
                                    0x40, 
                                    0x3E80, 
                                    0x3E80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x11, 
                                    0x10, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    Zero, 
                                    Zero, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x65, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x65, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x07, 
                                    0x04, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x07, 
                                    0x04, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x07, 
                                    0x04, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x0B, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x0B, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x0B, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x5B, 
                                    Zero, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x5C, 
                                    Zero, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x5D, 
                                    Zero, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x07, 
                                    0x04, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x07, 
                                    0x04, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x0B, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x45, 
                                    0x0B, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }, 

                                Package (0x06)
                                {
                                    0x52, 
                                    0x0B, 
                                    0xBB80, 
                                    0xBB80, 
                                    0x10, 
                                    0x10
                                }
                            })
                            Return (CFG) /* \_SB_.ADSP.ADCM.AUDD.QCRT.DEVI.CFG_ */
                        }

                        Method (EFMA, 0, NotSerialized)
                        {
                            Name (CFG, Package (0x01)
                            {
                                Package (0x0B)
                                {
                                    0x0100, 
                                    Zero, 
                                    0xE152, 
                                    0x1EAE, 
                                    0xE152, 
                                    0x1EAE, 
                                    0x64, 
                                    0x1F40, 
                                    0x02, 
                                    Package (0x06)
                                    {
                                        0x02, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }, 

                                    Package (0x06)
                                    {
                                        0x02, 
                                        0xFF7E, 
                                        Zero, 
                                        Zero, 
                                        0x1194, 
                                        0x1194
                                    }
                                }
                            })
                            Return (CFG) /* \_SB_.ADSP.ADCM.AUDD.QCRT.EFMA.CFG_ */
                        }

                        Method (OEMC, 0, NotSerialized)
                        {
                            Name (CFG, Package (0x04)
                            {
                                Package (0x06)
                                {
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x14, 
                                    0x08, 
                                    0x05
                                }, 

                                Package (0x0E)
                                {
                                    One, 
                                    0x0E000000, 
                                    0x20000000, 
                                    One, 
                                    One, 
                                    0x02, 
                                    Zero, 
                                    0x02, 
                                    0x00066000, 
                                    ToUUID ("c1f8153e-3592-4fab-bdbf-2bfb8ed3157a") /* Unknown UUID */, 
                                    One, 
                                    0x05, 
                                    0x8000, 
                                    ToUUID ("a2e1acdd-1b8f-47dc-a079-76c9b04b7d60") /* Unknown UUID */
                                }, 

                                Package (0x05)
                                {
                                    0x02, 
                                    Zero, 
                                    Zero, 
                                    One, 
                                    One
                                }, 

                                Package (0x0B)
                                {
                                    0x03, 
                                    0x1E, 
                                    0x1E, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    Zero, 
                                    0x1E, 
                                    0x0A, 
                                    0x1E, 
                                    0x1E
                                }
                            })
                            Return (CFG) /* \_SB_.ADSP.ADCM.AUDD.QCRT.OEMC.CFG_ */
                        }
                    }
                }
            }
        }

        Device (AMSS)
        {
            Name (_DEP, Package (0x05)  // _DEP: Dependencies
            {
                \_SB.PEP0, , 
                \_SB.SMD0, , 
                \_SB.PILC, , 
                \_SB.RPEN, , 
                \_SB.RFS0, 
            })
            Name (_HID, "QCOM242C")  // _HID: Hardware ID
            Method (CHLD, 0, NotSerialized)
            {
                If ((\_SB.SOID == "APQ8012"))
                {
                    Return (Package (0x00){})
                }
                Else
                {
                    Return (Package (0x06)
                    {
                        Package (0x04)
                        {
                            "QCMS\\QCOM0EA0", 
                            0x2B, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            "QCMS\\QCOM0EA0", 
                            0x2B, 
                            One, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            "QCMS\\QCOM0EA0", 
                            0x2B, 
                            0x02, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            "QCMS\\QCOM0EA0", 
                            0x2B, 
                            0x03, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            "QCMS\\QCOM0EA0", 
                            0x2B, 
                            0x04, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            "QCMS\\QCOM0EA0", 
                            0x2B, 
                            0x05, 
                            Zero
                        }
                    })
                }
            }

            Method (SHUT, 0, NotSerialized)
            {
                If ((\_SB.SOID == "APQ8012"))
                {
                    Return (Package (0x01)
                    {
                        One
                    })
                }
                Else
                {
                    Return (Package (0x01)
                    {
                        Zero
                    })
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0B)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x38, 0x00, 0x00,  // .....8..
                    /* 0008 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.AMSS._CRS.RBUF */
            }

            Method (VLMT, 0, NotSerialized)
            {
                Name (RBUF, Package (0x04)
                {
                    Package (0x02)
                    {
                        0x21, 
                        0x03
                    }, 

                    Package (0x02)
                    {
                        0x42, 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        0x63, 
                        One
                    }, 

                    Package (0x02)
                    {
                        0x64, 
                        Zero
                    }
                })
                Return (RBUF) /* \_SB_.AMSS.VLMT.RBUF */
            }
        }

        Device (QMUX)
        {
            Name (_HID, "QCOM244F")  // _HID: Hardware ID
        }

        Device (RIVA)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PEP0, , 
                \_SB.PILC, , 
                \_SB.SMD0, 
            })
            Name (_HID, "QCOM242A")  // _HID: Hardware ID
            Method (CHLD, 0, NotSerialized)
            {
                Return (Package (0x03)
                {
                    Package (0x04)
                    {
                        "QWCN\\QCOM245D", 
                        0x41, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "QWCN\\QCOM2450", 
                        0x12, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "QWCN\\QCOM2150", 
                        0x25, 
                        One, 
                        One
                    }
                })
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0B)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0xB5, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.RIVA._CRS.RBUF */
            }

            Device (BTH0)
            {
                Name (_ADR, Zero)  // _ADR: Address
            }

            Device (QWLN)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    Zero, 
                    Zero
                })
                Name (_S0W, 0x02)  // _S0W: S0 Device Wake State
                Name (_S4W, 0x02)  // _S4W: S4 Device Wake State
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, Buffer (0x20)
                    {
                        /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFB,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x01, 0x89, 0x06, 0x00, 0x19,  // ........
                        /* 0010 */  0x01, 0xB2, 0x00, 0x00, 0x00, 0x89, 0x06, 0x00,  // ........
                        /* 0018 */  0x01, 0x01, 0xB1, 0x00, 0x00, 0x00, 0x79, 0x00   // ......y.
                    })
                    Return (RBUF) /* \_SB_.RIVA.QWLN._CRS.RBUF */
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                }

                Method (_PS1, 0, NotSerialized)  // _PS1: Power State 1
                {
                }

                Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
                {
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                }
            }

            Scope (\_SB.RIVA)
            {
                Name (THLO, 0x0DAC)
                Method (VPHL, 0, NotSerialized)
                {
                    Return (THLO) /* \_SB_.RIVA.THLO */
                }

                Name (THHI, 0x0E10)
                Method (VPHH, 0, NotSerialized)
                {
                    Return (THHI) /* \_SB_.RIVA.THHI */
                }
            }

            Device (FMT0)
            {
                Name (_ADR, 0x02)  // _ADR: Address
            }
        }

        Device (QMMI)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.QDIG, 
            })
            Name (_HID, "QCOM2496")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x1A)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0xE0, 0x5F, 0x80, 0xFE,  // ....._..
                    /* 0008 */  0x0C, 0x00, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0xB0, 0x4A, 0xFC, 0x04, 0x00, 0x00, 0x00,  // ..J.....
                    /* 0018 */  0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.QMMI._CRS.RBUF */
            }

            Method (EMDL, 0, NotSerialized)
            {
                Name (RBUF, Package (0x03)
                {
                    0x322A4F99, 
                    0xC67E4350, 
                    0x77777777
                })
                Return (RBUF) /* \_SB_.QMMI.EMDL.RBUF */
            }
        }

        Device (SMMU)
        {
            Name (_HID, "QCOM0200")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0xA1)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x89, 0xFD,  // ........
                    /* 0008 */  0x00, 0x00, 0x01, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0x88, 0xFD, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x87, 0xFD,  // ........
                    /* 0020 */  0x00, 0x00, 0x01, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0028 */  0x00, 0x00, 0x86, 0xFD, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 0030 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFD,  // ........
                    /* 0038 */  0x00, 0x00, 0x01, 0x00, 0x89, 0x06, 0x00, 0x03,  // ........
                    /* 0040 */  0x01, 0x60, 0x00, 0x00, 0x00, 0x89, 0x06, 0x00,  // .`......
                    /* 0048 */  0x03, 0x01, 0x61, 0x00, 0x00, 0x00, 0x89, 0x06,  // ..a.....
                    /* 0050 */  0x00, 0x03, 0x01, 0x10, 0x01, 0x00, 0x00, 0x89,  // ........
                    /* 0058 */  0x06, 0x00, 0x03, 0x01, 0x11, 0x01, 0x00, 0x00,  // ........
                    /* 0060 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x4E, 0x00, 0x00,  // .....N..
                    /* 0068 */  0x00, 0x89, 0x06, 0x00, 0x03, 0x01, 0x4F, 0x00,  // ......O.
                    /* 0070 */  0x00, 0x00, 0x89, 0x06, 0x00, 0x03, 0x01, 0x16,  // ........
                    /* 0078 */  0x01, 0x00, 0x00, 0x89, 0x06, 0x00, 0x03, 0x01,  // ........
                    /* 0080 */  0x17, 0x01, 0x00, 0x00, 0x89, 0x06, 0x00, 0x03,  // ........
                    /* 0088 */  0x01, 0x19, 0x01, 0x00, 0x00, 0x89, 0x06, 0x00,  // ........
                    /* 0090 */  0x03, 0x01, 0x1A, 0x01, 0x00, 0x00, 0x89, 0x06,  // ........
                    /* 0098 */  0x00, 0x03, 0x01, 0x1B, 0x01, 0x00, 0x00, 0x79,  // .......y
                    /* 00A0 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.SMMU._CRS.RBUF */
            }

            Method (BCDE, 0, NotSerialized)
            {
                Name (XBUF, Buffer (0x04)
                {
                     0x04, 0x00, 0x01, 0x10                           // ....
                })
                Return (XBUF) /* \_SB_.SMMU.BCDE.XBUF */
            }

            Method (CORE, 0, NotSerialized)
            {
                Name (YBUF, Buffer (0x18)
                {
                    /* 0000 */  0x05, 0x01, 0x02, 0x03, 0x04, 0x05, 0x02, 0x03,  // ........
                    /* 0008 */  0x02, 0x02, 0x04, 0x01, 0x02, 0x03, 0x04, 0x05,  // ........
                    /* 0010 */  0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D   // ........
                })
                Return (YBUF) /* \_SB_.SMMU.CORE.YBUF */
            }

            Method (AGPA, 0, NotSerialized)
            {
                Name (BUFF, Buffer (One)
                {
                     0x01                                             // .
                })
                Return (BUFF) /* \_SB_.SMMU.AGPA.BUFF */
            }

            Method (PTCA, 0, NotSerialized)
            {
                Name (BUFF, Buffer (One)
                {
                     0x01                                             // .
                })
                Return (BUFF) /* \_SB_.SMMU.PTCA.BUFF */
            }
        }

        Device (OMEM)
        {
            Name (_HID, "QCOM2403")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
            })
            Method (GUID, 0, NotSerialized)
            {
                Return (ToUUID ("0bdb4206-6a68-4e0e-a4e6-079946be378c") /* Unknown UUID */)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xD0, 0xFD,  // ........
                    /* 0008 */  0x00, 0x20, 0x00, 0x00, 0x79, 0x00               // . ..y.
                })
                Return (RBUF) /* \_SB_.OMEM._CRS.RBUF */
            }

            Method (CLNT, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    Package (0x04)
                    {
                        One, 
                        0x0A, 
                        Zero, 
                        0x00100000
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        0x14, 
                        0xFED00000, 
                        0x7FFF
                    }
                })
            }
        }

        Device (DISP)
        {
            Name (_HID, "Nokia_PANEL")  // _HID: Hardware ID
            Name (_CID, "ACPINokia_PANEL")  // _CID: Compatible ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PMIC, , 
                \_SB.GIO0, 
            })
            Name (_UID, Zero)  // _UID: Unique ID
            Method (DPID, 0, NotSerialized)
            {
                Name (RBUF, Package (0x01)
                {
                    0x0083890B
                })
                Return (RBUF) /* \_SB_.DISP.DPID.RBUF */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x8E)
                {
                    /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x01, 0x01, 0x00, 0x08,  // . ......
                    /* 0008 */  0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x0C,  // ...#....
                    /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49,  // .\_SB.GI
                    /* 0020 */  0x4F, 0x30, 0x00, 0x8C, 0x20, 0x00, 0x01, 0x01,  // O0.. ...
                    /* 0028 */  0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23, 0x00,  // ......#.
                    /* 0038 */  0x00, 0x00, 0x29, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ..).\_SB
                    /* 0040 */  0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x8C, 0x20,  // .GIO0.. 
                    /* 0048 */  0x00, 0x01, 0x01, 0x01, 0x00, 0x08, 0x00, 0x02,  // ........
                    /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x19,  // ........
                    /* 0058 */  0x00, 0x23, 0x00, 0x00, 0x00, 0x07, 0x00, 0x5C,  // .#.....\
                    /* 0060 */  0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30,  // _SB.GIO0
                    /* 0068 */  0x00, 0x8C, 0x20, 0x00, 0x01, 0x01, 0x01, 0x00,  // .. .....
                    /* 0070 */  0x08, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x17,  // ........
                    /* 0078 */  0x00, 0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00,  // ....#...
                    /* 0080 */  0x4C, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47,  // L.\_SB.G
                    /* 0088 */  0x49, 0x4F, 0x30, 0x00, 0x79, 0x00               // IO0.y.
                })
                Return (RBUF) /* \_SB_.DISP._CRS.RBUF */
            }
        }

        Device (GPU0)
        {
            Name (_HID, "QCOM246F")  // _HID: Hardware ID
            Name (_CID, "ACPIQCOM246F")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CLS, 0x00)  // _CLS: Class Code
            Device (MON0)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return (Zero)
                }
            }

            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.SMMU, , 
                \_SB.PEP0, , 
                \_SB.SMD0, , 
                \_SB.PMIC, 
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x73)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x90, 0xFD,  // ........
                    /* 0008 */  0x00, 0x00, 0x10, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0xD0, 0xFD, 0x00, 0x00, 0x10, 0x00,  // ........
                    /* 0018 */  0x89, 0x06, 0x00, 0x01, 0x01, 0x68, 0x00, 0x00,  // .....h..
                    /* 0020 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xC0,  // ........
                    /* 0028 */  0xFD, 0x00, 0x00, 0x01, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0030 */  0x01, 0x00, 0x00, 0xC2, 0xFD, 0x00, 0x00, 0x01,  // ........
                    /* 0038 */  0x00, 0x89, 0x06, 0x00, 0x01, 0x01, 0x41, 0x00,  // ......A.
                    /* 0040 */  0x00, 0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0048 */  0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x8C, 0x20,  // @...... 
                    /* 0050 */  0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x01,  // ........
                    /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x19,  // ........
                    /* 0060 */  0x00, 0x23, 0x00, 0x00, 0x00, 0x29, 0x00, 0x5C,  // .#...).\
                    /* 0068 */  0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30,  // _SB.GIO0
                    /* 0070 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.GPU0._CRS.RBUF */
            }

            Method (RESI, 0, NotSerialized)
            {
                Name (RINF, Package (0x0A)
                {
                    0x03, 
                    Zero, 
                    Package (0x03)
                    {
                        "RESOURCE", 
                        "MDP_REGS", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "MIPI_DSI_REGS", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "VSYNC_INTERRUPT", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GFX_REGS", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GFX_SHADER_MEMORY", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GFX_INTERRUPT", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "UEFI_FRAME_BUFFER", 
                        "UEFI"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "DSI_PANEL_RESET", 
                        "DISPLAY"
                    }
                })
                Return (RINF) /* \_SB_.GPU0.RESI.RINF */
            }

            Method (ENGS, 0, NotSerialized)
            {
                Name (EBUF, Package (0x05)
                {
                    0x03, 
                    Zero, 
                    0x00140009, 
                    Package (0x04)
                    {
                        "ENGINES", 
                        0x02, 
                        Package (0x09)
                        {
                            "ENGINE", 
                            "GRAPHICS", 
                            "Adreno3XX", 
                            One, 
                            One, 
                            Zero, 
                            Package (0x03)
                            {
                                "MMUIDS", 
                                "VCM_GFX_CB0", 
                                "VCM_GFX_CB1"
                            }, 

                            Package (0x02)
                            {
                                "PERF_CONTROLS", 
                                Package (0x02)
                                {
                                    0x03, 
                                    Package (0x02)
                                    {
                                        "LimitForPassiveCooling", 
                                        One
                                    }
                                }
                            }, 

                            Package (0x05)
                            {
                                "PROPERTIES", 
                                0x03, 
                                Package (0x02)
                                {
                                    "GmemBaseAddr", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "GmemSize", 
                                    0x00020000
                                }, 

                                Package (0x02)
                                {
                                    "SMMUCount", 
                                    One
                                }
                            }
                        }, 

                        Package (0x08)
                        {
                            "ENGINE", 
                            "VIDEO", 
                            "QDSP6", 
                            0x02, 
                            One, 
                            Zero, 
                            Package (0x01)
                            {
                                "PERF_CONTROLS"
                            }, 

                            Package (0x0F)
                            {
                                "PROPERTIES", 
                                0x0D, 
                                Package (0x02)
                                {
                                    "DecMaxWidth", 
                                    0x0500
                                }, 

                                Package (0x02)
                                {
                                    "DecMaxHeight", 
                                    0x02D0
                                }, 

                                Package (0x02)
                                {
                                    "DecMaxMB", 
                                    0x0E10
                                }, 

                                Package (0x02)
                                {
                                    "DecMaxBitRate", 
                                    0x1770
                                }, 

                                Package (0x02)
                                {
                                    "DecGUIDs", 
                                    0x01FF
                                }, 

                                Package (0x02)
                                {
                                    "DecOutputFormats", 
                                    One
                                }, 

                                Package (0x02)
                                {
                                    "DecMaxFps", 
                                    0x3C
                                }, 

                                Package (0x02)
                                {
                                    "EncMaxWidth", 
                                    0x0360
                                }, 

                                Package (0x02)
                                {
                                    "EncMaxHeight", 
                                    0x01E0
                                }, 

                                Package (0x02)
                                {
                                    "EncMaxMB", 
                                    0x0654
                                }, 

                                Package (0x02)
                                {
                                    "EncMaxBitRate", 
                                    0x0C00
                                }, 

                                Package (0x02)
                                {
                                    "EncGUIDs", 
                                    0x2F
                                }, 

                                Package (0x02)
                                {
                                    "EncInputFormats", 
                                    0x03
                                }
                            }
                        }
                    }, 

                    Package (0x05)
                    {
                        "DISPLAYS", 
                        "MDP3.x", 
                        One, 
                        Package (0x06)
                        {
                            "DISPLAY", 
                            "INTERNAL1", 
                            Zero, 
                            One, 
                            Zero, 
                            Package (0x06)
                            {
                                "PERF_CONTROLS", 
                                Package (0x01)
                                {
                                    0x02
                                }, 

                                Package (0x01)
                                {
                                    0x03
                                }, 

                                Package (0x01)
                                {
                                    0x04
                                }, 

                                Package (0x01)
                                {
                                    0x05
                                }, 

                                Package (0x01)
                                {
                                    0x06
                                }
                            }
                        }, 

                        Package (0x03)
                        {
                            "RESOURCES", 
                            Package (0x05)
                            {
                                "MMUIDS", 
                                "VCM_MDPS_CB0", 
                                "VCM_MDPS_CB1", 
                                "VCM_MDPE_CB0", 
                                "VCM_MDPE_CB1"
                            }, 

                            Package (0x05)
                            {
                                "PROPERTIES", 
                                0x03, 
                                Package (0x02)
                                {
                                    "MultiplaneSupport", 
                                    One
                                }, 

                                Package (0x02)
                                {
                                    "LimitScalingModes", 
                                    0x02
                                }, 

                                Package (0x02)
                                {
                                    "DisableHDMI", 
                                    One
                                }
                            }
                        }
                    }
                })
                Return (EBUF) /* \_SB_.GPU0.ENGS.EBUF */
            }

            Method (PMCL, 0, NotSerialized)
            {
                Name (RBUF, Package (0x08)
                {
                    0x03, 
                    Zero, 
                    0x05, 
                    Package (0x11)
                    {
                        "COMPONENT", 
                        Zero, 
                        ToUUID ("2c135991-4391-4633-90b1-fa96f2e2cc04") /* Unknown UUID */, 
                        "PRIMDISPLAY_POWER_STATES", 
                        "HW_BLOCK_MDP", 
                        Package (0x02)
                        {
                            "DISPLAY", 
                            "INTERNAL1"
                        }, 

                        0x02, 
                        0x07, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            "ALL_ON", 
                            Zero, 
                            Zero, 
                            0x02
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            "PWR_OFF", 
                            One, 
                            One, 
                            One
                        }, 

                        Package (0x09)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            "INTERNAL1_RESET", 
                            "*", 
                            "RESET", 
                            0x02, 
                            Zero, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                One, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x09)
                        {
                            "PSTATE_SET", 
                            One, 
                            "INTERNAL1_FOOTSWITCH_OVERRIDE", 
                            "*", 
                            "FOOTSWITCH_OVERRIDE", 
                            0x02, 
                            One, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                One, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x0F)
                        {
                            "PSTATE_SET", 
                            0x02, 
                            "INTERNAL1_CORE_CLOCK_CONTROL", 
                            "*", 
                            "CORE_CLOCK", 
                            0x08, 
                            0x04, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                0x0BEBC200, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                0x08F0D180, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                0x05F5E100, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x03, 
                                0x047868C0, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x04, 
                                0x02FAF080, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x05, 
                                0x023C3460, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x06, 
                                0x0124F800, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x07, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x0F)
                        {
                            "PSTATE_SET", 
                            0x03, 
                            "PPP_INTERNAL1_CORE_CLOCK_CONTROL", 
                            "*", 
                            "CORE_CLOCK", 
                            0x08, 
                            0x04, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                0x0BEBC200, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                0x08F0D180, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                0x05F5E100, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x03, 
                                0x047868C0, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x04, 
                                0x02FAF080, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x05, 
                                0x023C3460, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x06, 
                                0x0124F800, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x07, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x28)
                        {
                            "PSTATE_SET", 
                            0x04, 
                            "INTERNAL1_EBI_BANDWIDTH", 
                            "*", 
                            "BANDWIDTH", 
                            0x21, 
                            0x08, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                0x0D2F0000, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                0x0BDD8000, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                0x0AADC000, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x03, 
                                0x099C6000, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x04, 
                                0x08A65667, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x05, 
                                0x07C8E75D, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x06, 
                                0x07019D07, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x07, 
                                0x064E4086, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x08, 
                                0x05ACD3AC, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x09, 
                                0x051B8B4E, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x0A, 
                                0x0498CA2C, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x0B, 
                                0x04231C5C, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x0C, 
                                0x03B93320, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x0D, 
                                0x0359E136, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x0E, 
                                0x0304177E, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x0F, 
                                0x02B6E1F1, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x10, 
                                0x027164F3, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x11, 
                                0x0232DADB, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x12, 
                                0x01FA91C5, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x13, 
                                0x01C7E998, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x14, 
                                0x019A523C, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x15, 
                                0x01714A03, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x16, 
                                0x014C5C36, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x17, 
                                0x012B1FCA, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x18, 
                                0x010D3636, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x19, 
                                0x00F24A64, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x1A, 
                                0x00DA0FC0, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x1B, 
                                0x00C44160, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x1C, 
                                0x00B0A13D, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x1D, 
                                0x009EF784, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x1E, 
                                0x008F11F6, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x1F, 
                                0x0080C35D, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x20, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x10)
                        {
                            "PSTATE_SET", 
                            0x05, 
                            "PPP_INTERNAL1_EBI_BANDWIDTH", 
                            "*", 
                            "BANDWIDTH", 
                            0x09, 
                            0x04, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                0x7F22FF40, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                0x5F5E1000, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                0x47868C00, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x03, 
                                0x2FAF0800, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x04, 
                                0x23C34600, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x05, 
                                0x17D78400, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x06, 
                                0x11E1A300, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x07, 
                                0x0927C000, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x08, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x09)
                        {
                            "PSTATE_SET", 
                            0x06, 
                            "INTERNAL1_SCAN_CONTROL", 
                            "*", 
                            "DISPLAY_SOURCE_SCAN_CTRL", 
                            0x02, 
                            Zero, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                One, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Zero, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x0F)
                    {
                        "COMPONENT", 
                        One, 
                        ToUUID ("30bdf1b5-28f7-4c0c-ac47-273dd1401e11") /* Unknown UUID */, 
                        "GRAPHICS_POWER_STATES", 
                        "HW_BLOCK_GRAPHICS", 
                        Package (0x02)
                        {
                            "ENGINE", 
                            "GRAPHICS"
                        }, 

                        0x03, 
                        0x04, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            "ALL_ON", 
                            Zero, 
                            Zero, 
                            0x03
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            "CLK_OFF", 
                            0x2710, 
                            Zero, 
                            0x02
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            0x02, 
                            "PWR_OFF", 
                            0x000186A0, 
                            Zero, 
                            One
                        }, 

                        Package (0x09)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            "GRAPHICS_RESET", 
                            "*", 
                            "RESET", 
                            0x02, 
                            Zero, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                One, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x09)
                        {
                            "PSTATE_SET", 
                            One, 
                            "GRAPHICS_FOOTSWITCH_OVERRIDE", 
                            "*", 
                            "FOOTSWITCH_OVERRIDE", 
                            0x02, 
                            One, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                One, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x0B)
                        {
                            "PSTATE_SET", 
                            0x02, 
                            "GRAPHICS_DXGKRNL_CONTROL", 
                            "*", 
                            "DXGKRNL_CONTROL", 
                            0x04, 
                            Ones, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                0x17D78400, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                0x11E1A300, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                0x08F0D180, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x03, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x0B)
                        {
                            "PSTATE_SET", 
                            0x03, 
                            "GRAPHICS_CORE_CLOCK_CONTROL", 
                            "*", 
                            "CORE_CLOCK", 
                            0x04, 
                            0x02, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                0x17D78400, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                0x11E1A300, 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x02, 
                                0x08F0D180, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                0x03, 
                                Zero, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x0B)
                    {
                        "COMPONENT", 
                        0x02, 
                        ToUUID ("d0e1bb1a-703d-4be8-b450-64a4fbfca6a8") /* Unknown UUID */, 
                        "VIDEO_POWER_STATES", 
                        "HW_BLOCK_VIDEO", 
                        Package (0x02)
                        {
                            "ENGINE", 
                            "VIDEO"
                        }, 

                        One, 
                        0x02, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            "ALL_ON", 
                            Zero, 
                            Zero, 
                            One
                        }, 

                        Package (0x09)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            "VIDEO_RESET", 
                            "*", 
                            "RESET", 
                            0x02, 
                            Zero, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                One, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Zero, 
                                0x02
                            }
                        }, 

                        Package (0x09)
                        {
                            "PSTATE_SET", 
                            One, 
                            "VIDEO_FOOTSWITCH_OVERRIDE", 
                            "*", 
                            "FOOTSWITCH_OVERRIDE", 
                            0x02, 
                            One, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                One, 
                                0x02
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Zero, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x09)
                    {
                        "COMPONENT", 
                        0x03, 
                        ToUUID ("8dd40bdf-6fbd-45ed-8538-711d434b6ba1") /* Unknown UUID */, 
                        "ALWAYS_ACTIVE_WP", 
                        "HW_BLOCK_NONE", 
                        Package (0x01)
                        {
                            "UNMANAGED"
                        }, 

                        One, 
                        Zero, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            "ALL_ON", 
                            Zero, 
                            Zero, 
                            One
                        }
                    }, 

                    Package (0x0A)
                    {
                        "COMPONENT", 
                        0x04, 
                        ToUUID ("64a9417d-1841-45ad-a705-3a246e607ffc") /* Unknown UUID */, 
                        "VIDPN_SOURCE_0", 
                        "HW_BLOCK_NONE", 
                        Package (0x02)
                        {
                            "DISPLAY_SOURCE", 
                            Zero
                        }, 

                        0x02, 
                        Zero, 
                        Package (0x06)
                        {
                            "FSTATE", 
                            Zero, 
                            "ALL_ON", 
                            Zero, 
                            Zero, 
                            One
                        }, 

                        Package (0x06)
                        {
                            "FSTATE", 
                            One, 
                            "PWR_OFF", 
                            One, 
                            One, 
                            Zero
                        }
                    }
                })
                Return (RBUF) /* \_SB_.GPU0.PMCL.RBUF */
            }

            Method (_ROM, 3, NotSerialized)  // _ROM: Read-Only Memory
            {
                Name (PCFG, Buffer (0x14C3)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x20,  // f-8'?>. 
                    /* 0028 */  0x20, 0x20, 0x20, 0x3C, 0x50, 0x61, 0x6E, 0x65,  //    <Pane
                    /* 0030 */  0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x54, 0x61,  // lName>Ta
                    /* 0038 */  0x79, 0x6C, 0x6F, 0x72, 0x3C, 0x2F, 0x50, 0x61,  // ylor</Pa
                    /* 0040 */  0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E,  // nelName>
                    /* 0048 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x50, 0x61,  // .    <Pa
                    /* 0050 */  0x6E, 0x65, 0x6C, 0x44, 0x65, 0x73, 0x63, 0x72,  // nelDescr
                    /* 0058 */  0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x54,  // iption>T
                    /* 0060 */  0x61, 0x79, 0x6C, 0x6F, 0x72, 0x20, 0x44, 0x53,  // aylor DS
                    /* 0068 */  0x49, 0x20, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x20,  // I Panel 
                    /* 0070 */  0x28, 0x34, 0x38, 0x30, 0x78, 0x38, 0x35, 0x34,  // (480x854
                    /* 0078 */  0x20, 0x32, 0x34, 0x62, 0x70, 0x70, 0x29, 0x3C,  //  24bpp)<
                    /* 0080 */  0x2F, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x44, 0x65,  // /PanelDe
                    /* 0088 */  0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F,  // scriptio
                    /* 0090 */  0x6E, 0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20,  // n>..    
                    /* 0098 */  0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69,  // <Group i
                    /* 00A0 */  0x64, 0x3D, 0x27, 0x45, 0x44, 0x49, 0x44, 0x20,  // d='EDID 
                    /* 00A8 */  0x43, 0x6F, 0x6E, 0x66, 0x69, 0x67, 0x75, 0x72,  // Configur
                    /* 00B0 */  0x61, 0x74, 0x69, 0x6F, 0x6E, 0x27, 0x3E, 0x0A,  // ation'>.
                    /* 00B8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 00C0 */  0x3C, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63,  // <Manufac
                    /* 00C8 */  0x74, 0x75, 0x72, 0x65, 0x49, 0x44, 0x3E, 0x30,  // tureID>0
                    /* 00D0 */  0x78, 0x42, 0x41, 0x44, 0x42, 0x41, 0x44, 0x3C,  // xBADBAD<
                    /* 00D8 */  0x2F, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63,  // /Manufac
                    /* 00E0 */  0x74, 0x75, 0x72, 0x65, 0x49, 0x44, 0x3E, 0x0A,  // tureID>.
                    /* 00E8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 00F0 */  0x3C, 0x50, 0x72, 0x6F, 0x64, 0x75, 0x63, 0x74,  // <Product
                    /* 00F8 */  0x43, 0x6F, 0x64, 0x65, 0x3E, 0x30, 0x78, 0x36,  // Code>0x6
                    /* 0100 */  0x31, 0x30, 0x30, 0x3C, 0x2F, 0x50, 0x72, 0x6F,  // 100</Pro
                    /* 0108 */  0x64, 0x75, 0x63, 0x74, 0x43, 0x6F, 0x64, 0x65,  // ductCode
                    /* 0110 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0118 */  0x20, 0x20, 0x3C, 0x53, 0x65, 0x72, 0x69, 0x61,  //   <Seria
                    /* 0120 */  0x6C, 0x4E, 0x75, 0x6D, 0x62, 0x65, 0x72, 0x3E,  // lNumber>
                    /* 0128 */  0x30, 0x78, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30,  // 0x000000
                    /* 0130 */  0x3C, 0x2F, 0x53, 0x65, 0x72, 0x69, 0x61, 0x6C,  // </Serial
                    /* 0138 */  0x4E, 0x75, 0x6D, 0x62, 0x65, 0x72, 0x3E, 0x0A,  // Number>.
                    /* 0140 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0148 */  0x3C, 0x57, 0x65, 0x65, 0x6B, 0x6F, 0x66, 0x4D,  // <WeekofM
                    /* 0150 */  0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75,  // anufactu
                    /* 0158 */  0x72, 0x65, 0x3E, 0x30, 0x78, 0x30, 0x39, 0x3C,  // re>0x09<
                    /* 0160 */  0x2F, 0x57, 0x65, 0x65, 0x6B, 0x6F, 0x66, 0x4D,  // /WeekofM
                    /* 0168 */  0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75,  // anufactu
                    /* 0170 */  0x72, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // re>.    
                    /* 0178 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x59, 0x65, 0x61,  //     <Yea
                    /* 0180 */  0x72, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75, 0x66,  // rofManuf
                    /* 0188 */  0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E, 0x30,  // acture>0
                    /* 0190 */  0x78, 0x31, 0x33, 0x3C, 0x2F, 0x59, 0x65, 0x61,  // x13</Yea
                    /* 0198 */  0x72, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75, 0x66,  // rofManuf
                    /* 01A0 */  0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E, 0x0A,  // acture>.
                    /* 01A8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 01B0 */  0x3C, 0x45, 0x44, 0x49, 0x44, 0x56, 0x65, 0x72,  // <EDIDVer
                    /* 01B8 */  0x73, 0x69, 0x6F, 0x6E, 0x3E, 0x31, 0x3C, 0x2F,  // sion>1</
                    /* 01C0 */  0x45, 0x44, 0x49, 0x44, 0x56, 0x65, 0x72, 0x73,  // EDIDVers
                    /* 01C8 */  0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ion>.   
                    /* 01D0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x45, 0x44,  //      <ED
                    /* 01D8 */  0x49, 0x44, 0x52, 0x65, 0x76, 0x69, 0x73, 0x69,  // IDRevisi
                    /* 01E0 */  0x6F, 0x6E, 0x3E, 0x33, 0x3C, 0x2F, 0x45, 0x44,  // on>3</ED
                    /* 01E8 */  0x49, 0x44, 0x52, 0x65, 0x76, 0x69, 0x73, 0x69,  // IDRevisi
                    /* 01F0 */  0x6F, 0x6E, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // on>.    
                    /* 01F8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x69, 0x64,  //     <Vid
                    /* 0200 */  0x65, 0x6F, 0x49, 0x6E, 0x70, 0x75, 0x74, 0x44,  // eoInputD
                    /* 0208 */  0x65, 0x66, 0x69, 0x6E, 0x69, 0x74, 0x69, 0x6F,  // efinitio
                    /* 0210 */  0x6E, 0x3E, 0x30, 0x78, 0x38, 0x30, 0x3C, 0x2F,  // n>0x80</
                    /* 0218 */  0x56, 0x69, 0x64, 0x65, 0x6F, 0x49, 0x6E, 0x70,  // VideoInp
                    /* 0220 */  0x75, 0x74, 0x44, 0x65, 0x66, 0x69, 0x6E, 0x69,  // utDefini
                    /* 0228 */  0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x20, 0x20,  // tion>.  
                    /* 0230 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x48,  //       <H
                    /* 0238 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0240 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 0248 */  0x69, 0x7A, 0x65, 0x3E, 0x30, 0x78, 0x33, 0x3C,  // ize>0x3<
                    /* 0250 */  0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // /Horizon
                    /* 0258 */  0x74, 0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65,  // talScree
                    /* 0260 */  0x6E, 0x53, 0x69, 0x7A, 0x65, 0x3E, 0x0A, 0x20,  // nSize>. 
                    /* 0268 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0270 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0278 */  0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53, 0x69,  // ScreenSi
                    /* 0280 */  0x7A, 0x65, 0x3E, 0x30, 0x78, 0x30, 0x36, 0x3C,  // ze>0x06<
                    /* 0288 */  0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // /Vertica
                    /* 0290 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 0298 */  0x69, 0x7A, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ize>.   
                    /* 02A0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x69,  //      <Di
                    /* 02A8 */  0x73, 0x70, 0x6C, 0x61, 0x79, 0x54, 0x72, 0x61,  // splayTra
                    /* 02B0 */  0x6E, 0x73, 0x66, 0x65, 0x72, 0x43, 0x68, 0x61,  // nsferCha
                    /* 02B8 */  0x72, 0x61, 0x63, 0x74, 0x65, 0x72, 0x69, 0x73,  // racteris
                    /* 02C0 */  0x74, 0x69, 0x63, 0x73, 0x3E, 0x30, 0x78, 0x37,  // tics>0x7
                    /* 02C8 */  0x38, 0x3C, 0x2F, 0x44, 0x69, 0x73, 0x70, 0x6C,  // 8</Displ
                    /* 02D0 */  0x61, 0x79, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66,  // ayTransf
                    /* 02D8 */  0x65, 0x72, 0x43, 0x68, 0x61, 0x72, 0x61, 0x63,  // erCharac
                    /* 02E0 */  0x74, 0x65, 0x72, 0x69, 0x73, 0x74, 0x69, 0x63,  // teristic
                    /* 02E8 */  0x73, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // s>.     
                    /* 02F0 */  0x20, 0x20, 0x20, 0x3C, 0x46, 0x65, 0x61, 0x74,  //    <Feat
                    /* 02F8 */  0x75, 0x72, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6F,  // ureSuppo
                    /* 0300 */  0x72, 0x74, 0x3E, 0x30, 0x78, 0x41, 0x3C, 0x2F,  // rt>0xA</
                    /* 0308 */  0x46, 0x65, 0x61, 0x74, 0x75, 0x72, 0x65, 0x53,  // FeatureS
                    /* 0310 */  0x75, 0x70, 0x70, 0x6F, 0x72, 0x74, 0x3E, 0x0A,  // upport>.
                    /* 0318 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0320 */  0x3C, 0x52, 0x65, 0x64, 0x2E, 0x47, 0x72, 0x65,  // <Red.Gre
                    /* 0328 */  0x65, 0x6E, 0x42, 0x69, 0x74, 0x73, 0x3E, 0x30,  // enBits>0
                    /* 0330 */  0x78, 0x43, 0x46, 0x3C, 0x2F, 0x52, 0x65, 0x64,  // xCF</Red
                    /* 0338 */  0x2E, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x42, 0x69,  // .GreenBi
                    /* 0340 */  0x74, 0x73, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // ts>.    
                    /* 0348 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75,  //     <Blu
                    /* 0350 */  0x65, 0x2E, 0x57, 0x68, 0x69, 0x74, 0x65, 0x42,  // e.WhiteB
                    /* 0358 */  0x69, 0x74, 0x73, 0x3E, 0x30, 0x78, 0x34, 0x35,  // its>0x45
                    /* 0360 */  0x3C, 0x2F, 0x42, 0x6C, 0x75, 0x65, 0x2E, 0x57,  // </Blue.W
                    /* 0368 */  0x68, 0x69, 0x74, 0x65, 0x42, 0x69, 0x74, 0x73,  // hiteBits
                    /* 0370 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0378 */  0x20, 0x20, 0x3C, 0x52, 0x65, 0x64, 0x58, 0x3E,  //   <RedX>
                    /* 0380 */  0x30, 0x78, 0x39, 0x30, 0x3C, 0x2F, 0x52, 0x65,  // 0x90</Re
                    /* 0388 */  0x64, 0x58, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // dX>.    
                    /* 0390 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x52, 0x65, 0x64,  //     <Red
                    /* 0398 */  0x59, 0x3E, 0x30, 0x78, 0x35, 0x39, 0x3C, 0x2F,  // Y>0x59</
                    /* 03A0 */  0x52, 0x65, 0x64, 0x59, 0x3E, 0x0A, 0x20, 0x20,  // RedY>.  
                    /* 03A8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x47,  //       <G
                    /* 03B0 */  0x72, 0x65, 0x65, 0x6E, 0x58, 0x3E, 0x30, 0x78,  // reenX>0x
                    /* 03B8 */  0x35, 0x37, 0x3C, 0x2F, 0x47, 0x72, 0x65, 0x65,  // 57</Gree
                    /* 03C0 */  0x6E, 0x58, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // nX>.    
                    /* 03C8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x65,  //     <Gre
                    /* 03D0 */  0x65, 0x6E, 0x59, 0x3E, 0x30, 0x78, 0x39, 0x35,  // enY>0x95
                    /* 03D8 */  0x3C, 0x2F, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x59,  // </GreenY
                    /* 03E0 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 03E8 */  0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75, 0x65, 0x58,  //   <BlueX
                    /* 03F0 */  0x3E, 0x30, 0x78, 0x32, 0x39, 0x3C, 0x2F, 0x42,  // >0x29</B
                    /* 03F8 */  0x6C, 0x75, 0x65, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // lueX>.  
                    /* 0400 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x42,  //       <B
                    /* 0408 */  0x6C, 0x75, 0x65, 0x59, 0x3E, 0x30, 0x78, 0x31,  // lueY>0x1
                    /* 0410 */  0x66, 0x3C, 0x2F, 0x42, 0x6C, 0x75, 0x65, 0x59,  // f</BlueY
                    /* 0418 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0420 */  0x20, 0x20, 0x3C, 0x57, 0x68, 0x69, 0x74, 0x65,  //   <White
                    /* 0428 */  0x58, 0x3E, 0x30, 0x78, 0x35, 0x30, 0x3C, 0x2F,  // X>0x50</
                    /* 0430 */  0x57, 0x68, 0x69, 0x74, 0x65, 0x58, 0x3E, 0x0A,  // WhiteX>.
                    /* 0438 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0440 */  0x3C, 0x57, 0x68, 0x69, 0x74, 0x65, 0x59, 0x3E,  // <WhiteY>
                    /* 0448 */  0x30, 0x78, 0x35, 0x34, 0x3C, 0x2F, 0x57, 0x68,  // 0x54</Wh
                    /* 0450 */  0x69, 0x74, 0x65, 0x59, 0x3E, 0x0A, 0x20, 0x20,  // iteY>.  
                    /* 0458 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x45,  //       <E
                    /* 0460 */  0x73, 0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68,  // stablish
                    /* 0468 */  0x65, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // edTiming
                    /* 0470 */  0x73, 0x49, 0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F,  // sI>0x0</
                    /* 0478 */  0x45, 0x73, 0x74, 0x61, 0x62, 0x6C, 0x69, 0x73,  // Establis
                    /* 0480 */  0x68, 0x65, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // hedTimin
                    /* 0488 */  0x67, 0x73, 0x49, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // gsI>.   
                    /* 0490 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x45, 0x73,  //      <Es
                    /* 0498 */  0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65,  // tablishe
                    /* 04A0 */  0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73,  // dTimings
                    /* 04A8 */  0x49, 0x49, 0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F,  // II>0x0</
                    /* 04B0 */  0x45, 0x73, 0x74, 0x61, 0x62, 0x6C, 0x69, 0x73,  // Establis
                    /* 04B8 */  0x68, 0x65, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // hedTimin
                    /* 04C0 */  0x67, 0x73, 0x49, 0x49, 0x3E, 0x0A, 0x20, 0x20,  // gsII>.  
                    /* 04C8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x4D,  //       <M
                    /* 04D0 */  0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75,  // anufactu
                    /* 04D8 */  0x72, 0x65, 0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // resTimin
                    /* 04E0 */  0x67, 0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F, 0x4D,  // g>0x0</M
                    /* 04E8 */  0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75,  // anufactu
                    /* 04F0 */  0x72, 0x65, 0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // resTimin
                    /* 04F8 */  0x67, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // g>.     
                    /* 0500 */  0x20, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  //    <Stan
                    /* 0508 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 0510 */  0x6E, 0x67, 0x73, 0x31, 0x2F, 0x3E, 0x0A, 0x20,  // ngs1/>. 
                    /* 0518 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0520 */  0x53, 0x74, 0x61, 0x6E, 0x64, 0x61, 0x72, 0x64,  // Standard
                    /* 0528 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x32,  // Timings2
                    /* 0530 */  0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // />.     
                    /* 0538 */  0x20, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  //    <Stan
                    /* 0540 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 0548 */  0x6E, 0x67, 0x73, 0x33, 0x2F, 0x3E, 0x0A, 0x20,  // ngs3/>. 
                    /* 0550 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0558 */  0x53, 0x74, 0x61, 0x6E, 0x64, 0x61, 0x72, 0x64,  // Standard
                    /* 0560 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x34,  // Timings4
                    /* 0568 */  0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // />.     
                    /* 0570 */  0x20, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  //    <Stan
                    /* 0578 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 0580 */  0x6E, 0x67, 0x73, 0x35, 0x2F, 0x3E, 0x0A, 0x20,  // ngs5/>. 
                    /* 0588 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0590 */  0x53, 0x74, 0x61, 0x6E, 0x64, 0x61, 0x72, 0x64,  // Standard
                    /* 0598 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x36,  // Timings6
                    /* 05A0 */  0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // />.     
                    /* 05A8 */  0x20, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  //    <Stan
                    /* 05B0 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 05B8 */  0x6E, 0x67, 0x73, 0x37, 0x2F, 0x3E, 0x0A, 0x20,  // ngs7/>. 
                    /* 05C0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 05C8 */  0x53, 0x69, 0x67, 0x6E, 0x61, 0x6C, 0x54, 0x69,  // SignalTi
                    /* 05D0 */  0x6D, 0x69, 0x6E, 0x67, 0x49, 0x6E, 0x74, 0x65,  // mingInte
                    /* 05D8 */  0x72, 0x66, 0x61, 0x63, 0x65, 0x2F, 0x3E, 0x0A,  // rface/>.
                    /* 05E0 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72,  //     </Gr
                    /* 05E8 */  0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x0A, 0x20, 0x20,  // oup>..  
                    /* 05F0 */  0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70,  //   <Group
                    /* 05F8 */  0x20, 0x69, 0x64, 0x3D, 0x27, 0x44, 0x65, 0x74,  //  id='Det
                    /* 0600 */  0x61, 0x69, 0x6C, 0x65, 0x64, 0x20, 0x54, 0x69,  // ailed Ti
                    /* 0608 */  0x6D, 0x69, 0x6E, 0x67, 0x27, 0x3E, 0x0A, 0x20,  // ming'>. 
                    /* 0610 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0618 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 0620 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 0628 */  0x53, 0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x30,  // SizeMM>0
                    /* 0630 */  0x78, 0x33, 0x37, 0x3C, 0x2F, 0x48, 0x6F, 0x72,  // x37</Hor
                    /* 0638 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53,  // izontalS
                    /* 0640 */  0x63, 0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A,  // creenSiz
                    /* 0648 */  0x65, 0x4D, 0x4D, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // eMM>.   
                    /* 0650 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65,  //      <Ve
                    /* 0658 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x63,  // rticalSc
                    /* 0660 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 0668 */  0x4D, 0x4D, 0x3E, 0x30, 0x78, 0x36, 0x33, 0x3C,  // MM>0x63<
                    /* 0670 */  0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // /Vertica
                    /* 0678 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 0680 */  0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x0A, 0x20,  // izeMM>. 
                    /* 0688 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0690 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 0698 */  0x61, 0x6C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // alVertic
                    /* 06A0 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 06A8 */  0x53, 0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x30,  // SizeMM>0
                    /* 06B0 */  0x78, 0x30, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72,  // x00</Hor
                    /* 06B8 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x56,  // izontalV
                    /* 06C0 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53,  // erticalS
                    /* 06C8 */  0x63, 0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A,  // creenSiz
                    /* 06D0 */  0x65, 0x4D, 0x4D, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // eMM>.   
                    /* 06D8 */  0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70,  //  </Group
                    /* 06E0 */  0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // >..    <
                    /* 06E8 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64,  // Group id
                    /* 06F0 */  0x3D, 0x27, 0x41, 0x63, 0x74, 0x69, 0x76, 0x65,  // ='Active
                    /* 06F8 */  0x20, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x27,  //  Timing'
                    /* 0700 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0708 */  0x20, 0x20, 0x3C, 0x52, 0x65, 0x70, 0x6F, 0x72,  //   <Repor
                    /* 0710 */  0x74, 0x65, 0x64, 0x50, 0x69, 0x78, 0x65, 0x6C,  // tedPixel
                    /* 0718 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46, 0x72, 0x65,  // ClockFre
                    /* 0720 */  0x71, 0x75, 0x65, 0x6E, 0x63, 0x79, 0x20, 0x75,  // quency u
                    /* 0728 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x48, 0x7A,  // nits='Hz
                    /* 0730 */  0x27, 0x3E, 0x33, 0x39, 0x38, 0x38, 0x38, 0x33,  // '>398883
                    /* 0738 */  0x31, 0x32, 0x37, 0x3C, 0x2F, 0x52, 0x65, 0x70,  // 127</Rep
                    /* 0740 */  0x6F, 0x72, 0x74, 0x65, 0x64, 0x50, 0x69, 0x78,  // ortedPix
                    /* 0748 */  0x65, 0x6C, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46,  // elClockF
                    /* 0750 */  0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79,  // requency
                    /* 0758 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0760 */  0x20, 0x20, 0x3C, 0x50, 0x69, 0x78, 0x65, 0x6C,  //   <Pixel
                    /* 0768 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46, 0x72, 0x65,  // ClockFre
                    /* 0770 */  0x71, 0x75, 0x65, 0x6E, 0x63, 0x79, 0x20, 0x75,  // quency u
                    /* 0778 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x48, 0x7A,  // nits='Hz
                    /* 0780 */  0x27, 0x3E, 0x33, 0x39, 0x38, 0x38, 0x38, 0x33,  // '>398883
                    /* 0788 */  0x31, 0x32, 0x37, 0x3C, 0x2F, 0x50, 0x69, 0x78,  // 127</Pix
                    /* 0790 */  0x65, 0x6C, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46,  // elClockF
                    /* 0798 */  0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79,  // requency
                    /* 07A0 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 07A8 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 07B0 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x41, 0x63, 0x74,  // ontalAct
                    /* 07B8 */  0x69, 0x76, 0x65, 0x20, 0x75, 0x6E, 0x69, 0x74,  // ive unit
                    /* 07C0 */  0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20, 0x43,  // s='Dot C
                    /* 07C8 */  0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E, 0x34,  // locks'>4
                    /* 07D0 */  0x38, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // 80</Hori
                    /* 07D8 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x41, 0x63,  // zontalAc
                    /* 07E0 */  0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A, 0x20, 0x20,  // tive>.  
                    /* 07E8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x48,  //       <H
                    /* 07F0 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 07F8 */  0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74, 0x50, 0x6F,  // lFrontPo
                    /* 0800 */  0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69, 0x74,  // rch unit
                    /* 0808 */  0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20, 0x43,  // s='Dot C
                    /* 0810 */  0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E, 0x37,  // locks'>7
                    /* 0818 */  0x35, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A,  // 5</Horiz
                    /* 0820 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x46, 0x72, 0x6F,  // ontalFro
                    /* 0828 */  0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63, 0x68, 0x3E,  // ntPorch>
                    /* 0830 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0838 */  0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F,  //  <Horizo
                    /* 0840 */  0x6E, 0x74, 0x61, 0x6C, 0x42, 0x61, 0x63, 0x6B,  // ntalBack
                    /* 0848 */  0x50, 0x6F, 0x72, 0x63, 0x68, 0x20, 0x75, 0x6E,  // Porch un
                    /* 0850 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74,  // its='Dot
                    /* 0858 */  0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27,  //  Clocks'
                    /* 0860 */  0x3E, 0x37, 0x35, 0x3C, 0x2F, 0x48, 0x6F, 0x72,  // >75</Hor
                    /* 0868 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x42,  // izontalB
                    /* 0870 */  0x61, 0x63, 0x6B, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ackPorch
                    /* 0878 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0880 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 0888 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79, 0x6E,  // ontalSyn
                    /* 0890 */  0x63, 0x50, 0x75, 0x6C, 0x73, 0x65, 0x20, 0x75,  // cPulse u
                    /* 0898 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F,  // nits='Do
                    /* 08A0 */  0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73,  // t Clocks
                    /* 08A8 */  0x27, 0x3E, 0x35, 0x3C, 0x2F, 0x48, 0x6F, 0x72,  // '>5</Hor
                    /* 08B0 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53,  // izontalS
                    /* 08B8 */  0x79, 0x6E, 0x63, 0x50, 0x75, 0x6C, 0x73, 0x65,  // yncPulse
                    /* 08C0 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 08C8 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 08D0 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79, 0x6E,  // ontalSyn
                    /* 08D8 */  0x63, 0x53, 0x6B, 0x65, 0x77, 0x20, 0x75, 0x6E,  // cSkew un
                    /* 08E0 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74,  // its='Dot
                    /* 08E8 */  0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27,  //  Clocks'
                    /* 08F0 */  0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // >0</Hori
                    /* 08F8 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79,  // zontalSy
                    /* 0900 */  0x6E, 0x63, 0x53, 0x6B, 0x65, 0x77, 0x3E, 0x0A,  // ncSkew>.
                    /* 0908 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0910 */  0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // <Horizon
                    /* 0918 */  0x74, 0x61, 0x6C, 0x4C, 0x65, 0x66, 0x74, 0x42,  // talLeftB
                    /* 0920 */  0x6F, 0x72, 0x64, 0x65, 0x72, 0x20, 0x75, 0x6E,  // order un
                    /* 0928 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74,  // its='Dot
                    /* 0930 */  0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27,  //  Clocks'
                    /* 0938 */  0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // >0</Hori
                    /* 0940 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x4C, 0x65,  // zontalLe
                    /* 0948 */  0x66, 0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72,  // ftBorder
                    /* 0950 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0958 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 0960 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x52, 0x69, 0x67,  // ontalRig
                    /* 0968 */  0x68, 0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72,  // htBorder
                    /* 0970 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0978 */  0x44, 0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63,  // Dot Cloc
                    /* 0980 */  0x6B, 0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x48,  // ks'>0</H
                    /* 0988 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0990 */  0x6C, 0x52, 0x69, 0x67, 0x68, 0x74, 0x42, 0x6F,  // lRightBo
                    /* 0998 */  0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20,  // rder>.  
                    /* 09A0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56,  //       <V
                    /* 09A8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x41,  // erticalA
                    /* 09B0 */  0x63, 0x74, 0x69, 0x76, 0x65, 0x20, 0x75, 0x6E,  // ctive un
                    /* 09B8 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74,  // its='Dot
                    /* 09C0 */  0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27,  //  Clocks'
                    /* 09C8 */  0x3E, 0x38, 0x35, 0x34, 0x3C, 0x2F, 0x56, 0x65,  // >854</Ve
                    /* 09D0 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x41, 0x63,  // rticalAc
                    /* 09D8 */  0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A, 0x20, 0x20,  // tive>.  
                    /* 09E0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56,  //       <V
                    /* 09E8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x46,  // erticalF
                    /* 09F0 */  0x72, 0x6F, 0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63,  // rontPorc
                    /* 09F8 */  0x68, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // h units=
                    /* 0A00 */  0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E,  // 'Lines'>
                    /* 0A08 */  0x36, 0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69,  // 6</Verti
                    /* 0A10 */  0x63, 0x61, 0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74,  // calFront
                    /* 0A18 */  0x50, 0x6F, 0x72, 0x63, 0x68, 0x3E, 0x0A, 0x20,  // Porch>. 
                    /* 0A20 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0A28 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0A30 */  0x42, 0x61, 0x63, 0x6B, 0x50, 0x6F, 0x72, 0x63,  // BackPorc
                    /* 0A38 */  0x68, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // h units=
                    /* 0A40 */  0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E,  // 'Lines'>
                    /* 0A48 */  0x36, 0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69,  // 6</Verti
                    /* 0A50 */  0x63, 0x61, 0x6C, 0x42, 0x61, 0x63, 0x6B, 0x50,  // calBackP
                    /* 0A58 */  0x6F, 0x72, 0x63, 0x68, 0x3E, 0x0A, 0x20, 0x20,  // orch>.  
                    /* 0A60 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56,  //       <V
                    /* 0A68 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53,  // erticalS
                    /* 0A70 */  0x79, 0x6E, 0x63, 0x50, 0x75, 0x6C, 0x73, 0x65,  // yncPulse
                    /* 0A78 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0A80 */  0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E, 0x35,  // Lines'>5
                    /* 0A88 */  0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // </Vertic
                    /* 0A90 */  0x61, 0x6C, 0x53, 0x79, 0x6E, 0x63, 0x50, 0x75,  // alSyncPu
                    /* 0A98 */  0x6C, 0x73, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // lse>.   
                    /* 0AA0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65,  //      <Ve
                    /* 0AA8 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x79,  // rticalSy
                    /* 0AB0 */  0x6E, 0x63, 0x53, 0x6B, 0x65, 0x77, 0x20, 0x75,  // ncSkew u
                    /* 0AB8 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x4C, 0x69,  // nits='Li
                    /* 0AC0 */  0x6E, 0x65, 0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F,  // nes'>0</
                    /* 0AC8 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0AD0 */  0x53, 0x79, 0x6E, 0x63, 0x53, 0x6B, 0x65, 0x77,  // SyncSkew
                    /* 0AD8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0AE0 */  0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69,  //   <Verti
                    /* 0AE8 */  0x63, 0x61, 0x6C, 0x54, 0x6F, 0x70, 0x42, 0x6F,  // calTopBo
                    /* 0AF0 */  0x72, 0x64, 0x65, 0x72, 0x20, 0x75, 0x6E, 0x69,  // rder uni
                    /* 0AF8 */  0x74, 0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65,  // ts='Line
                    /* 0B00 */  0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x56, 0x65,  // s'>0</Ve
                    /* 0B08 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x54, 0x6F,  // rticalTo
                    /* 0B10 */  0x70, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E,  // pBorder>
                    /* 0B18 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0B20 */  0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  //  <Vertic
                    /* 0B28 */  0x61, 0x6C, 0x42, 0x6F, 0x74, 0x74, 0x6F, 0x6D,  // alBottom
                    /* 0B30 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x20, 0x75,  // Border u
                    /* 0B38 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x4C, 0x69,  // nits='Li
                    /* 0B40 */  0x6E, 0x65, 0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F,  // nes'>0</
                    /* 0B48 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0B50 */  0x42, 0x6F, 0x74, 0x74, 0x6F, 0x6D, 0x42, 0x6F,  // BottomBo
                    /* 0B58 */  0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20,  // rder>.  
                    /* 0B60 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x49,  //       <I
                    /* 0B68 */  0x6E, 0x76, 0x65, 0x72, 0x74, 0x44, 0x61, 0x74,  // nvertDat
                    /* 0B70 */  0x61, 0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74,  // aPolarit
                    /* 0B78 */  0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C,  // y>False<
                    /* 0B80 */  0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x44,  // /InvertD
                    /* 0B88 */  0x61, 0x74, 0x61, 0x50, 0x6F, 0x6C, 0x61, 0x72,  // ataPolar
                    /* 0B90 */  0x69, 0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ity>.   
                    /* 0B98 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E,  //      <In
                    /* 0BA0 */  0x76, 0x65, 0x72, 0x74, 0x56, 0x73, 0x79, 0x6E,  // vertVsyn
                    /* 0BA8 */  0x63, 0x50, 0x6F, 0x6C, 0x61, 0x69, 0x72, 0x74,  // cPolairt
                    /* 0BB0 */  0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C,  // y>False<
                    /* 0BB8 */  0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x56,  // /InvertV
                    /* 0BC0 */  0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61,  // syncPola
                    /* 0BC8 */  0x69, 0x72, 0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20,  // irty>.  
                    /* 0BD0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x49,  //       <I
                    /* 0BD8 */  0x6E, 0x76, 0x65, 0x72, 0x74, 0x48, 0x73, 0x79,  // nvertHsy
                    /* 0BE0 */  0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69,  // ncPolari
                    /* 0BE8 */  0x74, 0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65,  // ty>False
                    /* 0BF0 */  0x3C, 0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74,  // </Invert
                    /* 0BF8 */  0x48, 0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C,  // HsyncPol
                    /* 0C00 */  0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A, 0x20,  // arity>. 
                    /* 0C08 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0C10 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x43, 0x6F,  // BorderCo
                    /* 0C18 */  0x6C, 0x6F, 0x72, 0x3E, 0x30, 0x78, 0x30, 0x3C,  // lor>0x0<
                    /* 0C20 */  0x2F, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x43,  // /BorderC
                    /* 0C28 */  0x6F, 0x6C, 0x6F, 0x72, 0x3E, 0x0A, 0x20, 0x20,  // olor>.  
                    /* 0C30 */  0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  //   </Grou
                    /* 0C38 */  0x70, 0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20,  // p>..    
                    /* 0C40 */  0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69,  // <Group i
                    /* 0C48 */  0x64, 0x3D, 0x27, 0x44, 0x69, 0x73, 0x70, 0x6C,  // d='Displ
                    /* 0C50 */  0x61, 0x79, 0x20, 0x49, 0x6E, 0x74, 0x65, 0x72,  // ay Inter
                    /* 0C58 */  0x66, 0x61, 0x63, 0x65, 0x27, 0x3E, 0x0A, 0x20,  // face'>. 
                    /* 0C60 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0C68 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 0C70 */  0x65, 0x54, 0x79, 0x70, 0x65, 0x20, 0x75, 0x6E,  // eType un
                    /* 0C78 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x51, 0x44, 0x49,  // its='QDI
                    /* 0C80 */  0x5F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79,  // _Display
                    /* 0C88 */  0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x54,  // ConnectT
                    /* 0C90 */  0x79, 0x70, 0x65, 0x27, 0x3E, 0x38, 0x3C, 0x2F,  // ype'>8</
                    /* 0C98 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 0CA0 */  0x65, 0x54, 0x79, 0x70, 0x65, 0x3E, 0x0A, 0x20,  // eType>. 
                    /* 0CA8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0CB0 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 0CB8 */  0x65, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F,  // eColorFo
                    /* 0CC0 */  0x72, 0x6D, 0x61, 0x74, 0x20, 0x75, 0x6E, 0x69,  // rmat uni
                    /* 0CC8 */  0x74, 0x73, 0x3D, 0x27, 0x51, 0x44, 0x49, 0x5F,  // ts='QDI_
                    /* 0CD0 */  0x50, 0x69, 0x78, 0x65, 0x6C, 0x46, 0x6F, 0x72,  // PixelFor
                    /* 0CD8 */  0x6D, 0x61, 0x74, 0x54, 0x79, 0x70, 0x65, 0x27,  // matType'
                    /* 0CE0 */  0x3E, 0x33, 0x3C, 0x2F, 0x49, 0x6E, 0x74, 0x65,  // >3</Inte
                    /* 0CE8 */  0x72, 0x66, 0x61, 0x63, 0x65, 0x43, 0x6F, 0x6C,  // rfaceCol
                    /* 0CF0 */  0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74,  // orFormat
                    /* 0CF8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x2F,  // >.    </
                    /* 0D00 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x0A,  // Group>..
                    /* 0D08 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F,  //     <Gro
                    /* 0D10 */  0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x44,  // up id='D
                    /* 0D18 */  0x53, 0x49, 0x20, 0x49, 0x6E, 0x74, 0x65, 0x72,  // SI Inter
                    /* 0D20 */  0x66, 0x61, 0x63, 0x65, 0x27, 0x3E, 0x0A, 0x20,  // face'>. 
                    /* 0D28 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0D30 */  0x44, 0x53, 0x49, 0x43, 0x68, 0x61, 0x6E, 0x6E,  // DSIChann
                    /* 0D38 */  0x65, 0x6C, 0x49, 0x64, 0x20, 0x75, 0x6E, 0x69,  // elId uni
                    /* 0D40 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x5F,  // ts='DSI_
                    /* 0D48 */  0x43, 0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x5F,  // Channel_
                    /* 0D50 */  0x49, 0x44, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E,  // IDType'>
                    /* 0D58 */  0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x43, 0x68,  // 1</DSICh
                    /* 0D60 */  0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x49, 0x64, 0x3E,  // annelId>
                    /* 0D68 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0D70 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x56, 0x69, 0x72,  //  <DSIVir
                    /* 0D78 */  0x74, 0x75, 0x61, 0x6C, 0x49, 0x64, 0x20, 0x75,  // tualId u
                    /* 0D80 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x53,  // nits='DS
                    /* 0D88 */  0x49, 0x5F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61,  // I_Displa
                    /* 0D90 */  0x79, 0x5F, 0x56, 0x43, 0x54, 0x79, 0x70, 0x65,  // y_VCType
                    /* 0D98 */  0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // '>0</DSI
                    /* 0DA0 */  0x56, 0x69, 0x72, 0x74, 0x75, 0x61, 0x6C, 0x49,  // VirtualI
                    /* 0DA8 */  0x64, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // d>.     
                    /* 0DB0 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x43,  //    <DSIC
                    /* 0DB8 */  0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D,  // olorForm
                    /* 0DC0 */  0x61, 0x74, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // at units
                    /* 0DC8 */  0x3D, 0x27, 0x44, 0x53, 0x49, 0x5F, 0x43, 0x6F,  // ='DSI_Co
                    /* 0DD0 */  0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61,  // lorForma
                    /* 0DD8 */  0x74, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x33,  // tType'>3
                    /* 0DE0 */  0x36, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x43, 0x6F,  // 6</DSICo
                    /* 0DE8 */  0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61,  // lorForma
                    /* 0DF0 */  0x74, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // t>.     
                    /* 0DF8 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x54,  //    <DSIT
                    /* 0E00 */  0x72, 0x61, 0x66, 0x66, 0x69, 0x63, 0x4D, 0x6F,  // rafficMo
                    /* 0E08 */  0x64, 0x65, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // de units
                    /* 0E10 */  0x3D, 0x27, 0x44, 0x53, 0x49, 0x5F, 0x54, 0x72,  // ='DSI_Tr
                    /* 0E18 */  0x61, 0x66, 0x66, 0x69, 0x63, 0x4D, 0x6F, 0x64,  // afficMod
                    /* 0E20 */  0x65, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x32,  // eType'>2
                    /* 0E28 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x54, 0x72, 0x61,  // </DSITra
                    /* 0E30 */  0x66, 0x66, 0x69, 0x63, 0x4D, 0x6F, 0x64, 0x65,  // fficMode
                    /* 0E38 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0E40 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x61,  //   <DSILa
                    /* 0E48 */  0x6E, 0x65, 0x73, 0x20, 0x75, 0x6E, 0x69, 0x74,  // nes unit
                    /* 0E50 */  0x73, 0x3D, 0x27, 0x69, 0x6E, 0x74, 0x65, 0x67,  // s='integ
                    /* 0E58 */  0x65, 0x72, 0x27, 0x3E, 0x32, 0x3C, 0x2F, 0x44,  // er'>2</D
                    /* 0E60 */  0x53, 0x49, 0x4C, 0x61, 0x6E, 0x65, 0x73, 0x3E,  // SILanes>
                    /* 0E68 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0E70 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x48, 0x73, 0x61,  //  <DSIHsa
                    /* 0E78 */  0x48, 0x73, 0x65, 0x41, 0x66, 0x74, 0x65, 0x72,  // HseAfter
                    /* 0E80 */  0x56, 0x73, 0x56, 0x65, 0x20, 0x75, 0x6E, 0x69,  // VsVe uni
                    /* 0E88 */  0x74, 0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C,  // ts='Bool
                    /* 0E90 */  0x27, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C,  // '>False<
                    /* 0E98 */  0x2F, 0x44, 0x53, 0x49, 0x48, 0x73, 0x61, 0x48,  // /DSIHsaH
                    /* 0EA0 */  0x73, 0x65, 0x41, 0x66, 0x74, 0x65, 0x72, 0x56,  // seAfterV
                    /* 0EA8 */  0x73, 0x56, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // sVe>.   
                    /* 0EB0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0EB8 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0EC0 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48,  // rModeInH
                    /* 0EC8 */  0x46, 0x50, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // FP units
                    /* 0ED0 */  0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E,  // ='Bool'>
                    /* 0ED8 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 0EE0 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0EE8 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0EF0 */  0x48, 0x46, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // HFP>.   
                    /* 0EF8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0F00 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0F08 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48,  // rModeInH
                    /* 0F10 */  0x42, 0x50, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // BP units
                    /* 0F18 */  0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E,  // ='Bool'>
                    /* 0F20 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 0F28 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0F30 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0F38 */  0x48, 0x42, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // HBP>.   
                    /* 0F40 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0F48 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0F50 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48,  // rModeInH
                    /* 0F58 */  0x53, 0x41, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // SA units
                    /* 0F60 */  0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E,  // ='Bool'>
                    /* 0F68 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 0F70 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0F78 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0F80 */  0x48, 0x53, 0x41, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // HSA>.   
                    /* 0F88 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0F90 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0F98 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42,  // rModeInB
                    /* 0FA0 */  0x4C, 0x4C, 0x50, 0x45, 0x4F, 0x46, 0x20, 0x75,  // LLPEOF u
                    /* 0FA8 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42, 0x6F,  // nits='Bo
                    /* 0FB0 */  0x6F, 0x6C, 0x27, 0x3E, 0x54, 0x72, 0x75, 0x65,  // ol'>True
                    /* 0FB8 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77,  // </DSILow
                    /* 0FC0 */  0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64,  // PowerMod
                    /* 0FC8 */  0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50, 0x45,  // eInBLLPE
                    /* 0FD0 */  0x4F, 0x46, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // OF>.    
                    /* 0FD8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0FE0 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 0FE8 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C,  // ModeInBL
                    /* 0FF0 */  0x4C, 0x50, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // LP units
                    /* 0FF8 */  0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E,  // ='Bool'>
                    /* 1000 */  0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // True</DS
                    /* 1008 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 1010 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42,  // rModeInB
                    /* 1018 */  0x4C, 0x4C, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // LLP>.   
                    /* 1020 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 1028 */  0x49, 0x42, 0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63,  // IBitCloc
                    /* 1030 */  0x6B, 0x46, 0x72, 0x65, 0x71, 0x75, 0x65, 0x6E,  // kFrequen
                    /* 1038 */  0x63, 0x79, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // cy units
                    /* 1040 */  0x3D, 0x27, 0x69, 0x6E, 0x74, 0x65, 0x67, 0x65,  // ='intege
                    /* 1048 */  0x72, 0x27, 0x3E, 0x33, 0x39, 0x38, 0x38, 0x38,  // r'>39888
                    /* 1050 */  0x33, 0x30, 0x30, 0x30, 0x3C, 0x2F, 0x44, 0x53,  // 3000</DS
                    /* 1058 */  0x49, 0x42, 0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63,  // IBitCloc
                    /* 1060 */  0x6B, 0x46, 0x72, 0x65, 0x71, 0x75, 0x65, 0x6E,  // kFrequen
                    /* 1068 */  0x63, 0x79, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // cy>.    
                    /* 1070 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 1078 */  0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x52,  // RefreshR
                    /* 1080 */  0x61, 0x74, 0x65, 0x20, 0x75, 0x6E, 0x69, 0x74,  // ate unit
                    /* 1088 */  0x73, 0x3D, 0x27, 0x69, 0x6E, 0x74, 0x65, 0x67,  // s='integ
                    /* 1090 */  0x65, 0x72, 0x20, 0x51, 0x31, 0x36, 0x2E, 0x31,  // er Q16.1
                    /* 1098 */  0x36, 0x27, 0x3E, 0x30, 0x78, 0x33, 0x43, 0x30,  // 6'>0x3C0
                    /* 10A0 */  0x30, 0x30, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // 000</DSI
                    /* 10A8 */  0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x52,  // RefreshR
                    /* 10B0 */  0x61, 0x74, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ate>.   
                    /* 10B8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 10C0 */  0x49, 0x48, 0x6F, 0x73, 0x74, 0x4C, 0x61, 0x6E,  // IHostLan
                    /* 10C8 */  0x65, 0x4D, 0x61, 0x70, 0x70, 0x69, 0x6E, 0x67,  // eMapping
                    /* 10D0 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 10D8 */  0x69, 0x6E, 0x74, 0x65, 0x67, 0x65, 0x72, 0x27,  // integer'
                    /* 10E0 */  0x3E, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x48,  // >0</DSIH
                    /* 10E8 */  0x6F, 0x73, 0x74, 0x4C, 0x61, 0x6E, 0x65, 0x4D,  // ostLaneM
                    /* 10F0 */  0x61, 0x70, 0x70, 0x69, 0x6E, 0x67, 0x3E, 0x0A,  // apping>.
                    /* 10F8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 1100 */  0x3C, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79,  // <Display
                    /* 1108 */  0x50, 0x6F, 0x77, 0x65, 0x72, 0x53, 0x61, 0x76,  // PowerSav
                    /* 1110 */  0x69, 0x6E, 0x67, 0x4F, 0x76, 0x65, 0x72, 0x72,  // ingOverr
                    /* 1118 */  0x69, 0x64, 0x65, 0x20, 0x75, 0x6E, 0x69, 0x74,  // ide unit
                    /* 1120 */  0x73, 0x3D, 0x27, 0x69, 0x6E, 0x74, 0x65, 0x67,  // s='integ
                    /* 1128 */  0x65, 0x72, 0x27, 0x3E, 0x30, 0x78, 0x30, 0x30,  // er'>0x00
                    /* 1130 */  0x30, 0x30, 0x30, 0x30, 0x30, 0x31, 0x3C, 0x2F,  // 000001</
                    /* 1138 */  0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x50,  // DisplayP
                    /* 1140 */  0x6F, 0x77, 0x65, 0x72, 0x53, 0x61, 0x76, 0x69,  // owerSavi
                    /* 1148 */  0x6E, 0x67, 0x4F, 0x76, 0x65, 0x72, 0x72, 0x69,  // ngOverri
                    /* 1150 */  0x64, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // de>.    
                    /* 1158 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 1160 */  0x4C, 0x50, 0x31, 0x31, 0x41, 0x74, 0x49, 0x6E,  // LP11AtIn
                    /* 1168 */  0x69, 0x74, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // it units
                    /* 1170 */  0x3D, 0x27, 0x69, 0x6E, 0x74, 0x65, 0x67, 0x65,  // ='intege
                    /* 1178 */  0x72, 0x27, 0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53,  // r'>1</DS
                    /* 1180 */  0x49, 0x4C, 0x50, 0x31, 0x31, 0x41, 0x74, 0x49,  // ILP11AtI
                    /* 1188 */  0x6E, 0x69, 0x74, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // nit>.   
                    /* 1190 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 1198 */  0x49, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x48, 0x53,  // IClockHS
                    /* 11A0 */  0x46, 0x6F, 0x72, 0x63, 0x65, 0x52, 0x65, 0x71,  // ForceReq
                    /* 11A8 */  0x75, 0x65, 0x73, 0x74, 0x20, 0x75, 0x69, 0x6E,  // uest uin
                    /* 11B0 */  0x74, 0x73, 0x3D, 0x27, 0x69, 0x6E, 0x74, 0x65,  // ts='inte
                    /* 11B8 */  0x67, 0x65, 0x72, 0x27, 0x3E, 0x30, 0x3C, 0x2F,  // ger'>0</
                    /* 11C0 */  0x44, 0x53, 0x49, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // DSIClock
                    /* 11C8 */  0x48, 0x53, 0x46, 0x6F, 0x72, 0x63, 0x65, 0x52,  // HSForceR
                    /* 11D0 */  0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x3E, 0x0A,  // equest>.
                    /* 11D8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72,  //     </Gr
                    /* 11E0 */  0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C, 0x21, 0x2D,  // oup>.<!-
                    /* 11E8 */  0x2D, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  // -.    <D
                    /* 11F0 */  0x53, 0x49, 0x49, 0x6E, 0x69, 0x74, 0x53, 0x65,  // SIInitSe
                    /* 11F8 */  0x71, 0x75, 0x65, 0x6E, 0x63, 0x65, 0x3E, 0x0A,  // quence>.
                    /* 1200 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x30, 0x35,  //       05
                    /* 1208 */  0x20, 0x31, 0x31, 0x20, 0x30, 0x30, 0x0A, 0x20,  //  11 00. 
                    /* 1210 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x66, 0x66, 0x20,  //      ff 
                    /* 1218 */  0x37, 0x38, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // 78.     
                    /* 1220 */  0x20, 0x31, 0x35, 0x20, 0x33, 0x36, 0x20, 0x30,  //  15 36 0
                    /* 1228 */  0x30, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // 0.      
                    /* 1230 */  0x31, 0x35, 0x20, 0x35, 0x33, 0x20, 0x32, 0x34,  // 15 53 24
                    /* 1238 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x31,  // .      1
                    /* 1240 */  0x35, 0x20, 0x35, 0x31, 0x20, 0x66, 0x66, 0x0A,  // 5 51 ff.
                    /* 1248 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x31, 0x35,  //       15
                    /* 1250 */  0x20, 0x35, 0x35, 0x20, 0x30, 0x30, 0x0A, 0x20,  //  55 00. 
                    /* 1258 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x30, 0x35, 0x20,  //      05 
                    /* 1260 */  0x32, 0x39, 0x20, 0x30, 0x30, 0x0A, 0x20, 0x20,  // 29 00.  
                    /* 1268 */  0x20, 0x20, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x49,  //   </DSII
                    /* 1270 */  0x6E, 0x69, 0x74, 0x53, 0x65, 0x71, 0x75, 0x65,  // nitSeque
                    /* 1278 */  0x6E, 0x63, 0x65, 0x3E, 0x0A, 0x0A, 0x20, 0x20,  // nce>..  
                    /* 1280 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x54, 0x65, 0x72,  //  <DSITer
                    /* 1288 */  0x6D, 0x53, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63,  // mSequenc
                    /* 1290 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // e>.     
                    /* 1298 */  0x20, 0x20, 0x30, 0x35, 0x20, 0x31, 0x30, 0x20,  //   05 10 
                    /* 12A0 */  0x30, 0x30, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // 00.     
                    /* 12A8 */  0x20, 0x20, 0x46, 0x46, 0x20, 0x37, 0x38, 0x0A,  //   FF 78.
                    /* 12B0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x30,  //        0
                    /* 12B8 */  0x35, 0x20, 0x32, 0x38, 0x20, 0x30, 0x30, 0x0A,  // 5 28 00.
                    /* 12C0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x31,  //        1
                    /* 12C8 */  0x35, 0x20, 0x35, 0x33, 0x20, 0x30, 0x30, 0x0A,  // 5 53 00.
                    /* 12D0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x31,  //        1
                    /* 12D8 */  0x35, 0x20, 0x35, 0x31, 0x20, 0x30, 0x30, 0x0A,  // 5 51 00.
                    /* 12E0 */  0x20, 0x20, 0x20, 0x3C, 0x2F, 0x44, 0x53, 0x49,  //    </DSI
                    /* 12E8 */  0x54, 0x65, 0x72, 0x6D, 0x53, 0x65, 0x71, 0x75,  // TermSequ
                    /* 12F0 */  0x65, 0x6E, 0x63, 0x65, 0x3E, 0x20, 0x20, 0x0A,  // ence>  .
                    /* 12F8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72,  // .    <Gr
                    /* 1300 */  0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27,  // oup id='
                    /* 1308 */  0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69,  // Connecti
                    /* 1310 */  0x6F, 0x6E, 0x20, 0x43, 0x6F, 0x6E, 0x66, 0x69,  // on Confi
                    /* 1318 */  0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x6E,  // guration
                    /* 1320 */  0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // '>.     
                    /* 1328 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x69, 0x73, 0x70,  //    <Disp
                    /* 1330 */  0x6C, 0x61, 0x79, 0x31, 0x52, 0x65, 0x73, 0x65,  // lay1Rese
                    /* 1338 */  0x74, 0x31, 0x49, 0x6E, 0x66, 0x6F, 0x3E, 0x44,  // t1Info>D
                    /* 1340 */  0x53, 0x49, 0x5F, 0x50, 0x41, 0x4E, 0x45, 0x4C,  // SI_PANEL
                    /* 1348 */  0x5F, 0x52, 0x45, 0x53, 0x45, 0x54, 0x2C, 0x20,  // _RESET, 
                    /* 1350 */  0x30, 0x2C, 0x20, 0x31, 0x30, 0x2C, 0x20, 0x31,  // 0, 10, 1
                    /* 1358 */  0x3C, 0x2F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61,  // </Displa
                    /* 1360 */  0x79, 0x31, 0x52, 0x65, 0x73, 0x65, 0x74, 0x31,  // y1Reset1
                    /* 1368 */  0x49, 0x6E, 0x66, 0x6F, 0x3E, 0x0A, 0x20, 0x20,  // Info>.  
                    /* 1370 */  0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  //   </Grou
                    /* 1378 */  0x70, 0x3E, 0x0A, 0x0A, 0x2D, 0x2D, 0x3E, 0x0A,  // p>..-->.
                    /* 1380 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F,  //     <Gro
                    /* 1388 */  0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x42,  // up id='B
                    /* 1390 */  0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68, 0x74,  // acklight
                    /* 1398 */  0x20, 0x43, 0x6F, 0x6E, 0x66, 0x69, 0x67, 0x75,  //  Configu
                    /* 13A0 */  0x72, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x27, 0x3E,  // ration'>
                    /* 13A8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 13B0 */  0x3C, 0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67,  // <Backlig
                    /* 13B8 */  0x68, 0x74, 0x54, 0x79, 0x70, 0x65, 0x20, 0x75,  // htType u
                    /* 13C0 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x51, 0x44,  // nits='QD
                    /* 13C8 */  0x49, 0x5F, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x5F,  // I_Panel_
                    /* 13D0 */  0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68,  // Backligh
                    /* 13D8 */  0x74, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x33,  // tType'>3
                    /* 13E0 */  0x3C, 0x2F, 0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69,  // </Backli
                    /* 13E8 */  0x67, 0x68, 0x74, 0x54, 0x79, 0x70, 0x65, 0x3E,  // ghtType>
                    /* 13F0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 13F8 */  0x3C, 0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67,  // <Backlig
                    /* 1400 */  0x68, 0x74, 0x53, 0x74, 0x65, 0x70, 0x73, 0x20,  // htSteps 
                    /* 1408 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x50,  // units='P
                    /* 1410 */  0x65, 0x72, 0x63, 0x65, 0x6E, 0x74, 0x61, 0x67,  // ercentag
                    /* 1418 */  0x65, 0x27, 0x3E, 0x31, 0x30, 0x30, 0x3C, 0x2F,  // e'>100</
                    /* 1420 */  0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68,  // Backligh
                    /* 1428 */  0x74, 0x53, 0x74, 0x65, 0x70, 0x73, 0x3E, 0x0A,  // tSteps>.
                    /* 1430 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 1438 */  0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68,  // Backligh
                    /* 1440 */  0x74, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6C, 0x74,  // tDefault
                    /* 1448 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 1450 */  0x50, 0x65, 0x72, 0x63, 0x65, 0x6E, 0x74, 0x61,  // Percenta
                    /* 1458 */  0x67, 0x65, 0x27, 0x3E, 0x38, 0x30, 0x3C, 0x2F,  // ge'>80</
                    /* 1460 */  0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68,  // Backligh
                    /* 1468 */  0x74, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6C, 0x74,  // tDefault
                    /* 1470 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 1478 */  0x20, 0x3C, 0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69,  //  <Backli
                    /* 1480 */  0x67, 0x68, 0x74, 0x4C, 0x6F, 0x77, 0x50, 0x6F,  // ghtLowPo
                    /* 1488 */  0x77, 0x65, 0x72, 0x20, 0x75, 0x6E, 0x69, 0x74,  // wer unit
                    /* 1490 */  0x73, 0x3D, 0x27, 0x50, 0x65, 0x72, 0x63, 0x65,  // s='Perce
                    /* 1498 */  0x6E, 0x74, 0x61, 0x67, 0x65, 0x27, 0x3E, 0x34,  // ntage'>4
                    /* 14A0 */  0x30, 0x3C, 0x2F, 0x42, 0x61, 0x63, 0x6B, 0x6C,  // 0</Backl
                    /* 14A8 */  0x69, 0x67, 0x68, 0x74, 0x4C, 0x6F, 0x77, 0x50,  // ightLowP
                    /* 14B0 */  0x6F, 0x77, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20,  // ower>.  
                    /* 14B8 */  0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  //   </Grou
                    /* 14C0 */  0x70, 0x3E, 0x00                                 // p>.
                })
                Name (PCF3, Buffer (0x1087)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x20,  // f-8'?>. 
                    /* 0028 */  0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75,  //    <Grou
                    /* 0030 */  0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x4D, 0x61,  // p id='Ma
                    /* 0038 */  0x69, 0x6E, 0x20, 0x50, 0x61, 0x6E, 0x65, 0x6C,  // in Panel
                    /* 0040 */  0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // '>.    <
                    /* 0048 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D,  // PanelNam
                    /* 0050 */  0x65, 0x3E, 0x54, 0x44, 0x4F, 0x2D, 0x58, 0x58,  // e>TDO-XX
                    /* 0058 */  0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,  // XXXXXXXX
                    /* 0060 */  0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,  // XXXXXXXX
                    /* 0068 */  0x58, 0x58, 0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65,  // XX</Pane
                    /* 0070 */  0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x0A, 0x20,  // lName>. 
                    /* 0078 */  0x20, 0x20, 0x20, 0x3C, 0x50, 0x61, 0x6E, 0x65,  //    <Pane
                    /* 0080 */  0x6C, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70,  // lDescrip
                    /* 0088 */  0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x56, 0x69, 0x64,  // tion>Vid
                    /* 0090 */  0x65, 0x6F, 0x20, 0x6D, 0x6F, 0x64, 0x65, 0x20,  // eo mode 
                    /* 0098 */  0x35, 0x34, 0x30, 0x71, 0x48, 0x44, 0x20, 0x54,  // 540qHD T
                    /* 00A0 */  0x72, 0x75, 0x6C, 0x79, 0x20, 0x44, 0x53, 0x49,  // ruly DSI
                    /* 00A8 */  0x20, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x20, 0x28,  //  Panel (
                    /* 00B0 */  0x35, 0x34, 0x30, 0x78, 0x39, 0x36, 0x30, 0x20,  // 540x960 
                    /* 00B8 */  0x32, 0x34, 0x62, 0x70, 0x70, 0x29, 0x3C, 0x2F,  // 24bpp)</
                    /* 00C0 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x44, 0x65, 0x73,  // PanelDes
                    /* 00C8 */  0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E,  // cription
                    /* 00D0 */  0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // >..    <
                    /* 00D8 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64,  // Group id
                    /* 00E0 */  0x3D, 0x27, 0x45, 0x44, 0x49, 0x44, 0x20, 0x43,  // ='EDID C
                    /* 00E8 */  0x6F, 0x6E, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61,  // onfigura
                    /* 00F0 */  0x74, 0x69, 0x6F, 0x6E, 0x27, 0x3E, 0x0A, 0x20,  // tion'>. 
                    /* 00F8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0100 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 0108 */  0x75, 0x72, 0x65, 0x49, 0x44, 0x3E, 0x30, 0x78,  // ureID>0x
                    /* 0110 */  0x41, 0x46, 0x30, 0x44, 0x3C, 0x2F, 0x4D, 0x61,  // AF0D</Ma
                    /* 0118 */  0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72,  // nufactur
                    /* 0120 */  0x65, 0x49, 0x44, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // eID>.   
                    /* 0128 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x50, 0x72,  //      <Pr
                    /* 0130 */  0x6F, 0x64, 0x75, 0x63, 0x74, 0x43, 0x6F, 0x64,  // oductCod
                    /* 0138 */  0x65, 0x3E, 0x30, 0x78, 0x30, 0x30, 0x31, 0x31,  // e>0x0011
                    /* 0140 */  0x3C, 0x2F, 0x50, 0x72, 0x6F, 0x64, 0x75, 0x63,  // </Produc
                    /* 0148 */  0x74, 0x43, 0x6F, 0x64, 0x65, 0x3E, 0x0A, 0x20,  // tCode>. 
                    /* 0150 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0158 */  0x53, 0x65, 0x72, 0x69, 0x61, 0x6C, 0x4E, 0x75,  // SerialNu
                    /* 0160 */  0x6D, 0x62, 0x65, 0x72, 0x3E, 0x30, 0x78, 0x30,  // mber>0x0
                    /* 0168 */  0x30, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x2F, 0x53,  // 00000</S
                    /* 0170 */  0x65, 0x72, 0x69, 0x61, 0x6C, 0x4E, 0x75, 0x6D,  // erialNum
                    /* 0178 */  0x62, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ber>.   
                    /* 0180 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x57, 0x65,  //      <We
                    /* 0188 */  0x65, 0x6B, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // ekofManu
                    /* 0190 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 0198 */  0x30, 0x78, 0x30, 0x39, 0x3C, 0x2F, 0x57, 0x65,  // 0x09</We
                    /* 01A0 */  0x65, 0x6B, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // ekofManu
                    /* 01A8 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 01B0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 01B8 */  0x20, 0x3C, 0x59, 0x65, 0x61, 0x72, 0x6F, 0x66,  //  <Yearof
                    /* 01C0 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 01C8 */  0x75, 0x72, 0x65, 0x3E, 0x30, 0x78, 0x31, 0x33,  // ure>0x13
                    /* 01D0 */  0x3C, 0x2F, 0x59, 0x65, 0x61, 0x72, 0x6F, 0x66,  // </Yearof
                    /* 01D8 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 01E0 */  0x75, 0x72, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ure>.   
                    /* 01E8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x45, 0x44,  //      <ED
                    /* 01F0 */  0x49, 0x44, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F,  // IDVersio
                    /* 01F8 */  0x6E, 0x3E, 0x31, 0x3C, 0x2F, 0x45, 0x44, 0x49,  // n>1</EDI
                    /* 0200 */  0x44, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E,  // DVersion
                    /* 0208 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0210 */  0x20, 0x20, 0x3C, 0x45, 0x44, 0x49, 0x44, 0x52,  //   <EDIDR
                    /* 0218 */  0x65, 0x76, 0x69, 0x73, 0x69, 0x6F, 0x6E, 0x3E,  // evision>
                    /* 0220 */  0x33, 0x3C, 0x2F, 0x45, 0x44, 0x49, 0x44, 0x52,  // 3</EDIDR
                    /* 0228 */  0x65, 0x76, 0x69, 0x73, 0x69, 0x6F, 0x6E, 0x3E,  // evision>
                    /* 0230 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0238 */  0x20, 0x3C, 0x56, 0x69, 0x64, 0x65, 0x6F, 0x49,  //  <VideoI
                    /* 0240 */  0x6E, 0x70, 0x75, 0x74, 0x44, 0x65, 0x66, 0x69,  // nputDefi
                    /* 0248 */  0x6E, 0x69, 0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x30,  // nition>0
                    /* 0250 */  0x78, 0x38, 0x30, 0x3C, 0x2F, 0x56, 0x69, 0x64,  // x80</Vid
                    /* 0258 */  0x65, 0x6F, 0x49, 0x6E, 0x70, 0x75, 0x74, 0x44,  // eoInputD
                    /* 0260 */  0x65, 0x66, 0x69, 0x6E, 0x69, 0x74, 0x69, 0x6F,  // efinitio
                    /* 0268 */  0x6E, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // n>.     
                    /* 0270 */  0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  //    <Hori
                    /* 0278 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x63,  // zontalSc
                    /* 0280 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 0288 */  0x3E, 0x30, 0x78, 0x30, 0x35, 0x3C, 0x2F, 0x48,  // >0x05</H
                    /* 0290 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0298 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 02A0 */  0x69, 0x7A, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ize>.   
                    /* 02A8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65,  //      <Ve
                    /* 02B0 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x63,  // rticalSc
                    /* 02B8 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 02C0 */  0x3E, 0x30, 0x78, 0x30, 0x41, 0x3C, 0x2F, 0x56,  // >0x0A</V
                    /* 02C8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53,  // erticalS
                    /* 02D0 */  0x63, 0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A,  // creenSiz
                    /* 02D8 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // e>.     
                    /* 02E0 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x69, 0x73, 0x70,  //    <Disp
                    /* 02E8 */  0x6C, 0x61, 0x79, 0x54, 0x72, 0x61, 0x6E, 0x73,  // layTrans
                    /* 02F0 */  0x66, 0x65, 0x72, 0x43, 0x68, 0x61, 0x72, 0x61,  // ferChara
                    /* 02F8 */  0x63, 0x74, 0x65, 0x72, 0x69, 0x73, 0x74, 0x69,  // cteristi
                    /* 0300 */  0x63, 0x73, 0x3E, 0x30, 0x78, 0x37, 0x38, 0x3C,  // cs>0x78<
                    /* 0308 */  0x2F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79,  // /Display
                    /* 0310 */  0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72,  // Transfer
                    /* 0318 */  0x43, 0x68, 0x61, 0x72, 0x61, 0x63, 0x74, 0x65,  // Characte
                    /* 0320 */  0x72, 0x69, 0x73, 0x74, 0x69, 0x63, 0x73, 0x3E,  // ristics>
                    /* 0328 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0330 */  0x20, 0x3C, 0x46, 0x65, 0x61, 0x74, 0x75, 0x72,  //  <Featur
                    /* 0338 */  0x65, 0x53, 0x75, 0x70, 0x70, 0x6F, 0x72, 0x74,  // eSupport
                    /* 0340 */  0x3E, 0x30, 0x78, 0x41, 0x3C, 0x2F, 0x46, 0x65,  // >0xA</Fe
                    /* 0348 */  0x61, 0x74, 0x75, 0x72, 0x65, 0x53, 0x75, 0x70,  // atureSup
                    /* 0350 */  0x70, 0x6F, 0x72, 0x74, 0x3E, 0x0A, 0x20, 0x20,  // port>.  
                    /* 0358 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x52,  //       <R
                    /* 0360 */  0x65, 0x64, 0x2E, 0x47, 0x72, 0x65, 0x65, 0x6E,  // ed.Green
                    /* 0368 */  0x42, 0x69, 0x74, 0x73, 0x3E, 0x30, 0x78, 0x43,  // Bits>0xC
                    /* 0370 */  0x46, 0x3C, 0x2F, 0x52, 0x65, 0x64, 0x2E, 0x47,  // F</Red.G
                    /* 0378 */  0x72, 0x65, 0x65, 0x6E, 0x42, 0x69, 0x74, 0x73,  // reenBits
                    /* 0380 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0388 */  0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75, 0x65, 0x2E,  //   <Blue.
                    /* 0390 */  0x57, 0x68, 0x69, 0x74, 0x65, 0x42, 0x69, 0x74,  // WhiteBit
                    /* 0398 */  0x73, 0x3E, 0x30, 0x78, 0x34, 0x35, 0x3C, 0x2F,  // s>0x45</
                    /* 03A0 */  0x42, 0x6C, 0x75, 0x65, 0x2E, 0x57, 0x68, 0x69,  // Blue.Whi
                    /* 03A8 */  0x74, 0x65, 0x42, 0x69, 0x74, 0x73, 0x3E, 0x0A,  // teBits>.
                    /* 03B0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 03B8 */  0x3C, 0x52, 0x65, 0x64, 0x58, 0x3E, 0x30, 0x78,  // <RedX>0x
                    /* 03C0 */  0x39, 0x30, 0x3C, 0x2F, 0x52, 0x65, 0x64, 0x58,  // 90</RedX
                    /* 03C8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 03D0 */  0x20, 0x20, 0x3C, 0x52, 0x65, 0x64, 0x59, 0x3E,  //   <RedY>
                    /* 03D8 */  0x30, 0x78, 0x35, 0x39, 0x3C, 0x2F, 0x52, 0x65,  // 0x59</Re
                    /* 03E0 */  0x64, 0x59, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // dY>.    
                    /* 03E8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x65,  //     <Gre
                    /* 03F0 */  0x65, 0x6E, 0x58, 0x3E, 0x30, 0x78, 0x35, 0x37,  // enX>0x57
                    /* 03F8 */  0x3C, 0x2F, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x58,  // </GreenX
                    /* 0400 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0408 */  0x20, 0x20, 0x3C, 0x47, 0x72, 0x65, 0x65, 0x6E,  //   <Green
                    /* 0410 */  0x59, 0x3E, 0x30, 0x78, 0x39, 0x35, 0x3C, 0x2F,  // Y>0x95</
                    /* 0418 */  0x47, 0x72, 0x65, 0x65, 0x6E, 0x59, 0x3E, 0x0A,  // GreenY>.
                    /* 0420 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0428 */  0x3C, 0x42, 0x6C, 0x75, 0x65, 0x58, 0x3E, 0x30,  // <BlueX>0
                    /* 0430 */  0x78, 0x32, 0x39, 0x3C, 0x2F, 0x42, 0x6C, 0x75,  // x29</Blu
                    /* 0438 */  0x65, 0x58, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // eX>.    
                    /* 0440 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75,  //     <Blu
                    /* 0448 */  0x65, 0x59, 0x3E, 0x30, 0x78, 0x31, 0x66, 0x3C,  // eY>0x1f<
                    /* 0450 */  0x2F, 0x42, 0x6C, 0x75, 0x65, 0x59, 0x3E, 0x0A,  // /BlueY>.
                    /* 0458 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0460 */  0x3C, 0x57, 0x68, 0x69, 0x74, 0x65, 0x58, 0x3E,  // <WhiteX>
                    /* 0468 */  0x30, 0x78, 0x35, 0x30, 0x3C, 0x2F, 0x57, 0x68,  // 0x50</Wh
                    /* 0470 */  0x69, 0x74, 0x65, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // iteX>.  
                    /* 0478 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x57,  //       <W
                    /* 0480 */  0x68, 0x69, 0x74, 0x65, 0x59, 0x3E, 0x30, 0x78,  // hiteY>0x
                    /* 0488 */  0x35, 0x34, 0x3C, 0x2F, 0x57, 0x68, 0x69, 0x74,  // 54</Whit
                    /* 0490 */  0x65, 0x59, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // eY>.    
                    /* 0498 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x45, 0x73, 0x74,  //     <Est
                    /* 04A0 */  0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65, 0x64,  // ablished
                    /* 04A8 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x49,  // TimingsI
                    /* 04B0 */  0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F, 0x45, 0x73,  // >0x0</Es
                    /* 04B8 */  0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65,  // tablishe
                    /* 04C0 */  0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73,  // dTimings
                    /* 04C8 */  0x49, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // I>.     
                    /* 04D0 */  0x20, 0x20, 0x20, 0x3C, 0x45, 0x73, 0x74, 0x61,  //    <Esta
                    /* 04D8 */  0x62, 0x6C, 0x69, 0x73, 0x68, 0x65, 0x64, 0x54,  // blishedT
                    /* 04E0 */  0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x49, 0x49,  // imingsII
                    /* 04E8 */  0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F, 0x45, 0x73,  // >0x0</Es
                    /* 04F0 */  0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65,  // tablishe
                    /* 04F8 */  0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73,  // dTimings
                    /* 0500 */  0x49, 0x49, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // II>.    
                    /* 0508 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x4D, 0x61, 0x6E,  //     <Man
                    /* 0510 */  0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65,  // ufacture
                    /* 0518 */  0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x3E,  // sTiming>
                    /* 0520 */  0x30, 0x78, 0x30, 0x3C, 0x2F, 0x4D, 0x61, 0x6E,  // 0x0</Man
                    /* 0528 */  0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65,  // ufacture
                    /* 0530 */  0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x3E,  // sTiming>
                    /* 0538 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0540 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 0548 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 0550 */  0x73, 0x31, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s1/>.   
                    /* 0558 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 0560 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 0568 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x32, 0x2F, 0x3E,  // mings2/>
                    /* 0570 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0578 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 0580 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 0588 */  0x73, 0x33, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s3/>.   
                    /* 0590 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 0598 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 05A0 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x34, 0x2F, 0x3E,  // mings4/>
                    /* 05A8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 05B0 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 05B8 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 05C0 */  0x73, 0x35, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s5/>.   
                    /* 05C8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 05D0 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 05D8 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x36, 0x2F, 0x3E,  // mings6/>
                    /* 05E0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 05E8 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 05F0 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 05F8 */  0x73, 0x37, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s7/>.   
                    /* 0600 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x69,  //      <Si
                    /* 0608 */  0x67, 0x6E, 0x61, 0x6C, 0x54, 0x69, 0x6D, 0x69,  // gnalTimi
                    /* 0610 */  0x6E, 0x67, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  // ngInterf
                    /* 0618 */  0x61, 0x63, 0x65, 0x2F, 0x3E, 0x0A, 0x20, 0x20,  // ace/>.  
                    /* 0620 */  0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  //   </Grou
                    /* 0628 */  0x70, 0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20,  // p>..    
                    /* 0630 */  0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69,  // <Group i
                    /* 0638 */  0x64, 0x3D, 0x27, 0x41, 0x63, 0x74, 0x69, 0x76,  // d='Activ
                    /* 0640 */  0x65, 0x20, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // e Timing
                    /* 0648 */  0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // '>.     
                    /* 0650 */  0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  //    <Hori
                    /* 0658 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x41, 0x63,  // zontalAc
                    /* 0660 */  0x74, 0x69, 0x76, 0x65, 0x20, 0x75, 0x6E, 0x69,  // tive uni
                    /* 0668 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 0670 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 0678 */  0x35, 0x34, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72,  // 540</Hor
                    /* 0680 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x41,  // izontalA
                    /* 0688 */  0x63, 0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A, 0x20,  // ctive>. 
                    /* 0690 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0698 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 06A0 */  0x61, 0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74, 0x50,  // alFrontP
                    /* 06A8 */  0x6F, 0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69,  // orch uni
                    /* 06B0 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 06B8 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 06C0 */  0x36, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // 60</Hori
                    /* 06C8 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x46, 0x72,  // zontalFr
                    /* 06D0 */  0x6F, 0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ontPorch
                    /* 06D8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 06E0 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 06E8 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x42, 0x61, 0x63,  // ontalBac
                    /* 06F0 */  0x6B, 0x50, 0x6F, 0x72, 0x63, 0x68, 0x20, 0x75,  // kPorch u
                    /* 06F8 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F,  // nits='Do
                    /* 0700 */  0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73,  // t Clocks
                    /* 0708 */  0x27, 0x3E, 0x36, 0x36, 0x3C, 0x2F, 0x48, 0x6F,  // '>66</Ho
                    /* 0710 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 0718 */  0x42, 0x61, 0x63, 0x6B, 0x50, 0x6F, 0x72, 0x63,  // BackPorc
                    /* 0720 */  0x68, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // h>.     
                    /* 0728 */  0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  //    <Hori
                    /* 0730 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79,  // zontalSy
                    /* 0738 */  0x6E, 0x63, 0x50, 0x75, 0x6C, 0x73, 0x65, 0x20,  // ncPulse 
                    /* 0740 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0748 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 0750 */  0x73, 0x27, 0x3E, 0x36, 0x36, 0x3C, 0x2F, 0x48,  // s'>66</H
                    /* 0758 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0760 */  0x6C, 0x53, 0x79, 0x6E, 0x63, 0x50, 0x75, 0x6C,  // lSyncPul
                    /* 0768 */  0x73, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // se>.    
                    /* 0770 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72,  //     <Hor
                    /* 0778 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53,  // izontalS
                    /* 0780 */  0x79, 0x6E, 0x63, 0x53, 0x6B, 0x65, 0x77, 0x20,  // yncSkew 
                    /* 0788 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0790 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 0798 */  0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F,  // s'>0</Ho
                    /* 07A0 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 07A8 */  0x53, 0x79, 0x6E, 0x63, 0x53, 0x6B, 0x65, 0x77,  // SyncSkew
                    /* 07B0 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 07B8 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 07C0 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x4C, 0x65, 0x66,  // ontalLef
                    /* 07C8 */  0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x20,  // tBorder 
                    /* 07D0 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 07D8 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 07E0 */  0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F,  // s'>0</Ho
                    /* 07E8 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 07F0 */  0x4C, 0x65, 0x66, 0x74, 0x42, 0x6F, 0x72, 0x64,  // LeftBord
                    /* 07F8 */  0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // er>.    
                    /* 0800 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72,  //     <Hor
                    /* 0808 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x52,  // izontalR
                    /* 0810 */  0x69, 0x67, 0x68, 0x74, 0x42, 0x6F, 0x72, 0x64,  // ightBord
                    /* 0818 */  0x65, 0x72, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // er units
                    /* 0820 */  0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20, 0x43, 0x6C,  // ='Dot Cl
                    /* 0828 */  0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E, 0x30, 0x3C,  // ocks'>0<
                    /* 0830 */  0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // /Horizon
                    /* 0838 */  0x74, 0x61, 0x6C, 0x52, 0x69, 0x67, 0x68, 0x74,  // talRight
                    /* 0840 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A,  // Border>.
                    /* 0848 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0850 */  0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // <Vertica
                    /* 0858 */  0x6C, 0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x20,  // lActive 
                    /* 0860 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0868 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 0870 */  0x73, 0x27, 0x3E, 0x39, 0x36, 0x30, 0x3C, 0x2F,  // s'>960</
                    /* 0878 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0880 */  0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A,  // Active>.
                    /* 0888 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0890 */  0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // <Vertica
                    /* 0898 */  0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74, 0x50, 0x6F,  // lFrontPo
                    /* 08A0 */  0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69, 0x74,  // rch unit
                    /* 08A8 */  0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73,  // s='Lines
                    /* 08B0 */  0x27, 0x3E, 0x35, 0x3C, 0x2F, 0x56, 0x65, 0x72,  // '>5</Ver
                    /* 08B8 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x46, 0x72, 0x6F,  // ticalFro
                    /* 08C0 */  0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63, 0x68, 0x3E,  // ntPorch>
                    /* 08C8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 08D0 */  0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  //  <Vertic
                    /* 08D8 */  0x61, 0x6C, 0x42, 0x61, 0x63, 0x6B, 0x50, 0x6F,  // alBackPo
                    /* 08E0 */  0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69, 0x74,  // rch unit
                    /* 08E8 */  0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73,  // s='Lines
                    /* 08F0 */  0x27, 0x3E, 0x36, 0x3C, 0x2F, 0x56, 0x65, 0x72,  // '>6</Ver
                    /* 08F8 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x42, 0x61, 0x63,  // ticalBac
                    /* 0900 */  0x6B, 0x50, 0x6F, 0x72, 0x63, 0x68, 0x3E, 0x0A,  // kPorch>.
                    /* 0908 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0910 */  0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // <Vertica
                    /* 0918 */  0x6C, 0x53, 0x79, 0x6E, 0x63, 0x50, 0x75, 0x6C,  // lSyncPul
                    /* 0920 */  0x73, 0x65, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // se units
                    /* 0928 */  0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27,  // ='Lines'
                    /* 0930 */  0x3E, 0x35, 0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74,  // >5</Vert
                    /* 0938 */  0x69, 0x63, 0x61, 0x6C, 0x53, 0x79, 0x6E, 0x63,  // icalSync
                    /* 0940 */  0x50, 0x75, 0x6C, 0x73, 0x65, 0x3E, 0x0A, 0x20,  // Pulse>. 
                    /* 0948 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0950 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0958 */  0x54, 0x6F, 0x70, 0x42, 0x6F, 0x72, 0x64, 0x65,  // TopBorde
                    /* 0960 */  0x72, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // r units=
                    /* 0968 */  0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E,  // 'Lines'>
                    /* 0970 */  0x30, 0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69,  // 0</Verti
                    /* 0978 */  0x63, 0x61, 0x6C, 0x54, 0x6F, 0x70, 0x42, 0x6F,  // calTopBo
                    /* 0980 */  0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20,  // rder>.  
                    /* 0988 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56,  //       <V
                    /* 0990 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x42,  // erticalB
                    /* 0998 */  0x6F, 0x74, 0x74, 0x6F, 0x6D, 0x42, 0x6F, 0x72,  // ottomBor
                    /* 09A0 */  0x64, 0x65, 0x72, 0x20, 0x75, 0x6E, 0x69, 0x74,  // der unit
                    /* 09A8 */  0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73,  // s='Lines
                    /* 09B0 */  0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x56, 0x65, 0x72,  // '>0</Ver
                    /* 09B8 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x42, 0x6F, 0x74,  // ticalBot
                    /* 09C0 */  0x74, 0x6F, 0x6D, 0x42, 0x6F, 0x72, 0x64, 0x65,  // tomBorde
                    /* 09C8 */  0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // r>.     
                    /* 09D0 */  0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x76, 0x65,  //    <Inve
                    /* 09D8 */  0x72, 0x74, 0x44, 0x61, 0x74, 0x61, 0x50, 0x6F,  // rtDataPo
                    /* 09E0 */  0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x46,  // larity>F
                    /* 09E8 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x49, 0x6E,  // alse</In
                    /* 09F0 */  0x76, 0x65, 0x72, 0x74, 0x44, 0x61, 0x74, 0x61,  // vertData
                    /* 09F8 */  0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74, 0x79,  // Polarity
                    /* 0A00 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0A08 */  0x20, 0x20, 0x3C, 0x49, 0x6E, 0x76, 0x65, 0x72,  //   <Inver
                    /* 0A10 */  0x74, 0x56, 0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F,  // tVsyncPo
                    /* 0A18 */  0x6C, 0x61, 0x69, 0x72, 0x74, 0x79, 0x3E, 0x46,  // lairty>F
                    /* 0A20 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x49, 0x6E,  // alse</In
                    /* 0A28 */  0x76, 0x65, 0x72, 0x74, 0x56, 0x73, 0x79, 0x6E,  // vertVsyn
                    /* 0A30 */  0x63, 0x50, 0x6F, 0x6C, 0x61, 0x69, 0x72, 0x74,  // cPolairt
                    /* 0A38 */  0x79, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // y>.     
                    /* 0A40 */  0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x76, 0x65,  //    <Inve
                    /* 0A48 */  0x72, 0x74, 0x48, 0x73, 0x79, 0x6E, 0x63, 0x50,  // rtHsyncP
                    /* 0A50 */  0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E,  // olarity>
                    /* 0A58 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x49,  // False</I
                    /* 0A60 */  0x6E, 0x76, 0x65, 0x72, 0x74, 0x48, 0x73, 0x79,  // nvertHsy
                    /* 0A68 */  0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69,  // ncPolari
                    /* 0A70 */  0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // ty>.    
                    /* 0A78 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x42, 0x6F, 0x72,  //     <Bor
                    /* 0A80 */  0x64, 0x65, 0x72, 0x43, 0x6F, 0x6C, 0x6F, 0x72,  // derColor
                    /* 0A88 */  0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F, 0x42, 0x6F,  // >0x0</Bo
                    /* 0A90 */  0x72, 0x64, 0x65, 0x72, 0x43, 0x6F, 0x6C, 0x6F,  // rderColo
                    /* 0A98 */  0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // r>.    <
                    /* 0AA0 */  0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A,  // /Group>.
                    /* 0AA8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72,  // .    <Gr
                    /* 0AB0 */  0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27,  // oup id='
                    /* 0AB8 */  0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x20,  // Display 
                    /* 0AC0 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 0AC8 */  0x65, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // e'>.    
                    /* 0AD0 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x74,  //     <Int
                    /* 0AD8 */  0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x54, 0x79,  // erfaceTy
                    /* 0AE0 */  0x70, 0x65, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // pe units
                    /* 0AE8 */  0x3D, 0x27, 0x51, 0x44, 0x49, 0x5F, 0x44, 0x69,  // ='QDI_Di
                    /* 0AF0 */  0x73, 0x70, 0x6C, 0x61, 0x79, 0x43, 0x6F, 0x6E,  // splayCon
                    /* 0AF8 */  0x6E, 0x65, 0x63, 0x74, 0x54, 0x79, 0x70, 0x65,  // nectType
                    /* 0B00 */  0x27, 0x3E, 0x38, 0x3C, 0x2F, 0x49, 0x6E, 0x74,  // '>8</Int
                    /* 0B08 */  0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x54, 0x79,  // erfaceTy
                    /* 0B10 */  0x70, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // pe>.    
                    /* 0B18 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x74,  //     <Int
                    /* 0B20 */  0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x43, 0x6F,  // erfaceCo
                    /* 0B28 */  0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61,  // lorForma
                    /* 0B30 */  0x74, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // t units=
                    /* 0B38 */  0x27, 0x51, 0x44, 0x49, 0x5F, 0x50, 0x69, 0x78,  // 'QDI_Pix
                    /* 0B40 */  0x65, 0x6C, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74,  // elFormat
                    /* 0B48 */  0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x33, 0x3C,  // Type'>3<
                    /* 0B50 */  0x2F, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61,  // /Interfa
                    /* 0B58 */  0x63, 0x65, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46,  // ceColorF
                    /* 0B60 */  0x6F, 0x72, 0x6D, 0x61, 0x74, 0x3E, 0x0A, 0x20,  // ormat>. 
                    /* 0B68 */  0x20, 0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F,  //    </Gro
                    /* 0B70 */  0x75, 0x70, 0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20,  // up>..   
                    /* 0B78 */  0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20,  //  <Group 
                    /* 0B80 */  0x69, 0x64, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x20,  // id='DSI 
                    /* 0B88 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 0B90 */  0x65, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // e'>.    
                    /* 0B98 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0BA0 */  0x43, 0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x49,  // ChannelI
                    /* 0BA8 */  0x64, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // d units=
                    /* 0BB0 */  0x27, 0x44, 0x53, 0x49, 0x5F, 0x43, 0x68, 0x61,  // 'DSI_Cha
                    /* 0BB8 */  0x6E, 0x6E, 0x65, 0x6C, 0x5F, 0x49, 0x44, 0x54,  // nnel_IDT
                    /* 0BC0 */  0x79, 0x70, 0x65, 0x27, 0x3E, 0x31, 0x3C, 0x2F,  // ype'>1</
                    /* 0BC8 */  0x44, 0x53, 0x49, 0x43, 0x68, 0x61, 0x6E, 0x6E,  // DSIChann
                    /* 0BD0 */  0x65, 0x6C, 0x49, 0x64, 0x3E, 0x0A, 0x20, 0x20,  // elId>.  
                    /* 0BD8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0BE0 */  0x53, 0x49, 0x56, 0x69, 0x72, 0x74, 0x75, 0x61,  // SIVirtua
                    /* 0BE8 */  0x6C, 0x49, 0x64, 0x20, 0x75, 0x6E, 0x69, 0x74,  // lId unit
                    /* 0BF0 */  0x73, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x5F, 0x44,  // s='DSI_D
                    /* 0BF8 */  0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x5F, 0x56,  // isplay_V
                    /* 0C00 */  0x43, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x30,  // CType'>0
                    /* 0C08 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x56, 0x69, 0x72,  // </DSIVir
                    /* 0C10 */  0x74, 0x75, 0x61, 0x6C, 0x49, 0x64, 0x3E, 0x0A,  // tualId>.
                    /* 0C18 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0C20 */  0x3C, 0x44, 0x53, 0x49, 0x43, 0x6F, 0x6C, 0x6F,  // <DSIColo
                    /* 0C28 */  0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x20,  // rFormat 
                    /* 0C30 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0C38 */  0x53, 0x49, 0x5F, 0x43, 0x6F, 0x6C, 0x6F, 0x72,  // SI_Color
                    /* 0C40 */  0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x54, 0x79,  // FormatTy
                    /* 0C48 */  0x70, 0x65, 0x27, 0x3E, 0x33, 0x36, 0x3C, 0x2F,  // pe'>36</
                    /* 0C50 */  0x44, 0x53, 0x49, 0x43, 0x6F, 0x6C, 0x6F, 0x72,  // DSIColor
                    /* 0C58 */  0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x3E, 0x0A,  // Format>.
                    /* 0C60 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0C68 */  0x3C, 0x44, 0x53, 0x49, 0x54, 0x72, 0x61, 0x66,  // <DSITraf
                    /* 0C70 */  0x66, 0x69, 0x63, 0x4D, 0x6F, 0x64, 0x65, 0x20,  // ficMode 
                    /* 0C78 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0C80 */  0x53, 0x49, 0x5F, 0x54, 0x72, 0x61, 0x66, 0x66,  // SI_Traff
                    /* 0C88 */  0x69, 0x63, 0x4D, 0x6F, 0x64, 0x65, 0x54, 0x79,  // icModeTy
                    /* 0C90 */  0x70, 0x65, 0x27, 0x3E, 0x31, 0x3C, 0x2F, 0x44,  // pe'>1</D
                    /* 0C98 */  0x53, 0x49, 0x54, 0x72, 0x61, 0x66, 0x66, 0x69,  // SITraffi
                    /* 0CA0 */  0x63, 0x4D, 0x6F, 0x64, 0x65, 0x3E, 0x0A, 0x20,  // cMode>. 
                    /* 0CA8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0CB0 */  0x44, 0x53, 0x49, 0x4C, 0x61, 0x6E, 0x65, 0x73,  // DSILanes
                    /* 0CB8 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0CC0 */  0x69, 0x6E, 0x74, 0x65, 0x67, 0x65, 0x72, 0x27,  // integer'
                    /* 0CC8 */  0x3E, 0x32, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C,  // >2</DSIL
                    /* 0CD0 */  0x61, 0x6E, 0x65, 0x73, 0x3E, 0x0A, 0x20, 0x20,  // anes>.  
                    /* 0CD8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0CE0 */  0x53, 0x49, 0x48, 0x73, 0x61, 0x48, 0x73, 0x65,  // SIHsaHse
                    /* 0CE8 */  0x41, 0x66, 0x74, 0x65, 0x72, 0x56, 0x73, 0x56,  // AfterVsV
                    /* 0CF0 */  0x65, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // e units=
                    /* 0CF8 */  0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46,  // 'Bool'>F
                    /* 0D00 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // alse</DS
                    /* 0D08 */  0x49, 0x48, 0x73, 0x61, 0x48, 0x73, 0x65, 0x41,  // IHsaHseA
                    /* 0D10 */  0x66, 0x74, 0x65, 0x72, 0x56, 0x73, 0x56, 0x65,  // fterVsVe
                    /* 0D18 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0D20 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F,  //   <DSILo
                    /* 0D28 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0D30 */  0x64, 0x65, 0x49, 0x6E, 0x48, 0x46, 0x50, 0x20,  // deInHFP 
                    /* 0D38 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42,  // units='B
                    /* 0D40 */  0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46, 0x61, 0x6C,  // ool'>Fal
                    /* 0D48 */  0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C,  // se</DSIL
                    /* 0D50 */  0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D,  // owPowerM
                    /* 0D58 */  0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x46, 0x50,  // odeInHFP
                    /* 0D60 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0D68 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F,  //   <DSILo
                    /* 0D70 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0D78 */  0x64, 0x65, 0x49, 0x6E, 0x48, 0x42, 0x50, 0x20,  // deInHBP 
                    /* 0D80 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42,  // units='B
                    /* 0D88 */  0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46, 0x61, 0x6C,  // ool'>Fal
                    /* 0D90 */  0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C,  // se</DSIL
                    /* 0D98 */  0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D,  // owPowerM
                    /* 0DA0 */  0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x42, 0x50,  // odeInHBP
                    /* 0DA8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0DB0 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F,  //   <DSILo
                    /* 0DB8 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0DC0 */  0x64, 0x65, 0x49, 0x6E, 0x48, 0x53, 0x41, 0x20,  // deInHSA 
                    /* 0DC8 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42,  // units='B
                    /* 0DD0 */  0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46, 0x61, 0x6C,  // ool'>Fal
                    /* 0DD8 */  0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C,  // se</DSIL
                    /* 0DE0 */  0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D,  // owPowerM
                    /* 0DE8 */  0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x53, 0x41,  // odeInHSA
                    /* 0DF0 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0DF8 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F,  //   <DSILo
                    /* 0E00 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0E08 */  0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50,  // deInBLLP
                    /* 0E10 */  0x45, 0x4F, 0x46, 0x20, 0x75, 0x6E, 0x69, 0x74,  // EOF unit
                    /* 0E18 */  0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27,  // s='Bool'
                    /* 0E20 */  0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44,  // >True</D
                    /* 0E28 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0E30 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0E38 */  0x42, 0x4C, 0x4C, 0x50, 0x45, 0x4F, 0x46, 0x3E,  // BLLPEOF>
                    /* 0E40 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0E48 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77,  //  <DSILow
                    /* 0E50 */  0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64,  // PowerMod
                    /* 0E58 */  0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50, 0x20,  // eInBLLP 
                    /* 0E60 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42,  // units='B
                    /* 0E68 */  0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x54, 0x72, 0x75,  // ool'>Tru
                    /* 0E70 */  0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F,  // e</DSILo
                    /* 0E78 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0E80 */  0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50,  // deInBLLP
                    /* 0E88 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0E90 */  0x20, 0x20, 0x3C, 0x21, 0x2D, 0x2D, 0x20, 0x3C,  //   <!-- <
                    /* 0E98 */  0x44, 0x53, 0x49, 0x52, 0x65, 0x66, 0x72, 0x65,  // DSIRefre
                    /* 0EA0 */  0x73, 0x68, 0x52, 0x61, 0x74, 0x65, 0x20, 0x75,  // shRate u
                    /* 0EA8 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x69, 0x6E,  // nits='in
                    /* 0EB0 */  0x74, 0x65, 0x67, 0x65, 0x72, 0x20, 0x51, 0x31,  // teger Q1
                    /* 0EB8 */  0x36, 0x2E, 0x31, 0x36, 0x27, 0x3E, 0x30, 0x78,  // 6.16'>0x
                    /* 0EC0 */  0x33, 0x43, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x2F,  // 3C0000</
                    /* 0EC8 */  0x44, 0x53, 0x49, 0x52, 0x65, 0x66, 0x72, 0x65,  // DSIRefre
                    /* 0ED0 */  0x73, 0x68, 0x52, 0x61, 0x74, 0x65, 0x3E, 0x20,  // shRate> 
                    /* 0ED8 */  0x2D, 0x2D, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // -->.    
                    /* 0EE0 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0EE8 */  0x50, 0x61, 0x63, 0x6B, 0x65, 0x74, 0x54, 0x72,  // PacketTr
                    /* 0EF0 */  0x61, 0x6E, 0x73, 0x66, 0x65, 0x72, 0x48, 0x53,  // ansferHS
                    /* 0EF8 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0F00 */  0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46, 0x61,  // Bool'>Fa
                    /* 0F08 */  0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // lse</DSI
                    /* 0F10 */  0x50, 0x61, 0x63, 0x6B, 0x65, 0x74, 0x54, 0x72,  // PacketTr
                    /* 0F18 */  0x61, 0x6E, 0x73, 0x66, 0x65, 0x72, 0x48, 0x53,  // ansferHS
                    /* 0F20 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0F28 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x48, 0x6F,  //   <DSIHo
                    /* 0F30 */  0x73, 0x74, 0x4C, 0x61, 0x6E, 0x65, 0x4D, 0x61,  // stLaneMa
                    /* 0F38 */  0x70, 0x70, 0x69, 0x6E, 0x67, 0x20, 0x75, 0x6E,  // pping un
                    /* 0F40 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x69, 0x6E, 0x74,  // its='int
                    /* 0F48 */  0x65, 0x67, 0x65, 0x72, 0x27, 0x3E, 0x30, 0x3C,  // eger'>0<
                    /* 0F50 */  0x2F, 0x44, 0x53, 0x49, 0x48, 0x6F, 0x73, 0x74,  // /DSIHost
                    /* 0F58 */  0x4C, 0x61, 0x6E, 0x65, 0x4D, 0x61, 0x70, 0x70,  // LaneMapp
                    /* 0F60 */  0x69, 0x6E, 0x67, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ing>.   
                    /* 0F68 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0F70 */  0x49, 0x50, 0x68, 0x79, 0x44, 0x43, 0x44, 0x43,  // IPhyDCDC
                    /* 0F78 */  0x4D, 0x6F, 0x64, 0x65, 0x20, 0x75, 0x6E, 0x69,  // Mode uni
                    /* 0F80 */  0x74, 0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C,  // ts='Bool
                    /* 0F88 */  0x27, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C,  // '>False<
                    /* 0F90 */  0x2F, 0x44, 0x53, 0x49, 0x50, 0x68, 0x79, 0x44,  // /DSIPhyD
                    /* 0F98 */  0x43, 0x44, 0x43, 0x4D, 0x6F, 0x64, 0x65, 0x3E,  // CDCMode>
                    /* 0FA0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0FA8 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x50, 0x31,  //  <DSILP1
                    /* 0FB0 */  0x31, 0x41, 0x74, 0x49, 0x6E, 0x69, 0x74, 0x20,  // 1AtInit 
                    /* 0FB8 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42,  // units='B
                    /* 0FC0 */  0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x54, 0x72, 0x75,  // ool'>Tru
                    /* 0FC8 */  0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C, 0x50,  // e</DSILP
                    /* 0FD0 */  0x31, 0x31, 0x41, 0x74, 0x49, 0x6E, 0x69, 0x74,  // 11AtInit
                    /* 0FD8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0FE0 */  0x20, 0x20, 0x3C, 0x21, 0x2D, 0x2D, 0x20, 0x3C,  //   <!-- <
                    /* 0FE8 */  0x44, 0x53, 0x49, 0x44, 0x69, 0x73, 0x61, 0x62,  // DSIDisab
                    /* 0FF0 */  0x6C, 0x65, 0x45, 0x6F, 0x54, 0x41, 0x66, 0x74,  // leEoTAft
                    /* 0FF8 */  0x65, 0x72, 0x48, 0x53, 0x58, 0x66, 0x65, 0x72,  // erHSXfer
                    /* 1000 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 1008 */  0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x54, 0x72,  // Bool'>Tr
                    /* 1010 */  0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x44,  // ue</DSID
                    /* 1018 */  0x69, 0x73, 0x61, 0x62, 0x6C, 0x65, 0x45, 0x6F,  // isableEo
                    /* 1020 */  0x54, 0x41, 0x66, 0x74, 0x65, 0x72, 0x48, 0x53,  // TAfterHS
                    /* 1028 */  0x58, 0x66, 0x65, 0x72, 0x3E, 0x20, 0x2D, 0x2D,  // Xfer> --
                    /* 1030 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 1038 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x42, 0x69,  //   <DSIBi
                    /* 1040 */  0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46, 0x72,  // tClockFr
                    /* 1048 */  0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79, 0x3E,  // equency>
                    /* 1050 */  0x35, 0x31, 0x34, 0x33, 0x39, 0x31, 0x30, 0x34,  // 51439104
                    /* 1058 */  0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x42, 0x69,  // 0</DSIBi
                    /* 1060 */  0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46, 0x72,  // tClockFr
                    /* 1068 */  0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79, 0x3E,  // equency>
                    /* 1070 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x2F, 0x47,  // .    </G
                    /* 1078 */  0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C, 0x2F,  // roup>.</
                    /* 1080 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x00         // Group>.
                })
                Name (PCF4, Buffer (0x1089)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x20,  // f-8'?>. 
                    /* 0028 */  0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75,  //    <Grou
                    /* 0030 */  0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x4D, 0x61,  // p id='Ma
                    /* 0038 */  0x69, 0x6E, 0x20, 0x50, 0x61, 0x6E, 0x65, 0x6C,  // in Panel
                    /* 0040 */  0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // '>.    <
                    /* 0048 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D,  // PanelNam
                    /* 0050 */  0x65, 0x3E, 0x54, 0x44, 0x4F, 0x2D, 0x58, 0x58,  // e>TDO-XX
                    /* 0058 */  0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,  // XXXXXXXX
                    /* 0060 */  0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,  // XXXXXXXX
                    /* 0068 */  0x58, 0x58, 0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65,  // XX</Pane
                    /* 0070 */  0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x0A, 0x20,  // lName>. 
                    /* 0078 */  0x20, 0x20, 0x20, 0x3C, 0x50, 0x61, 0x6E, 0x65,  //    <Pane
                    /* 0080 */  0x6C, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70,  // lDescrip
                    /* 0088 */  0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x56, 0x69, 0x64,  // tion>Vid
                    /* 0090 */  0x65, 0x6F, 0x20, 0x6D, 0x6F, 0x64, 0x65, 0x20,  // eo mode 
                    /* 0098 */  0x35, 0x34, 0x30, 0x71, 0x48, 0x44, 0x20, 0x54,  // 540qHD T
                    /* 00A0 */  0x72, 0x75, 0x6C, 0x79, 0x20, 0x44, 0x53, 0x49,  // ruly DSI
                    /* 00A8 */  0x20, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x20, 0x28,  //  Panel (
                    /* 00B0 */  0x35, 0x34, 0x30, 0x78, 0x39, 0x36, 0x30, 0x20,  // 540x960 
                    /* 00B8 */  0x32, 0x34, 0x62, 0x70, 0x70, 0x29, 0x3C, 0x2F,  // 24bpp)</
                    /* 00C0 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x44, 0x65, 0x73,  // PanelDes
                    /* 00C8 */  0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E,  // cription
                    /* 00D0 */  0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // >..    <
                    /* 00D8 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64,  // Group id
                    /* 00E0 */  0x3D, 0x27, 0x45, 0x44, 0x49, 0x44, 0x20, 0x43,  // ='EDID C
                    /* 00E8 */  0x6F, 0x6E, 0x66, 0x69, 0x67, 0x75, 0x72, 0x61,  // onfigura
                    /* 00F0 */  0x74, 0x69, 0x6F, 0x6E, 0x27, 0x3E, 0x0A, 0x20,  // tion'>. 
                    /* 00F8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0100 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 0108 */  0x75, 0x72, 0x65, 0x49, 0x44, 0x3E, 0x30, 0x78,  // ureID>0x
                    /* 0110 */  0x41, 0x46, 0x30, 0x44, 0x3C, 0x2F, 0x4D, 0x61,  // AF0D</Ma
                    /* 0118 */  0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72,  // nufactur
                    /* 0120 */  0x65, 0x49, 0x44, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // eID>.   
                    /* 0128 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x50, 0x72,  //      <Pr
                    /* 0130 */  0x6F, 0x64, 0x75, 0x63, 0x74, 0x43, 0x6F, 0x64,  // oductCod
                    /* 0138 */  0x65, 0x3E, 0x30, 0x78, 0x30, 0x30, 0x31, 0x31,  // e>0x0011
                    /* 0140 */  0x3C, 0x2F, 0x50, 0x72, 0x6F, 0x64, 0x75, 0x63,  // </Produc
                    /* 0148 */  0x74, 0x43, 0x6F, 0x64, 0x65, 0x3E, 0x0A, 0x20,  // tCode>. 
                    /* 0150 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0158 */  0x53, 0x65, 0x72, 0x69, 0x61, 0x6C, 0x4E, 0x75,  // SerialNu
                    /* 0160 */  0x6D, 0x62, 0x65, 0x72, 0x3E, 0x30, 0x78, 0x30,  // mber>0x0
                    /* 0168 */  0x30, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x2F, 0x53,  // 00000</S
                    /* 0170 */  0x65, 0x72, 0x69, 0x61, 0x6C, 0x4E, 0x75, 0x6D,  // erialNum
                    /* 0178 */  0x62, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ber>.   
                    /* 0180 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x57, 0x65,  //      <We
                    /* 0188 */  0x65, 0x6B, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // ekofManu
                    /* 0190 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 0198 */  0x30, 0x78, 0x30, 0x39, 0x3C, 0x2F, 0x57, 0x65,  // 0x09</We
                    /* 01A0 */  0x65, 0x6B, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // ekofManu
                    /* 01A8 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 01B0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 01B8 */  0x20, 0x3C, 0x59, 0x65, 0x61, 0x72, 0x6F, 0x66,  //  <Yearof
                    /* 01C0 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 01C8 */  0x75, 0x72, 0x65, 0x3E, 0x30, 0x78, 0x31, 0x33,  // ure>0x13
                    /* 01D0 */  0x3C, 0x2F, 0x59, 0x65, 0x61, 0x72, 0x6F, 0x66,  // </Yearof
                    /* 01D8 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 01E0 */  0x75, 0x72, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ure>.   
                    /* 01E8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x45, 0x44,  //      <ED
                    /* 01F0 */  0x49, 0x44, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F,  // IDVersio
                    /* 01F8 */  0x6E, 0x3E, 0x31, 0x3C, 0x2F, 0x45, 0x44, 0x49,  // n>1</EDI
                    /* 0200 */  0x44, 0x56, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E,  // DVersion
                    /* 0208 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0210 */  0x20, 0x20, 0x3C, 0x45, 0x44, 0x49, 0x44, 0x52,  //   <EDIDR
                    /* 0218 */  0x65, 0x76, 0x69, 0x73, 0x69, 0x6F, 0x6E, 0x3E,  // evision>
                    /* 0220 */  0x33, 0x3C, 0x2F, 0x45, 0x44, 0x49, 0x44, 0x52,  // 3</EDIDR
                    /* 0228 */  0x65, 0x76, 0x69, 0x73, 0x69, 0x6F, 0x6E, 0x3E,  // evision>
                    /* 0230 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0238 */  0x20, 0x3C, 0x56, 0x69, 0x64, 0x65, 0x6F, 0x49,  //  <VideoI
                    /* 0240 */  0x6E, 0x70, 0x75, 0x74, 0x44, 0x65, 0x66, 0x69,  // nputDefi
                    /* 0248 */  0x6E, 0x69, 0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x30,  // nition>0
                    /* 0250 */  0x78, 0x38, 0x30, 0x3C, 0x2F, 0x56, 0x69, 0x64,  // x80</Vid
                    /* 0258 */  0x65, 0x6F, 0x49, 0x6E, 0x70, 0x75, 0x74, 0x44,  // eoInputD
                    /* 0260 */  0x65, 0x66, 0x69, 0x6E, 0x69, 0x74, 0x69, 0x6F,  // efinitio
                    /* 0268 */  0x6E, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // n>.     
                    /* 0270 */  0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  //    <Hori
                    /* 0278 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x63,  // zontalSc
                    /* 0280 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 0288 */  0x3E, 0x30, 0x78, 0x30, 0x35, 0x3C, 0x2F, 0x48,  // >0x05</H
                    /* 0290 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0298 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 02A0 */  0x69, 0x7A, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ize>.   
                    /* 02A8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65,  //      <Ve
                    /* 02B0 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x63,  // rticalSc
                    /* 02B8 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 02C0 */  0x3E, 0x30, 0x78, 0x30, 0x41, 0x3C, 0x2F, 0x56,  // >0x0A</V
                    /* 02C8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53,  // erticalS
                    /* 02D0 */  0x63, 0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A,  // creenSiz
                    /* 02D8 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // e>.     
                    /* 02E0 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x69, 0x73, 0x70,  //    <Disp
                    /* 02E8 */  0x6C, 0x61, 0x79, 0x54, 0x72, 0x61, 0x6E, 0x73,  // layTrans
                    /* 02F0 */  0x66, 0x65, 0x72, 0x43, 0x68, 0x61, 0x72, 0x61,  // ferChara
                    /* 02F8 */  0x63, 0x74, 0x65, 0x72, 0x69, 0x73, 0x74, 0x69,  // cteristi
                    /* 0300 */  0x63, 0x73, 0x3E, 0x30, 0x78, 0x37, 0x38, 0x3C,  // cs>0x78<
                    /* 0308 */  0x2F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79,  // /Display
                    /* 0310 */  0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72,  // Transfer
                    /* 0318 */  0x43, 0x68, 0x61, 0x72, 0x61, 0x63, 0x74, 0x65,  // Characte
                    /* 0320 */  0x72, 0x69, 0x73, 0x74, 0x69, 0x63, 0x73, 0x3E,  // ristics>
                    /* 0328 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0330 */  0x20, 0x3C, 0x46, 0x65, 0x61, 0x74, 0x75, 0x72,  //  <Featur
                    /* 0338 */  0x65, 0x53, 0x75, 0x70, 0x70, 0x6F, 0x72, 0x74,  // eSupport
                    /* 0340 */  0x3E, 0x30, 0x78, 0x41, 0x3C, 0x2F, 0x46, 0x65,  // >0xA</Fe
                    /* 0348 */  0x61, 0x74, 0x75, 0x72, 0x65, 0x53, 0x75, 0x70,  // atureSup
                    /* 0350 */  0x70, 0x6F, 0x72, 0x74, 0x3E, 0x0A, 0x20, 0x20,  // port>.  
                    /* 0358 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x52,  //       <R
                    /* 0360 */  0x65, 0x64, 0x2E, 0x47, 0x72, 0x65, 0x65, 0x6E,  // ed.Green
                    /* 0368 */  0x42, 0x69, 0x74, 0x73, 0x3E, 0x30, 0x78, 0x43,  // Bits>0xC
                    /* 0370 */  0x46, 0x3C, 0x2F, 0x52, 0x65, 0x64, 0x2E, 0x47,  // F</Red.G
                    /* 0378 */  0x72, 0x65, 0x65, 0x6E, 0x42, 0x69, 0x74, 0x73,  // reenBits
                    /* 0380 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0388 */  0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75, 0x65, 0x2E,  //   <Blue.
                    /* 0390 */  0x57, 0x68, 0x69, 0x74, 0x65, 0x42, 0x69, 0x74,  // WhiteBit
                    /* 0398 */  0x73, 0x3E, 0x30, 0x78, 0x34, 0x35, 0x3C, 0x2F,  // s>0x45</
                    /* 03A0 */  0x42, 0x6C, 0x75, 0x65, 0x2E, 0x57, 0x68, 0x69,  // Blue.Whi
                    /* 03A8 */  0x74, 0x65, 0x42, 0x69, 0x74, 0x73, 0x3E, 0x0A,  // teBits>.
                    /* 03B0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 03B8 */  0x3C, 0x52, 0x65, 0x64, 0x58, 0x3E, 0x30, 0x78,  // <RedX>0x
                    /* 03C0 */  0x39, 0x30, 0x3C, 0x2F, 0x52, 0x65, 0x64, 0x58,  // 90</RedX
                    /* 03C8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 03D0 */  0x20, 0x20, 0x3C, 0x52, 0x65, 0x64, 0x59, 0x3E,  //   <RedY>
                    /* 03D8 */  0x30, 0x78, 0x35, 0x39, 0x3C, 0x2F, 0x52, 0x65,  // 0x59</Re
                    /* 03E0 */  0x64, 0x59, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // dY>.    
                    /* 03E8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x65,  //     <Gre
                    /* 03F0 */  0x65, 0x6E, 0x58, 0x3E, 0x30, 0x78, 0x35, 0x37,  // enX>0x57
                    /* 03F8 */  0x3C, 0x2F, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x58,  // </GreenX
                    /* 0400 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0408 */  0x20, 0x20, 0x3C, 0x47, 0x72, 0x65, 0x65, 0x6E,  //   <Green
                    /* 0410 */  0x59, 0x3E, 0x30, 0x78, 0x39, 0x35, 0x3C, 0x2F,  // Y>0x95</
                    /* 0418 */  0x47, 0x72, 0x65, 0x65, 0x6E, 0x59, 0x3E, 0x0A,  // GreenY>.
                    /* 0420 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0428 */  0x3C, 0x42, 0x6C, 0x75, 0x65, 0x58, 0x3E, 0x30,  // <BlueX>0
                    /* 0430 */  0x78, 0x32, 0x39, 0x3C, 0x2F, 0x42, 0x6C, 0x75,  // x29</Blu
                    /* 0438 */  0x65, 0x58, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // eX>.    
                    /* 0440 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75,  //     <Blu
                    /* 0448 */  0x65, 0x59, 0x3E, 0x30, 0x78, 0x31, 0x66, 0x3C,  // eY>0x1f<
                    /* 0450 */  0x2F, 0x42, 0x6C, 0x75, 0x65, 0x59, 0x3E, 0x0A,  // /BlueY>.
                    /* 0458 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0460 */  0x3C, 0x57, 0x68, 0x69, 0x74, 0x65, 0x58, 0x3E,  // <WhiteX>
                    /* 0468 */  0x30, 0x78, 0x35, 0x30, 0x3C, 0x2F, 0x57, 0x68,  // 0x50</Wh
                    /* 0470 */  0x69, 0x74, 0x65, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // iteX>.  
                    /* 0478 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x57,  //       <W
                    /* 0480 */  0x68, 0x69, 0x74, 0x65, 0x59, 0x3E, 0x30, 0x78,  // hiteY>0x
                    /* 0488 */  0x35, 0x34, 0x3C, 0x2F, 0x57, 0x68, 0x69, 0x74,  // 54</Whit
                    /* 0490 */  0x65, 0x59, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // eY>.    
                    /* 0498 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x45, 0x73, 0x74,  //     <Est
                    /* 04A0 */  0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65, 0x64,  // ablished
                    /* 04A8 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x49,  // TimingsI
                    /* 04B0 */  0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F, 0x45, 0x73,  // >0x0</Es
                    /* 04B8 */  0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65,  // tablishe
                    /* 04C0 */  0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73,  // dTimings
                    /* 04C8 */  0x49, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // I>.     
                    /* 04D0 */  0x20, 0x20, 0x20, 0x3C, 0x45, 0x73, 0x74, 0x61,  //    <Esta
                    /* 04D8 */  0x62, 0x6C, 0x69, 0x73, 0x68, 0x65, 0x64, 0x54,  // blishedT
                    /* 04E0 */  0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x49, 0x49,  // imingsII
                    /* 04E8 */  0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F, 0x45, 0x73,  // >0x0</Es
                    /* 04F0 */  0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65,  // tablishe
                    /* 04F8 */  0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73,  // dTimings
                    /* 0500 */  0x49, 0x49, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // II>.    
                    /* 0508 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x4D, 0x61, 0x6E,  //     <Man
                    /* 0510 */  0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65,  // ufacture
                    /* 0518 */  0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x3E,  // sTiming>
                    /* 0520 */  0x30, 0x78, 0x30, 0x3C, 0x2F, 0x4D, 0x61, 0x6E,  // 0x0</Man
                    /* 0528 */  0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65,  // ufacture
                    /* 0530 */  0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x3E,  // sTiming>
                    /* 0538 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0540 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 0548 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 0550 */  0x73, 0x31, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s1/>.   
                    /* 0558 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 0560 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 0568 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x32, 0x2F, 0x3E,  // mings2/>
                    /* 0570 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0578 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 0580 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 0588 */  0x73, 0x33, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s3/>.   
                    /* 0590 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 0598 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 05A0 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x34, 0x2F, 0x3E,  // mings4/>
                    /* 05A8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 05B0 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 05B8 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 05C0 */  0x73, 0x35, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s5/>.   
                    /* 05C8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 05D0 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 05D8 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x36, 0x2F, 0x3E,  // mings6/>
                    /* 05E0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 05E8 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 05F0 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 05F8 */  0x73, 0x37, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s7/>.   
                    /* 0600 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x69,  //      <Si
                    /* 0608 */  0x67, 0x6E, 0x61, 0x6C, 0x54, 0x69, 0x6D, 0x69,  // gnalTimi
                    /* 0610 */  0x6E, 0x67, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  // ngInterf
                    /* 0618 */  0x61, 0x63, 0x65, 0x2F, 0x3E, 0x0A, 0x20, 0x20,  // ace/>.  
                    /* 0620 */  0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  //   </Grou
                    /* 0628 */  0x70, 0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20,  // p>..    
                    /* 0630 */  0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69,  // <Group i
                    /* 0638 */  0x64, 0x3D, 0x27, 0x41, 0x63, 0x74, 0x69, 0x76,  // d='Activ
                    /* 0640 */  0x65, 0x20, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // e Timing
                    /* 0648 */  0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // '>.     
                    /* 0650 */  0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  //    <Hori
                    /* 0658 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x41, 0x63,  // zontalAc
                    /* 0660 */  0x74, 0x69, 0x76, 0x65, 0x20, 0x75, 0x6E, 0x69,  // tive uni
                    /* 0668 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 0670 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 0678 */  0x35, 0x34, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72,  // 540</Hor
                    /* 0680 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x41,  // izontalA
                    /* 0688 */  0x63, 0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A, 0x20,  // ctive>. 
                    /* 0690 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0698 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 06A0 */  0x61, 0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74, 0x50,  // alFrontP
                    /* 06A8 */  0x6F, 0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69,  // orch uni
                    /* 06B0 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 06B8 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 06C0 */  0x35, 0x39, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // 59</Hori
                    /* 06C8 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x46, 0x72,  // zontalFr
                    /* 06D0 */  0x6F, 0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ontPorch
                    /* 06D8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 06E0 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 06E8 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x42, 0x61, 0x63,  // ontalBac
                    /* 06F0 */  0x6B, 0x50, 0x6F, 0x72, 0x63, 0x68, 0x20, 0x75,  // kPorch u
                    /* 06F8 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F,  // nits='Do
                    /* 0700 */  0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73,  // t Clocks
                    /* 0708 */  0x27, 0x3E, 0x36, 0x34, 0x3C, 0x2F, 0x48, 0x6F,  // '>64</Ho
                    /* 0710 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 0718 */  0x42, 0x61, 0x63, 0x6B, 0x50, 0x6F, 0x72, 0x63,  // BackPorc
                    /* 0720 */  0x68, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // h>.     
                    /* 0728 */  0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  //    <Hori
                    /* 0730 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79,  // zontalSy
                    /* 0738 */  0x6E, 0x63, 0x50, 0x75, 0x6C, 0x73, 0x65, 0x20,  // ncPulse 
                    /* 0740 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0748 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 0750 */  0x73, 0x27, 0x3E, 0x36, 0x34, 0x3C, 0x2F, 0x48,  // s'>64</H
                    /* 0758 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0760 */  0x6C, 0x53, 0x79, 0x6E, 0x63, 0x50, 0x75, 0x6C,  // lSyncPul
                    /* 0768 */  0x73, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // se>.    
                    /* 0770 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72,  //     <Hor
                    /* 0778 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53,  // izontalS
                    /* 0780 */  0x79, 0x6E, 0x63, 0x53, 0x6B, 0x65, 0x77, 0x20,  // yncSkew 
                    /* 0788 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0790 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 0798 */  0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F,  // s'>0</Ho
                    /* 07A0 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 07A8 */  0x53, 0x79, 0x6E, 0x63, 0x53, 0x6B, 0x65, 0x77,  // SyncSkew
                    /* 07B0 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 07B8 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 07C0 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x4C, 0x65, 0x66,  // ontalLef
                    /* 07C8 */  0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x20,  // tBorder 
                    /* 07D0 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 07D8 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 07E0 */  0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F,  // s'>0</Ho
                    /* 07E8 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 07F0 */  0x4C, 0x65, 0x66, 0x74, 0x42, 0x6F, 0x72, 0x64,  // LeftBord
                    /* 07F8 */  0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // er>.    
                    /* 0800 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72,  //     <Hor
                    /* 0808 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x52,  // izontalR
                    /* 0810 */  0x69, 0x67, 0x68, 0x74, 0x42, 0x6F, 0x72, 0x64,  // ightBord
                    /* 0818 */  0x65, 0x72, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // er units
                    /* 0820 */  0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20, 0x43, 0x6C,  // ='Dot Cl
                    /* 0828 */  0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E, 0x30, 0x3C,  // ocks'>0<
                    /* 0830 */  0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // /Horizon
                    /* 0838 */  0x74, 0x61, 0x6C, 0x52, 0x69, 0x67, 0x68, 0x74,  // talRight
                    /* 0840 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A,  // Border>.
                    /* 0848 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0850 */  0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // <Vertica
                    /* 0858 */  0x6C, 0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x20,  // lActive 
                    /* 0860 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0868 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 0870 */  0x73, 0x27, 0x3E, 0x39, 0x36, 0x30, 0x3C, 0x2F,  // s'>960</
                    /* 0878 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0880 */  0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A,  // Active>.
                    /* 0888 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0890 */  0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // <Vertica
                    /* 0898 */  0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74, 0x50, 0x6F,  // lFrontPo
                    /* 08A0 */  0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69, 0x74,  // rch unit
                    /* 08A8 */  0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73,  // s='Lines
                    /* 08B0 */  0x27, 0x3E, 0x31, 0x30, 0x3C, 0x2F, 0x56, 0x65,  // '>10</Ve
                    /* 08B8 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x46, 0x72,  // rticalFr
                    /* 08C0 */  0x6F, 0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ontPorch
                    /* 08C8 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 08D0 */  0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69,  //   <Verti
                    /* 08D8 */  0x63, 0x61, 0x6C, 0x42, 0x61, 0x63, 0x6B, 0x50,  // calBackP
                    /* 08E0 */  0x6F, 0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69,  // orch uni
                    /* 08E8 */  0x74, 0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65,  // ts='Line
                    /* 08F0 */  0x73, 0x27, 0x3E, 0x31, 0x30, 0x3C, 0x2F, 0x56,  // s'>10</V
                    /* 08F8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x42,  // erticalB
                    /* 0900 */  0x61, 0x63, 0x6B, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ackPorch
                    /* 0908 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0910 */  0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69,  //   <Verti
                    /* 0918 */  0x63, 0x61, 0x6C, 0x53, 0x79, 0x6E, 0x63, 0x50,  // calSyncP
                    /* 0920 */  0x75, 0x6C, 0x73, 0x65, 0x20, 0x75, 0x6E, 0x69,  // ulse uni
                    /* 0928 */  0x74, 0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65,  // ts='Line
                    /* 0930 */  0x73, 0x27, 0x3E, 0x32, 0x3C, 0x2F, 0x56, 0x65,  // s'>2</Ve
                    /* 0938 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x79,  // rticalSy
                    /* 0940 */  0x6E, 0x63, 0x50, 0x75, 0x6C, 0x73, 0x65, 0x3E,  // ncPulse>
                    /* 0948 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0950 */  0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  //  <Vertic
                    /* 0958 */  0x61, 0x6C, 0x54, 0x6F, 0x70, 0x42, 0x6F, 0x72,  // alTopBor
                    /* 0960 */  0x64, 0x65, 0x72, 0x20, 0x75, 0x6E, 0x69, 0x74,  // der unit
                    /* 0968 */  0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E, 0x65, 0x73,  // s='Lines
                    /* 0970 */  0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x56, 0x65, 0x72,  // '>0</Ver
                    /* 0978 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x54, 0x6F, 0x70,  // ticalTop
                    /* 0980 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A,  // Border>.
                    /* 0988 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0990 */  0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // <Vertica
                    /* 0998 */  0x6C, 0x42, 0x6F, 0x74, 0x74, 0x6F, 0x6D, 0x42,  // lBottomB
                    /* 09A0 */  0x6F, 0x72, 0x64, 0x65, 0x72, 0x20, 0x75, 0x6E,  // order un
                    /* 09A8 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x4C, 0x69, 0x6E,  // its='Lin
                    /* 09B0 */  0x65, 0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x56,  // es'>0</V
                    /* 09B8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x42,  // erticalB
                    /* 09C0 */  0x6F, 0x74, 0x74, 0x6F, 0x6D, 0x42, 0x6F, 0x72,  // ottomBor
                    /* 09C8 */  0x64, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // der>.   
                    /* 09D0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E,  //      <In
                    /* 09D8 */  0x76, 0x65, 0x72, 0x74, 0x44, 0x61, 0x74, 0x61,  // vertData
                    /* 09E0 */  0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74, 0x79,  // Polarity
                    /* 09E8 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 09F0 */  0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x44, 0x61,  // InvertDa
                    /* 09F8 */  0x74, 0x61, 0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69,  // taPolari
                    /* 0A00 */  0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // ty>.    
                    /* 0A08 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x76,  //     <Inv
                    /* 0A10 */  0x65, 0x72, 0x74, 0x56, 0x73, 0x79, 0x6E, 0x63,  // ertVsync
                    /* 0A18 */  0x50, 0x6F, 0x6C, 0x61, 0x69, 0x72, 0x74, 0x79,  // Polairty
                    /* 0A20 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 0A28 */  0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x56, 0x73,  // InvertVs
                    /* 0A30 */  0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61, 0x69,  // yncPolai
                    /* 0A38 */  0x72, 0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // rty>.   
                    /* 0A40 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x49, 0x6E,  //      <In
                    /* 0A48 */  0x76, 0x65, 0x72, 0x74, 0x48, 0x73, 0x79, 0x6E,  // vertHsyn
                    /* 0A50 */  0x63, 0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74,  // cPolarit
                    /* 0A58 */  0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C,  // y>False<
                    /* 0A60 */  0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x48,  // /InvertH
                    /* 0A68 */  0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61,  // syncPola
                    /* 0A70 */  0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20,  // rity>.  
                    /* 0A78 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x42,  //       <B
                    /* 0A80 */  0x6F, 0x72, 0x64, 0x65, 0x72, 0x43, 0x6F, 0x6C,  // orderCol
                    /* 0A88 */  0x6F, 0x72, 0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F,  // or>0x0</
                    /* 0A90 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x43, 0x6F,  // BorderCo
                    /* 0A98 */  0x6C, 0x6F, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // lor>.   
                    /* 0AA0 */  0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70,  //  </Group
                    /* 0AA8 */  0x3E, 0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // >..    <
                    /* 0AB0 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64,  // Group id
                    /* 0AB8 */  0x3D, 0x27, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61,  // ='Displa
                    /* 0AC0 */  0x79, 0x20, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  // y Interf
                    /* 0AC8 */  0x61, 0x63, 0x65, 0x27, 0x3E, 0x0A, 0x20, 0x20,  // ace'>.  
                    /* 0AD0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x49,  //       <I
                    /* 0AD8 */  0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65,  // nterface
                    /* 0AE0 */  0x54, 0x79, 0x70, 0x65, 0x20, 0x75, 0x6E, 0x69,  // Type uni
                    /* 0AE8 */  0x74, 0x73, 0x3D, 0x27, 0x51, 0x44, 0x49, 0x5F,  // ts='QDI_
                    /* 0AF0 */  0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x43,  // DisplayC
                    /* 0AF8 */  0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x54, 0x79,  // onnectTy
                    /* 0B00 */  0x70, 0x65, 0x27, 0x3E, 0x38, 0x3C, 0x2F, 0x49,  // pe'>8</I
                    /* 0B08 */  0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65,  // nterface
                    /* 0B10 */  0x54, 0x79, 0x70, 0x65, 0x3E, 0x0A, 0x20, 0x20,  // Type>.  
                    /* 0B18 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x49,  //       <I
                    /* 0B20 */  0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65,  // nterface
                    /* 0B28 */  0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72,  // ColorFor
                    /* 0B30 */  0x6D, 0x61, 0x74, 0x20, 0x75, 0x6E, 0x69, 0x74,  // mat unit
                    /* 0B38 */  0x73, 0x3D, 0x27, 0x51, 0x44, 0x49, 0x5F, 0x50,  // s='QDI_P
                    /* 0B40 */  0x69, 0x78, 0x65, 0x6C, 0x46, 0x6F, 0x72, 0x6D,  // ixelForm
                    /* 0B48 */  0x61, 0x74, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E,  // atType'>
                    /* 0B50 */  0x33, 0x3C, 0x2F, 0x49, 0x6E, 0x74, 0x65, 0x72,  // 3</Inter
                    /* 0B58 */  0x66, 0x61, 0x63, 0x65, 0x43, 0x6F, 0x6C, 0x6F,  // faceColo
                    /* 0B60 */  0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x3E,  // rFormat>
                    /* 0B68 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x2F, 0x47,  // .    </G
                    /* 0B70 */  0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x0A, 0x20,  // roup>.. 
                    /* 0B78 */  0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75,  //    <Grou
                    /* 0B80 */  0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x44, 0x53,  // p id='DS
                    /* 0B88 */  0x49, 0x20, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  // I Interf
                    /* 0B90 */  0x61, 0x63, 0x65, 0x27, 0x3E, 0x0A, 0x20, 0x20,  // ace'>.  
                    /* 0B98 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0BA0 */  0x53, 0x49, 0x43, 0x68, 0x61, 0x6E, 0x6E, 0x65,  // SIChanne
                    /* 0BA8 */  0x6C, 0x49, 0x64, 0x20, 0x75, 0x6E, 0x69, 0x74,  // lId unit
                    /* 0BB0 */  0x73, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x5F, 0x43,  // s='DSI_C
                    /* 0BB8 */  0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x5F, 0x49,  // hannel_I
                    /* 0BC0 */  0x44, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x31,  // DType'>1
                    /* 0BC8 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x43, 0x68, 0x61,  // </DSICha
                    /* 0BD0 */  0x6E, 0x6E, 0x65, 0x6C, 0x49, 0x64, 0x3E, 0x0A,  // nnelId>.
                    /* 0BD8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0BE0 */  0x3C, 0x44, 0x53, 0x49, 0x56, 0x69, 0x72, 0x74,  // <DSIVirt
                    /* 0BE8 */  0x75, 0x61, 0x6C, 0x49, 0x64, 0x20, 0x75, 0x6E,  // ualId un
                    /* 0BF0 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x53, 0x49,  // its='DSI
                    /* 0BF8 */  0x5F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79,  // _Display
                    /* 0C00 */  0x5F, 0x56, 0x43, 0x54, 0x79, 0x70, 0x65, 0x27,  // _VCType'
                    /* 0C08 */  0x3E, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x56,  // >0</DSIV
                    /* 0C10 */  0x69, 0x72, 0x74, 0x75, 0x61, 0x6C, 0x49, 0x64,  // irtualId
                    /* 0C18 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0C20 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x43, 0x6F,  //   <DSICo
                    /* 0C28 */  0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61,  // lorForma
                    /* 0C30 */  0x74, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // t units=
                    /* 0C38 */  0x27, 0x44, 0x53, 0x49, 0x5F, 0x43, 0x6F, 0x6C,  // 'DSI_Col
                    /* 0C40 */  0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74,  // orFormat
                    /* 0C48 */  0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x33, 0x36,  // Type'>36
                    /* 0C50 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x43, 0x6F, 0x6C,  // </DSICol
                    /* 0C58 */  0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74,  // orFormat
                    /* 0C60 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0C68 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x54, 0x72,  //   <DSITr
                    /* 0C70 */  0x61, 0x66, 0x66, 0x69, 0x63, 0x4D, 0x6F, 0x64,  // afficMod
                    /* 0C78 */  0x65, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // e units=
                    /* 0C80 */  0x27, 0x44, 0x53, 0x49, 0x5F, 0x54, 0x72, 0x61,  // 'DSI_Tra
                    /* 0C88 */  0x66, 0x66, 0x69, 0x63, 0x4D, 0x6F, 0x64, 0x65,  // fficMode
                    /* 0C90 */  0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x31, 0x3C,  // Type'>1<
                    /* 0C98 */  0x2F, 0x44, 0x53, 0x49, 0x54, 0x72, 0x61, 0x66,  // /DSITraf
                    /* 0CA0 */  0x66, 0x69, 0x63, 0x4D, 0x6F, 0x64, 0x65, 0x3E,  // ficMode>
                    /* 0CA8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0CB0 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x61, 0x6E,  //  <DSILan
                    /* 0CB8 */  0x65, 0x73, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // es units
                    /* 0CC0 */  0x3D, 0x27, 0x69, 0x6E, 0x74, 0x65, 0x67, 0x65,  // ='intege
                    /* 0CC8 */  0x72, 0x27, 0x3E, 0x32, 0x3C, 0x2F, 0x44, 0x53,  // r'>2</DS
                    /* 0CD0 */  0x49, 0x4C, 0x61, 0x6E, 0x65, 0x73, 0x3E, 0x0A,  // ILanes>.
                    /* 0CD8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0CE0 */  0x3C, 0x44, 0x53, 0x49, 0x48, 0x73, 0x61, 0x48,  // <DSIHsaH
                    /* 0CE8 */  0x73, 0x65, 0x41, 0x66, 0x74, 0x65, 0x72, 0x56,  // seAfterV
                    /* 0CF0 */  0x73, 0x56, 0x65, 0x20, 0x75, 0x6E, 0x69, 0x74,  // sVe unit
                    /* 0CF8 */  0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27,  // s='Bool'
                    /* 0D00 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 0D08 */  0x44, 0x53, 0x49, 0x48, 0x73, 0x61, 0x48, 0x73,  // DSIHsaHs
                    /* 0D10 */  0x65, 0x41, 0x66, 0x74, 0x65, 0x72, 0x56, 0x73,  // eAfterVs
                    /* 0D18 */  0x56, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // Ve>.    
                    /* 0D20 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0D28 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 0D30 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x46,  // ModeInHF
                    /* 0D38 */  0x50, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // P units=
                    /* 0D40 */  0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46,  // 'Bool'>F
                    /* 0D48 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // alse</DS
                    /* 0D50 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0D58 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48,  // rModeInH
                    /* 0D60 */  0x46, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // FP>.    
                    /* 0D68 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0D70 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 0D78 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x42,  // ModeInHB
                    /* 0D80 */  0x50, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // P units=
                    /* 0D88 */  0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46,  // 'Bool'>F
                    /* 0D90 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // alse</DS
                    /* 0D98 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0DA0 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48,  // rModeInH
                    /* 0DA8 */  0x42, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // BP>.    
                    /* 0DB0 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0DB8 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 0DC0 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x53,  // ModeInHS
                    /* 0DC8 */  0x41, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // A units=
                    /* 0DD0 */  0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46,  // 'Bool'>F
                    /* 0DD8 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // alse</DS
                    /* 0DE0 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0DE8 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48,  // rModeInH
                    /* 0DF0 */  0x53, 0x41, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // SA>.    
                    /* 0DF8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0E00 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 0E08 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C,  // ModeInBL
                    /* 0E10 */  0x4C, 0x50, 0x45, 0x4F, 0x46, 0x20, 0x75, 0x6E,  // LPEOF un
                    /* 0E18 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F,  // its='Boo
                    /* 0E20 */  0x6C, 0x27, 0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C,  // l'>True<
                    /* 0E28 */  0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50,  // /DSILowP
                    /* 0E30 */  0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65,  // owerMode
                    /* 0E38 */  0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50, 0x45, 0x4F,  // InBLLPEO
                    /* 0E40 */  0x46, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // F>.     
                    /* 0E48 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C,  //    <DSIL
                    /* 0E50 */  0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D,  // owPowerM
                    /* 0E58 */  0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C,  // odeInBLL
                    /* 0E60 */  0x50, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // P units=
                    /* 0E68 */  0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x54,  // 'Bool'>T
                    /* 0E70 */  0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // rue</DSI
                    /* 0E78 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 0E80 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C,  // ModeInBL
                    /* 0E88 */  0x4C, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // LP>.    
                    /* 0E90 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x21, 0x2D, 0x2D,  //     <!--
                    /* 0E98 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x52, 0x65, 0x66,  //  <DSIRef
                    /* 0EA0 */  0x72, 0x65, 0x73, 0x68, 0x52, 0x61, 0x74, 0x65,  // reshRate
                    /* 0EA8 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0EB0 */  0x69, 0x6E, 0x74, 0x65, 0x67, 0x65, 0x72, 0x20,  // integer 
                    /* 0EB8 */  0x51, 0x31, 0x36, 0x2E, 0x31, 0x36, 0x27, 0x3E,  // Q16.16'>
                    /* 0EC0 */  0x30, 0x78, 0x33, 0x43, 0x30, 0x30, 0x30, 0x30,  // 0x3C0000
                    /* 0EC8 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x52, 0x65, 0x66,  // </DSIRef
                    /* 0ED0 */  0x72, 0x65, 0x73, 0x68, 0x52, 0x61, 0x74, 0x65,  // reshRate
                    /* 0ED8 */  0x3E, 0x20, 0x2D, 0x2D, 0x3E, 0x0A, 0x20, 0x20,  // > -->.  
                    /* 0EE0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0EE8 */  0x53, 0x49, 0x50, 0x61, 0x63, 0x6B, 0x65, 0x74,  // SIPacket
                    /* 0EF0 */  0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72,  // Transfer
                    /* 0EF8 */  0x48, 0x53, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // HS units
                    /* 0F00 */  0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E,  // ='Bool'>
                    /* 0F08 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 0F10 */  0x53, 0x49, 0x50, 0x61, 0x63, 0x6B, 0x65, 0x74,  // SIPacket
                    /* 0F18 */  0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72,  // Transfer
                    /* 0F20 */  0x48, 0x53, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // HS>.    
                    /* 0F28 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0F30 */  0x48, 0x6F, 0x73, 0x74, 0x4C, 0x61, 0x6E, 0x65,  // HostLane
                    /* 0F38 */  0x4D, 0x61, 0x70, 0x70, 0x69, 0x6E, 0x67, 0x20,  // Mapping 
                    /* 0F40 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x69,  // units='i
                    /* 0F48 */  0x6E, 0x74, 0x65, 0x67, 0x65, 0x72, 0x27, 0x3E,  // nteger'>
                    /* 0F50 */  0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x48, 0x6F,  // 0</DSIHo
                    /* 0F58 */  0x73, 0x74, 0x4C, 0x61, 0x6E, 0x65, 0x4D, 0x61,  // stLaneMa
                    /* 0F60 */  0x70, 0x70, 0x69, 0x6E, 0x67, 0x3E, 0x0A, 0x20,  // pping>. 
                    /* 0F68 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0F70 */  0x44, 0x53, 0x49, 0x50, 0x68, 0x79, 0x44, 0x43,  // DSIPhyDC
                    /* 0F78 */  0x44, 0x43, 0x4D, 0x6F, 0x64, 0x65, 0x20, 0x75,  // DCMode u
                    /* 0F80 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42, 0x6F,  // nits='Bo
                    /* 0F88 */  0x6F, 0x6C, 0x27, 0x3E, 0x46, 0x61, 0x6C, 0x73,  // ol'>Fals
                    /* 0F90 */  0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x50, 0x68,  // e</DSIPh
                    /* 0F98 */  0x79, 0x44, 0x43, 0x44, 0x43, 0x4D, 0x6F, 0x64,  // yDCDCMod
                    /* 0FA0 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // e>.     
                    /* 0FA8 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C,  //    <DSIL
                    /* 0FB0 */  0x50, 0x31, 0x31, 0x41, 0x74, 0x49, 0x6E, 0x69,  // P11AtIni
                    /* 0FB8 */  0x74, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D,  // t units=
                    /* 0FC0 */  0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x54,  // 'Bool'>T
                    /* 0FC8 */  0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // rue</DSI
                    /* 0FD0 */  0x4C, 0x50, 0x31, 0x31, 0x41, 0x74, 0x49, 0x6E,  // LP11AtIn
                    /* 0FD8 */  0x69, 0x74, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // it>.    
                    /* 0FE0 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x21, 0x2D, 0x2D,  //     <!--
                    /* 0FE8 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x44, 0x69, 0x73,  //  <DSIDis
                    /* 0FF0 */  0x61, 0x62, 0x6C, 0x65, 0x45, 0x6F, 0x54, 0x41,  // ableEoTA
                    /* 0FF8 */  0x66, 0x74, 0x65, 0x72, 0x48, 0x53, 0x58, 0x66,  // fterHSXf
                    /* 1000 */  0x65, 0x72, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // er units
                    /* 1008 */  0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E,  // ='Bool'>
                    /* 1010 */  0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // True</DS
                    /* 1018 */  0x49, 0x44, 0x69, 0x73, 0x61, 0x62, 0x6C, 0x65,  // IDisable
                    /* 1020 */  0x45, 0x6F, 0x54, 0x41, 0x66, 0x74, 0x65, 0x72,  // EoTAfter
                    /* 1028 */  0x48, 0x53, 0x58, 0x66, 0x65, 0x72, 0x3E, 0x20,  // HSXfer> 
                    /* 1030 */  0x2D, 0x2D, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // -->.    
                    /* 1038 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 1040 */  0x42, 0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // BitClock
                    /* 1048 */  0x46, 0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63,  // Frequenc
                    /* 1050 */  0x79, 0x3E, 0x35, 0x31, 0x34, 0x30, 0x31, 0x38,  // y>514018
                    /* 1058 */  0x30, 0x38, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // 080</DSI
                    /* 1060 */  0x42, 0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // BitClock
                    /* 1068 */  0x46, 0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63,  // Frequenc
                    /* 1070 */  0x79, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // y>.    <
                    /* 1078 */  0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A,  // /Group>.
                    /* 1080 */  0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E,  // </Group>
                    /* 1088 */  0x00                                             // .
                })
                Name (PCF5, Buffer (0x1024)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x20,  // f-8'?>. 
                    /* 0028 */  0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75,  //    <Grou
                    /* 0030 */  0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x4D, 0x61,  // p id='Ma
                    /* 0038 */  0x69, 0x6E, 0x20, 0x50, 0x61, 0x6E, 0x65, 0x6C,  // in Panel
                    /* 0040 */  0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C,  // '>.    <
                    /* 0048 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D,  // PanelNam
                    /* 0050 */  0x65, 0x3E, 0x54, 0x46, 0x54, 0x34, 0x38, 0x30,  // e>TFT480
                    /* 0058 */  0x38, 0x30, 0x30, 0x2D, 0x38, 0x31, 0x2D, 0x45,  // 800-81-E
                    /* 0060 */  0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E,  // </PanelN
                    /* 0068 */  0x61, 0x6D, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ame>.   
                    /* 0070 */  0x20, 0x3C, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x44,  //  <PanelD
                    /* 0078 */  0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69,  // escripti
                    /* 0080 */  0x6F, 0x6E, 0x3E, 0x56, 0x69, 0x64, 0x65, 0x6F,  // on>Video
                    /* 0088 */  0x20, 0x6D, 0x6F, 0x64, 0x65, 0x20, 0x54, 0x72,  //  mode Tr
                    /* 0090 */  0x75, 0x6C, 0x79, 0x20, 0x57, 0x56, 0x47, 0x41,  // uly WVGA
                    /* 0098 */  0x20, 0x44, 0x53, 0x49, 0x20, 0x50, 0x61, 0x6E,  //  DSI Pan
                    /* 00A0 */  0x65, 0x6C, 0x20, 0x28, 0x34, 0x38, 0x30, 0x58,  // el (480X
                    /* 00A8 */  0x38, 0x30, 0x30, 0x20, 0x32, 0x34, 0x62, 0x70,  // 800 24bp
                    /* 00B0 */  0x70, 0x29, 0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65,  // p)</Pane
                    /* 00B8 */  0x6C, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70,  // lDescrip
                    /* 00C0 */  0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x0A, 0x20,  // tion>.. 
                    /* 00C8 */  0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75,  //    <Grou
                    /* 00D0 */  0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x45, 0x44,  // p id='ED
                    /* 00D8 */  0x49, 0x44, 0x20, 0x43, 0x6F, 0x6E, 0x66, 0x69,  // ID Confi
                    /* 00E0 */  0x67, 0x75, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x6E,  // guration
                    /* 00E8 */  0x27, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // '>.     
                    /* 00F0 */  0x20, 0x20, 0x20, 0x3C, 0x4D, 0x61, 0x6E, 0x75,  //    <Manu
                    /* 00F8 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x49,  // factureI
                    /* 0100 */  0x44, 0x3E, 0x30, 0x78, 0x41, 0x46, 0x30, 0x44,  // D>0xAF0D
                    /* 0108 */  0x3C, 0x2F, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61,  // </Manufa
                    /* 0110 */  0x63, 0x74, 0x75, 0x72, 0x65, 0x49, 0x44, 0x3E,  // ctureID>
                    /* 0118 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0120 */  0x20, 0x3C, 0x50, 0x72, 0x6F, 0x64, 0x75, 0x63,  //  <Produc
                    /* 0128 */  0x74, 0x43, 0x6F, 0x64, 0x65, 0x3E, 0x30, 0x78,  // tCode>0x
                    /* 0130 */  0x30, 0x30, 0x31, 0x31, 0x3C, 0x2F, 0x50, 0x72,  // 0011</Pr
                    /* 0138 */  0x6F, 0x64, 0x75, 0x63, 0x74, 0x43, 0x6F, 0x64,  // oductCod
                    /* 0140 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // e>.     
                    /* 0148 */  0x20, 0x20, 0x20, 0x3C, 0x53, 0x65, 0x72, 0x69,  //    <Seri
                    /* 0150 */  0x61, 0x6C, 0x4E, 0x75, 0x6D, 0x62, 0x65, 0x72,  // alNumber
                    /* 0158 */  0x3E, 0x30, 0x78, 0x30, 0x30, 0x30, 0x30, 0x30,  // >0x00000
                    /* 0160 */  0x30, 0x3C, 0x2F, 0x53, 0x65, 0x72, 0x69, 0x61,  // 0</Seria
                    /* 0168 */  0x6C, 0x4E, 0x75, 0x6D, 0x62, 0x65, 0x72, 0x3E,  // lNumber>
                    /* 0170 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0178 */  0x20, 0x3C, 0x57, 0x65, 0x65, 0x6B, 0x6F, 0x66,  //  <Weekof
                    /* 0180 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 0188 */  0x75, 0x72, 0x65, 0x3E, 0x30, 0x78, 0x30, 0x39,  // ure>0x09
                    /* 0190 */  0x3C, 0x2F, 0x57, 0x65, 0x65, 0x6B, 0x6F, 0x66,  // </Weekof
                    /* 0198 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 01A0 */  0x75, 0x72, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ure>.   
                    /* 01A8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x59, 0x65,  //      <Ye
                    /* 01B0 */  0x61, 0x72, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // arofManu
                    /* 01B8 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 01C0 */  0x30, 0x78, 0x31, 0x33, 0x3C, 0x2F, 0x59, 0x65,  // 0x13</Ye
                    /* 01C8 */  0x61, 0x72, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // arofManu
                    /* 01D0 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 01D8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 01E0 */  0x20, 0x3C, 0x45, 0x44, 0x49, 0x44, 0x56, 0x65,  //  <EDIDVe
                    /* 01E8 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3E, 0x31, 0x3C,  // rsion>1<
                    /* 01F0 */  0x2F, 0x45, 0x44, 0x49, 0x44, 0x56, 0x65, 0x72,  // /EDIDVer
                    /* 01F8 */  0x73, 0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x20, 0x20,  // sion>.  
                    /* 0200 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x45,  //       <E
                    /* 0208 */  0x44, 0x49, 0x44, 0x52, 0x65, 0x76, 0x69, 0x73,  // DIDRevis
                    /* 0210 */  0x69, 0x6F, 0x6E, 0x3E, 0x33, 0x3C, 0x2F, 0x45,  // ion>3</E
                    /* 0218 */  0x44, 0x49, 0x44, 0x52, 0x65, 0x76, 0x69, 0x73,  // DIDRevis
                    /* 0220 */  0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ion>.   
                    /* 0228 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x69,  //      <Vi
                    /* 0230 */  0x64, 0x65, 0x6F, 0x49, 0x6E, 0x70, 0x75, 0x74,  // deoInput
                    /* 0238 */  0x44, 0x65, 0x66, 0x69, 0x6E, 0x69, 0x74, 0x69,  // Definiti
                    /* 0240 */  0x6F, 0x6E, 0x3E, 0x30, 0x78, 0x38, 0x30, 0x3C,  // on>0x80<
                    /* 0248 */  0x2F, 0x56, 0x69, 0x64, 0x65, 0x6F, 0x49, 0x6E,  // /VideoIn
                    /* 0250 */  0x70, 0x75, 0x74, 0x44, 0x65, 0x66, 0x69, 0x6E,  // putDefin
                    /* 0258 */  0x69, 0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x20,  // ition>. 
                    /* 0260 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0268 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 0270 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 0278 */  0x53, 0x69, 0x7A, 0x65, 0x3E, 0x30, 0x78, 0x30,  // Size>0x0
                    /* 0280 */  0x35, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A,  // 5</Horiz
                    /* 0288 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x63, 0x72,  // ontalScr
                    /* 0290 */  0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65, 0x3E,  // eenSize>
                    /* 0298 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 02A0 */  0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  //  <Vertic
                    /* 02A8 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 02B0 */  0x53, 0x69, 0x7A, 0x65, 0x3E, 0x30, 0x78, 0x30,  // Size>0x0
                    /* 02B8 */  0x41, 0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69,  // A</Verti
                    /* 02C0 */  0x63, 0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65,  // calScree
                    /* 02C8 */  0x6E, 0x53, 0x69, 0x7A, 0x65, 0x3E, 0x0A, 0x20,  // nSize>. 
                    /* 02D0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 02D8 */  0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x54,  // DisplayT
                    /* 02E0 */  0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72, 0x43,  // ransferC
                    /* 02E8 */  0x68, 0x61, 0x72, 0x61, 0x63, 0x74, 0x65, 0x72,  // haracter
                    /* 02F0 */  0x69, 0x73, 0x74, 0x69, 0x63, 0x73, 0x3E, 0x30,  // istics>0
                    /* 02F8 */  0x78, 0x37, 0x38, 0x3C, 0x2F, 0x44, 0x69, 0x73,  // x78</Dis
                    /* 0300 */  0x70, 0x6C, 0x61, 0x79, 0x54, 0x72, 0x61, 0x6E,  // playTran
                    /* 0308 */  0x73, 0x66, 0x65, 0x72, 0x43, 0x68, 0x61, 0x72,  // sferChar
                    /* 0310 */  0x61, 0x63, 0x74, 0x65, 0x72, 0x69, 0x73, 0x74,  // acterist
                    /* 0318 */  0x69, 0x63, 0x73, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ics>.   
                    /* 0320 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x46, 0x65,  //      <Fe
                    /* 0328 */  0x61, 0x74, 0x75, 0x72, 0x65, 0x53, 0x75, 0x70,  // atureSup
                    /* 0330 */  0x70, 0x6F, 0x72, 0x74, 0x3E, 0x30, 0x78, 0x41,  // port>0xA
                    /* 0338 */  0x3C, 0x2F, 0x46, 0x65, 0x61, 0x74, 0x75, 0x72,  // </Featur
                    /* 0340 */  0x65, 0x53, 0x75, 0x70, 0x70, 0x6F, 0x72, 0x74,  // eSupport
                    /* 0348 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0350 */  0x20, 0x20, 0x3C, 0x52, 0x65, 0x64, 0x2E, 0x47,  //   <Red.G
                    /* 0358 */  0x72, 0x65, 0x65, 0x6E, 0x42, 0x69, 0x74, 0x73,  // reenBits
                    /* 0360 */  0x3E, 0x30, 0x78, 0x43, 0x46, 0x3C, 0x2F, 0x52,  // >0xCF</R
                    /* 0368 */  0x65, 0x64, 0x2E, 0x47, 0x72, 0x65, 0x65, 0x6E,  // ed.Green
                    /* 0370 */  0x42, 0x69, 0x74, 0x73, 0x3E, 0x0A, 0x20, 0x20,  // Bits>.  
                    /* 0378 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x42,  //       <B
                    /* 0380 */  0x6C, 0x75, 0x65, 0x2E, 0x57, 0x68, 0x69, 0x74,  // lue.Whit
                    /* 0388 */  0x65, 0x42, 0x69, 0x74, 0x73, 0x3E, 0x30, 0x78,  // eBits>0x
                    /* 0390 */  0x34, 0x35, 0x3C, 0x2F, 0x42, 0x6C, 0x75, 0x65,  // 45</Blue
                    /* 0398 */  0x2E, 0x57, 0x68, 0x69, 0x74, 0x65, 0x42, 0x69,  // .WhiteBi
                    /* 03A0 */  0x74, 0x73, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // ts>.    
                    /* 03A8 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x52, 0x65, 0x64,  //     <Red
                    /* 03B0 */  0x58, 0x3E, 0x30, 0x78, 0x39, 0x30, 0x3C, 0x2F,  // X>0x90</
                    /* 03B8 */  0x52, 0x65, 0x64, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // RedX>.  
                    /* 03C0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x52,  //       <R
                    /* 03C8 */  0x65, 0x64, 0x59, 0x3E, 0x30, 0x78, 0x35, 0x39,  // edY>0x59
                    /* 03D0 */  0x3C, 0x2F, 0x52, 0x65, 0x64, 0x59, 0x3E, 0x0A,  // </RedY>.
                    /* 03D8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 03E0 */  0x3C, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x58, 0x3E,  // <GreenX>
                    /* 03E8 */  0x30, 0x78, 0x35, 0x37, 0x3C, 0x2F, 0x47, 0x72,  // 0x57</Gr
                    /* 03F0 */  0x65, 0x65, 0x6E, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // eenX>.  
                    /* 03F8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x47,  //       <G
                    /* 0400 */  0x72, 0x65, 0x65, 0x6E, 0x59, 0x3E, 0x30, 0x78,  // reenY>0x
                    /* 0408 */  0x39, 0x35, 0x3C, 0x2F, 0x47, 0x72, 0x65, 0x65,  // 95</Gree
                    /* 0410 */  0x6E, 0x59, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // nY>.    
                    /* 0418 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75,  //     <Blu
                    /* 0420 */  0x65, 0x58, 0x3E, 0x30, 0x78, 0x32, 0x39, 0x3C,  // eX>0x29<
                    /* 0428 */  0x2F, 0x42, 0x6C, 0x75, 0x65, 0x58, 0x3E, 0x0A,  // /BlueX>.
                    /* 0430 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0438 */  0x3C, 0x42, 0x6C, 0x75, 0x65, 0x59, 0x3E, 0x30,  // <BlueY>0
                    /* 0440 */  0x78, 0x31, 0x66, 0x3C, 0x2F, 0x42, 0x6C, 0x75,  // x1f</Blu
                    /* 0448 */  0x65, 0x59, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // eY>.    
                    /* 0450 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x57, 0x68, 0x69,  //     <Whi
                    /* 0458 */  0x74, 0x65, 0x58, 0x3E, 0x30, 0x78, 0x35, 0x30,  // teX>0x50
                    /* 0460 */  0x3C, 0x2F, 0x57, 0x68, 0x69, 0x74, 0x65, 0x58,  // </WhiteX
                    /* 0468 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // >.      
                    /* 0470 */  0x20, 0x20, 0x3C, 0x57, 0x68, 0x69, 0x74, 0x65,  //   <White
                    /* 0478 */  0x59, 0x3E, 0x30, 0x78, 0x35, 0x34, 0x3C, 0x2F,  // Y>0x54</
                    /* 0480 */  0x57, 0x68, 0x69, 0x74, 0x65, 0x59, 0x3E, 0x0A,  // WhiteY>.
                    /* 0488 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0490 */  0x3C, 0x45, 0x73, 0x74, 0x61, 0x62, 0x6C, 0x69,  // <Establi
                    /* 0498 */  0x73, 0x68, 0x65, 0x64, 0x54, 0x69, 0x6D, 0x69,  // shedTimi
                    /* 04A0 */  0x6E, 0x67, 0x73, 0x49, 0x3E, 0x30, 0x78, 0x30,  // ngsI>0x0
                    /* 04A8 */  0x3C, 0x2F, 0x45, 0x73, 0x74, 0x61, 0x62, 0x6C,  // </Establ
                    /* 04B0 */  0x69, 0x73, 0x68, 0x65, 0x64, 0x54, 0x69, 0x6D,  // ishedTim
                    /* 04B8 */  0x69, 0x6E, 0x67, 0x73, 0x49, 0x3E, 0x0A, 0x20,  // ingsI>. 
                    /* 04C0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 04C8 */  0x45, 0x73, 0x74, 0x61, 0x62, 0x6C, 0x69, 0x73,  // Establis
                    /* 04D0 */  0x68, 0x65, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // hedTimin
                    /* 04D8 */  0x67, 0x73, 0x49, 0x49, 0x3E, 0x30, 0x78, 0x30,  // gsII>0x0
                    /* 04E0 */  0x3C, 0x2F, 0x45, 0x73, 0x74, 0x61, 0x62, 0x6C,  // </Establ
                    /* 04E8 */  0x69, 0x73, 0x68, 0x65, 0x64, 0x54, 0x69, 0x6D,  // ishedTim
                    /* 04F0 */  0x69, 0x6E, 0x67, 0x73, 0x49, 0x49, 0x3E, 0x0A,  // ingsII>.
                    /* 04F8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0500 */  0x3C, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63,  // <Manufac
                    /* 0508 */  0x74, 0x75, 0x72, 0x65, 0x73, 0x54, 0x69, 0x6D,  // turesTim
                    /* 0510 */  0x69, 0x6E, 0x67, 0x3E, 0x30, 0x78, 0x30, 0x3C,  // ing>0x0<
                    /* 0518 */  0x2F, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63,  // /Manufac
                    /* 0520 */  0x74, 0x75, 0x72, 0x65, 0x73, 0x54, 0x69, 0x6D,  // turesTim
                    /* 0528 */  0x69, 0x6E, 0x67, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ing>.   
                    /* 0530 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 0538 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 0540 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x31, 0x2F, 0x3E,  // mings1/>
                    /* 0548 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0550 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 0558 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 0560 */  0x73, 0x32, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s2/>.   
                    /* 0568 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 0570 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 0578 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x33, 0x2F, 0x3E,  // mings3/>
                    /* 0580 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0588 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 0590 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 0598 */  0x73, 0x34, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s4/>.   
                    /* 05A0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 05A8 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 05B0 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x35, 0x2F, 0x3E,  // mings5/>
                    /* 05B8 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 05C0 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 05C8 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 05D0 */  0x73, 0x36, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // s6/>.   
                    /* 05D8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x53, 0x74,  //      <St
                    /* 05E0 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 05E8 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x37, 0x2F, 0x3E,  // mings7/>
                    /* 05F0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 05F8 */  0x20, 0x3C, 0x53, 0x69, 0x67, 0x6E, 0x61, 0x6C,  //  <Signal
                    /* 0600 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x49, 0x6E,  // TimingIn
                    /* 0608 */  0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x2F,  // terface/
                    /* 0610 */  0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x2F,  // >.    </
                    /* 0618 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x0A,  // Group>..
                    /* 0620 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F,  //     <Gro
                    /* 0628 */  0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x41,  // up id='A
                    /* 0630 */  0x63, 0x74, 0x69, 0x76, 0x65, 0x20, 0x54, 0x69,  // ctive Ti
                    /* 0638 */  0x6D, 0x69, 0x6E, 0x67, 0x27, 0x3E, 0x0A, 0x20,  // ming'>. 
                    /* 0640 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0648 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 0650 */  0x61, 0x6C, 0x41, 0x63, 0x74, 0x69, 0x76, 0x65,  // alActive
                    /* 0658 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0660 */  0x44, 0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63,  // Dot Cloc
                    /* 0668 */  0x6B, 0x73, 0x27, 0x3E, 0x34, 0x38, 0x30, 0x3C,  // ks'>480<
                    /* 0670 */  0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // /Horizon
                    /* 0678 */  0x74, 0x61, 0x6C, 0x41, 0x63, 0x74, 0x69, 0x76,  // talActiv
                    /* 0680 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // e>.     
                    /* 0688 */  0x20, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  //    <Hori
                    /* 0690 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x46, 0x72,  // zontalFr
                    /* 0698 */  0x6F, 0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ontPorch
                    /* 06A0 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 06A8 */  0x44, 0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63,  // Dot Cloc
                    /* 06B0 */  0x6B, 0x73, 0x27, 0x3E, 0x31, 0x30, 0x30, 0x3C,  // ks'>100<
                    /* 06B8 */  0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // /Horizon
                    /* 06C0 */  0x74, 0x61, 0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74,  // talFront
                    /* 06C8 */  0x50, 0x6F, 0x72, 0x63, 0x68, 0x3E, 0x0A, 0x20,  // Porch>. 
                    /* 06D0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 06D8 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 06E0 */  0x61, 0x6C, 0x42, 0x61, 0x63, 0x6B, 0x50, 0x6F,  // alBackPo
                    /* 06E8 */  0x72, 0x63, 0x68, 0x20, 0x75, 0x6E, 0x69, 0x74,  // rch unit
                    /* 06F0 */  0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20, 0x43,  // s='Dot C
                    /* 06F8 */  0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E, 0x39,  // locks'>9
                    /* 0700 */  0x34, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A,  // 4</Horiz
                    /* 0708 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x42, 0x61, 0x63,  // ontalBac
                    /* 0710 */  0x6B, 0x50, 0x6F, 0x72, 0x63, 0x68, 0x3E, 0x0A,  // kPorch>.
                    /* 0718 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0720 */  0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // <Horizon
                    /* 0728 */  0x74, 0x61, 0x6C, 0x53, 0x79, 0x6E, 0x63, 0x50,  // talSyncP
                    /* 0730 */  0x75, 0x6C, 0x73, 0x65, 0x20, 0x75, 0x6E, 0x69,  // ulse uni
                    /* 0738 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 0740 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 0748 */  0x34, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // 40</Hori
                    /* 0750 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79,  // zontalSy
                    /* 0758 */  0x6E, 0x63, 0x50, 0x75, 0x6C, 0x73, 0x65, 0x3E,  // ncPulse>
                    /* 0760 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0768 */  0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F,  //  <Horizo
                    /* 0770 */  0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79, 0x6E, 0x63,  // ntalSync
                    /* 0778 */  0x53, 0x6B, 0x65, 0x77, 0x20, 0x75, 0x6E, 0x69,  // Skew uni
                    /* 0780 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 0788 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 0790 */  0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A,  // 0</Horiz
                    /* 0798 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x79, 0x6E,  // ontalSyn
                    /* 07A0 */  0x63, 0x53, 0x6B, 0x65, 0x77, 0x3E, 0x0A, 0x20,  // cSkew>. 
                    /* 07A8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 07B0 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 07B8 */  0x61, 0x6C, 0x4C, 0x65, 0x66, 0x74, 0x42, 0x6F,  // alLeftBo
                    /* 07C0 */  0x72, 0x64, 0x65, 0x72, 0x20, 0x75, 0x6E, 0x69,  // rder uni
                    /* 07C8 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 07D0 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 07D8 */  0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A,  // 0</Horiz
                    /* 07E0 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x4C, 0x65, 0x66,  // ontalLef
                    /* 07E8 */  0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E,  // tBorder>
                    /* 07F0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 07F8 */  0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F,  //  <Horizo
                    /* 0800 */  0x6E, 0x74, 0x61, 0x6C, 0x52, 0x69, 0x67, 0x68,  // ntalRigh
                    /* 0808 */  0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x20,  // tBorder 
                    /* 0810 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44,  // units='D
                    /* 0818 */  0x6F, 0x74, 0x20, 0x43, 0x6C, 0x6F, 0x63, 0x6B,  // ot Clock
                    /* 0820 */  0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F,  // s'>0</Ho
                    /* 0828 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 0830 */  0x52, 0x69, 0x67, 0x68, 0x74, 0x42, 0x6F, 0x72,  // RightBor
                    /* 0838 */  0x64, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // der>.   
                    /* 0840 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65,  //      <Ve
                    /* 0848 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x41, 0x63,  // rticalAc
                    /* 0850 */  0x74, 0x69, 0x76, 0x65, 0x20, 0x75, 0x6E, 0x69,  // tive uni
                    /* 0858 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x6F, 0x74, 0x20,  // ts='Dot 
                    /* 0860 */  0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x73, 0x27, 0x3E,  // Clocks'>
                    /* 0868 */  0x38, 0x30, 0x30, 0x3C, 0x2F, 0x56, 0x65, 0x72,  // 800</Ver
                    /* 0870 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x41, 0x63, 0x74,  // ticalAct
                    /* 0878 */  0x69, 0x76, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // ive>.   
                    /* 0880 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65,  //      <Ve
                    /* 0888 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x46, 0x72,  // rticalFr
                    /* 0890 */  0x6F, 0x6E, 0x74, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ontPorch
                    /* 0898 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 08A0 */  0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E, 0x36,  // Lines'>6
                    /* 08A8 */  0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // </Vertic
                    /* 08B0 */  0x61, 0x6C, 0x46, 0x72, 0x6F, 0x6E, 0x74, 0x50,  // alFrontP
                    /* 08B8 */  0x6F, 0x72, 0x63, 0x68, 0x3E, 0x0A, 0x20, 0x20,  // orch>.  
                    /* 08C0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56,  //       <V
                    /* 08C8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x42,  // erticalB
                    /* 08D0 */  0x61, 0x63, 0x6B, 0x50, 0x6F, 0x72, 0x63, 0x68,  // ackPorch
                    /* 08D8 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 08E0 */  0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E, 0x34,  // Lines'>4
                    /* 08E8 */  0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // </Vertic
                    /* 08F0 */  0x61, 0x6C, 0x42, 0x61, 0x63, 0x6B, 0x50, 0x6F,  // alBackPo
                    /* 08F8 */  0x72, 0x63, 0x68, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // rch>.   
                    /* 0900 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65,  //      <Ve
                    /* 0908 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x79,  // rticalSy
                    /* 0910 */  0x6E, 0x63, 0x50, 0x75, 0x6C, 0x73, 0x65, 0x20,  // ncPulse 
                    /* 0918 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x4C,  // units='L
                    /* 0920 */  0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E, 0x36, 0x3C,  // ines'>6<
                    /* 0928 */  0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // /Vertica
                    /* 0930 */  0x6C, 0x53, 0x79, 0x6E, 0x63, 0x50, 0x75, 0x6C,  // lSyncPul
                    /* 0938 */  0x73, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // se>.    
                    /* 0940 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x56, 0x65, 0x72,  //     <Ver
                    /* 0948 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x54, 0x6F, 0x70,  // ticalTop
                    /* 0950 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x20, 0x75,  // Border u
                    /* 0958 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x4C, 0x69,  // nits='Li
                    /* 0960 */  0x6E, 0x65, 0x73, 0x27, 0x3E, 0x30, 0x3C, 0x2F,  // nes'>0</
                    /* 0968 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0970 */  0x54, 0x6F, 0x70, 0x42, 0x6F, 0x72, 0x64, 0x65,  // TopBorde
                    /* 0978 */  0x72, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // r>.     
                    /* 0980 */  0x20, 0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74,  //    <Vert
                    /* 0988 */  0x69, 0x63, 0x61, 0x6C, 0x42, 0x6F, 0x74, 0x74,  // icalBott
                    /* 0990 */  0x6F, 0x6D, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72,  // omBorder
                    /* 0998 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 09A0 */  0x4C, 0x69, 0x6E, 0x65, 0x73, 0x27, 0x3E, 0x30,  // Lines'>0
                    /* 09A8 */  0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // </Vertic
                    /* 09B0 */  0x61, 0x6C, 0x42, 0x6F, 0x74, 0x74, 0x6F, 0x6D,  // alBottom
                    /* 09B8 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A,  // Border>.
                    /* 09C0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 09C8 */  0x3C, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x44,  // <InvertD
                    /* 09D0 */  0x61, 0x74, 0x61, 0x50, 0x6F, 0x6C, 0x61, 0x72,  // ataPolar
                    /* 09D8 */  0x69, 0x74, 0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73,  // ity>Fals
                    /* 09E0 */  0x65, 0x3C, 0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72,  // e</Inver
                    /* 09E8 */  0x74, 0x44, 0x61, 0x74, 0x61, 0x50, 0x6F, 0x6C,  // tDataPol
                    /* 09F0 */  0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A, 0x20,  // arity>. 
                    /* 09F8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0A00 */  0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x56, 0x73,  // InvertVs
                    /* 0A08 */  0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61, 0x69,  // yncPolai
                    /* 0A10 */  0x72, 0x74, 0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73,  // rty>Fals
                    /* 0A18 */  0x65, 0x3C, 0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72,  // e</Inver
                    /* 0A20 */  0x74, 0x56, 0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F,  // tVsyncPo
                    /* 0A28 */  0x6C, 0x61, 0x69, 0x72, 0x74, 0x79, 0x3E, 0x0A,  // lairty>.
                    /* 0A30 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0A38 */  0x3C, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x48,  // <InvertH
                    /* 0A40 */  0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61,  // syncPola
                    /* 0A48 */  0x72, 0x69, 0x74, 0x79, 0x3E, 0x46, 0x61, 0x6C,  // rity>Fal
                    /* 0A50 */  0x73, 0x65, 0x3C, 0x2F, 0x49, 0x6E, 0x76, 0x65,  // se</Inve
                    /* 0A58 */  0x72, 0x74, 0x48, 0x73, 0x79, 0x6E, 0x63, 0x50,  // rtHsyncP
                    /* 0A60 */  0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E,  // olarity>
                    /* 0A68 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0A70 */  0x20, 0x3C, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72,  //  <Border
                    /* 0A78 */  0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x3E, 0x30, 0x78,  // Color>0x
                    /* 0A80 */  0x30, 0x3C, 0x2F, 0x42, 0x6F, 0x72, 0x64, 0x65,  // 0</Borde
                    /* 0A88 */  0x72, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x3E, 0x0A,  // rColor>.
                    /* 0A90 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72,  //     </Gr
                    /* 0A98 */  0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x0A, 0x20, 0x20,  // oup>..  
                    /* 0AA0 */  0x20, 0x20, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70,  //   <Group
                    /* 0AA8 */  0x20, 0x69, 0x64, 0x3D, 0x27, 0x44, 0x69, 0x73,  //  id='Dis
                    /* 0AB0 */  0x70, 0x6C, 0x61, 0x79, 0x20, 0x49, 0x6E, 0x74,  // play Int
                    /* 0AB8 */  0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x27, 0x3E,  // erface'>
                    /* 0AC0 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0AC8 */  0x20, 0x3C, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  //  <Interf
                    /* 0AD0 */  0x61, 0x63, 0x65, 0x54, 0x79, 0x70, 0x65, 0x20,  // aceType 
                    /* 0AD8 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x51,  // units='Q
                    /* 0AE0 */  0x44, 0x49, 0x5F, 0x44, 0x69, 0x73, 0x70, 0x6C,  // DI_Displ
                    /* 0AE8 */  0x61, 0x79, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63,  // ayConnec
                    /* 0AF0 */  0x74, 0x54, 0x79, 0x70, 0x65, 0x27, 0x3E, 0x38,  // tType'>8
                    /* 0AF8 */  0x3C, 0x2F, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  // </Interf
                    /* 0B00 */  0x61, 0x63, 0x65, 0x54, 0x79, 0x70, 0x65, 0x3E,  // aceType>
                    /* 0B08 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0B10 */  0x20, 0x3C, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  //  <Interf
                    /* 0B18 */  0x61, 0x63, 0x65, 0x43, 0x6F, 0x6C, 0x6F, 0x72,  // aceColor
                    /* 0B20 */  0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x20, 0x75,  // Format u
                    /* 0B28 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x51, 0x44,  // nits='QD
                    /* 0B30 */  0x49, 0x5F, 0x50, 0x69, 0x78, 0x65, 0x6C, 0x46,  // I_PixelF
                    /* 0B38 */  0x6F, 0x72, 0x6D, 0x61, 0x74, 0x54, 0x79, 0x70,  // ormatTyp
                    /* 0B40 */  0x65, 0x27, 0x3E, 0x33, 0x3C, 0x2F, 0x49, 0x6E,  // e'>3</In
                    /* 0B48 */  0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x43,  // terfaceC
                    /* 0B50 */  0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D,  // olorForm
                    /* 0B58 */  0x61, 0x74, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // at>.    
                    /* 0B60 */  0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E,  // </Group>
                    /* 0B68 */  0x0A, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x47,  // ..    <G
                    /* 0B70 */  0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D,  // roup id=
                    /* 0B78 */  0x27, 0x44, 0x53, 0x49, 0x20, 0x49, 0x6E, 0x74,  // 'DSI Int
                    /* 0B80 */  0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x27, 0x3E,  // erface'>
                    /* 0B88 */  0x0A, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  // .       
                    /* 0B90 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x43, 0x68, 0x61,  //  <DSICha
                    /* 0B98 */  0x6E, 0x6E, 0x65, 0x6C, 0x49, 0x64, 0x20, 0x75,  // nnelId u
                    /* 0BA0 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x44, 0x53,  // nits='DS
                    /* 0BA8 */  0x49, 0x5F, 0x43, 0x68, 0x61, 0x6E, 0x6E, 0x65,  // I_Channe
                    /* 0BB0 */  0x6C, 0x5F, 0x49, 0x44, 0x54, 0x79, 0x70, 0x65,  // l_IDType
                    /* 0BB8 */  0x27, 0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // '>1</DSI
                    /* 0BC0 */  0x43, 0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x49,  // ChannelI
                    /* 0BC8 */  0x64, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // d>.     
                    /* 0BD0 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x56,  //    <DSIV
                    /* 0BD8 */  0x69, 0x72, 0x74, 0x75, 0x61, 0x6C, 0x49, 0x64,  // irtualId
                    /* 0BE0 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0BE8 */  0x44, 0x53, 0x49, 0x5F, 0x44, 0x69, 0x73, 0x70,  // DSI_Disp
                    /* 0BF0 */  0x6C, 0x61, 0x79, 0x5F, 0x56, 0x43, 0x54, 0x79,  // lay_VCTy
                    /* 0BF8 */  0x70, 0x65, 0x27, 0x3E, 0x30, 0x3C, 0x2F, 0x44,  // pe'>0</D
                    /* 0C00 */  0x53, 0x49, 0x56, 0x69, 0x72, 0x74, 0x75, 0x61,  // SIVirtua
                    /* 0C08 */  0x6C, 0x49, 0x64, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // lId>.   
                    /* 0C10 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0C18 */  0x49, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F,  // IColorFo
                    /* 0C20 */  0x72, 0x6D, 0x61, 0x74, 0x20, 0x75, 0x6E, 0x69,  // rmat uni
                    /* 0C28 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x5F,  // ts='DSI_
                    /* 0C30 */  0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72,  // ColorFor
                    /* 0C38 */  0x6D, 0x61, 0x74, 0x54, 0x79, 0x70, 0x65, 0x27,  // matType'
                    /* 0C40 */  0x3E, 0x33, 0x36, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // >36</DSI
                    /* 0C48 */  0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72,  // ColorFor
                    /* 0C50 */  0x6D, 0x61, 0x74, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // mat>.   
                    /* 0C58 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0C60 */  0x49, 0x54, 0x72, 0x61, 0x66, 0x66, 0x69, 0x63,  // ITraffic
                    /* 0C68 */  0x4D, 0x6F, 0x64, 0x65, 0x20, 0x75, 0x6E, 0x69,  // Mode uni
                    /* 0C70 */  0x74, 0x73, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x5F,  // ts='DSI_
                    /* 0C78 */  0x54, 0x72, 0x61, 0x66, 0x66, 0x69, 0x63, 0x4D,  // TrafficM
                    /* 0C80 */  0x6F, 0x64, 0x65, 0x54, 0x79, 0x70, 0x65, 0x27,  // odeType'
                    /* 0C88 */  0x3E, 0x32, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x54,  // >2</DSIT
                    /* 0C90 */  0x72, 0x61, 0x66, 0x66, 0x69, 0x63, 0x4D, 0x6F,  // rafficMo
                    /* 0C98 */  0x64, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // de>.    
                    /* 0CA0 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0CA8 */  0x4C, 0x61, 0x6E, 0x65, 0x73, 0x20, 0x75, 0x6E,  // Lanes un
                    /* 0CB0 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x69, 0x6E, 0x74,  // its='int
                    /* 0CB8 */  0x65, 0x67, 0x65, 0x72, 0x27, 0x3E, 0x32, 0x3C,  // eger'>2<
                    /* 0CC0 */  0x2F, 0x44, 0x53, 0x49, 0x4C, 0x61, 0x6E, 0x65,  // /DSILane
                    /* 0CC8 */  0x73, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20, 0x20,  // s>.     
                    /* 0CD0 */  0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x48,  //    <DSIH
                    /* 0CD8 */  0x73, 0x61, 0x48, 0x73, 0x65, 0x41, 0x66, 0x74,  // saHseAft
                    /* 0CE0 */  0x65, 0x72, 0x56, 0x73, 0x56, 0x65, 0x20, 0x75,  // erVsVe u
                    /* 0CE8 */  0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42, 0x6F,  // nits='Bo
                    /* 0CF0 */  0x6F, 0x6C, 0x27, 0x3E, 0x54, 0x72, 0x75, 0x65,  // ol'>True
                    /* 0CF8 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x48, 0x73, 0x61,  // </DSIHsa
                    /* 0D00 */  0x48, 0x73, 0x65, 0x41, 0x66, 0x74, 0x65, 0x72,  // HseAfter
                    /* 0D08 */  0x56, 0x73, 0x56, 0x65, 0x3E, 0x0A, 0x20, 0x20,  // VsVe>.  
                    /* 0D10 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0D18 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0D20 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0D28 */  0x48, 0x46, 0x50, 0x20, 0x75, 0x6E, 0x69, 0x74,  // HFP unit
                    /* 0D30 */  0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27,  // s='Bool'
                    /* 0D38 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 0D40 */  0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F,  // DSILowPo
                    /* 0D48 */  0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49,  // werModeI
                    /* 0D50 */  0x6E, 0x48, 0x46, 0x50, 0x3E, 0x0A, 0x20, 0x20,  // nHFP>.  
                    /* 0D58 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0D60 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0D68 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0D70 */  0x48, 0x42, 0x50, 0x20, 0x75, 0x6E, 0x69, 0x74,  // HBP unit
                    /* 0D78 */  0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27,  // s='Bool'
                    /* 0D80 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 0D88 */  0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F,  // DSILowPo
                    /* 0D90 */  0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49,  // werModeI
                    /* 0D98 */  0x6E, 0x48, 0x42, 0x50, 0x3E, 0x0A, 0x20, 0x20,  // nHBP>.  
                    /* 0DA0 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0DA8 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0DB0 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0DB8 */  0x48, 0x53, 0x41, 0x20, 0x75, 0x6E, 0x69, 0x74,  // HSA unit
                    /* 0DC0 */  0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27,  // s='Bool'
                    /* 0DC8 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 0DD0 */  0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F,  // DSILowPo
                    /* 0DD8 */  0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49,  // werModeI
                    /* 0DE0 */  0x6E, 0x48, 0x53, 0x41, 0x3E, 0x0A, 0x20, 0x20,  // nHSA>.  
                    /* 0DE8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0DF0 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0DF8 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0E00 */  0x42, 0x4C, 0x4C, 0x50, 0x45, 0x4F, 0x46, 0x20,  // BLLPEOF 
                    /* 0E08 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42,  // units='B
                    /* 0E10 */  0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x54, 0x72, 0x75,  // ool'>Tru
                    /* 0E18 */  0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F,  // e</DSILo
                    /* 0E20 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0E28 */  0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50,  // deInBLLP
                    /* 0E30 */  0x45, 0x4F, 0x46, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // EOF>.   
                    /* 0E38 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0E40 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0E48 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42,  // rModeInB
                    /* 0E50 */  0x4C, 0x4C, 0x50, 0x20, 0x75, 0x6E, 0x69, 0x74,  // LLP unit
                    /* 0E58 */  0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27,  // s='Bool'
                    /* 0E60 */  0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44,  // >True</D
                    /* 0E68 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0E70 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0E78 */  0x42, 0x4C, 0x4C, 0x50, 0x3E, 0x0A, 0x20, 0x20,  // BLLP>.  
                    /* 0E80 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44,  //       <D
                    /* 0E88 */  0x53, 0x49, 0x52, 0x65, 0x66, 0x72, 0x65, 0x73,  // SIRefres
                    /* 0E90 */  0x68, 0x52, 0x61, 0x74, 0x65, 0x20, 0x75, 0x6E,  // hRate un
                    /* 0E98 */  0x69, 0x74, 0x73, 0x3D, 0x27, 0x69, 0x6E, 0x74,  // its='int
                    /* 0EA0 */  0x65, 0x67, 0x65, 0x72, 0x20, 0x51, 0x31, 0x36,  // eger Q16
                    /* 0EA8 */  0x2E, 0x31, 0x36, 0x27, 0x3E, 0x30, 0x78, 0x33,  // .16'>0x3
                    /* 0EB0 */  0x43, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x2F, 0x44,  // C0000</D
                    /* 0EB8 */  0x53, 0x49, 0x52, 0x65, 0x66, 0x72, 0x65, 0x73,  // SIRefres
                    /* 0EC0 */  0x68, 0x52, 0x61, 0x74, 0x65, 0x3E, 0x0A, 0x20,  // hRate>. 
                    /* 0EC8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C,  //        <
                    /* 0ED0 */  0x44, 0x53, 0x49, 0x50, 0x61, 0x63, 0x6B, 0x65,  // DSIPacke
                    /* 0ED8 */  0x74, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65,  // tTransfe
                    /* 0EE0 */  0x72, 0x48, 0x53, 0x20, 0x75, 0x6E, 0x69, 0x74,  // rHS unit
                    /* 0EE8 */  0x73, 0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27,  // s='Bool'
                    /* 0EF0 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 0EF8 */  0x44, 0x53, 0x49, 0x50, 0x61, 0x63, 0x6B, 0x65,  // DSIPacke
                    /* 0F00 */  0x74, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65,  // tTransfe
                    /* 0F08 */  0x72, 0x48, 0x53, 0x3E, 0x0A, 0x20, 0x20, 0x20,  // rHS>.   
                    /* 0F10 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53,  //      <DS
                    /* 0F18 */  0x49, 0x48, 0x6F, 0x73, 0x74, 0x4C, 0x61, 0x6E,  // IHostLan
                    /* 0F20 */  0x65, 0x4D, 0x61, 0x70, 0x70, 0x69, 0x6E, 0x67,  // eMapping
                    /* 0F28 */  0x20, 0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27,  //  units='
                    /* 0F30 */  0x69, 0x6E, 0x74, 0x65, 0x67, 0x65, 0x72, 0x27,  // integer'
                    /* 0F38 */  0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x48,  // >1</DSIH
                    /* 0F40 */  0x6F, 0x73, 0x74, 0x4C, 0x61, 0x6E, 0x65, 0x4D,  // ostLaneM
                    /* 0F48 */  0x61, 0x70, 0x70, 0x69, 0x6E, 0x67, 0x3E, 0x0A,  // apping>.
                    /* 0F50 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,  //         
                    /* 0F58 */  0x3C, 0x44, 0x53, 0x49, 0x50, 0x68, 0x79, 0x44,  // <DSIPhyD
                    /* 0F60 */  0x43, 0x44, 0x43, 0x4D, 0x6F, 0x64, 0x65, 0x20,  // CDCMode 
                    /* 0F68 */  0x75, 0x6E, 0x69, 0x74, 0x73, 0x3D, 0x27, 0x42,  // units='B
                    /* 0F70 */  0x6F, 0x6F, 0x6C, 0x27, 0x3E, 0x46, 0x61, 0x6C,  // ool'>Fal
                    /* 0F78 */  0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x50,  // se</DSIP
                    /* 0F80 */  0x68, 0x79, 0x44, 0x43, 0x44, 0x43, 0x4D, 0x6F,  // hyDCDCMo
                    /* 0F88 */  0x64, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x20, 0x20,  // de>.    
                    /* 0F90 */  0x20, 0x20, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  //     <DSI
                    /* 0F98 */  0x4C, 0x50, 0x31, 0x31, 0x41, 0x74, 0x49, 0x6E,  // LP11AtIn
                    /* 0FA0 */  0x69, 0x74, 0x20, 0x75, 0x6E, 0x69, 0x74, 0x73,  // it units
                    /* 0FA8 */  0x3D, 0x27, 0x42, 0x6F, 0x6F, 0x6C, 0x27, 0x3E,  // ='Bool'>
                    /* 0FB0 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 0FB8 */  0x53, 0x49, 0x4C, 0x50, 0x31, 0x31, 0x41, 0x74,  // SILP11At
                    /* 0FC0 */  0x49, 0x6E, 0x69, 0x74, 0x3E, 0x0A, 0x20, 0x20,  // Init>.  
                    /* 0FC8 */  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3C, 0x21,  //       <!
                    /* 0FD0 */  0x2D, 0x2D, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x42,  // -- <DSIB
                    /* 0FD8 */  0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46,  // itClockF
                    /* 0FE0 */  0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79,  // requency
                    /* 0FE8 */  0x3E, 0x34, 0x33, 0x37, 0x33, 0x33, 0x30, 0x38,  // >4373308
                    /* 0FF0 */  0x38, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x42,  // 80</DSIB
                    /* 0FF8 */  0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46,  // itClockF
                    /* 1000 */  0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79,  // requency
                    /* 1008 */  0x3E, 0x20, 0x2D, 0x2D, 0x3E, 0x0A, 0x20, 0x20,  // > -->.  
                    /* 1010 */  0x20, 0x20, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  //   </Grou
                    /* 1018 */  0x70, 0x3E, 0x0A, 0x3C, 0x2F, 0x47, 0x72, 0x6F,  // p>.</Gro
                    /* 1020 */  0x75, 0x70, 0x3E, 0x00                           // up>.
                })
                While (One)
                {
                    Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_0 = ToInteger (Arg2)
                    If ((_T_0 == 0x8000))
                    {
                        Local2 = PCF1 /* External reference */
                    }
                    ElseIf ((_T_0 == 0x0083890B))
                    {
                        Local2 = PCF3 /* \_SB_.GPU0._ROM.PCF3 */
                    }
                    ElseIf ((_T_0 == 0x0083890C))
                    {
                        Local2 = PCF4 /* \_SB_.GPU0._ROM.PCF4 */
                    }
                    ElseIf ((_T_0 == 0x0083790A))
                    {
                        Local2 = PCF5 /* \_SB_.GPU0._ROM.PCF5 */
                    }
                    Else
                    {
                        Local2 = PCFG /* \_SB_.GPU0._ROM.PCFG */
                    }

                    Break
                }

                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0._ROM.RBUF */
            }

            Method (PIGC, 1, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.PIGC.RBUF */
            }

            Method (PPCC, 1, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.PPCC.RBUF */
            }

            Method (PGCT, 1, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.PGCT.RBUF */
            }

            Method (PGRT, 2, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.PGRT.RBUF */
            }

            Method (PBRT, 2, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.PBRT.RBUF */
            }

            Method (BLCP, 1, NotSerialized)
            {
                Name (RBUF, Buffer (0x0100){})
                Return (RBUF) /* \_SB_.GPU0.BLCP.RBUF */
            }

            Name (_DOD, Package (0x01)  // _DOD: Display Output Devices
            {
                0x00024321
            })
            Device (AVS0)
            {
                Name (_ADR, 0x00024321)  // _ADR: Address
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    })
                    Return (RBUF) /* \_SB_.GPU0.AVS0._CRS.RBUF */
                }

                Name (_DEP, Package (0x02)  // _DEP: Dependencies
                {
                    \_SB.SMMU, , 
                    \_SB.VFE0, 
                })
            }

            Method (CHDV, 0, NotSerialized)
            {
                Name (CHIF, Package (0x02)
                {
                    One, 
                    Package (0x07)
                    {
                        "CHILDDEV", 
                        Zero, 
                        0x00024321, 
                        "QCOM_AVStream", 
                        Zero, 
                        "Qualcomm Camera AVStream Mini Driver", 
                        Package (0x04)
                        {
                            "COMPATIBLEIDS", 
                            0x02, 
                            "VEN_QCOM&DEV__AVSTREAM", 
                            "QCOM_AVSTREAM"
                        }
                    }
                })
                Return (CHIF) /* \_SB_.GPU0.CHDV.CHIF */
            }

            Method (REGR, 0, NotSerialized)
            {
                Name (RBUF, Package (0x07)
                {
                    Package (0x02)
                    {
                        "AllowDxgkrnlPerfManagement", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ForceMaxPerf", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "ForceActive", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "PreventPowerCollapse", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DisableThermalMitigation", 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "GRAPHICS", 
                        Package (0x02)
                        {
                            "PerfManagedByDxgkrnl", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "ForceFullMicrocodeReload", 
                            Zero
                        }, 

                        Package (0x05)
                        {
                            "DCVS", 
                            Package (0x02)
                            {
                                "Enable", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "IncreaseFilterBw", 
                                0x00020000
                            }, 

                            Package (0x02)
                            {
                                "DecreaseFilterBw", 
                                0x3333
                            }, 

                            Package (0x02)
                            {
                                "TargetBusyPct", 
                                0x55
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "VIDEO", 
                        Package (0x02)
                        {
                            "PerfManagedByDxgkrnl", 
                            One
                        }
                    }
                })
                Return (RBUF) /* \_SB_.GPU0.REGR.RBUF */
            }
        }

        Device (TPM0)
        {
            Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
            OperationRegion (TPMR, SystemMemory, 0xFE805716, 0x04)
            Field (TPMR, ByteAcc, NoLock, Preserve)
            {
                MORR,   8, 
                PCMD,   8, 
                CCMD,   8, 
                RCMD,   8
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (0x02)
                        {
                             0xFF, 0x01                                       // ..
                        })
                    }

                    If ((Arg2 == One))
                    {
                        Return ("1.2")
                    }

                    If ((Arg2 == 0x02))
                    {
                        Return (0x02)
                    }

                    If ((Arg2 == 0x03))
                    {
                        Local0 = Package (0x02)
                            {
                                Zero, 
                                Zero
                            }
                        Local1 = RefOf (Local0 [One])
                        Local1 = \_SB.TPM0.PCMD
                        Return (Local0)
                    }

                    If ((Arg2 == 0x04))
                    {
                        Return (0x02)
                    }

                    If ((Arg2 == 0x05))
                    {
                        Local0 = Package (0x03)
                            {
                                Zero, 
                                Zero, 
                                Zero
                            }
                        Local1 = RefOf (Local0 [One])
                        Local2 = RefOf (Local0 [0x02])
                        Local1 = \_SB.TPM0.CCMD
                        Local2 = \_SB.TPM0.RCMD
                        Return (Local0)
                    }

                    If ((Arg2 == 0x06))
                    {
                        Return (0x03)
                    }

                    If ((Arg2 == 0x07))
                    {
                        PCMD = DerefOf (Arg3 [Zero])
                        Return (Zero)
                    }

                    If ((Arg2 == 0x08))
                    {
                        Return (0x04)
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                If ((Arg0 == ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d") /* TPM Memory Clear */))
                {
                    Return (Zero)
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }

        Device (SCM0)
        {
            Name (_HID, "QCOM0E90")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x26)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x1C, 0x57, 0x80, 0xFE,  // .....W..
                    /* 0008 */  0x04, 0x00, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0x40, 0x01, 0x00, 0xD0, 0x03, 0x00,  // ..@.....
                    /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0xD0, 0x43, 0x01,  // ......C.
                    /* 0020 */  0x00, 0x30, 0x00, 0x00, 0x79, 0x00               // .0..y.
                })
                Return (RBUF) /* \_SB_.SCM0._CRS.RBUF */
            }

            Method (GCFG, 0, NotSerialized)
            {
                Name (SCFG, Package (0x00){})
                Return (SCFG) /* \_SB_.SCM0.GCFG.SCFG */
            }
        }

        Device (GIO0)
        {
            Name (_HID, "QCOM2405")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x29)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x51, 0xFD,  // ......Q.
                    /* 0008 */  0x00, 0x20, 0x00, 0x00, 0x89, 0x06, 0x00, 0x09,  // . ......
                    /* 0010 */  0x01, 0xF0, 0x00, 0x00, 0x00, 0x89, 0x06, 0x00,  // ........
                    /* 0018 */  0x09, 0x01, 0xF0, 0x00, 0x00, 0x00, 0x89, 0x06,  // ........
                    /* 0020 */  0x00, 0x09, 0x01, 0xF0, 0x00, 0x00, 0x00, 0x79,  // .......y
                    /* 0028 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GIO0._CRS.RBUF */
            }

            Method (OFNI, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x92, 0x00                                       // ..
                })
                Return (RBUF) /* \_SB_.GIO0.OFNI.RBUF */
            }
        }

        Device (HAL8)
        {
            Name (_HID, "QCOM1005")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (SDC1)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
            })
            Name (_HID, "QCOM2466")  // _HID: Hardware ID
            Name (_CID, "ACPIQCOM2466")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x23)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x49, 0x82, 0xF9,  // .....I..
                    /* 0008 */  0x00, 0x02, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0x9B, 0x00, 0x00, 0x00, 0x55, 0x2E, 0x00,  // .....U..
                    /* 0018 */  0x00, 0x00, 0x02, 0x55, 0x2F, 0x00, 0x01, 0x00,  // ...U/...
                    /* 0020 */  0x02, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.SDC1._CRS.RBUF */
            }

            Device (EMMC)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return (0x08)
                }

                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }
            }
        }

        Device (UAR3)
        {
            Name (_HID, "QCOM2424")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x3A)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0xF0, 0x91, 0xF9,  // ........
                    /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0x8D, 0x00, 0x00, 0x00, 0x8C, 0x20, 0x00,  // ...... .
                    /* 0018 */  0x01, 0x00, 0x01, 0x00, 0x03, 0x00, 0x02, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00,  // ........
                    /* 0028 */  0x23, 0x00, 0x00, 0x00, 0x09, 0x00, 0x5C, 0x5F,  // #.....\_
                    /* 0030 */  0x53, 0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00,  // SB.GIO0.
                    /* 0038 */  0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.UAR3._CRS.RBUF */
            }

            Method (PROP, 0, NotSerialized)
            {
                Name (RBUF, Package (0x0E)
                {
                    "DalDeviceId", 
                    0x02001002, 
                    "EnableDma", 
                    Zero, 
                    "QgicBase", 
                    0xF9000000, 
                    "ClkrgmBase", 
                    0xFC400000, 
                    "TlmmBase", 
                    0xFD510000, 
                    "GpioRxData", 
                    0x09, 
                    "GpioTxData", 
                    0x08
                })
                Return (RBUF) /* \_SB_.UAR3.PROP.RBUF */
            }
        }

        Device (SDC2)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, , 
                \_SB.GIO0, 
            })
            Name (_HID, "QCOM2466")  // _HID: Hardware ID
            Name (_CID, "ACPIQCOM2466")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x69)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x49, 0x8A, 0xF9,  // .....I..
                    /* 0008 */  0x00, 0x02, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0x9D, 0x00, 0x00, 0x00, 0x55, 0x34, 0x00,  // .....U4.
                    /* 0018 */  0x00, 0x00, 0x02, 0x55, 0x35, 0x00, 0x01, 0x00,  // ...U5...
                    /* 0020 */  0x02, 0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00,  // .. .....
                    /* 0028 */  0x1D, 0x00, 0x02, 0x00, 0x00, 0x30, 0x75, 0x17,  // .....0u.
                    /* 0030 */  0x00, 0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00,  // ....#...
                    /* 0038 */  0x2A, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47,  // *.\_SB.G
                    /* 0040 */  0x49, 0x4F, 0x30, 0x00, 0x8C, 0x20, 0x00, 0x01,  // IO0.. ..
                    /* 0048 */  0x01, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x00,  // ........
                    /* 0050 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0058 */  0x00, 0x00, 0x00, 0x2A, 0x00, 0x5C, 0x5F, 0x53,  // ...*.\_S
                    /* 0060 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x79,  // B.GIO0.y
                    /* 0068 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.SDC2._CRS.RBUF */
            }
        }

        Device (SMD0)
        {
            Name (_HID, "QCOM2407")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x83)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x90, 0x0D,  // ........
                    /* 0008 */  0x00, 0x00, 0x10, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x40, 0x48, 0xFD, 0x00, 0x10, 0x00, 0x00,  // .@H.....
                    /* 0018 */  0x86, 0x09, 0x00, 0x01, 0xF0, 0x2F, 0x80, 0xFE,  // ...../..
                    /* 0020 */  0x10, 0x00, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0028 */  0x08, 0x10, 0x01, 0xF9, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0030 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x39, 0x00, 0x00,  // .....9..
                    /* 0038 */  0x00, 0x89, 0x06, 0x00, 0x03, 0x01, 0xBC, 0x00,  // ........
                    /* 0040 */  0x00, 0x00, 0x89, 0x06, 0x00, 0x03, 0x01, 0xAE,  // ........
                    /* 0048 */  0x00, 0x00, 0x00, 0x89, 0x06, 0x00, 0x03, 0x01,  // ........
                    /* 0050 */  0x3B, 0x00, 0x00, 0x00, 0x89, 0x06, 0x00, 0x03,  // ;.......
                    /* 0058 */  0x01, 0xBE, 0x00, 0x00, 0x00, 0x89, 0x06, 0x00,  // ........
                    /* 0060 */  0x03, 0x01, 0xAF, 0x00, 0x00, 0x00, 0x89, 0x06,  // ........
                    /* 0068 */  0x00, 0x03, 0x01, 0x3A, 0x00, 0x00, 0x00, 0x89,  // ...:....
                    /* 0070 */  0x06, 0x00, 0x03, 0x01, 0xBD, 0x00, 0x00, 0x00,  // ........
                    /* 0078 */  0x89, 0x06, 0x00, 0x03, 0x01, 0xB0, 0x00, 0x00,  // ........
                    /* 0080 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.SMD0._CRS.RBUF */
            }

            Method (INTR, 0, NotSerialized)
            {
                Name (RBUF, Package (0x28)
                {
                    0x03, 
                    0x03, 
                    0x03, 
                    0x03, 
                    One, 
                    0xF9011008, 
                    0x1000, 
                    Zero, 
                    0x02, 
                    0xF9011008, 
                    0x0100, 
                    Zero, 
                    0x04, 
                    0xF9011008, 
                    0x00020000, 
                    Zero, 
                    One, 
                    0xF9011008, 
                    0x4000, 
                    Zero, 
                    0x02, 
                    0xF9011008, 
                    0x0400, 
                    Zero, 
                    0x04, 
                    0xF9011008, 
                    0x00040000, 
                    Zero, 
                    One, 
                    0xF9011008, 
                    0x2000, 
                    Zero, 
                    0x02, 
                    0xF9011008, 
                    0x0200, 
                    Zero, 
                    0x03, 
                    0xF9011008, 
                    0x00080000, 
                    Zero
                })
                Return (RBUF) /* \_SB_.SMD0.INTR.RBUF */
            }
        }

        Device (IPC0)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.SMD0, 
            })
            Name (_HID, "QCOM240A")  // _HID: Hardware ID
        }

        Device (SPMI)
        {
            Name (_HID, "QCOM2404")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x4C, 0xFC,  // ......L.
                    /* 0008 */  0x00, 0x00, 0x10, 0x00, 0x79, 0x00               // ....y.
                })
                Return (RBUF) /* \_SB_.SPMI._CRS.RBUF */
            }

            Method (CONF, 0, NotSerialized)
            {
                Name (XBUF, Buffer (0x02)
                {
                     0x00, 0x01                                       // ..
                })
                Return (XBUF) /* \_SB_.SPMI.CONF.XBUF */
            }
        }

        Device (RFS0)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.IPC0, 
            })
            Name (_HID, "QCOM2423")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x1A)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xC8, 0x0D,  // ........
                    /* 0008 */  0x00, 0x00, 0x18, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0xC6, 0x0D, 0x00, 0x00, 0x02, 0x00,  // ........
                    /* 0018 */  0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.RFS0._CRS.RBUF */
            }
        }

        Device (I2C1)
        {
            Name (_HID, "QCOM240E")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.BAM3, , 
                \_SB.PEP0, 
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x30, 0x92, 0xF9,  // .....0..
                    /* 0008 */  0x00, 0x08, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0x7F, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.I2C1._CRS.RBUF */
            }

            Method (FNOC, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x01, 0x01, 0x00, 0x40, 0x90, 0xF9, 0x0D, 0x0C,  // ...@....
                    /* 0008 */  0x00, 0x04, 0x00, 0xF8, 0x24, 0x01               // ....$.
                })
                Return (RBUF) /* \_SB_.I2C1.FNOC.RBUF */
            }
        }

        Device (I2C3)
        {
            Name (_HID, "QCOM240E")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.BAM3, , 
                \_SB.PEP0, 
            })
            Name (AVBL, Zero)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x09))
                {
                    AVBL = Arg1
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x50, 0x92, 0xF9,  // .....P..
                    /* 0008 */  0x00, 0x08, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0x81, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.I2C3._CRS.RBUF */
            }

            Method (FNOC, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x03, 0x01, 0x00, 0x40, 0x90, 0xF9, 0x11, 0x10,  // ...@....
                    /* 0008 */  0x00, 0x04, 0x00, 0xF8, 0x24, 0x01               // ....$.
                })
                Return (RBUF) /* \_SB_.I2C3.FNOC.RBUF */
            }
        }

        Device (I2C5)
        {
            Name (_HID, "QCOM240E")  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.BAM3, , 
                \_SB.PEP0, 
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x70, 0x92, 0xF9,  // .....p..
                    /* 0008 */  0x00, 0x08, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0x83, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.I2C5._CRS.RBUF */
            }

            Method (FNOC, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x05, 0x01, 0x00, 0x40, 0x90, 0xF9, 0x15, 0x14,  // ...@....
                    /* 0008 */  0x00, 0x04, 0x00, 0xF8, 0x24, 0x01               // ....$.
                })
                Return (RBUF) /* \_SB_.I2C5.FNOC.RBUF */
            }
        }

        Device (SPI4)
        {
            Name (_HID, "QCOM240C")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, , 
                \_SB.BAM3, 
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x60, 0x92, 0xF9,  // .....`..
                    /* 0008 */  0x00, 0x08, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0x82, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Return (RBUF) /* \_SB_.SPI4._CRS.RBUF */
            }

            Method (FNOC, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x09)
                {
                    /* 0000 */  0x04, 0x00, 0x40, 0x90, 0xF9, 0x13, 0x12, 0x00,  // ..@.....
                    /* 0008 */  0x01                                             // .
                })
                Return (RBUF) /* \_SB_.SPI4.FNOC.RBUF */
            }
        }

        Device (UFN1)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
            })
            Name (_HID, "QCOM2488")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (REG, Zero)
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x17)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x50, 0xA5, 0xF9,  // .....P..
                    /* 0008 */  0x00, 0x03, 0x00, 0x00, 0x89, 0x06, 0x00, 0x01,  // ........
                    /* 0010 */  0x01, 0xA6, 0x00, 0x00, 0x00, 0x79, 0x00         // .....y.
                })
                Local0 = RBUF /* \_SB_.UFN1._CRS.RBUF */
                ConcatenateResTemplate (Local0, Buffer (0x0B)
                    {
                        /* 0000 */  0x89, 0x06, 0x00, 0x11, 0x01, 0xAC, 0x00, 0x00,  // ........
                        /* 0008 */  0x00, 0x79, 0x00                                 // .y.
                    }, Local1)
                ConcatenateResTemplate (Local1, Buffer (0x29)
                    {
                        /* 0000 */  0x8C, 0x24, 0x00, 0x01, 0x00, 0x01, 0x00, 0x1D,  // .$......
                        /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                        /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x04, 0x00, 0x02,  // ...#....
                        /* 0018 */  0x10, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D,  // .\_SB.PM
                        /* 0020 */  0x30, 0x31, 0x00, 0x21, 0x01, 0x02, 0x19, 0x79,  // 01.!...y
                        /* 0028 */  0x00                                             // .
                    }, Local2)
                ConcatenateResTemplate (Local2, Buffer (0x29)
                    {
                        /* 0000 */  0x8C, 0x24, 0x00, 0x01, 0x00, 0x01, 0x00, 0x1D,  // .$......
                        /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                        /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x04, 0x00, 0x01,  // ...#....
                        /* 0018 */  0x10, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D,  // .\_SB.PM
                        /* 0020 */  0x30, 0x31, 0x00, 0x20, 0x01, 0x02, 0x19, 0x79,  // 01. ...y
                        /* 0028 */  0x00                                             // .
                    }, Local3)
                Return (Local3)
            }

            OperationRegion (UCDR, SystemMemory, 0xF9A55000, 0x1000)
            Field (UCDR, WordAcc, NoLock, Preserve)
            {
                Offset (0x44), 
                SCRA,   32, 
                Offset (0x90), 
                AHBB,   32, 
                Offset (0x98), 
                AHBM,   32, 
                GENC,   32, 
                GETC,   32, 
                Offset (0x140), 
                UCMD,   32, 
                Offset (0x170), 
                ULPI,   32, 
                Offset (0x184), 
                PTSC,   32, 
                Offset (0x1A8), 
                MODE,   32
            }

            Method (_UBF, 0, NotSerialized)
            {
                MODE = 0x02
                REG = PTSC /* \_SB_.UFN1.PTSC */
                PTSC = (REG | 0x02)
                AHBM = 0x08
                AHBB = Zero
                GENC = 0x0CB0
                ULPI = 0x60960003
                REG = GETC /* \_SB_.UFN1.GETC */
                GETC = (REG | 0x80)
                REG = UCMD /* \_SB_.UFN1.UCMD */
                UCMD = (REG | 0x02000000)
                SCRA = 0x39
            }
        }

        Device (QBCC)
        {
            Name (_HID, "QCOM241D")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x1A)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0xF0, 0xBF, 0xF9,  // ........
                    /* 0008 */  0x24, 0x01, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // $.......
                    /* 0010 */  0x00, 0xA0, 0x41, 0xFD, 0x0B, 0x50, 0x00, 0x00,  // ..A..P..
                    /* 0018 */  0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.QBCC._CRS.RBUF */
            }
        }

        Device (QDIG)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.SMD0, 
            })
            Name (_HID, "QCOM2413")  // _HID: Hardware ID
        }

        Device (QCDB)
        {
            Name (_HID, "QCOM248B")  // _HID: Hardware ID
        }

        Device (CPU0)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (CPU1)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
        }

        Device (CPU2)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
        }

        Device (CPU3)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
        }

        Device (GPS)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.SMD0, 
            })
            Name (_HID, "QCOM_GPS")  // _HID: Hardware ID
            Name (_CID, "ACPIQCOM_GPS")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (ADC1)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.SPMI, , 
                \_SB.PMIC, 
            })
            Name (_HID, "QCOM240F")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (INTB, Buffer (0x6E)
                {
                    /* 0000 */  0x8C, 0x21, 0x00, 0x01, 0x00, 0x01, 0x00, 0x11,  // .!......
                    /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x01, 0x00, 0x88,  // ...#....
                    /* 0018 */  0x01, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D,  // .\_SB.PM
                    /* 0020 */  0x30, 0x31, 0x00, 0x02, 0x8C, 0x21, 0x00, 0x01,  // 01...!..
                    /* 0028 */  0x00, 0x01, 0x00, 0x11, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0030 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0038 */  0x00, 0x01, 0x00, 0xA0, 0x01, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 0040 */  0x42, 0x2E, 0x50, 0x4D, 0x30, 0x31, 0x00, 0x03,  // B.PM01..
                    /* 0048 */  0x8C, 0x21, 0x00, 0x01, 0x00, 0x01, 0x00, 0x11,  // .!......
                    /* 0050 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0058 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x01, 0x00, 0xB0,  // ...#....
                    /* 0060 */  0x01, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D,  // .\_SB.PM
                    /* 0068 */  0x30, 0x31, 0x00, 0x02, 0x79, 0x00               // 01..y.
                })
                Name (NAM, Buffer (0x0A)
                {
                    "\\_SB.SPMI"
                })
                Name (PON1, Buffer (0x0C)
                {
                    /* 0000 */  0x8E, 0x13, 0x00, 0x01, 0x00, 0xC1, 0x02, 0x00,  // ........
                    /* 0008 */  0x31, 0x01, 0x00, 0x00                           // 1...
                })
                Name (PON2, Buffer (0x0C)
                {
                    /* 0000 */  0x8E, 0x13, 0x00, 0x01, 0x00, 0xC1, 0x02, 0x00,  // ........
                    /* 0008 */  0x34, 0x01, 0x00, 0x00                           // 4...
                })
                Name (PON3, Buffer (0x0C)
                {
                    /* 0000 */  0x8E, 0x13, 0x00, 0x01, 0x00, 0xC1, 0x02, 0x00,  // ........
                    /* 0008 */  0x36, 0x01, 0x00, 0x00                           // 6...
                })
                Name (END, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Concatenate (PON1, NAM, Local1)
                Concatenate (PON2, NAM, Local2)
                Concatenate (PON3, NAM, Local3)
                Concatenate (Local1, Local2, Local4)
                Concatenate (Local3, INTB, Local5)
                Concatenate (Local4, Local5, Local0)
                Return (Local0)
            }

            Method (ADDV, 0, NotSerialized)
            {
                Return (Package (0x03)
                {
                    One, 
                    One, 
                    One
                })
            }

            Method (GENP, 0, NotSerialized)
            {
                Return (Package (0x0D)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x08, 
                    0x09, 
                    0x0708, 
                    Zero, 
                    0x0271, 
                    0x04E2
                })
            }

            Method (CHAN, 0, NotSerialized)
            {
                Return (Package (0x15)
                {
                    Package (0x12)
                    {
                        "USB_IN", 
                        Zero, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        0x14, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VCHG", 
                        0x02, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x0A, 
                        0x51, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VCOIN", 
                        0x05, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        0x03, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VBATT", 
                        0x06, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        0x03, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VBATT_GSM", 
                        0x06, 
                        0x02, 
                        Zero, 
                        0xFFFF, 
                        One, 
                        Zero, 
                        One, 
                        0x03, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VBATT_FLASH", 
                        0x06, 
                        0x02, 
                        Zero, 
                        0xFFFF, 
                        One, 
                        One, 
                        One, 
                        0x03, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VPH_PWR", 
                        0x07, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        0x03, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "PMIC_THERM", 
                        0x08, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        PTCF, PTCI (0x02), 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "CHG_TEMP", 
                        0x0B, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        PTCF, PTCI (0x02), 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "BATT_THERM", 
                        0x30, 
                        Zero, 
                        One, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        BTTB, , 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "BATT_THERM_K", 
                        0x30, 
                        Zero, 
                        One, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        BTTK, , 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "BATT_ID", 
                        0x31, 
                        Zero, 
                        One, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "XO_THERM", 
                        0x3C, 
                        Zero, 
                        0x05, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        XOCF, Zero, 
                        One, 
                        XTTB, , 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "XO_THERM_GPS", 
                        0x3C, 
                        One, 
                        0x05, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        XOCF, Zero, 
                        One, 
                        XTTB, , 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "PA_THERM", 
                        0x13, 
                        Zero, 
                        One, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        SYTB, , 
                        Zero, 
                        0x000186A0, 
                        One, 
                        0x03, 
                        0x03
                    }, 

                    Package (0x12)
                    {
                        "PLATFORM_ID", 
                        0x36, 
                        Zero, 
                        One, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VDD", 
                        0x0F, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "GND", 
                        0x0E, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VREF1", 
                        0x09, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VREF2", 
                        0x0A, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "BATT_THERM2", 
                        0x12, 
                        Zero, 
                        One, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        BTTB, , 
                        One, 
                        0x000186A0, 
                        One, 
                        0x02, 
                        0x02
                    }
                })
            }

            Method (CBCH, 0, NotSerialized)
            {
                Return (Package (0x04)
                {
                    Package (0x12)
                    {
                        "VDD", 
                        0x0F, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "GND", 
                        0x0E, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VREF1", 
                        0x09, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x12)
                    {
                        "VREF2", 
                        0x0A, 
                        Zero, 
                        Zero, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        0x000186A0, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }

            Method (CFGS, 0, NotSerialized)
            {
                Return (Package (0x03)
                {
                    Package (0x03)
                    {
                        One, 
                        Zero, 
                        0x01AB
                    }, 

                    Package (0x03)
                    {
                        0x03, 
                        One, 
                        0x0355
                    }, 

                    Package (0x03)
                    {
                        Zero, 
                        One, 
                        0x6B
                    }
                })
            }

            Method (SEQP, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    Package (0x04)
                    {
                        0x07, 
                        0x05, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        Zero, 
                        0x0F, 
                        One, 
                        0x02
                    }
                })
            }

            Method (PTCF, 1, NotSerialized)
            {
                Local0 = (Arg0 >> One)
                Local0 -= 0x00042B08
                Return (Local0)
            }

            Method (PTCI, 1, NotSerialized)
            {
                Local0 = (Arg0 + 0x00042B08)
                Local0 <<= One
                Return (Local0)
            }

            Method (XOCF, 1, NotSerialized)
            {
                Local1 = (Arg0 << 0x0E)
                Local0 = (0xFFFF - Arg0)
                Local2 = (Local0 >> One)
                If ((Local0 == Zero))
                {
                    Return (0x7FFFFFFF)
                }

                Local3 = (Local1 + Local2)
                Divide (Local3, Local0, Local4, Local3)
                If ((Local3 > 0x7FFFFFFF))
                {
                    Return (0x7FFFFFFF)
                }

                Return (Local3)
            }

            Method (BTTB, 0, NotSerialized)
            {
                Return (Package (0x16)
                {
                    Package (0x02)
                    {
                        0x064A, 
                        0xFFFFFFE2
                    }, 

                    Package (0x02)
                    {
                        0x05CE, 
                        0xFFFFFFEC
                    }, 

                    Package (0x02)
                    {
                        0x0537, 
                        0xFFFFFFF6
                    }, 

                    Package (0x02)
                    {
                        0x04E4, 
                        0xFFFFFFFB
                    }, 

                    Package (0x02)
                    {
                        0x0497, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x0434, 
                        0x05
                    }, 

                    Package (0x02)
                    {
                        0x03DD, 
                        0x0A
                    }, 

                    Package (0x02)
                    {
                        0x038B, 
                        0x0F
                    }, 

                    Package (0x02)
                    {
                        0x0338, 
                        0x14
                    }, 

                    Package (0x02)
                    {
                        0x02F3, 
                        0x19
                    }, 

                    Package (0x02)
                    {
                        0x02BC, 
                        0x1E
                    }, 

                    Package (0x02)
                    {
                        0x0280, 
                        0x23
                    }, 

                    Package (0x02)
                    {
                        0x0248, 
                        0x28
                    }, 

                    Package (0x02)
                    {
                        0x0217, 
                        0x2D
                    }, 

                    Package (0x02)
                    {
                        0x01F0, 
                        0x32
                    }, 

                    Package (0x02)
                    {
                        0x01CD, 
                        0x37
                    }, 

                    Package (0x02)
                    {
                        0x01B2, 
                        0x3C
                    }, 

                    Package (0x02)
                    {
                        0x0199, 
                        0x41
                    }, 

                    Package (0x02)
                    {
                        0x0185, 
                        0x46
                    }, 

                    Package (0x02)
                    {
                        0x0173, 
                        0x4B
                    }, 

                    Package (0x02)
                    {
                        0x0171, 
                        0x50
                    }, 

                    Package (0x02)
                    {
                        0x0164, 
                        0x55
                    }
                })
            }

            Method (BTTK, 0, NotSerialized)
            {
                Return (Package (0x16)
                {
                    Package (0x02)
                    {
                        0x064A, 
                        0x0980
                    }, 

                    Package (0x02)
                    {
                        0x05CE, 
                        0x09E4
                    }, 

                    Package (0x02)
                    {
                        0x0537, 
                        0x0A48
                    }, 

                    Package (0x02)
                    {
                        0x04E4, 
                        0x0A7A
                    }, 

                    Package (0x02)
                    {
                        0x0497, 
                        0x0AAC
                    }, 

                    Package (0x02)
                    {
                        0x0434, 
                        0x0ADE
                    }, 

                    Package (0x02)
                    {
                        0x03DD, 
                        0x0B10
                    }, 

                    Package (0x02)
                    {
                        0x038B, 
                        0x0B42
                    }, 

                    Package (0x02)
                    {
                        0x0338, 
                        0x0B74
                    }, 

                    Package (0x02)
                    {
                        0x02F3, 
                        0x0BA6
                    }, 

                    Package (0x02)
                    {
                        0x02BC, 
                        0x0BD8
                    }, 

                    Package (0x02)
                    {
                        0x0280, 
                        0x0C0A
                    }, 

                    Package (0x02)
                    {
                        0x0248, 
                        0x0C3C
                    }, 

                    Package (0x02)
                    {
                        0x0217, 
                        0x0C6E
                    }, 

                    Package (0x02)
                    {
                        0x01F0, 
                        0x0CA0
                    }, 

                    Package (0x02)
                    {
                        0x01CD, 
                        0x0CD2
                    }, 

                    Package (0x02)
                    {
                        0x01B2, 
                        0x0D04
                    }, 

                    Package (0x02)
                    {
                        0x0199, 
                        0x0D36
                    }, 

                    Package (0x02)
                    {
                        0x0185, 
                        0x0D68
                    }, 

                    Package (0x02)
                    {
                        0x0173, 
                        0x0D9A
                    }, 

                    Package (0x02)
                    {
                        0x0171, 
                        0x0DCC
                    }, 

                    Package (0x02)
                    {
                        0x0164, 
                        0x0DFE
                    }
                })
            }

            Method (SYTB, 0, NotSerialized)
            {
                Return (Package (0x22)
                {
                    Package (0x02)
                    {
                        0x06DF, 
                        0xFFFFFFD8
                    }, 

                    Package (0x02)
                    {
                        0x06CE, 
                        0xFFFFFFDD
                    }, 

                    Package (0x02)
                    {
                        0x06B8, 
                        0xFFFFFFE2
                    }, 

                    Package (0x02)
                    {
                        0x069B, 
                        0xFFFFFFE7
                    }, 

                    Package (0x02)
                    {
                        0x0676, 
                        0xFFFFFFEC
                    }, 

                    Package (0x02)
                    {
                        0x0648, 
                        0xFFFFFFF1
                    }, 

                    Package (0x02)
                    {
                        0x060F, 
                        0xFFFFFFF6
                    }, 

                    Package (0x02)
                    {
                        0x05CC, 
                        0xFFFFFFFB
                    }, 

                    Package (0x02)
                    {
                        0x057D, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x0524, 
                        0x05
                    }, 

                    Package (0x02)
                    {
                        0x04C2, 
                        0x0A
                    }, 

                    Package (0x02)
                    {
                        0x045A, 
                        0x0F
                    }, 

                    Package (0x02)
                    {
                        0x03EF, 
                        0x14
                    }, 

                    Package (0x02)
                    {
                        0x0384, 
                        0x19
                    }, 

                    Package (0x02)
                    {
                        0x031C, 
                        0x1E
                    }, 

                    Package (0x02)
                    {
                        0x02B9, 
                        0x23
                    }, 

                    Package (0x02)
                    {
                        0x025E, 
                        0x28
                    }, 

                    Package (0x02)
                    {
                        0x020A, 
                        0x2D
                    }, 

                    Package (0x02)
                    {
                        0x01C1, 
                        0x32
                    }, 

                    Package (0x02)
                    {
                        0x0180, 
                        0x37
                    }, 

                    Package (0x02)
                    {
                        0x0147, 
                        0x3C
                    }, 

                    Package (0x02)
                    {
                        0x0116, 
                        0x41
                    }, 

                    Package (0x02)
                    {
                        0xEE, 
                        0x46
                    }, 

                    Package (0x02)
                    {
                        0xC9, 
                        0x4B
                    }, 

                    Package (0x02)
                    {
                        0xAD, 
                        0x50
                    }, 

                    Package (0x02)
                    {
                        0x93, 
                        0x55
                    }, 

                    Package (0x02)
                    {
                        0x7E, 
                        0x5A
                    }, 

                    Package (0x02)
                    {
                        0x6C, 
                        0x5F
                    }, 

                    Package (0x02)
                    {
                        0x5C, 
                        0x64
                    }, 

                    Package (0x02)
                    {
                        0x4F, 
                        0x69
                    }, 

                    Package (0x02)
                    {
                        0x45, 
                        0x6E
                    }, 

                    Package (0x02)
                    {
                        0x3C, 
                        0x73
                    }, 

                    Package (0x02)
                    {
                        0x34, 
                        0x78
                    }, 

                    Package (0x02)
                    {
                        0x2D, 
                        0x7D
                    }
                })
            }

            Method (XTTB, 0, NotSerialized)
            {
                Return (Package (0xA8)
                {
                    Package (0x02)
                    {
                        0x000AA0A3, 
                        0xFFFF6000
                    }, 

                    Package (0x02)
                    {
                        0x0009E7BC, 
                        0xFFFF6400
                    }, 

                    Package (0x02)
                    {
                        0x00093CB8, 
                        0xFFFF6800
                    }, 

                    Package (0x02)
                    {
                        0x00089E49, 
                        0xFFFF6C00
                    }, 

                    Package (0x02)
                    {
                        0x00080B6F, 
                        0xFFFF7000
                    }, 

                    Package (0x02)
                    {
                        0x00078322, 
                        0xFFFF7400
                    }, 

                    Package (0x02)
                    {
                        0x000704E7, 
                        0xFFFF7800
                    }, 

                    Package (0x02)
                    {
                        0x00068F9E, 
                        0xFFFF7C00
                    }, 

                    Package (0x02)
                    {
                        0x000622B3, 
                        0xFFFF8000
                    }, 

                    Package (0x02)
                    {
                        0x0005BD80, 
                        0xFFFF8400
                    }, 

                    Package (0x02)
                    {
                        0x00055F4B, 
                        0xFFFF8800
                    }, 

                    Package (0x02)
                    {
                        0x000507F2, 
                        0xFFFF8C00
                    }, 

                    Package (0x02)
                    {
                        0x0004B68C, 
                        0xFFFF9000
                    }, 

                    Package (0x02)
                    {
                        0x00046AC8, 
                        0xFFFF9400
                    }, 

                    Package (0x02)
                    {
                        0x00042439, 
                        0xFFFF9800
                    }, 

                    Package (0x02)
                    {
                        0x0003E26E, 
                        0xFFFF9C00
                    }, 

                    Package (0x02)
                    {
                        0x0003A537, 
                        0xFFFFA000
                    }, 

                    Package (0x02)
                    {
                        0x00036C14, 
                        0xFFFFA400
                    }, 

                    Package (0x02)
                    {
                        0x000336C7, 
                        0xFFFFA800
                    }, 

                    Package (0x02)
                    {
                        0x00030508, 
                        0xFFFFAC00
                    }, 

                    Package (0x02)
                    {
                        0x0002D697, 
                        0xFFFFB000
                    }, 

                    Package (0x02)
                    {
                        0x0002AB33, 
                        0xFFFFB400
                    }, 

                    Package (0x02)
                    {
                        0x000282A9, 
                        0xFFFFB800
                    }, 

                    Package (0x02)
                    {
                        0x00025CC2, 
                        0xFFFFBC00
                    }, 

                    Package (0x02)
                    {
                        0x00023950, 
                        0xFFFFC000
                    }, 

                    Package (0x02)
                    {
                        0x00021831, 
                        0xFFFFC400
                    }, 

                    Package (0x02)
                    {
                        0x0001F91B, 
                        0xFFFFC800
                    }, 

                    Package (0x02)
                    {
                        0x0001DC0A, 
                        0xFFFFCC00
                    }, 

                    Package (0x02)
                    {
                        0x0001C0D0, 
                        0xFFFFD000
                    }, 

                    Package (0x02)
                    {
                        0x0001A74D, 
                        0xFFFFD400
                    }, 

                    Package (0x02)
                    {
                        0x00018F6C, 
                        0xFFFFD800
                    }, 

                    Package (0x02)
                    {
                        0x000178F3, 
                        0xFFFFDC00
                    }, 

                    Package (0x02)
                    {
                        0x000163E7, 
                        0xFFFFE000
                    }, 

                    Package (0x02)
                    {
                        0x00015027, 
                        0xFFFFE400
                    }, 

                    Package (0x02)
                    {
                        0x00013D9C, 
                        0xFFFFE800
                    }, 

                    Package (0x02)
                    {
                        0x00012C39, 
                        0xFFFFEC00
                    }, 

                    Package (0x02)
                    {
                        0x00011BD4, 
                        0xFFFFF000
                    }, 

                    Package (0x02)
                    {
                        0x00010C72, 
                        0xFFFFF400
                    }, 

                    Package (0x02)
                    {
                        0xFDFC, 
                        0xFFFFF800
                    }, 

                    Package (0x02)
                    {
                        0xF062, 
                        0xFFFFFC00
                    }, 

                    Package (0x02)
                    {
                        0xE395, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0xD789, 
                        0x0400
                    }, 

                    Package (0x02)
                    {
                        0xCC32, 
                        0x0800
                    }, 

                    Package (0x02)
                    {
                        0xC182, 
                        0x0C00
                    }, 

                    Package (0x02)
                    {
                        0xB772, 
                        0x1000
                    }, 

                    Package (0x02)
                    {
                        0xADF3, 
                        0x1400
                    }, 

                    Package (0x02)
                    {
                        0xA503, 
                        0x1800
                    }, 

                    Package (0x02)
                    {
                        0x9C93, 
                        0x1C00
                    }, 

                    Package (0x02)
                    {
                        0x949D, 
                        0x2000
                    }, 

                    Package (0x02)
                    {
                        0x8D1A, 
                        0x2400
                    }, 

                    Package (0x02)
                    {
                        0x8604, 
                        0x2800
                    }, 

                    Package (0x02)
                    {
                        0x7F50, 
                        0x2C00
                    }, 

                    Package (0x02)
                    {
                        0x78FC, 
                        0x3000
                    }, 

                    Package (0x02)
                    {
                        0x7302, 
                        0x3400
                    }, 

                    Package (0x02)
                    {
                        0x6D5B, 
                        0x3800
                    }, 

                    Package (0x02)
                    {
                        0x6800, 
                        0x3C00
                    }, 

                    Package (0x02)
                    {
                        0x62F5, 
                        0x4000
                    }, 

                    Package (0x02)
                    {
                        0x5E2D, 
                        0x4400
                    }, 

                    Package (0x02)
                    {
                        0x59A7, 
                        0x4800
                    }, 

                    Package (0x02)
                    {
                        0x555E, 
                        0x4C00
                    }, 

                    Package (0x02)
                    {
                        0x5147, 
                        0x5000
                    }, 

                    Package (0x02)
                    {
                        0x4D77, 
                        0x5400
                    }, 

                    Package (0x02)
                    {
                        0x49D3, 
                        0x5800
                    }, 

                    Package (0x02)
                    {
                        0x4660, 
                        0x5C00
                    }, 

                    Package (0x02)
                    {
                        0x431A, 
                        0x6000
                    }, 

                    Package (0x02)
                    {
                        0x4000, 
                        0x6400
                    }, 

                    Package (0x02)
                    {
                        0x3D0F, 
                        0x6800
                    }, 

                    Package (0x02)
                    {
                        0x3A44, 
                        0x6C00
                    }, 

                    Package (0x02)
                    {
                        0x379D, 
                        0x7000
                    }, 

                    Package (0x02)
                    {
                        0x3519, 
                        0x7400
                    }, 

                    Package (0x02)
                    {
                        0x32B0, 
                        0x7800
                    }, 

                    Package (0x02)
                    {
                        0x3070, 
                        0x7C00
                    }, 

                    Package (0x02)
                    {
                        0x2E48, 
                        0x8000
                    }, 

                    Package (0x02)
                    {
                        0x2C3C, 
                        0x8400
                    }, 

                    Package (0x02)
                    {
                        0x2A49, 
                        0x8800
                    }, 

                    Package (0x02)
                    {
                        0x2872, 
                        0x8C00
                    }, 

                    Package (0x02)
                    {
                        0x26AC, 
                        0x9000
                    }, 

                    Package (0x02)
                    {
                        0x24FF, 
                        0x9400
                    }, 

                    Package (0x02)
                    {
                        0x2366, 
                        0x9800
                    }, 

                    Package (0x02)
                    {
                        0x21E2, 
                        0x9C00
                    }, 

                    Package (0x02)
                    {
                        0x2072, 
                        0xA000
                    }, 

                    Package (0x02)
                    {
                        0x1F0F, 
                        0xA400
                    }, 

                    Package (0x02)
                    {
                        0x1DC0, 
                        0xA800
                    }, 

                    Package (0x02)
                    {
                        0x1C80, 
                        0xAC00
                    }, 

                    Package (0x02)
                    {
                        0x1B4F, 
                        0xB000
                    }, 

                    Package (0x02)
                    {
                        0x1A2D, 
                        0xB400
                    }, 

                    Package (0x02)
                    {
                        0x1918, 
                        0xB800
                    }, 

                    Package (0x02)
                    {
                        0x1810, 
                        0xBC00
                    }, 

                    Package (0x02)
                    {
                        0x1714, 
                        0xC000
                    }, 

                    Package (0x02)
                    {
                        0x1623, 
                        0xC400
                    }, 

                    Package (0x02)
                    {
                        0x153F, 
                        0xC800
                    }, 

                    Package (0x02)
                    {
                        0x1463, 
                        0xCC00
                    }, 

                    Package (0x02)
                    {
                        0x1392, 
                        0xD000
                    }, 

                    Package (0x02)
                    {
                        0x12CA, 
                        0xD400
                    }, 

                    Package (0x02)
                    {
                        0x120B, 
                        0xD800
                    }, 

                    Package (0x02)
                    {
                        0x1158, 
                        0xDC00
                    }, 

                    Package (0x02)
                    {
                        0x10A7, 
                        0xE000
                    }, 

                    Package (0x02)
                    {
                        0x1001, 
                        0xE400
                    }, 

                    Package (0x02)
                    {
                        0x0F62, 
                        0xE800
                    }, 

                    Package (0x02)
                    {
                        0x0EC9, 
                        0xEC00
                    }, 

                    Package (0x02)
                    {
                        0x0E35, 
                        0xF000
                    }, 

                    Package (0x02)
                    {
                        0x0DAD, 
                        0xF400
                    }, 

                    Package (0x02)
                    {
                        0x0D28, 
                        0xF800
                    }, 

                    Package (0x02)
                    {
                        0x0CA8, 
                        0xFC00
                    }, 

                    Package (0x02)
                    {
                        0x0C2E, 
                        0x00010000
                    }, 

                    Package (0x02)
                    {
                        0x0BB6, 
                        0x00010400
                    }, 

                    Package (0x02)
                    {
                        0x0B49, 
                        0x00010800
                    }, 

                    Package (0x02)
                    {
                        0x0ADE, 
                        0x00010C00
                    }, 

                    Package (0x02)
                    {
                        0x0A78, 
                        0x00011000
                    }, 

                    Package (0x02)
                    {
                        0x0A15, 
                        0x00011400
                    }, 

                    Package (0x02)
                    {
                        0x09BA, 
                        0x00011800
                    }, 

                    Package (0x02)
                    {
                        0x095D, 
                        0x00011C00
                    }, 

                    Package (0x02)
                    {
                        0x0906, 
                        0x00012000
                    }, 

                    Package (0x02)
                    {
                        0x08B3, 
                        0x00012400
                    }, 

                    Package (0x02)
                    {
                        0x0863, 
                        0x00012800
                    }, 

                    Package (0x02)
                    {
                        0x0810, 
                        0x00012C00
                    }, 

                    Package (0x02)
                    {
                        0x07CE, 
                        0x00013000
                    }, 

                    Package (0x02)
                    {
                        0x0787, 
                        0x00013400
                    }, 

                    Package (0x02)
                    {
                        0x0744, 
                        0x00013800
                    }, 

                    Package (0x02)
                    {
                        0x0703, 
                        0x00013C00
                    }, 

                    Package (0x02)
                    {
                        0x06C8, 
                        0x00014000
                    }, 

                    Package (0x02)
                    {
                        0x0689, 
                        0x00014400
                    }, 

                    Package (0x02)
                    {
                        0x064F, 
                        0x00014800
                    }, 

                    Package (0x02)
                    {
                        0x0618, 
                        0x00014C00
                    }, 

                    Package (0x02)
                    {
                        0x05E3, 
                        0x00015000
                    }, 

                    Package (0x02)
                    {
                        0x05B0, 
                        0x00015400
                    }, 

                    Package (0x02)
                    {
                        0x057F, 
                        0x00015800
                    }, 

                    Package (0x02)
                    {
                        0x0550, 
                        0x00015C00
                    }, 

                    Package (0x02)
                    {
                        0x0522, 
                        0x00016000
                    }, 

                    Package (0x02)
                    {
                        0x04F7, 
                        0x00016400
                    }, 

                    Package (0x02)
                    {
                        0x04CC, 
                        0x00016800
                    }, 

                    Package (0x02)
                    {
                        0x04A5, 
                        0x00016C00
                    }, 

                    Package (0x02)
                    {
                        0x047E, 
                        0x00017000
                    }, 

                    Package (0x02)
                    {
                        0x0458, 
                        0x00017400
                    }, 

                    Package (0x02)
                    {
                        0x0434, 
                        0x00017800
                    }, 

                    Package (0x02)
                    {
                        0x0412, 
                        0x00017C00
                    }, 

                    Package (0x02)
                    {
                        0x03F0, 
                        0x00018000
                    }, 

                    Package (0x02)
                    {
                        0x03D0, 
                        0x00018400
                    }, 

                    Package (0x02)
                    {
                        0x03B1, 
                        0x00018800
                    }, 

                    Package (0x02)
                    {
                        0x0393, 
                        0x00018C00
                    }, 

                    Package (0x02)
                    {
                        0x0376, 
                        0x00019000
                    }, 

                    Package (0x02)
                    {
                        0x035B, 
                        0x00019400
                    }, 

                    Package (0x02)
                    {
                        0x0340, 
                        0x00019800
                    }, 

                    Package (0x02)
                    {
                        0x0327, 
                        0x00019C00
                    }, 

                    Package (0x02)
                    {
                        0x030E, 
                        0x0001A000
                    }, 

                    Package (0x02)
                    {
                        0x02F4, 
                        0x0001A400
                    }, 

                    Package (0x02)
                    {
                        0x02DF, 
                        0x0001A800
                    }, 

                    Package (0x02)
                    {
                        0x02C8, 
                        0x0001AC00
                    }, 

                    Package (0x02)
                    {
                        0x02B3, 
                        0x0001B000
                    }, 

                    Package (0x02)
                    {
                        0x029E, 
                        0x0001B400
                    }, 

                    Package (0x02)
                    {
                        0x028A, 
                        0x0001B800
                    }, 

                    Package (0x02)
                    {
                        0x0277, 
                        0x0001BC00
                    }, 

                    Package (0x02)
                    {
                        0x0264, 
                        0x0001C000
                    }, 

                    Package (0x02)
                    {
                        0x0252, 
                        0x0001C400
                    }, 

                    Package (0x02)
                    {
                        0x0241, 
                        0x0001C800
                    }, 

                    Package (0x02)
                    {
                        0x0230, 
                        0x0001CC00
                    }, 

                    Package (0x02)
                    {
                        0x0220, 
                        0x0001D000
                    }, 

                    Package (0x02)
                    {
                        0x0210, 
                        0x0001D400
                    }, 

                    Package (0x02)
                    {
                        0x0201, 
                        0x0001D800
                    }, 

                    Package (0x02)
                    {
                        0x01F2, 
                        0x0001DC00
                    }, 

                    Package (0x02)
                    {
                        0x01E3, 
                        0x0001E000
                    }, 

                    Package (0x02)
                    {
                        0x01D6, 
                        0x0001E400
                    }, 

                    Package (0x02)
                    {
                        0x01C9, 
                        0x0001E800
                    }, 

                    Package (0x02)
                    {
                        0x01BC, 
                        0x0001EC00
                    }, 

                    Package (0x02)
                    {
                        0x01AF, 
                        0x0001F000
                    }, 

                    Package (0x02)
                    {
                        0x01A3, 
                        0x0001F400
                    }, 

                    Package (0x02)
                    {
                        0x0198, 
                        0x0001F800
                    }, 

                    Package (0x02)
                    {
                        0x018C, 
                        0x0001FC00
                    }
                })
            }

            Method (VTGN, 0, NotSerialized)
            {
                Return (Package (0x11)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x08, 
                    0x0A, 
                    One, 
                    Zero, 
                    0x01AB, 
                    0x05, 
                    0xFFFF, 
                    0x0F, 
                    One, 
                    0x05, 
                    0x32, 
                    0x06D6
                })
            }

            Method (VTCH, 0, NotSerialized)
            {
                Return (Package (0x04)
                {
                    Package (0x02)
                    {
                        "PA_THERM", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "BATT_THERM", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "PMIC_THERM", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "VBATT", 
                        One
                    }
                })
            }

            Method (IGEN, 0, NotSerialized)
            {
                Return (Package (0x0F)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x08, 
                    0x03, 
                    0x01107A4C, 
                    Zero, 
                    0x3D09, 
                    0x6CFE, 
                    0x1388, 
                    0x000493E0
                })
            }

            Method (ICHA, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    Package (0x08)
                    {
                        "IBATT_INTERNAL", 
                        Zero, 
                        Zero, 
                        0x00989680, 
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x000186A0
                    }
                })
            }

            Method (ICCH, 0, NotSerialized)
            {
                Return (Package (0x03)
                {
                    Package (0x08)
                    {
                        "GAIN", 
                        0x03, 
                        0x02, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero, 
                        0x000186A0
                    }, 

                    Package (0x08)
                    {
                        "INTRSNS_OFFSET", 
                        0x06, 
                        0x02, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero, 
                        0x000186A0
                    }, 

                    Package (0x08)
                    {
                        "EXTRSNS_OFFSET", 
                        0x05, 
                        0x02, 
                        Zero, 
                        0x04, 
                        Zero, 
                        Zero, 
                        0x000186A0
                    }
                })
            }

            Method (ICFG, 0, NotSerialized)
            {
                Return (Package (0x03)
                {
                    One, 
                    Zero, 
                    0x03E8
                })
            }
        }

        Device (WDFH)
        {
            Name (_HID, "QCOM247F")  // _HID: Hardware ID
        }

        Device (VIB1)
        {
            Name (_HID, "NOKIA_VIBRA")  // _HID: Hardware ID
            Name (_CID, "ACPINOKIA_VIBRA")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x25)
                {
                    /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x01, 0x01, 0x00, 0x08,  // . ......
                    /* 0008 */  0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x38,  // ...#...8
                    /* 0018 */  0x06, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D,  // .\_SB.PM
                    /* 0020 */  0x30, 0x31, 0x00, 0x79, 0x00                     // 01.y.
                })
                Return (RBUF) /* \_SB_.VIB1._CRS.RBUF */
            }
        }

        Device (ATTS)
        {
            Name (_HID, "NOKIA_ATTS")  // _HID: Hardware ID
        }

        Device (ARPC)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.ADSP, , 
                \_SB.SMD0, 
            })
            Name (_HID, "QCOM248A")  // _HID: Hardware ID
        }

        Device (FTM0)
        {
            Name (_HID, "QCOM2462")  // _HID: Hardware ID
        }

        Device (QDSS)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
            })
            Name (_HID, "QCOM247D")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (Buffer (0x23)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x03, 0x01, 0xC6, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x30,  // .......0
                    /* 0010 */  0xFC, 0x00, 0x00, 0x08, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0018 */  0x01, 0x00, 0x00, 0x00, 0xFA, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x01, 0x79, 0x00                                 // .y.
                })
            }

            Method (CHPD, 0, NotSerialized)
            {
                Return (One)
            }

            Method (PWRV, 0, NotSerialized)
            {
                Return (One)
            }

            Method (ETMV, 0, NotSerialized)
            {
                Return (One)
            }

            Method (OFFS, 0, NotSerialized)
            {
                Return (Package (0x1E)
                {
                    Package (0x04)
                    {
                        "DAPROM", 
                        Zero, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "CSR", 
                        0x1000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "STM", 
                        0x2000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "CTI0", 
                        0x00010000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI1", 
                        0x00011000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI2", 
                        0x00012000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI3", 
                        0x00013000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI4", 
                        0x00014000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI5", 
                        0x00015000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI6", 
                        0x00016000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI7", 
                        0x00017000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CTI8", 
                        0x00018000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "TPIU", 
                        0x00020000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "IN_FUN0", 
                        0x00021000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "IN_FUN1", 
                        0x00022000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "MERG_FUN", 
                        0x00023000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "REPLICATOR", 
                        0x00024000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "ETFETB", 
                        0x00025000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "ETR", 
                        0x00026000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "WCN_CPU0", 
                        0x00035000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "MODEM_CPU0", 
                        0x00038000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "AUDIO_CPU0", 
                        0x0003C000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "ETM", 
                        0x0004C000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "L2_CLUSTER0", 
                        0x00050000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "CPU0", 
                        0x00051000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CPU1", 
                        0x00052000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CPU2", 
                        0x00053000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "CPU3", 
                        0x00054000, 
                        0x1000, 
                        One
                    }, 

                    Package (0x04)
                    {
                        "APSS_FUN", 
                        0x00055000, 
                        0x1000, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        "RPM_CPU0", 
                        0x00060000, 
                        0x1000, 
                        One
                    }
                })
            }

            Method (S2FP, 0, NotSerialized)
            {
                Return (Package (0x04)
                {
                    Package (0x03)
                    {
                        "STM", 
                        Package (0x02)
                        {
                            "MERG_FUN", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "IN_FUN0", 
                            0x07
                        }
                    }, 

                    Package (0x07)
                    {
                        "ETM", 
                        Package (0x02)
                        {
                            "MERG_FUN", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "IN_FUN1", 
                            0x06
                        }, 

                        Package (0x02)
                        {
                            "APSS_FUN", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "APSS_FUN", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "APSS_FUN", 
                            0x02
                        }, 

                        Package (0x02)
                        {
                            "APSS_FUN", 
                            0x03
                        }
                    }, 

                    Package (0x07)
                    {
                        "BUS", 
                        Package (0x02)
                        {
                            "MERG_FUN", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "IN_FUN0", 
                            0x03
                        }, 

                        Package (0x02)
                        {
                            "IN_FUN0", 
                            0x05
                        }, 

                        Package (0x02)
                        {
                            "IN_FUN0", 
                            0x06
                        }, 

                        Package (0x02)
                        {
                            "MERG_FUN", 
                            One
                        }, 

                        Package (0x02)
                        {
                            "IN_FUN1", 
                            0x03
                        }
                    }, 

                    Package (0x04)
                    {
                        "GFX", 
                        Package (0x02)
                        {
                            "MERG_FUN", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "IN_FUN0", 
                            0x04
                        }, 

                        Package (0x02)
                        {
                            "MMSS_FUN", 
                            0x07
                        }
                    }
                })
            }
        }

        Device (COEX)
        {
            Name (_HID, "QCOM2487")  // _HID: Hardware ID
        }

        Device (AGR0)
        {
            Name (_HID, "ACPI000C" /* Processor Aggregator Device */)  // _HID: Hardware ID
            Name (_PUR, Package (0x02)  // _PUR: Processor Utilization Request
            {
                One, 
                Zero
            })
            Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
            {
                \_SB.PEP0.ROST = Arg2
            }
        }

        ThermalZone (TZ0)
        {
            Name (_HID, "QCOM2470")  // _HID: Hardware ID
            Name (_UID, 0x64)  // _UID: Unique ID
            Name (_TZD, Package (0x09)  // _TZD: Thermal Zone Devices
            {
                \_SB.CPU0, , 
                \_SB.CPU1, , 
                \_SB.CPU2, , 
                \_SB.CPU3, , 
                \_SB.PEP0, , 
                \_SB.AMSS, , 
                \_SB.GPU0.MON0, , 
                \_SB.GPU0, , 
                \_SB.NEDD, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0E92)
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (0x0EC4)
            }

            Name (_TC1, 0x04)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x03)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x0A)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
        }

        ThermalZone (TZ1)
        {
            Name (_HID, "QCOM2471")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x04)  // _TZD: Thermal Zone Devices
            {
                \_SB.CPU0, , 
                \_SB.CPU1, , 
                \_SB.CPU2, , 
                \_SB.CPU3, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0DB6)
            }

            Name (_TC1, One)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x02)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x0A)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ1_._DSM._T_0 */
                    If ((_T_0 == ToUUID ("14d399cd-7a27-4b18-8fb4-7cb7b9f4e500") /* Thermal Extensions */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (0x41)
                            }

                            Break
                        }
                    }

                    Break
                }
            }
        }

        ThermalZone (TZ2)
        {
            Name (_HID, "QCOM2471")  // _HID: Hardware ID
            Name (_UID, 0x64)  // _UID: Unique ID
            Name (_TZD, Package (0x09)  // _TZD: Thermal Zone Devices
            {
                \_SB.CPU0, , 
                \_SB.CPU1, , 
                \_SB.CPU2, , 
                \_SB.CPU3, , 
                \_SB.PEP0, , 
                \_SB.AMSS, , 
                \_SB.GPU0.MON0, , 
                \_SB.GPU0, , 
                \_SB.NEDD, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0E92)
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (0x0EC4)
            }

            Name (_TC1, 0x04)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x03)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x0A)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
        }

        ThermalZone (TZ3)
        {
            Name (_HID, "QCOM2471")  // _HID: Hardware ID
            Name (_UID, 0x65)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.PEP0, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0E4C)
            }

            Name (_TC1, 0x04)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x03)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x05)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ3_._DSM._T_0 */
                    If ((_T_0 == ToUUID ("14d399cd-7a27-4b18-8fb4-7cb7b9f4e500") /* Thermal Extensions */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (0x22)
                            }

                            Break
                        }
                    }

                    Break
                }
            }
        }

        ThermalZone (TZ4)
        {
            Name (_HID, "QCOM248C")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x02)  // _TZD: Thermal Zone Devices
            {
                \_SB.AMSS, , 
                \_SB.NEDD, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0DD4)
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (0x0DFC)
            }

            Name (_TC1, Zero)  // _TC1: Thermal Constant 1
            Name (_TC2, One)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x0A)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
        }

        ThermalZone (TZ5)
        {
            Name (_HID, "QCOM248D")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.NEDD, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0D48)
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (0x0D66)
            }

            Name (_TC1, 0x04)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x03)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
        }

        ThermalZone (TZ11)
        {
            Name (_HID, "QCOM248D")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.DISP, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0C8A)
            }

            Name (_TC1, Zero)  // _TC1: Thermal Constant 1
            Name (_TC2, One)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ11._DSM._T_0 */
                    If ((_T_0 == ToUUID ("14d399cd-7a27-4b18-8fb4-7cb7b9f4e500") /* Thermal Extensions */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (0x50)
                            }

                            Break
                        }
                    }

                    Break
                }
            }
        }

        ThermalZone (TZ12)
        {
            Name (_HID, "QCOM248D")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.DISP, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0D2A)
            }

            Name (_TC1, Zero)  // _TC1: Thermal Constant 1
            Name (_TC2, One)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
        }

        ThermalZone (TZ6)
        {
            Name (_HID, "QCOM248E")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x09)  // _TZD: Thermal Zone Devices
            {
                \_SB.CPU0, , 
                \_SB.CPU1, , 
                \_SB.CPU2, , 
                \_SB.CPU3, , 
                \_SB.PEP0, , 
                \_SB.AMSS, , 
                \_SB.GPU0.MON0, , 
                \_SB.GPU0, , 
                \_SB.NEDD, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0E10)
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (0x0E2E)
            }

            Name (_TC1, One)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x02)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
        }

        ThermalZone (TZ16)
        {
            Name (_HID, "QCOM248E")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.NEDD, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0D3E)
            }

            Name (_TC1, One)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x02)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ16._DSM._T_0 */
                    If ((_T_0 == ToUUID ("14d399cd-7a27-4b18-8fb4-7cb7b9f4e500") /* Thermal Extensions */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (0x3C)
                            }

                            Break
                        }
                    }

                    Break
                }
            }
        }

        ThermalZone (TZ17)
        {
            Name (_HID, "QCOM248E")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.NEDD, 
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0D98)
            }

            Name (_TC1, One)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x02)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x0A)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
        }

        Device (CAMP)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, , 
                \_SB.PMIC, 
            })
            Name (_HID, "QCOM0775")  // _HID: Hardware ID
            Name (_UID, 0x1B)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x80, 0x92, 0xF9,  // ........
                    /* 0008 */  0x14, 0x04, 0x00, 0x00, 0x79, 0x00               // ....y.
                })
                Return (RBUF) /* \_SB_.CAMP._CRS.RBUF */
            }
        }

        Device (CAMS)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.CAMP, , 
                \_SB.PEP0, 
            })
            Name (_HID, "QCOM0710")  // _HID: Hardware ID
            Name (_UID, 0x15)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x23)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xA0, 0xFD,  // ........
                    /* 0008 */  0x00, 0x04, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x0C, 0xA0, 0xFD, 0x00, 0x04, 0x00, 0x00,  // ........
                    /* 0018 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x52, 0x00, 0x00,  // .....R..
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.CAMS._CRS.RBUF */
            }
        }

        Device (CESP)
        {
            Name (_HID, "CESP0001")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
        }

        Device (CAMF)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.CAMS, , 
                \_SB.PEP0, 
            })
            Name (_HID, "QCOM0715")  // _HID: Hardware ID
            Name (_UID, 0x1A)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x23)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x04, 0xA0, 0xFD,  // ........
                    /* 0008 */  0x00, 0x04, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x10, 0xA0, 0xFD, 0x00, 0x04, 0x00, 0x00,  // ........
                    /* 0018 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x53, 0x00, 0x00,  // .....S..
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.CAMF._CRS.RBUF */
            }
        }

        Device (VFE0)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.SMMU, , 
                \_SB.PEP0, 
            })
            Name (_HID, "QCOM0700")  // _HID: Hardware ID
            Name (_UID, 0x16)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x2C)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xE0, 0xFD,  // ........
                    /* 0008 */  0x14, 0x06, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x08, 0xA0, 0xFD, 0x90, 0x00, 0x00, 0x00,  // ........
                    /* 0018 */  0x89, 0x06, 0x00, 0x03, 0x01, 0x51, 0x00, 0x00,  // .....Q..
                    /* 0020 */  0x00, 0x89, 0x06, 0x00, 0x03, 0x01, 0x54, 0x00,  // ......T.
                    /* 0028 */  0x00, 0x00, 0x79, 0x00                           // ..y.
                })
                Return (RBUF) /* \_SB_.VFE0._CRS.RBUF */
            }
        }

        Device (FLSH)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.CAMS, , 
                \_SB.PEP0, 
            })
            Name (_HID, "QCOM0705")  // _HID: Hardware ID
            Name (_UID, 0x19)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.FLSH._CRS.RBUF */
            }
        }

        Device (DMUX)
        {
            Name (_HID, "QCOM2406")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (MBRG)
        {
            Name (_HID, "QCOM2145")  // _HID: Hardware ID
        }

        Device (RMAT)
        {
            Name (_HID, "QCOM2155")  // _HID: Hardware ID
        }

        Device (RMNT)
        {
            Name (_HID, "QCOM2148")  // _HID: Hardware ID
        }

        Device (TSC1)
        {
            Name (_HID, "NOKIA_TOUCH")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, , 
                \_SB.PRXY, 
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x64)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x4A, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // J.\_SB.I
                    /* 0018 */  0x32, 0x43, 0x31, 0x00, 0x8C, 0x20, 0x00, 0x01,  // 2C1.. ..
                    /* 0020 */  0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0028 */  0x00, 0x00, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // .......#
                    /* 0030 */  0x00, 0x00, 0x00, 0x01, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 0038 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x8C,  // B.GIO0..
                    /* 0040 */  0x20, 0x00, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00,  //  .......
                    /* 0048 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00,  // ........
                    /* 0050 */  0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..#.....
                    /* 0058 */  0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x49, 0x4F,  // \_SB.GIO
                    /* 0060 */  0x30, 0x00, 0x79, 0x00                           // 0.y.
                })
                Return (RBUF) /* \_SB_.TSC1._CRS.RBUF */
            }

            Name (PGID, Buffer (0x0A)
            {
                "\\_SB.TSC2"
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
                DEID = PGID /* \_SB_.TSC1.PGID */
                If (\_SB.ABD.AVBL)
                {
                    \_SB.PRXY.FLD0 = DBUF /* \_SB_.TSC1.DBUF */
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                DEID = Buffer (ESNL){}
                DVAL = 0x03
                DEID = PGID /* \_SB_.TSC1.PGID */
                If (\_SB.ABD.AVBL)
                {
                    \_SB.PRXY.FLD0 = DBUF /* \_SB_.TSC1.DBUF */
                }
            }
        }

        Device (BTN0)
        {
            Name (_HID, "QCOM2066")  // _HID: Hardware ID
            Name (_CID, "PNP0C40" /* Standard Button Controller */)  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0xB1)
                {
                    /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0D,  // . ......
                    /* 0008 */  0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x40,  // ...#...@
                    /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D,  // .\_SB.PM
                    /* 0020 */  0x30, 0x31, 0x00, 0x8C, 0x20, 0x00, 0x01, 0x00,  // 01.. ...
                    /* 0028 */  0x01, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x38,  // .......8
                    /* 0030 */  0x18, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23, 0x00,  // ......#.
                    /* 0038 */  0x00, 0x00, 0x48, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ..H.\_SB
                    /* 0040 */  0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x8C, 0x20,  // .GIO0.. 
                    /* 0048 */  0x00, 0x01, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x02,  // ........
                    /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x19,  // ........
                    /* 0058 */  0x00, 0x23, 0x00, 0x00, 0x00, 0x41, 0x00, 0x5C,  // .#...A.\
                    /* 0060 */  0x5F, 0x53, 0x42, 0x2E, 0x50, 0x4D, 0x30, 0x31,  // _SB.PM01
                    /* 0068 */  0x00, 0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00,  // .. .....
                    /* 0070 */  0x0D, 0x00, 0x01, 0x00, 0x00, 0x38, 0x18, 0x17,  // .....8..
                    /* 0078 */  0x00, 0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00,  // ....#...
                    /* 0080 */  0x49, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47,  // I.\_SB.G
                    /* 0088 */  0x49, 0x4F, 0x30, 0x00, 0x8C, 0x20, 0x00, 0x01,  // IO0.. ..
                    /* 0090 */  0x00, 0x01, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00,  // ........
                    /* 0098 */  0x38, 0x18, 0x17, 0x00, 0x00, 0x19, 0x00, 0x23,  // 8......#
                    /* 00A0 */  0x00, 0x00, 0x00, 0x4A, 0x00, 0x5C, 0x5F, 0x53,  // ...J.\_S
                    /* 00A8 */  0x42, 0x2E, 0x47, 0x49, 0x4F, 0x30, 0x00, 0x79,  // B.GIO0.y
                    /* 00B0 */  0x00                                             // .
                })
                Return (RBUF) /* \_SB_.BTN0._CRS.RBUF */
            }

            Method (BNWP, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x05)
                {
                     0x00, 0x02, 0x03, 0x07, 0x08                     // .....
                })
                Return (RBUF) /* \_SB_.BTN0.BNWP.RBUF */
            }

            Method (BNAS, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x05)
                {
                     0x01, 0x00, 0x01, 0x00, 0x00                     // .....
                })
                Return (RBUF) /* \_SB_.BTN0.BNAS.RBUF */
            }
        }

        Device (HWN0)
        {
            Name (_HID, "QCOM0D50")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (HWNL, 0, NotSerialized)
            {
                Name (CFG0, Package (0x08)
                {
                    Zero, 
                    One, 
                    0x019B, 
                    0x14, 
                    One, 
                    0x02, 
                    0x03, 
                    One
                })
                Return (CFG0) /* \_SB_.HWN0.HWNL.CFG0 */
            }
        }

        Device (HWN1)
        {
            Name (_HID, "QCOM2147")  // _HID: Hardware ID
            Name (_CID, "ACPIQCOM2147")  // _CID: Compatible ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (NAM, Buffer (0x0A)
                {
                    "\\_SB.SPMI"
                })
                Name (PON1, Buffer (0x0C)
                {
                    /* 0000 */  0x8E, 0x13, 0x00, 0x01, 0x00, 0xC1, 0x02, 0x01,  // ........
                    /* 0008 */  0xC0, 0x01, 0x00, 0x00                           // ....
                })
                Name (END, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Concatenate (PON1, NAM, Local0)
                Concatenate (Local0, END, Local1)
                Return (Local1)
            }

            Method (HWNH, 0, NotSerialized)
            {
                Name (CFG0, Package (0x02)
                {
                    One, 
                    Zero
                })
                Return (CFG0) /* \_SB_.HWN1.HWNH.CFG0 */
            }
        }

        Device (QDCI)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.SMD0, 
            })
            Name (_HID, "QCOM2412")  // _HID: Hardware ID
        }

        Device (SSM)
        {
            Name (_HID, "QCOM2414")  // _HID: Hardware ID
        }

        Device (SEC)
        {
            Name (_HID, "NOKIA_SEC")  // _HID: Hardware ID
        }
    }
}


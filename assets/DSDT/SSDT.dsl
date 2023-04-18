/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT.aml, Sun Apr  9 18:20:28 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00003C62 (15458)
 *     Revision         0x02
 *     Checksum         0xA3
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160422 (538313762)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "CB-01   ", 0x00000001)
{
    /*
     * External declarations were imported from
     * a reference file -- DSDT.aml
     */

    External (_SB_.AAC0, FieldUnitObj)    // (from opcode)
    External (_SB_.ACRT, FieldUnitObj)    // (from opcode)
    External (_SB_.APSV, FieldUnitObj)    // (from opcode)
    External (_SB_.CBMI, FieldUnitObj)    // (from opcode)
    External (_SB_.CFGD, FieldUnitObj)    // (from opcode)
    External (_SB_.CLVL, FieldUnitObj)    // (from opcode)
    External (_SB_.CPPC, FieldUnitObj)    // (from opcode)
    External (_SB_.CTC0, FieldUnitObj)    // (from opcode)
    External (_SB_.CTC1, FieldUnitObj)    // (from opcode)
    External (_SB_.CTC2, FieldUnitObj)    // (from opcode)
    External (_SB_.OSCP, IntObj)    // (from opcode)
    External (_SB_.PAGD, DeviceObj)    // (from opcode)
    External (_SB_.PAGD._PUR, PkgObj)    // (from opcode)
    External (_SB_.PAGD._STA, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.B0D4, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.CHIS, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.CPUS, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.CPUT, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.ECAV, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.GPUS, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.GPUT, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.LFCM, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.MHBR, FieldUnitObj)    // (from opcode)
    External (_SB_.PL10, FieldUnitObj)    // (from opcode)
    External (_SB_.PL11, FieldUnitObj)    // (from opcode)
    External (_SB_.PL12, FieldUnitObj)    // (from opcode)
    External (_SB_.PL20, FieldUnitObj)    // (from opcode)
    External (_SB_.PL21, FieldUnitObj)    // (from opcode)
    External (_SB_.PL22, FieldUnitObj)    // (from opcode)
    External (_SB_.PLW0, FieldUnitObj)    // (from opcode)
    External (_SB_.PLW1, FieldUnitObj)    // (from opcode)
    External (_SB_.PLW2, FieldUnitObj)    // (from opcode)
    External (_SB_.PR00, ProcessorObj)    // (from opcode)
    External (_SB_.PR00._PSS, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PR00._TPC, IntObj)    // (from opcode)
    External (_SB_.PR00._TSD, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PR00._TSS, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PR00.LPSS, PkgObj)    // (from opcode)
    External (_SB_.PR00.TPSS, PkgObj)    // (from opcode)
    External (_SB_.PR00.TSMC, PkgObj)    // (from opcode)
    External (_SB_.PR00.TSMF, PkgObj)    // (from opcode)
    External (_SB_.PR01, ProcessorObj)    // (from opcode)
    External (_SB_.PR02, ProcessorObj)    // (from opcode)
    External (_SB_.PR03, ProcessorObj)    // (from opcode)
    External (_SB_.PR04, ProcessorObj)    // (from opcode)
    External (_SB_.PR05, ProcessorObj)    // (from opcode)
    External (_SB_.PR06, ProcessorObj)    // (from opcode)
    External (_SB_.PR07, ProcessorObj)    // (from opcode)
    External (_SB_.PR08, ProcessorObj)    // (from opcode)
    External (_SB_.PR09, ProcessorObj)    // (from opcode)
    External (_SB_.PR10, ProcessorObj)    // (from opcode)
    External (_SB_.PR11, ProcessorObj)    // (from opcode)
    External (_SB_.PR12, ProcessorObj)    // (from opcode)
    External (_SB_.PR13, ProcessorObj)    // (from opcode)
    External (_SB_.PR14, ProcessorObj)    // (from opcode)
    External (_SB_.PR15, ProcessorObj)    // (from opcode)
    External (_SB_.PR16, ProcessorObj)    // (from opcode)
    External (_SB_.PR17, ProcessorObj)    // (from opcode)
    External (_SB_.PR18, ProcessorObj)    // (from opcode)
    External (_SB_.PR19, ProcessorObj)    // (from opcode)
    External (_SB_.SLPB, DeviceObj)    // (from opcode)
    External (_SB_.TAR0, FieldUnitObj)    // (from opcode)
    External (_SB_.TAR1, FieldUnitObj)    // (from opcode)
    External (_SB_.TAR2, FieldUnitObj)    // (from opcode)
    External (_TZ_.ETMD, IntObj)    // (from opcode)
    External (_TZ_.TZ00, ThermalZoneObj)    // (from opcode)
    External (_TZ_.TZ01, ThermalZoneObj)    // (from opcode)
    External (ACTT, IntObj)    // (from opcode)
    External (ADBG, MethodObj)    // 1 Arguments (from opcode)
    External (ATMC, IntObj)    // (from opcode)
    External (ATPC, IntObj)    // (from opcode)
    External (BATR, IntObj)    // (from opcode)
    External (CA2D, IntObj)    // (from opcode)
    External (CHGE, IntObj)    // (from opcode)
    External (CPUS, IntObj)    // (from opcode)
    External (CRTT, IntObj)    // (from opcode)
    External (CTDP, IntObj)    // (from opcode)
    External (DCFE, IntObj)    // (from opcode)
    External (DISE, IntObj)    // (from opcode)
    External (DPHL, IntObj)    // (from opcode)
    External (DPLL, IntObj)    // (from opcode)
    External (DPTF, IntObj)    // (from opcode)
    External (FND1, IntObj)    // (from opcode)
    External (HIDW, MethodObj)    // 4 Arguments (from opcode)
    External (HIWC, MethodObj)    // 1 Arguments (from opcode)
    External (LPER, IntObj)    // (from opcode)
    External (LPOE, IntObj)    // (from opcode)
    External (LPOP, IntObj)    // (from opcode)
    External (LPOS, IntObj)    // (from opcode)
    External (LPOW, IntObj)    // (from opcode)
    External (MPL0, IntObj)    // (from opcode)
    External (MPL1, IntObj)    // (from opcode)
    External (MPL2, IntObj)    // (from opcode)
    External (ODV0, IntObj)    // (from opcode)
    External (ODV1, IntObj)    // (from opcode)
    External (ODV2, IntObj)    // (from opcode)
    External (ODV3, IntObj)    // (from opcode)
    External (ODV4, IntObj)    // (from opcode)
    External (ODV5, IntObj)    // (from opcode)
    External (ODV6, IntObj)    // (from opcode)
    External (ODV7, IntObj)    // (from opcode)
    External (ODV8, IntObj)    // (from opcode)
    External (ODV9, IntObj)    // (from opcode)
    External (ODVA, IntObj)    // (from opcode)
    External (ODVB, IntObj)    // (from opcode)
    External (ODVC, IntObj)    // (from opcode)
    External (ODVD, IntObj)    // (from opcode)
    External (ODVE, IntObj)    // (from opcode)
    External (ODVF, IntObj)    // (from opcode)
    External (ODVG, IntObj)    // (from opcode)
    External (ODVH, IntObj)    // (from opcode)
    External (PC00, IntObj)    // (from opcode)
    External (PLID, UnknownObj)    // (from opcode)
    External (PNHM, IntObj)    // (from opcode)
    External (PPPR, IntObj)    // (from opcode)
    External (PPSZ, IntObj)    // (from opcode)
    External (PSVT, IntObj)    // (from opcode)
    External (PTMC, IntObj)    // (from opcode)
    External (PTPC, IntObj)    // (from opcode)
    External (PWRE, IntObj)    // (from opcode)
    External (PWRS, IntObj)    // (from opcode)
    External (S2AT, IntObj)    // (from opcode)
    External (S2CT, IntObj)    // (from opcode)
    External (S2DE, IntObj)    // (from opcode)
    External (S2HT, IntObj)    // (from opcode)
    External (S2PT, IntObj)    // (from opcode)
    External (S2S3, IntObj)    // (from opcode)
    External (S3AT, IntObj)    // (from opcode)
    External (S3CT, IntObj)    // (from opcode)
    External (S3DE, IntObj)    // (from opcode)
    External (S3HT, IntObj)    // (from opcode)
    External (S3PT, IntObj)    // (from opcode)
    External (S3S3, IntObj)    // (from opcode)
    External (S4AT, IntObj)    // (from opcode)
    External (S4CT, IntObj)    // (from opcode)
    External (S4DE, IntObj)    // (from opcode)
    External (S4HT, IntObj)    // (from opcode)
    External (S4PT, IntObj)    // (from opcode)
    External (S4S3, IntObj)    // (from opcode)
    External (S5AT, IntObj)    // (from opcode)
    External (S5CT, IntObj)    // (from opcode)
    External (S5DE, IntObj)    // (from opcode)
    External (S5HT, IntObj)    // (from opcode)
    External (S5PT, IntObj)    // (from opcode)
    External (S5S3, IntObj)    // (from opcode)
    External (SAC3, IntObj)    // (from opcode)
    External (SACT, IntObj)    // (from opcode)
    External (SADE, IntObj)    // (from opcode)
    External (SAHT, IntObj)    // (from opcode)
    External (SAT1, IntObj)    // (from opcode)
    External (SAT2, IntObj)    // (from opcode)
    External (SC31, IntObj)    // (from opcode)
    External (SC32, IntObj)    // (from opcode)
    External (SCT1, IntObj)    // (from opcode)
    External (SCT2, IntObj)    // (from opcode)
    External (SGE1, IntObj)    // (from opcode)
    External (SGE2, IntObj)    // (from opcode)
    External (SHT1, IntObj)    // (from opcode)
    External (SHT2, IntObj)    // (from opcode)
    External (SPT1, IntObj)    // (from opcode)
    External (SPT2, IntObj)    // (from opcode)
    External (SSP2, IntObj)    // (from opcode)
    External (SSP3, IntObj)    // (from opcode)
    External (SSP4, IntObj)    // (from opcode)
    External (SSP5, IntObj)    // (from opcode)
    External (TCNT, IntObj)    // (from opcode)
    External (TJMX, IntObj)    // (from opcode)
    External (TSOD, IntObj)    // (from opcode)
    External (V1AT, IntObj)    // (from opcode)
    External (V1C3, IntObj)    // (from opcode)
    External (V1CR, IntObj)    // (from opcode)
    External (V1HT, IntObj)    // (from opcode)
    External (V1PV, IntObj)    // (from opcode)
    External (V2AT, IntObj)    // (from opcode)
    External (V2C3, IntObj)    // (from opcode)
    External (V2CR, IntObj)    // (from opcode)
    External (V2HT, IntObj)    // (from opcode)
    External (V2PV, IntObj)    // (from opcode)
    External (VSP1, IntObj)    // (from opcode)
    External (VSP2, IntObj)    // (from opcode)
    External (WAND, IntObj)    // (from opcode)
    External (WLC3, IntObj)    // (from opcode)
    External (WRAT, IntObj)    // (from opcode)
    External (WRCT, IntObj)    // (from opcode)
    External (WRFD, IntObj)    // (from opcode)
    External (WRHT, IntObj)    // (from opcode)
    External (WRPT, IntObj)    // (from opcode)
    External (WTSP, IntObj)    // (from opcode)
    External (WWAT, IntObj)    // (from opcode)
    External (WWC3, IntObj)    // (from opcode)
    External (WWCT, IntObj)    // (from opcode)
    External (WWHT, IntObj)    // (from opcode)
    External (WWPT, IntObj)    // (from opcode)

    Scope (\_SB)
    {
        Device (IETM)
        {
            Name (_HID, EisaId ("INT3400"))  // _HID: Hardware ID
            Method (XDSM, 4, Serialized)
            {
                If (CondRefOf (HIWC))
                {
                    If (HIWC (Arg0))
                    {
                        If (CondRefOf (HIDW))
                        {
                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                           
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (DPTF, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PTRP, Zero)
            Name (PSEM, Zero)
            Name (ATRP, Zero)
            Name (ASEM, Zero)
            Name (YTRP, Zero)
            Name (YSEM, Zero)
            Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, STS1)
                CreateDWordField (Arg3, 0x04, CAP1)
                If (LNotEqual (Arg1, One))
                {
                    And (STS1, 0xFFFFFF00, STS1)
                    Or (STS1, 0x0A, STS1)
                    Return (Arg3)
                }

                If (LNotEqual (Arg2, 0x02))
                {
                    And (STS1, 0xFFFFFF00, STS1)
                    Or (STS1, 0x02, STS1)
                    Return (Arg3)
                }

                If (CondRefOf (\_SB.APSV))
                {
                    If (LEqual (PSEM, Zero))
                    {
                        Store (One, PSEM)
                        Store (\_SB.APSV, PTRP)
                    }
                }

                If (CondRefOf (\_SB.AAC0))
                {
                    If (LEqual (ASEM, Zero))
                    {
                        Store (One, ASEM)
                        Store (\_SB.AAC0, ATRP)
                    }
                }

                If (CondRefOf (\_SB.ACRT))
                {
                    If (LEqual (YSEM, Zero))
                    {
                        Store (One, YSEM)
                        Store (\_SB.ACRT, YTRP)
                    }
                }

                If (LEqual (Arg0, ToUUID ("b23ba85d-c8b7-3542-88de-8de2ffcfd698")))
                {
                    If (Not (And (STS1, One)))
                    {
                        If (And (CAP1, One))
                        {
                            If (And (CAP1, 0x02))
                            {
                                Store (0x6E, \_SB.AAC0)
                                Store (Zero, \_TZ.ETMD)
                            }
                            Else
                            {
                                Store (ATRP, \_SB.AAC0)
                                Store (One, \_TZ.ETMD)
                            }

                            If (And (CAP1, 0x04))
                            {
                                Store (0x6E, \_SB.APSV)
                            }
                            Else
                            {
                                Store (PTRP, \_SB.APSV)
                            }

                            If (And (CAP1, 0x08))
                            {
                                Store (0xD2, \_SB.ACRT)
                            }
                            Else
                            {
                                Store (YTRP, \_SB.ACRT)
                            }
                        }
                        Else
                        {
                            Store (YTRP, \_SB.ACRT)
                            Store (PTRP, \_SB.APSV)
                            Store (ATRP, \_SB.AAC0)
                            Store (One, \_TZ.ETMD)
                        }
                    }

                    Return (Arg3)
                }

                Return (Arg3)
            }

            Method (DCFG, 0, NotSerialized)
            {
                Return (\DCFE)
            }

            Name (ODVX, Package (0x12)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Method (ODVP, 0, Serialized)
            {
                Store (\ODV0, Index (ODVX, Zero))
                Store (\ODV1, Index (ODVX, One))
                Store (\ODV2, Index (ODVX, 0x02))
                Store (\ODV3, Index (ODVX, 0x03))
                Store (\ODV4, Index (ODVX, 0x04))
                Store (\ODV5, Index (ODVX, 0x05))
                Store (\ODV6, Index (ODVX, 0x06))
                Store (\ODV7, Index (ODVX, 0x07))
                Store (\ODV8, Index (ODVX, 0x08))
                Store (\ODV9, Index (ODVX, 0x09))
                Store (\ODVA, Index (ODVX, 0x0A))
                Store (\ODVB, Index (ODVX, 0x0B))
                Store (\ODVC, Index (ODVX, 0x0C))
                Store (\ODVD, Index (ODVX, 0x0D))
                Store (\ODVE, Index (ODVX, 0x0E))
                Store (\ODVF, Index (ODVX, 0x0F))
                Store (\ODVG, Index (ODVX, 0x10))
                Store (\ODVH, Index (ODVX, 0x11))
                Return (ODVX)
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Method (KTOC, 1, Serialized)
        {
            If (LGreater (Arg0, 0x0AAC))
            {
                Return (Divide (Subtract (Arg0, 0x0AAC), 0x0A, ))
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (CTOK, 1, Serialized)
        {
            Return (Add (Multiply (Arg0, 0x0A), 0x0AAC))
        }

        Method (C10K, 1, Serialized)
        {
            Name (TMP1, Buffer (0x10)
            {
                 0x00                                           
            })
            CreateByteField (TMP1, Zero, TMPL)
            CreateByteField (TMP1, One, TMPH)
            Add (Arg0, 0x0AAC, Local0)
            Store (And (Local0, 0xFF), TMPL)
            Store (ShiftRight (And (Local0, 0xFF00), 0x08), TMPH)
            ToInteger (TMP1, Local1)
            Return (Local1)
        }

        Method (K10C, 1, Serialized)
        {
            If (LGreater (Arg0, 0x0AAC))
            {
                Return (Subtract (Arg0, 0x0AAC))
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.B0D4)
    {
        Name (PFLG, Zero)
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LEqual (\SADE, One))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        OperationRegion (MBAR, SystemMemory, Add (ShiftLeft (MHBR, 0x0F), 0x5000), 0x1000)
        Field (MBAR, ByteAcc, NoLock, Preserve)
        {
            Offset (0x930), 
            PTDP,   15, 
            Offset (0x932), 
            PMIN,   15, 
            Offset (0x934), 
            PMAX,   15, 
            Offset (0x936), 
            TMAX,   7, 
            Offset (0x938), 
            PWRU,   4, 
            Offset (0x939), 
            EGYU,   5, 
            Offset (0x93A), 
            TIMU,   4, 
            Offset (0x958), 
            Offset (0x95C), 
            LPMS,   1, 
            CTNL,   2, 
            Offset (0x978), 
            PCTP,   8, 
            Offset (0x998), 
            RP0C,   8, 
            RP1C,   8, 
            RPNC,   8, 
            Offset (0xF3C), 
            TRAT,   8, 
            Offset (0xF40), 
            PTD1,   15, 
            Offset (0xF42), 
            TRA1,   8, 
            Offset (0xF44), 
            PMX1,   15, 
            Offset (0xF46), 
            PMN1,   15, 
            Offset (0xF48), 
            PTD2,   15, 
            Offset (0xF4A), 
            TRA2,   8, 
            Offset (0xF4C), 
            PMX2,   15, 
            Offset (0xF4E), 
            PMN2,   15, 
            Offset (0xF50), 
            CTCL,   2, 
                ,   29, 
            CLCK,   1, 
            MNTR,   8
        }

        Name (XPCC, Zero)
        Method (PPCC, 0, Serialized)
        {
            If (LAnd (LEqual (XPCC, Zero), CondRefOf (\_SB.CBMI)))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        If (LAnd (LGreaterEqual (\_SB.CLVL, One), LLessEqual (\_SB.CLVL, 0x03)))
                        {
                            CPL0 ()
                            Store (One, XPCC)
                        }
                    }
                    Case (One)
                    {
                        If (LOr (LEqual (\_SB.CLVL, 0x02), LEqual (\_SB.CLVL, 0x03)))
                        {
                            CPL1 ()
                            Store (One, XPCC)
                        }
                    }
                    Case (0x02)
                    {
                        If (LEqual (\_SB.CLVL, 0x03))
                        {
                            CPL2 ()
                            Store (One, XPCC)
                        }
                    }

                }
            }

            Return (NPCC)
        }

        Name (NPCC, Package (0x03)
        {
            0x02, 
            Package (0x06)
            {
                Zero, 
                0x88B8, 
                0xAFC8, 
                0x6D60, 
                0x7D00, 
                0x03E8
            }, 

            Package (0x06)
            {
                One, 
                0xDBBA, 
                0xDBBA, 
                Zero, 
                Zero, 
                0x03E8
            }
        })
        Method (CPNU, 2, Serialized)
        {
            Name (CNVT, Zero)
            Name (PPUU, Zero)
            Name (RMDR, Zero)
            If (LEqual (PWRU, Zero))
            {
                Store (One, PPUU)
            }
            Else
            {
                ShiftLeft (Decrement (PWRU), 0x02, PPUU)
            }

            Divide (Arg0, PPUU, RMDR, CNVT)
            If (LEqual (Arg1, Zero))
            {
                Return (CNVT)
            }
            Else
            {
                Multiply (CNVT, 0x03E8, CNVT)
                Multiply (RMDR, 0x03E8, RMDR)
                Divide (RMDR, PPUU, , RMDR)
                Add (CNVT, RMDR, CNVT)
                Return (CNVT)
            }
        }

        Method (CPL0, 0, NotSerialized)
        {
            Store (0x02, Index (\_SB.PCI0.B0D4.NPCC, Zero))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), Zero))
            Store (\MPL0, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), One))
            Store (CPNU (\_SB.PL10, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x02))
            Multiply (\_SB.PLW0, 0x03E8, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x03))
            Add (Multiply (\_SB.PLW0, 0x03E8), 0x0FA0, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x04))
            Store (PPSZ, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x05))
            Store (One, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), Zero))
            Store (CPNU (\_SB.PL20, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), One))
            Store (CPNU (\_SB.PL20, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x02))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x03))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x04))
            Store (PPSZ, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x05))
        }

        Method (CPL1, 0, NotSerialized)
        {
            Store (0x02, Index (\_SB.PCI0.B0D4.NPCC, Zero))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), Zero))
            Store (\MPL1, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), One))
            Store (CPNU (\_SB.PL11, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x02))
            Multiply (\_SB.PLW1, 0x03E8, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x03))
            Add (Multiply (\_SB.PLW1, 0x03E8), 0x0FA0, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x04))
            Store (PPSZ, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x05))
            Store (One, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), Zero))
            Store (CPNU (\_SB.PL21, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), One))
            Store (CPNU (\_SB.PL21, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x02))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x03))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x04))
            Store (PPSZ, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x05))
        }

        Method (CPL2, 0, NotSerialized)
        {
            Store (0x02, Index (\_SB.PCI0.B0D4.NPCC, Zero))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), Zero))
            Store (\MPL2, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), One))
            Store (CPNU (\_SB.PL12, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x02))
            Multiply (\_SB.PLW2, 0x03E8, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x03))
            Add (Multiply (\_SB.PLW2, 0x03E8), 0x0FA0, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x04))
            Store (PPSZ, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, One)), 0x05))
            Store (One, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), Zero))
            Store (CPNU (\_SB.PL22, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), One))
            Store (CPNU (\_SB.PL22, One), Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x02))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x03))
            Store (Zero, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x04))
            Store (PPSZ, Index (DerefOf (Index (\_SB.PCI0.B0D4.NPCC, 0x02)), 0x05))
        }

        Name (LSTM, Zero)
        Name (_PPC, Zero)  // _PPC: Performance Present Capabilities
        Method (SPPC, 1, Serialized)
        {
            If (CondRefOf (\_SB.CPPC))
            {
                Store (Arg0, \_SB.CPPC)
            }

            Switch (ToInteger (\TCNT))
            {
                Case (0x14)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                    Notify (\_SB.PR10, 0x80)
                    Notify (\_SB.PR11, 0x80)
                    Notify (\_SB.PR12, 0x80)
                    Notify (\_SB.PR13, 0x80)
                    Notify (\_SB.PR14, 0x80)
                    Notify (\_SB.PR15, 0x80)
                    Notify (\_SB.PR16, 0x80)
                    Notify (\_SB.PR17, 0x80)
                    Notify (\_SB.PR18, 0x80)
                    Notify (\_SB.PR19, 0x80)
                }
                Case (0x13)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                    Notify (\_SB.PR10, 0x80)
                    Notify (\_SB.PR11, 0x80)
                    Notify (\_SB.PR12, 0x80)
                    Notify (\_SB.PR13, 0x80)
                    Notify (\_SB.PR14, 0x80)
                    Notify (\_SB.PR15, 0x80)
                    Notify (\_SB.PR16, 0x80)
                    Notify (\_SB.PR17, 0x80)
                    Notify (\_SB.PR18, 0x80)
                }
                Case (0x12)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                    Notify (\_SB.PR10, 0x80)
                    Notify (\_SB.PR11, 0x80)
                    Notify (\_SB.PR12, 0x80)
                    Notify (\_SB.PR13, 0x80)
                    Notify (\_SB.PR14, 0x80)
                    Notify (\_SB.PR15, 0x80)
                    Notify (\_SB.PR16, 0x80)
                    Notify (\_SB.PR17, 0x80)
                }
                Case (0x11)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                    Notify (\_SB.PR10, 0x80)
                    Notify (\_SB.PR11, 0x80)
                    Notify (\_SB.PR12, 0x80)
                    Notify (\_SB.PR13, 0x80)
                    Notify (\_SB.PR14, 0x80)
                    Notify (\_SB.PR15, 0x80)
                    Notify (\_SB.PR16, 0x80)
                }
                Case (0x10)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                    Notify (\_SB.PR10, 0x80)
                    Notify (\_SB.PR11, 0x80)
                    Notify (\_SB.PR12, 0x80)
                    Notify (\_SB.PR13, 0x80)
                    Notify (\_SB.PR14, 0x80)
                    Notify (\_SB.PR15, 0x80)
                }
                Case (0x0E)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                    Notify (\_SB.PR10, 0x80)
                    Notify (\_SB.PR11, 0x80)
                    Notify (\_SB.PR12, 0x80)
                    Notify (\_SB.PR13, 0x80)
                }
                Case (0x0C)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                    Notify (\_SB.PR10, 0x80)
                    Notify (\_SB.PR11, 0x80)
                }
                Case (0x0A)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                    Notify (\_SB.PR08, 0x80)
                    Notify (\_SB.PR09, 0x80)
                }
                Case (0x08)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                    Notify (\_SB.PR07, 0x80)
                }
                Case (0x07)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                    Notify (\_SB.PR06, 0x80)
                }
                Case (0x06)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                    Notify (\_SB.PR05, 0x80)
                }
                Case (0x05)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                    Notify (\_SB.PR04, 0x80)
                }
                Case (0x04)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                    Notify (\_SB.PR03, 0x80)
                }
                Case (0x03)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                    Notify (\_SB.PR02, 0x80)
                }
                Case (0x02)
                {
                    Notify (\_SB.PR00, 0x80)
                    Notify (\_SB.PR01, 0x80)
                }
                Default
                {
                    Notify (\_SB.PR00, 0x80)
                }

            }
        }

        Name (TLPO, Package (0x06)
        {
            One, 
            One, 
            Zero, 
            One, 
            One, 
            0x02
        })
        Method (CLPO, 0, NotSerialized)
        {
            Store (LPOE, Index (TLPO, One))
            If (CondRefOf (\_SB.PR00._PSS))
            {
                If (And (\_SB.OSCP, 0x0400))
                {
                    Store (SizeOf (\_SB.PR00.TPSS), Local1)
                }
                Else
                {
                    Store (SizeOf (\_SB.PR00.LPSS), Local1)
                }
            }
            Else
            {
                Store (Zero, Local1)
            }

            If (LLess (LPOP, Local1))
            {
                Store (LPOP, Index (TLPO, 0x02))
            }
            Else
            {
                Decrement (Local1)
                Store (Local1, Index (TLPO, 0x02))
            }

            Store (LPOS, Index (TLPO, 0x03))
            Store (LPOW, Index (TLPO, 0x04))
            Store (LPER, Index (TLPO, 0x05))
            Return (TLPO)
        }

        Method (SPUR, 1, NotSerialized)
        {
            If (LLessEqual (Arg0, \TCNT))
            {
                If (LEqual (\_SB.PAGD._STA (), 0x0F))
                {
                    Store (Arg0, Index (\_SB.PAGD._PUR, One))
                    Notify (\_SB.PAGD, 0x80)
                }
            }
        }

        Name (AEXL, Package (0x04)
        {
            "svchost.exe", 
            "dllhost.exe", 
            "smss.exe", 
            "WinSAT.exe"
        })
        Method (PCCC, 0, Serialized)
        {
            Store (One, Index (PCCX, Zero))
            Switch (ToInteger (CPNU (PTDP, Zero)))
            {
                Case (0x39)
                {
                    Store (0xA7F8, Index (DerefOf (Index (PCCX, One)), Zero))
                    Store (0x00017318, Index (DerefOf (Index (PCCX, One)), One))
                }
                Case (0x2F)
                {
                    Store (0x9858, Index (DerefOf (Index (PCCX, One)), Zero))
                    Store (0x00014C08, Index (DerefOf (Index (PCCX, One)), One))
                }
                Case (0x25)
                {
                    Store (0x7148, Index (DerefOf (Index (PCCX, One)), Zero))
                    Store (0xD6D8, Index (DerefOf (Index (PCCX, One)), One))
                }
                Case (0x19)
                {
                    Store (0x3E80, Index (DerefOf (Index (PCCX, One)), Zero))
                    Store (0x7D00, Index (DerefOf (Index (PCCX, One)), One))
                }
                Case (0x0F)
                {
                    Store (0x36B0, Index (DerefOf (Index (PCCX, One)), Zero))
                    Store (0x7D00, Index (DerefOf (Index (PCCX, One)), One))
                }
                Case (0x0B)
                {
                    Store (0x36B0, Index (DerefOf (Index (PCCX, One)), Zero))
                    Store (0x61A8, Index (DerefOf (Index (PCCX, One)), One))
                }
                Default
                {
                    Store (0xFF, Index (DerefOf (Index (PCCX, One)), Zero))
                    Store (0xFF, Index (DerefOf (Index (PCCX, One)), One))
                }

            }

            Return (PCCX)
        }

        Name (PCCX, Package (0x02)
        {
            0x80000000, 
            Package (0x02)
            {
                0x80000000, 
                0x80000000
            }
        })
        Name (KEFF, Package (0x1E)
        {
            Package (0x02)
            {
                0x01BC, 
                Zero
            }, 

            Package (0x02)
            {
                0x01CF, 
                0x27
            }, 

            Package (0x02)
            {
                0x01E1, 
                0x4B
            }, 

            Package (0x02)
            {
                0x01F3, 
                0x6C
            }, 

            Package (0x02)
            {
                0x0206, 
                0x8B
            }, 

            Package (0x02)
            {
                0x0218, 
                0xA8
            }, 

            Package (0x02)
            {
                0x022A, 
                0xC3
            }, 

            Package (0x02)
            {
                0x023D, 
                0xDD
            }, 

            Package (0x02)
            {
                0x024F, 
                0xF4
            }, 

            Package (0x02)
            {
                0x0261, 
                0x010B
            }, 

            Package (0x02)
            {
                0x0274, 
                0x011F
            }, 

            Package (0x02)
            {
                0x032C, 
                0x01BD
            }, 

            Package (0x02)
            {
                0x03D7, 
                0x0227
            }, 

            Package (0x02)
            {
                0x048B, 
                0x026D
            }, 

            Package (0x02)
            {
                0x053E, 
                0x02A1
            }, 

            Package (0x02)
            {
                0x05F7, 
                0x02C6
            }, 

            Package (0x02)
            {
                0x06A8, 
                0x02E6
            }, 

            Package (0x02)
            {
                0x075D, 
                0x02FF
            }, 

            Package (0x02)
            {
                0x0818, 
                0x0311
            }, 

            Package (0x02)
            {
                0x08CF, 
                0x0322
            }, 

            Package (0x02)
            {
                0x179C, 
                0x0381
            }, 

            Package (0x02)
            {
                0x2DDC, 
                0x039C
            }, 

            Package (0x02)
            {
                0x44A8, 
                0x039E
            }, 

            Package (0x02)
            {
                0x5C35, 
                0x0397
            }, 

            Package (0x02)
            {
                0x747D, 
                0x038D
            }, 

            Package (0x02)
            {
                0x8D7F, 
                0x0382
            }, 

            Package (0x02)
            {
                0xA768, 
                0x0376
            }, 

            Package (0x02)
            {
                0xC23B, 
                0x0369
            }, 

            Package (0x02)
            {
                0xDE26, 
                0x035A
            }, 

            Package (0x02)
            {
                0xFB7C, 
                0x034A
            }
        })
        Name (CEUP, Package (0x06)
        {
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000
        })
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            Return (\_SB.IETM.CTOK (PCTP))
        }

        Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
        {
            Store (Arg0, LSTM)
            Notify (\_SB.PCI0.B0D4, 0x91)
        }

        Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
        {
            Return (0x0ADE)
        }

        Name (PTYP, Zero)
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                Return (\_SB.PR00._PSS ())
            }
            Else
            {
                Return (Package (0x02)
                {
                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TSS, 0, NotSerialized)  // _TSS: Throttling Supported States
        {
            If (CondRefOf (\_SB.PR00._TSS))
            {
                Return (\_SB.PR00._TSS ())
            }
            Else
            {
                Return (Package (0x01)
                {
                    Package (0x05)
                    {
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TPC, 0, NotSerialized)  // _TPC: Throttling Present Capabilities
        {
            If (CondRefOf (\_SB.PR00._TPC))
            {
                Return (\_SB.PR00._TPC)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PTC, 0, NotSerialized)  // _PTC: Processor Throttling Control
        {
            If (LAnd (CondRefOf (\PC00), LNotEqual (\PC00, 0x80000000)))
            {
                If (And (\PC00, 0x04))
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }
                    })
                }
            }
            Else
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }
        }

        Method (_TSD, 0, NotSerialized)  // _TSD: Throttling State Dependencies
        {
            If (CondRefOf (\_SB.PR00._TSD))
            {
                Return (\_SB.PR00._TSD ())
            }
            Else
            {
                Return (Package (0x01)
                {
                    Package (0x05)
                    {
                        0x05, 
                        Zero, 
                        Zero, 
                        0xFC, 
                        Zero
                    }
                })
            }
        }

        Method (_TDL, 0, NotSerialized)  // _TDL: T-State Depth Limit
        {
            If (LAnd (CondRefOf (\_SB.PR00._TSS), CondRefOf (\_SB.CFGD)))
            {
                If (And (\_SB.CFGD, 0x2000))
                {
                    Return (Subtract (SizeOf (\_SB.PR00.TSMF), One))
                }
                Else
                {
                    Return (Subtract (SizeOf (\_SB.PR00.TSMC), One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PDL, 0, NotSerialized)  // _PDL: P-state Depth Limit
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                If (And (\_SB.OSCP, 0x0400))
                {
                    Return (Subtract (SizeOf (\_SB.PR00.TPSS), One))
                }
                Else
                {
                    Return (Subtract (SizeOf (\_SB.PR00.LPSS), One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
        {
            Return (\CPUS)
        }

        Method (_AC0, 0, Serialized)  // _ACx: Active Cooling
        {
            If (LEqual (\ATMC, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Store (\_SB.IETM.CTOK (\ATMC), Local1)
            If (LGreaterEqual (LSTM, Local1))
            {
                Return (Subtract (Local1, 0x14))
            }
            Else
            {
                Return (Local1)
            }
        }

        Method (_AC1, 0, Serialized)  // _ACx: Active Cooling
        {
            If (LEqual (\ATMC, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Store (\_SB.IETM.CTOK (\ATMC), Local0)
            Subtract (Local0, 0x32, Local0)
            If (LGreaterEqual (LSTM, Local0))
            {
                Return (Subtract (Local0, 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_AC2, 0, Serialized)  // _ACx: Active Cooling
        {
            If (LEqual (\ATMC, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Store (\_SB.IETM.CTOK (\ATMC), Local0)
            Subtract (Local0, 0x64, Local0)
            If (LGreaterEqual (LSTM, Local0))
            {
                Return (Subtract (Local0, 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_AC3, 0, Serialized)  // _ACx: Active Cooling
        {
            If (LEqual (\ATMC, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Store (\_SB.IETM.CTOK (\ATMC), Local0)
            Subtract (Local0, 0x96, Local0)
            If (LGreaterEqual (LSTM, Local0))
            {
                Return (Subtract (Local0, 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_AC4, 0, Serialized)  // _ACx: Active Cooling
        {
            If (LEqual (\ATMC, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Store (\_SB.IETM.CTOK (\ATMC), Local0)
            Subtract (Local0, 0xC8, Local0)
            If (LGreaterEqual (LSTM, Local0))
            {
                Return (Subtract (Local0, 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
        {
            If (LEqual (\PTMC, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\PTMC))
        }

        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If (LEqual (\SACT, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\SACT))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If (LEqual (\SAC3, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\SAC3))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If (LEqual (\SAHT, Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\SAHT))
        }

        Method (UVTH, 1, Serialized)
        {
        }
    }

    Scope (\_SB.IETM)
    {
        Name (CTSP, Package (0x01)
        {
            ToUUID ("e145970a-e4c1-4d73-900e-c9c5a69dd067")
        })
    }

    Scope (\_SB.PCI0.B0D4)
    {
        Method (TDPL, 0, Serialized)
        {
            Name (AAAA, Zero)
            Name (BBBB, Zero)
            Name (CCCC, Zero)
            Store (CTNL, Local0)
            If (LOr (LEqual (Local0, One), LEqual (Local0, 0x02)))
            {
                Store (\_SB.CLVL, Local0)
            }
            Else
            {
                Return (Package (0x01)
                {
                    Zero
                })
            }

            If (LEqual (CLCK, One))
            {
                Store (One, Local0)
            }

            Store (CPNU (\_SB.PL10, One), AAAA)
            Store (CPNU (\_SB.PL11, One), BBBB)
            Store (CPNU (\_SB.PL12, One), CCCC)
            Name (TMP1, Package (0x01)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP2, Package (0x02)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP3, Package (0x03)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            If (LEqual (Local0, 0x03))
            {
                If (LGreater (AAAA, BBBB))
                {
                    If (LGreater (AAAA, CCCC))
                    {
                        If (LGreater (BBBB, CCCC))
                        {
                            Store (Zero, Local3)
                            Store (Zero, LEV0)
                            Store (One, Local4)
                            Store (One, LEV1)
                            Store (0x02, Local5)
                            Store (0x02, LEV2)
                        }
                        Else
                        {
                            Store (Zero, Local3)
                            Store (Zero, LEV0)
                            Store (One, Local5)
                            Store (0x02, LEV1)
                            Store (0x02, Local4)
                            Store (One, LEV2)
                        }
                    }
                    Else
                    {
                        Store (Zero, Local5)
                        Store (0x02, LEV0)
                        Store (One, Local3)
                        Store (Zero, LEV1)
                        Store (0x02, Local4)
                        Store (One, LEV2)
                    }
                }
                ElseIf (LGreater (BBBB, CCCC))
                {
                    If (LGreater (AAAA, CCCC))
                    {
                        Store (Zero, Local4)
                        Store (One, LEV0)
                        Store (One, Local3)
                        Store (Zero, LEV1)
                        Store (0x02, Local5)
                        Store (0x02, LEV2)
                    }
                    Else
                    {
                        Store (Zero, Local4)
                        Store (One, LEV0)
                        Store (One, Local5)
                        Store (0x02, LEV1)
                        Store (0x02, Local3)
                        Store (Zero, LEV2)
                    }
                }
                Else
                {
                    Store (Zero, Local5)
                    Store (0x02, LEV0)
                    Store (One, Local4)
                    Store (One, LEV1)
                    Store (0x02, Local3)
                    Store (Zero, LEV2)
                }

                Store (Add (\_SB.TAR0, One), Local1)
                Multiply (Local1, 0x64, Local2)
                Store (AAAA, Index (DerefOf (Index (TMP3, Local3)), Zero))
                Store (Local2, Index (DerefOf (Index (TMP3, Local3)), One))
                Store (\_SB.CTC0, Index (DerefOf (Index (TMP3, Local3)), 0x02))
                Store (Local1, Index (DerefOf (Index (TMP3, Local3)), 0x03))
                Store (Zero, Index (DerefOf (Index (TMP3, Local3)), 0x04))
                Store (Add (\_SB.TAR1, One), Local1)
                Multiply (Local1, 0x64, Local2)
                Store (BBBB, Index (DerefOf (Index (TMP3, Local4)), Zero))
                Store (Local2, Index (DerefOf (Index (TMP3, Local4)), One))
                Store (\_SB.CTC1, Index (DerefOf (Index (TMP3, Local4)), 0x02))
                Store (Local1, Index (DerefOf (Index (TMP3, Local4)), 0x03))
                Store (Zero, Index (DerefOf (Index (TMP3, Local4)), 0x04))
                Store (Add (\_SB.TAR2, One), Local1)
                Multiply (Local1, 0x64, Local2)
                Store (CCCC, Index (DerefOf (Index (TMP3, Local5)), Zero))
                Store (Local2, Index (DerefOf (Index (TMP3, Local5)), One))
                Store (\_SB.CTC2, Index (DerefOf (Index (TMP3, Local5)), 0x02))
                Store (Local1, Index (DerefOf (Index (TMP3, Local5)), 0x03))
                Store (Zero, Index (DerefOf (Index (TMP3, Local5)), 0x04))
                Return (TMP3)
            }

            If (LEqual (Local0, 0x02))
            {
                If (LGreater (AAAA, BBBB))
                {
                    Store (Zero, Local3)
                    Store (One, Local4)
                    Store (Zero, LEV0)
                    Store (One, LEV1)
                    Store (Zero, LEV2)
                }
                Else
                {
                    Store (Zero, Local4)
                    Store (One, Local3)
                    Store (One, LEV0)
                    Store (Zero, LEV1)
                    Store (Zero, LEV2)
                }

                Store (Add (\_SB.TAR0, One), Local1)
                Multiply (Local1, 0x64, Local2)
                Store (AAAA, Index (DerefOf (Index (TMP2, Local3)), Zero))
                Store (Local2, Index (DerefOf (Index (TMP2, Local3)), One))
                Store (\_SB.CTC0, Index (DerefOf (Index (TMP2, Local3)), 0x02))
                Store (Local1, Index (DerefOf (Index (TMP2, Local3)), 0x03))
                Store (Zero, Index (DerefOf (Index (TMP2, Local3)), 0x04))
                Store (Add (\_SB.TAR1, One), Local1)
                Multiply (Local1, 0x64, Local2)
                Store (BBBB, Index (DerefOf (Index (TMP2, Local4)), Zero))
                Store (Local2, Index (DerefOf (Index (TMP2, Local4)), One))
                Store (\_SB.CTC1, Index (DerefOf (Index (TMP2, Local4)), 0x02))
                Store (Local1, Index (DerefOf (Index (TMP2, Local4)), 0x03))
                Store (Zero, Index (DerefOf (Index (TMP2, Local4)), 0x04))
                Return (TMP2)
            }

            If (LEqual (Local0, One))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        Store (Add (\_SB.TAR0, One), Local1)
                        Multiply (Local1, 0x64, Local2)
                        Store (AAAA, Index (DerefOf (Index (TMP1, Zero)), Zero))
                        Store (Local2, Index (DerefOf (Index (TMP1, Zero)), One))
                        Store (\_SB.CTC0, Index (DerefOf (Index (TMP1, Zero)), 0x02))
                        Store (Local1, Index (DerefOf (Index (TMP1, Zero)), 0x03))
                        Store (Zero, Index (DerefOf (Index (TMP1, Zero)), 0x04))
                        Store (Zero, LEV0)
                        Store (Zero, LEV1)
                        Store (Zero, LEV2)
                    }
                    Case (One)
                    {
                        Store (Add (\_SB.TAR1, One), Local1)
                        Multiply (Local1, 0x64, Local2)
                        Store (BBBB, Index (DerefOf (Index (TMP1, Zero)), Zero))
                        Store (Local2, Index (DerefOf (Index (TMP1, Zero)), One))
                        Store (\_SB.CTC1, Index (DerefOf (Index (TMP1, Zero)), 0x02))
                        Store (Local1, Index (DerefOf (Index (TMP1, Zero)), 0x03))
                        Store (Zero, Index (DerefOf (Index (TMP1, Zero)), 0x04))
                        Store (One, LEV0)
                        Store (One, LEV1)
                        Store (One, LEV2)
                    }
                    Case (0x02)
                    {
                        Store (Add (\_SB.TAR2, One), Local1)
                        Multiply (Local1, 0x64, Local2)
                        Store (CCCC, Index (DerefOf (Index (TMP1, Zero)), Zero))
                        Store (Local2, Index (DerefOf (Index (TMP1, Zero)), One))
                        Store (\_SB.CTC2, Index (DerefOf (Index (TMP1, Zero)), 0x02))
                        Store (Local1, Index (DerefOf (Index (TMP1, Zero)), 0x03))
                        Store (Zero, Index (DerefOf (Index (TMP1, Zero)), 0x04))
                        Store (0x02, LEV0)
                        Store (0x02, LEV1)
                        Store (0x02, LEV2)
                    }

                }

                Return (TMP1)
            }

            Return (Zero)
        }

        Name (MAXT, Zero)
        Method (TDPC, 0, NotSerialized)
        {
            Return (MAXT)
        }

        Name (LEV0, Zero)
        Name (LEV1, Zero)
        Name (LEV2, Zero)
        Method (STDP, 1, Serialized)
        {
            If (LGreaterEqual (Arg0, \_SB.CLVL))
            {
                Return (Zero)
            }

            Switch (ToInteger (Arg0))
            {
                Case (Zero)
                {
                    Store (LEV0, Local0)
                }
                Case (One)
                {
                    Store (LEV1, Local0)
                }
                Case (0x02)
                {
                    Store (LEV2, Local0)
                }

            }

            Switch (ToInteger (Local0))
            {
                Case (Zero)
                {
                    CPL0 ()
                }
                Case (One)
                {
                    CPL1 ()
                }
                Case (0x02)
                {
                    CPL2 ()
                }

            }

            Notify (\_SB.PCI0.B0D4, 0x83)
        }
    }

    Scope (\_SB.IETM)
    {
        Name (PTTL, 0x14)
        Name (PSVT, Package (0x02)
        {
            0x02, 
            Package (0x0C)
            {
                \_SB.PCI0.B0D4, 
                \_SB.PCI0.B0D4, 
                0x0A, 
                0x0A, 
                0x0DCC, 
                0x09, 
                0x00010000, 
                "MAX", 
                0x01F4, 
                0x0A, 
                0x0A, 
                Zero
            }
        })
        Store (\_SB.IETM.CTOK (PTMC), Index (DerefOf (Index (\_SB.IETM.PSVT, One)), 0x04))
    }

    Scope (\_SB.IETM)
    {
        Name (DP2P, Package (0x01)
        {
            ToUUID ("9e04115a-ae87-4d1c-9500-0f3e340bfe75")
        })
        Name (DPSP, Package (0x01)
        {
            ToUUID ("42a441d6-ae6a-462b-a84b-4a8ce79027d3")
        })
        Name (DASP, Package (0x01)
        {
            ToUUID ("3a95c389-e4b8-4629-a526-c52c88626bae")
        })
        Name (DA2P, Package (0x01)
        {
            ToUUID ("0e56fab6-bdfc-4e8c-8246-40ecfd4d74ea")
        })
        Name (DCSP, Package (0x01)
        {
            ToUUID ("97c68ae7-15fa-499c-b8c9-5da81d606e0a")
        })
        Name (RFIP, Package (0x01)
        {
            ToUUID ("c4ce1849-243a-49f3-b8d5-f97002f38e6a")
        })
        Name (POBP, Package (0x01)
        {
            ToUUID ("f5a35014-c209-46a4-993a-eb56de7530a1")
        })
        Name (DAPP, Package (0x01)
        {
            ToUUID ("63be270f-1c11-48fd-a6f7-3af253ff3e2d")
        })
        Name (DVSP, Package (0x01)
        {
            ToUUID ("6ed722a7-9240-48a5-b479-31eef723d7cf")
        })
        Name (DPID, Package (0x01)
        {
            ToUUID ("42496e14-bc1b-46e8-a798-ca915464426f")
        })
    }

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Device (SEN1)
        {
            Name (_HID, EisaId ("INT3403"))  // _HID: Hardware ID
            Name (_UID, "CPUS")  // _UID: Unique ID
            Name (_STR, Unicode ("Thermistor CPU"))  // _STR: Description String
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.EC0.ECAV)
                {
                    If (LEqual (Acquire (\_SB.PCI0.LPCB.EC0.LFCM, 0xA000), Zero))
                    {
                        Store (\_SB.IETM.C10K (Multiply (\_SB.PCI0.LPCB.EC0.CPUS, 0x0A)), Local0)
                        Release (\_SB.PCI0.LPCB.EC0.LFCM)
                        Return (Local0)
                    }
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }

            Name (GTSH, 0x14)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Device (SEN2)
        {
            Name (_HID, EisaId ("INT3403"))  // _HID: Hardware ID
            Name (_UID, "GPUT")  // _UID: Unique ID
            Name (_STR, Unicode ("GPU DTS"))  // _STR: Description String
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.EC0.ECAV)
                {
                    If (LEqual (Acquire (\_SB.PCI0.LPCB.EC0.LFCM, 0xA000), Zero))
                    {
                        Store (\_SB.IETM.C10K (Multiply (\_SB.PCI0.LPCB.EC0.GPUT, 0x0A)), Local0)
                        Release (\_SB.PCI0.LPCB.EC0.LFCM)
                        Return (Local0)
                    }
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }

            Name (GTSH, 0x14)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Device (SEN3)
        {
            Name (_HID, EisaId ("INT3403"))  // _HID: Hardware ID
            Name (_UID, "CHIS")  // _UID: Unique ID
            Name (_STR, Unicode ("Thermistor Charger IC"))  // _STR: Description String
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.EC0.ECAV)
                {
                    If (LEqual (Acquire (\_SB.PCI0.LPCB.EC0.LFCM, 0xA000), Zero))
                    {
                        Store (\_SB.IETM.C10K (Multiply (\_SB.PCI0.LPCB.EC0.CHIS, 0x0A)), Local0)
                        Release (\_SB.PCI0.LPCB.EC0.LFCM)
                        Return (Local0)
                    }
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }

            Name (GTSH, 0x14)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Device (SEN4)
        {
            Name (_HID, EisaId ("INT3403"))  // _HID: Hardware ID
            Name (_UID, "GPUS")  // _UID: Unique ID
            Name (_STR, Unicode ("Thermistor GPU"))  // _STR: Description String
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.EC0.ECAV)
                {
                    If (LEqual (Acquire (\_SB.PCI0.LPCB.EC0.LFCM, 0xA000), Zero))
                    {
                        Store (\_SB.IETM.C10K (Multiply (\_SB.PCI0.LPCB.EC0.GPUS, 0x0A)), Local0)
                        Release (\_SB.PCI0.LPCB.EC0.LFCM)
                        Return (Local0)
                    }
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }

            Name (GTSH, 0x14)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Device (SEN5)
        {
            Name (_HID, EisaId ("INT3403"))  // _HID: Hardware ID
            Name (_UID, "CPUT")  // _UID: Unique ID
            Name (_STR, Unicode ("CPU DTS"))  // _STR: Description String
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.EC0.ECAV)
                {
                    If (LEqual (Acquire (\_SB.PCI0.LPCB.EC0.LFCM, 0xA000), Zero))
                    {
                        Store (\_SB.IETM.C10K (Multiply (\_SB.PCI0.LPCB.EC0.CPUT, 0x0A)), Local0)
                        Release (\_SB.PCI0.LPCB.EC0.LFCM)
                        Return (Local0)
                    }
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }

            Name (GTSH, 0x14)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Method (GDDV, 0, Serialized)
        {
            Return (Package (0x01)
            {
                Buffer (0x076A)
                {
                    /* 0000 */  0xE5, 0x1F, 0x94, 0x00, 0x00, 0x00, 0x00, 0x02,
                    /* 0008 */  0x00, 0x00, 0x00, 0x40, 0x67, 0x64, 0x64, 0x76,
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x4F, 0x45, 0x4D, 0x20,
                    /* 0030 */  0x45, 0x78, 0x70, 0x6F, 0x72, 0x74, 0x65, 0x64,
                    /* 0038 */  0x20, 0x44, 0x61, 0x74, 0x61, 0x56, 0x61, 0x75,
                    /* 0040 */  0x6C, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x57, 0x5A, 0x74, 0x33,
                    /* 0070 */  0x62, 0x5C, 0xC4, 0xF1, 0x5F, 0x1A, 0x69, 0x2C,
                    /* 0078 */  0x8C, 0x19, 0x24, 0x65, 0x86, 0xF8, 0x2D, 0x22,
                    /* 0080 */  0x11, 0xDB, 0x7B, 0xF4, 0x15, 0x79, 0xEB, 0x20,
                    /* 0088 */  0x4E, 0x78, 0x15, 0x4D, 0xD6, 0x06, 0x00, 0x00,
                    /* 0090 */  0x52, 0x45, 0x50, 0x4F, 0x5D, 0x00, 0x00, 0x00,
                    /* 0098 */  0x01, 0xA9, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 00A0 */  0x00, 0x00, 0x72, 0x87, 0xCD, 0xFF, 0x6D, 0x24,
                    /* 00A8 */  0x47, 0xDB, 0x3D, 0x24, 0x92, 0xB4, 0x16, 0x6F,
                    /* 00B0 */  0x45, 0xD8, 0xC3, 0xF5, 0x66, 0x14, 0x9F, 0x22,
                    /* 00B8 */  0xD7, 0xF7, 0xDE, 0x67, 0x90, 0x9A, 0xA2, 0x0D,
                    /* 00C0 */  0x39, 0x25, 0xAD, 0xC3, 0x1A, 0xAD, 0x52, 0x0B,
                    /* 00C8 */  0x75, 0x38, 0xE1, 0xA4, 0x14, 0x41, 0xAF, 0xCB,
                    /* 00D0 */  0x90, 0x9C, 0xBD, 0xF7, 0xD1, 0xAB, 0x5F, 0xB4,
                    /* 00D8 */  0xB4, 0x12, 0x61, 0x6E, 0xC0, 0xCC, 0x4F, 0x45,
                    /* 00E0 */  0x19, 0xA7, 0xB1, 0x93, 0xDE, 0xC5, 0xEB, 0xF7,
                    /* 00E8 */  0x1D, 0x10, 0x14, 0x12, 0x7B, 0x9C, 0xD4, 0xB2,
                    /* 00F0 */  0x70, 0x32, 0xD9, 0x28, 0x4F, 0xD8, 0x2F, 0x8B,
                    /* 00F8 */  0x28, 0x8D, 0x89, 0xB8, 0xDF, 0x19, 0xB5, 0x62,
                    /* 0100 */  0xD7, 0x27, 0x2D, 0xAB, 0x1A, 0x50, 0x31, 0x15,
                    /* 0108 */  0x09, 0xE6, 0x3B, 0xA4, 0xC2, 0xF4, 0xF4, 0x85,
                    /* 0110 */  0x28, 0x23, 0x42, 0xDA, 0x7C, 0xA6, 0xBC, 0xB8,
                    /* 0118 */  0x3A, 0x82, 0x86, 0x14, 0x50, 0xD6, 0x4E, 0xBB,
                    /* 0120 */  0x1E, 0xB1, 0xB6, 0xA0, 0x22, 0x1D, 0x93, 0x17,
                    /* 0128 */  0x3E, 0xCF, 0x1C, 0x21, 0x0C, 0x37, 0x17, 0x04,
                    /* 0130 */  0x3A, 0x4C, 0x53, 0x2C, 0xF4, 0x2D, 0x10, 0xCA,
                    /* 0138 */  0x01, 0x1B, 0xC5, 0xB9, 0x6A, 0xDA, 0xB9, 0x25,
                    /* 0140 */  0x9F, 0xA2, 0x26, 0x49, 0x14, 0xBA, 0x8C, 0x6D,
                    /* 0148 */  0x09, 0xF3, 0xDB, 0x8E, 0xFD, 0x24, 0x10, 0xCB,
                    /* 0150 */  0x84, 0x35, 0x19, 0x74, 0xFE, 0x9F, 0x8A, 0x76,
                    /* 0158 */  0xAF, 0xBC, 0xE6, 0x82, 0xA6, 0x7D, 0x19, 0x06,
                    /* 0160 */  0xF8, 0xB7, 0xDC, 0xB4, 0xCB, 0x2F, 0x33, 0x1C,
                    /* 0168 */  0x68, 0x39, 0x2F, 0xB4, 0xBC, 0x04, 0x62, 0x19,
                    /* 0170 */  0x5C, 0xA1, 0xC1, 0x5C, 0x0C, 0xC6, 0x2B, 0xD3,
                    /* 0178 */  0x01, 0xEE, 0xCD, 0x6B, 0xB0, 0x6C, 0xB0, 0x8D,
                    /* 0180 */  0xEB, 0x97, 0xA1, 0x3F, 0x42, 0x1F, 0xA5, 0x89,
                    /* 0188 */  0xC8, 0xDA, 0x09, 0x32, 0x63, 0xD7, 0x3F, 0x3B,
                    /* 0190 */  0xB3, 0xD8, 0xE3, 0x03, 0xB7, 0x86, 0x18, 0xBB,
                    /* 0198 */  0x70, 0xCE, 0xDC, 0x96, 0x77, 0xE9, 0xD5, 0x16,
                    /* 01A0 */  0xE2, 0x25, 0xC0, 0x04, 0xF9, 0x4F, 0x0E, 0x47,
                    /* 01A8 */  0xBA, 0xCD, 0x35, 0xB7, 0xA8, 0x9F, 0x77, 0x30,
                    /* 01B0 */  0x32, 0x95, 0x86, 0xAE, 0xD3, 0x0F, 0x54, 0x51,
                    /* 01B8 */  0x70, 0x1D, 0x03, 0xE9, 0x87, 0x5A, 0xF2, 0x42,
                    /* 01C0 */  0x16, 0xB1, 0x5F, 0x97, 0x25, 0x2A, 0xC5, 0x43,
                    /* 01C8 */  0x11, 0xC7, 0xCB, 0x61, 0x10, 0x6B, 0xB6, 0x1B,
                    /* 01D0 */  0xAF, 0x39, 0x5B, 0x54, 0xA0, 0x1B, 0x27, 0x13,
                    /* 01D8 */  0x30, 0x48, 0x51, 0x24, 0xEB, 0x4A, 0x30, 0x23,
                    /* 01E0 */  0x8D, 0x96, 0xB2, 0xB9, 0xBE, 0xF7, 0x73, 0xC7,
                    /* 01E8 */  0x33, 0xB3, 0x8E, 0x67, 0x6E, 0x1F, 0xF9, 0xEA,
                    /* 01F0 */  0x08, 0x8C, 0x7B, 0xF2, 0x11, 0x43, 0x5F, 0xD4,
                    /* 01F8 */  0x3E, 0x23, 0x18, 0xB7, 0x99, 0xBD, 0x33, 0x43,
                    /* 0200 */  0x02, 0x7A, 0xFF, 0x98, 0x70, 0x6E, 0x40, 0x82,
                    /* 0208 */  0x0A, 0x30, 0x8D, 0x53, 0xD3, 0xEB, 0xAC, 0x0E,
                    /* 0210 */  0xF5, 0x55, 0x60, 0x86, 0x54, 0x7A, 0x9B, 0xDD,
                    /* 0218 */  0xD0, 0x64, 0xA8, 0x3B, 0x81, 0xC4, 0x1B, 0x0E,
                    /* 0220 */  0x0E, 0x3A, 0x98, 0xE0, 0x48, 0xB3, 0x09, 0x37,
                    /* 0228 */  0x4E, 0x86, 0x86, 0xED, 0xC1, 0xEC, 0x0E, 0xD5,
                    /* 0230 */  0x3B, 0xF9, 0xEF, 0x38, 0x8B, 0x8A, 0xA3, 0x78,
                    /* 0238 */  0xFF, 0x01, 0x2B, 0x0D, 0x68, 0xA5, 0xA0, 0x01,
                    /* 0240 */  0x25, 0xA5, 0xBE, 0xF2, 0x40, 0x76, 0x4E, 0x54,
                    /* 0248 */  0xF3, 0xA1, 0x4F, 0xBE, 0xDA, 0x9A, 0x97, 0x03,
                    /* 0250 */  0x2E, 0x80, 0xEC, 0x5F, 0x6B, 0x24, 0x30, 0x13,
                    /* 0258 */  0x9D, 0x4E, 0x8D, 0xA8, 0x72, 0xBF, 0x21, 0xD8,
                    /* 0260 */  0x17, 0xB2, 0xD7, 0xD7, 0x2D, 0xDE, 0x0C, 0x26,
                    /* 0268 */  0x0D, 0x62, 0x3B, 0xBE, 0xC1, 0x6E, 0x99, 0x4C,
                    /* 0270 */  0xBF, 0xD5, 0x7C, 0xD0, 0x4C, 0x8D, 0x6C, 0x04,
                    /* 0278 */  0xA1, 0x4B, 0xED, 0x09, 0xDC, 0xE3, 0x5D, 0x0C,
                    /* 0280 */  0x70, 0xE8, 0x1A, 0xE7, 0x10, 0x40, 0xA6, 0x57,
                    /* 0288 */  0x15, 0x61, 0xBD, 0x39, 0xD5, 0x1E, 0x0A, 0xCD,
                    /* 0290 */  0xF0, 0xA3, 0x74, 0x5C, 0x41, 0x29, 0x09, 0x02,
                    /* 0298 */  0xF5, 0x07, 0x69, 0x25, 0x6B, 0x7C, 0x0D, 0xF1,
                    /* 02A0 */  0x09, 0xF9, 0xF7, 0xBF, 0xDB, 0xB6, 0xD4, 0x28,
                    /* 02A8 */  0x0F, 0x58, 0x78, 0x79, 0xB8, 0xF1, 0x1A, 0xFF,
                    /* 02B0 */  0x1D, 0x9E, 0xDB, 0x8D, 0xC0, 0x3B, 0x40, 0xCB,
                    /* 02B8 */  0xAE, 0x79, 0x67, 0x1E, 0x06, 0x30, 0x9B, 0x77,
                    /* 02C0 */  0x4E, 0x66, 0xD8, 0xEA, 0x7F, 0x77, 0x85, 0x30,
                    /* 02C8 */  0x71, 0xBC, 0x18, 0xE3, 0x8F, 0x5F, 0x1F, 0xCE,
                    /* 02D0 */  0xED, 0xDF, 0x3B, 0x09, 0x34, 0x53, 0x15, 0xBB,
                    /* 02D8 */  0xE0, 0x92, 0x6C, 0x51, 0x5C, 0xD1, 0x53, 0xCC,
                    /* 02E0 */  0x01, 0xAA, 0x08, 0x8F, 0x45, 0xE0, 0x2F, 0x7F,
                    /* 02E8 */  0x16, 0x40, 0x72, 0x5F, 0x8B, 0xC1, 0x88, 0xFD,
                    /* 02F0 */  0xCF, 0x57, 0x9A, 0x16, 0x42, 0x71, 0x0B, 0x33,
                    /* 02F8 */  0x9E, 0x8D, 0x1C, 0x4D, 0x77, 0x4E, 0x73, 0x2F,
                    /* 0300 */  0x50, 0xAA, 0x0C, 0x6A, 0xAC, 0x87, 0x7A, 0xD1,
                    /* 0308 */  0x78, 0x85, 0xA7, 0xBE, 0xB0, 0x10, 0xE9, 0x58,
                    /* 0310 */  0x08, 0x24, 0xDE, 0xC5, 0xF5, 0xFC, 0xB0, 0xD0,
                    /* 0318 */  0x9F, 0x08, 0xCC, 0xCE, 0x44, 0xB6, 0x84, 0x08,
                    /* 0320 */  0xD1, 0xB8, 0x56, 0xAC, 0xC4, 0x80, 0xB8, 0x82,
                    /* 0328 */  0xFE, 0x71, 0xEE, 0x4B, 0x54, 0x2B, 0x62, 0x19,
                    /* 0330 */  0x15, 0x17, 0xD4, 0xA9, 0x42, 0x64, 0x3C, 0x12,
                    /* 0338 */  0xFE, 0x3E, 0x1F, 0x50, 0xD7, 0xBA, 0x25, 0x3C,
                    /* 0340 */  0x3C, 0x2D, 0xBC, 0x37, 0xD9, 0xB3, 0x40, 0xCE,
                    /* 0348 */  0x07, 0x69, 0x46, 0x89, 0x7F, 0x72, 0x36, 0x9A,
                    /* 0350 */  0x18, 0xD8, 0x69, 0x7A, 0x20, 0x14, 0x1E, 0xCA,
                    /* 0358 */  0x23, 0x7B, 0x79, 0x1D, 0x61, 0xC0, 0xCA, 0x9E,
                    /* 0360 */  0x64, 0xED, 0x8A, 0x33, 0xAD, 0x8E, 0x9E, 0x5F,
                    /* 0368 */  0x80, 0x1B, 0x71, 0x15, 0x6E, 0xD7, 0x33, 0x21,
                    /* 0370 */  0x53, 0xC7, 0xBA, 0x3C, 0xAF, 0x3E, 0xE3, 0xBE,
                    /* 0378 */  0x50, 0xD9, 0xE6, 0xB1, 0xE2, 0x3D, 0x54, 0xA3,
                    /* 0380 */  0xBD, 0xD5, 0xC7, 0x3E, 0x57, 0xB3, 0xE8, 0xCD,
                    /* 0388 */  0xAE, 0x0C, 0xBC, 0xD1, 0x00, 0x80, 0x4A, 0x4E,
                    /* 0390 */  0x8F, 0xBB, 0x7E, 0x0A, 0x5A, 0x95, 0x05, 0xC0,
                    /* 0398 */  0x4C, 0x68, 0x6D, 0x1D, 0xA6, 0xA8, 0xEC, 0x5F,
                    /* 03A0 */  0xEC, 0x47, 0xA0, 0xE9, 0xB0, 0x11, 0x66, 0x70,
                    /* 03A8 */  0xD5, 0xCE, 0x51, 0x70, 0x95, 0x67, 0x41, 0x11,
                    /* 03B0 */  0x2D, 0xEA, 0xAD, 0x85, 0x4C, 0x13, 0xB3, 0x95,
                    /* 03B8 */  0xEF, 0x3D, 0x08, 0x92, 0xBA, 0xE5, 0xC5, 0xEC,
                    /* 03C0 */  0xDD, 0x5A, 0x7F, 0x27, 0xFF, 0x10, 0xFE, 0x2D,
                    /* 03C8 */  0xDC, 0xCA, 0x42, 0x8F, 0xBA, 0x64, 0xF8, 0x60,
                    /* 03D0 */  0xCF, 0x39, 0xFC, 0xD8, 0x72, 0x9B, 0x61, 0xB3,
                    /* 03D8 */  0xCF, 0x8B, 0xA9, 0xAC, 0xAF, 0x71, 0x96, 0x60,
                    /* 03E0 */  0xB9, 0x64, 0xF7, 0x5F, 0xCB, 0x62, 0x75, 0x6E,
                    /* 03E8 */  0x78, 0x5A, 0x97, 0x84, 0xFF, 0x0A, 0x0C, 0x1F,
                    /* 03F0 */  0x5E, 0xCF, 0x23, 0x17, 0xE7, 0xD8, 0xB9, 0x32,
                    /* 03F8 */  0xF2, 0x80, 0x23, 0x12, 0xE0, 0xE4, 0xEA, 0xE0,
                    /* 0400 */  0x60, 0xD2, 0x51, 0xB8, 0xFB, 0x9D, 0x99, 0x29,
                    /* 0408 */  0x28, 0xA9, 0x5B, 0xCB, 0x3B, 0x7C, 0x70, 0x19,
                    /* 0410 */  0x11, 0xE4, 0xD0, 0x83, 0x64, 0x6E, 0x6A, 0x1B,
                    /* 0418 */  0x88, 0x51, 0x8D, 0x65, 0x3A, 0x97, 0x60, 0x9F,
                    /* 0420 */  0x64, 0xA0, 0x2C, 0x86, 0x64, 0x22, 0x74, 0x3B,
                    /* 0428 */  0x72, 0x5E, 0xD9, 0x0A, 0x8A, 0xC0, 0x35, 0xE1,
                    /* 0430 */  0xA9, 0x3F, 0x48, 0xB1, 0x81, 0xFB, 0x6F, 0x2D,
                    /* 0438 */  0x2C, 0x9F, 0x17, 0xD8, 0x1D, 0x4F, 0x70, 0x77,
                    /* 0440 */  0x16, 0xC4, 0xDE, 0xA8, 0x42, 0x2D, 0xC2, 0xEA,
                    /* 0448 */  0x1D, 0x97, 0x12, 0xBB, 0xBC, 0xAD, 0x38, 0x85,
                    /* 0450 */  0x59, 0xA8, 0x87, 0x43, 0xB4, 0xE1, 0x72, 0xF7,
                    /* 0458 */  0xE6, 0x6C, 0xF6, 0x73, 0x6C, 0x8E, 0x8B, 0x95,
                    /* 0460 */  0x1D, 0x55, 0x08, 0x8E, 0x17, 0x77, 0x11, 0x19,
                    /* 0468 */  0x46, 0x73, 0xD3, 0x6D, 0x29, 0xF5, 0xE2, 0xBB,
                    /* 0470 */  0x0E, 0xDF, 0xCE, 0xB5, 0xA9, 0xD2, 0xE6, 0x22,
                    /* 0478 */  0x7B, 0x4E, 0x92, 0x77, 0x65, 0x5E, 0xA2, 0xD9,
                    /* 0480 */  0x94, 0xC5, 0x97, 0x7D, 0x31, 0xA9, 0xCD, 0xA6,
                    /* 0488 */  0x00, 0x14, 0x45, 0x7D, 0x62, 0x85, 0x83, 0xBD,
                    /* 0490 */  0xC6, 0x1B, 0xFA, 0x79, 0x78, 0x2D, 0x21, 0xA9,
                    /* 0498 */  0x31, 0xB5, 0x30, 0x06, 0x42, 0x1D, 0x66, 0xE5,
                    /* 04A0 */  0xCC, 0x0E, 0x6E, 0xDC, 0xD5, 0x28, 0x32, 0x64,
                    /* 04A8 */  0x51, 0x9F, 0x7E, 0xDA, 0xA3, 0x23, 0xC2, 0x68,
                    /* 04B0 */  0xAB, 0x95, 0x7F, 0x4C, 0xEA, 0x6B, 0x32, 0xD9,
                    /* 04B8 */  0x4C, 0xA8, 0x76, 0x95, 0xAD, 0x0D, 0x1F, 0x9F,
                    /* 04C0 */  0xAB, 0x82, 0x9F, 0x69, 0x90, 0x47, 0xB8, 0xB2,
                    /* 04C8 */  0xE8, 0x54, 0x73, 0xC6, 0x93, 0xC5, 0x09, 0x0A,
                    /* 04D0 */  0xD1, 0xDA, 0xD3, 0xDE, 0x69, 0xB3, 0xCD, 0xF1,
                    /* 04D8 */  0xAC, 0x27, 0x8F, 0xEA, 0xAB, 0x9D, 0x75, 0x92,
                    /* 04E0 */  0x3C, 0x5D, 0xF9, 0x67, 0xBC, 0x6F, 0xF9, 0x7E,
                    /* 04E8 */  0x9F, 0xB2, 0x96, 0x7E, 0xAF, 0x31, 0xCE, 0xD6,
                    /* 04F0 */  0x21, 0xC3, 0x9E, 0x14, 0x2E, 0xAE, 0x31, 0xA0,
                    /* 04F8 */  0x07, 0xCB, 0xC0, 0xC1, 0x7D, 0xA2, 0xAB, 0xAF,
                    /* 0500 */  0xB8, 0xF9, 0x96, 0x24, 0x22, 0x0A, 0x78, 0xF8,
                    /* 0508 */  0xA6, 0x4A, 0x29, 0xBD, 0x09, 0xBF, 0xA1, 0x59,
                    /* 0510 */  0x86, 0x71, 0x8F, 0x04, 0x28, 0xA1, 0x63, 0x08,
                    /* 0518 */  0x8B, 0x29, 0xC2, 0x9E, 0x78, 0x79, 0x63, 0x6A,
                    /* 0520 */  0xC3, 0x51, 0x38, 0x88, 0x44, 0xA7, 0xDF, 0x63,
                    /* 0528 */  0x35, 0x26, 0x20, 0xB5, 0x84, 0x5D, 0x0A, 0xD9,
                    /* 0530 */  0x2A, 0x2A, 0x06, 0x5D, 0x13, 0x05, 0x0F, 0xEA,
                    /* 0538 */  0x1B, 0xF8, 0x7E, 0xD3, 0x49, 0xF1, 0x57, 0xC4,
                    /* 0540 */  0x10, 0x5D, 0x05, 0x4B, 0x3D, 0x5F, 0x36, 0x3B,
                    /* 0548 */  0x6A, 0xAE, 0xF1, 0xBF, 0x74, 0xC1, 0x06, 0x3C,
                    /* 0550 */  0xD5, 0xB2, 0xBD, 0x51, 0xAE, 0x65, 0xD3, 0xCA,
                    /* 0558 */  0x72, 0x6A, 0xF5, 0x56, 0x4F, 0x72, 0x6D, 0x56,
                    /* 0560 */  0x35, 0x7F, 0xB5, 0x6C, 0x56, 0x63, 0x86, 0x90,
                    /* 0568 */  0xEA, 0xDE, 0x5C, 0x66, 0x16, 0x7B, 0x1B, 0x7D,
                    /* 0570 */  0x4C, 0xCD, 0x24, 0xF8, 0xCF, 0xBB, 0x3B, 0xB5,
                    /* 0578 */  0x82, 0x39, 0xAE, 0x37, 0xE8, 0xF2, 0x35, 0xC1,
                    /* 0580 */  0xA6, 0xAE, 0xF4, 0x4B, 0xD1, 0xA5, 0xAB, 0x88,
                    /* 0588 */  0x2A, 0xBD, 0xE4, 0x12, 0xC9, 0x34, 0x2E, 0xA2,
                    /* 0590 */  0x89, 0xE1, 0x61, 0x70, 0x59, 0xB1, 0xE6, 0x94,
                    /* 0598 */  0x3D, 0x9D, 0x0C, 0xBA, 0xEF, 0x83, 0x20, 0xC3,
                    /* 05A0 */  0xB4, 0xAA, 0x90, 0xF6, 0x01, 0xD9, 0xDF, 0x40,
                    /* 05A8 */  0x87, 0x8C, 0x20, 0x54, 0x1E, 0xFA, 0x0C, 0x2C,
                    /* 05B0 */  0xC6, 0xA6, 0xCA, 0x9C, 0x92, 0xB1, 0x0C, 0x0B,
                    /* 05B8 */  0x76, 0x05, 0xDB, 0x24, 0x98, 0xD4, 0x9E, 0x99,
                    /* 05C0 */  0x00, 0x40, 0xAF, 0x8C, 0x7F, 0x9E, 0x4D, 0x50,
                    /* 05C8 */  0x73, 0x5B, 0x3C, 0x0C, 0x21, 0x0D, 0x33, 0x91,
                    /* 05D0 */  0x3D, 0x94, 0xD0, 0x60, 0xF0, 0x6F, 0x47, 0xEC,
                    /* 05D8 */  0xC5, 0x3A, 0x8F, 0x2F, 0x35, 0x24, 0x9D, 0xE3,
                    /* 05E0 */  0xE5, 0xD7, 0x93, 0xB9, 0x27, 0xA3, 0x42, 0xD8,
                    /* 05E8 */  0x88, 0x66, 0xA8, 0xCF, 0x67, 0xB0, 0xBA, 0x22,
                    /* 05F0 */  0x3F, 0x4A, 0x1E, 0x7F, 0x36, 0x9A, 0x28, 0x8A,
                    /* 05F8 */  0x67, 0x0C, 0x46, 0xD1, 0x55, 0xEF, 0xE6, 0xBD,
                    /* 0600 */  0xC6, 0xC5, 0xBE, 0xCF, 0xC3, 0x42, 0x52, 0x08,
                    /* 0608 */  0x51, 0x38, 0x7C, 0x41, 0x05, 0x33, 0x67, 0x50,
                    /* 0610 */  0x2C, 0xC0, 0xCA, 0x0E, 0x0B, 0xC6, 0x8D, 0x76,
                    /* 0618 */  0x07, 0xAF, 0x2A, 0xC8, 0xFD, 0x9C, 0x11, 0xB1,
                    /* 0620 */  0x02, 0x75, 0xB1, 0x35, 0x3B, 0xE7, 0xFD, 0x97,
                    /* 0628 */  0x21, 0x80, 0x5B, 0x94, 0xAE, 0x03, 0xBD, 0x7F,
                    /* 0630 */  0xD5, 0xA8, 0x09, 0x49, 0x11, 0x9F, 0xE1, 0x07,
                    /* 0638 */  0x97, 0x0D, 0x2B, 0x08, 0x0F, 0xFE, 0x3C, 0x9E,
                    /* 0640 */  0xDE, 0xB7, 0x7C, 0x82, 0xB7, 0x97, 0x18, 0x40,
                    /* 0648 */  0xC1, 0x6F, 0x9F, 0xD5, 0x83, 0xC4, 0x6F, 0x8B,
                    /* 0650 */  0xE8, 0x79, 0x70, 0x90, 0x52, 0xFD, 0xC7, 0x1D,
                    /* 0658 */  0xEB, 0x38, 0x84, 0xEF, 0x6A, 0x27, 0x07, 0x10,
                    /* 0660 */  0x1B, 0xFB, 0xCC, 0x33, 0x48, 0xC6, 0xE0, 0x6F,
                    /* 0668 */  0x57, 0x13, 0x6C, 0xA0, 0xC0, 0x32, 0x67, 0x45,
                    /* 0670 */  0x36, 0x74, 0x43, 0x07, 0x7D, 0xB3, 0xF5, 0xAD,
                    /* 0678 */  0x86, 0x70, 0x96, 0x6C, 0x55, 0x6A, 0x5D, 0x39,
                    /* 0680 */  0xFB, 0xA3, 0xA1, 0xB8, 0xC8, 0x0F, 0x82, 0xEF,
                    /* 0688 */  0x6D, 0x9F, 0xF1, 0xCA, 0x15, 0x5D, 0x1E, 0xFA,
                    /* 0690 */  0x20, 0x8E, 0x68, 0x45, 0x7E, 0xCB, 0xF8, 0x23,
                    /* 0698 */  0x78, 0x24, 0x3F, 0x7B, 0xCA, 0x4E, 0x95, 0x5D,
                    /* 06A0 */  0xDF, 0x53, 0x2A, 0x88, 0x71, 0x0E, 0x52, 0x9B,
                    /* 06A8 */  0x13, 0xE7, 0x51, 0x0C, 0x52, 0x03, 0x39, 0x79,
                    /* 06B0 */  0x59, 0xA4, 0xB2, 0x9A, 0xA9, 0x40, 0x4E, 0x2B,
                    /* 06B8 */  0x1F, 0x93, 0x57, 0xF6, 0x12, 0xEB, 0x0D, 0x42,
                    /* 06C0 */  0xD1, 0x3A, 0x0B, 0x08, 0xDE, 0xE5, 0x04, 0x8F,
                    /* 06C8 */  0x31, 0x4C, 0x8B, 0x03, 0xB4, 0x8C, 0x30, 0x1A,
                    /* 06D0 */  0x77, 0x6C, 0x3B, 0xDD, 0x95, 0xFE, 0xCE, 0x28,
                    /* 06D8 */  0x27, 0x39, 0x5B, 0x0A, 0xC6, 0x1C, 0xD3, 0xB4,
                    /* 06E0 */  0xEE, 0x13, 0xD3, 0xE8, 0x70, 0x9C, 0x15, 0xFE,
                    /* 06E8 */  0x68, 0x12, 0xA0, 0x82, 0x00, 0x9B, 0x52, 0x2E,
                    /* 06F0 */  0x93, 0xD4, 0xBB, 0x93, 0x42, 0x6B, 0x75, 0xC0,
                    /* 06F8 */  0x87, 0x3C, 0xF5, 0xBA, 0x03, 0xE2, 0x1F, 0xCE,
                    /* 0700 */  0x52, 0x2F, 0xCA, 0xEE, 0xB5, 0x0E, 0xC0, 0x4E,
                    /* 0708 */  0x46, 0xDD, 0x52, 0x2F, 0x7D, 0x85, 0x89, 0x48,
                    /* 0710 */  0x33, 0x1F, 0x76, 0xDC, 0xCA, 0x85, 0x6F, 0xB0,
                    /* 0718 */  0x0C, 0xF0, 0x74, 0xBA, 0x23, 0xCE, 0xA6, 0xC0,
                    /* 0720 */  0x6C, 0x37, 0xD6, 0xFD, 0x7A, 0x75, 0x89, 0x6A,
                    /* 0728 */  0xB8, 0x60, 0x11, 0xA1, 0xD7, 0x8D, 0x96, 0x30,
                    /* 0730 */  0x07, 0xDE, 0xB9, 0xFF, 0xA1, 0x9C, 0x69, 0x6B,
                    /* 0738 */  0xFE, 0x4E, 0xBB, 0x67, 0xE8, 0xF9, 0x41, 0x70,
                    /* 0740 */  0xB3, 0xDD, 0x51, 0x41, 0x07, 0xE9, 0x57, 0xA7,
                    /* 0748 */  0xBE, 0x2C, 0x46, 0x84, 0x3A, 0xEB, 0x22, 0x66,
                    /* 0750 */  0xAB, 0x98, 0x0E, 0x81, 0x0D, 0xEB, 0x39, 0xDF,
                    /* 0758 */  0xC3, 0x1F, 0xB6, 0xA3, 0xF1, 0xAE, 0x7A, 0x0E,
                    /* 0760 */  0xD2, 0x32, 0x19, 0x07, 0x3F, 0x62, 0x78, 0xF3,
                    /* 0768 */  0x85, 0x00                                     
                }
            })
        }

        Method (IMOK, 1, NotSerialized)
        {
            ADBG ("IMOK")
            ADBG (Arg0)
            Return (Arg0)
        }
    }
}


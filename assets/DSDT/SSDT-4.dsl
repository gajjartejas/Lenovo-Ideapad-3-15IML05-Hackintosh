/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-4.aml, Sun Apr  9 18:20:29 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000256F (9583)
 *     Revision         0x02
 *     Checksum         0x20
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

    External (_SB_.PCI0.RP01.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP13.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP17.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP21.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.UBTC.RUCC, MethodObj)    // 2 Arguments (from opcode)
    External (DPM1, IntObj)    // (from opcode)
    External (DPM2, IntObj)    // (from opcode)
    External (DPM3, IntObj)    // (from opcode)
    External (NDUS, IntObj)    // (from opcode)
    External (NTUS, IntObj)    // (from opcode)
    External (RPS0, IntObj)    // (from opcode)
    External (RPS1, IntObj)    // (from opcode)
    External (TBSE, IntObj)    // (from opcode)
    External (TBTS, IntObj)    // (from opcode)
    External (TP1D, IntObj)    // (from opcode)
    External (TP1P, IntObj)    // (from opcode)
    External (TP1T, IntObj)    // (from opcode)
    External (TP2D, IntObj)    // (from opcode)
    External (TP2P, IntObj)    // (from opcode)
    External (TP2T, IntObj)    // (from opcode)
    External (TP3D, IntObj)    // (from opcode)
    External (TP3P, IntObj)    // (from opcode)
    External (TP3T, IntObj)    // (from opcode)
    External (TP4D, IntObj)    // (from opcode)
    External (TP4P, IntObj)    // (from opcode)
    External (TP4T, IntObj)    // (from opcode)
    External (TP5D, IntObj)    // (from opcode)
    External (TP5P, IntObj)    // (from opcode)
    External (TP5T, IntObj)    // (from opcode)
    External (TP6D, IntObj)    // (from opcode)
    External (TP6P, IntObj)    // (from opcode)
    External (TP6T, IntObj)    // (from opcode)

    If (LAnd (LEqual (TBTS, One), LOr (LEqual (RPS0, One), LEqual (RPS1, One))))
    {
        Scope (\_SB.PCI0.RP01.PXSX)
        {
            Name (TURP, One)
            Device (TBDU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Device (XHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (SLMS, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (And (TP1D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (And (TP2D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (And (TP3D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (And (TP4D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (And (TP5D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (And (TP6D, One))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (FPCP, 2, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (\_SB.UBTC.RUCC (One, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x02, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x03, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x04, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x05, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x06, Arg1))
                            }
                            ElseIf (LEqual (Arg1, One))
                            {
                                Return (TUPC (Zero, Zero))
                            }
                            Else
                            {
                                Return (TPLD (Zero, Zero))
                            }
                        }

                        Method (FPSP, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (TPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10){}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                            Store (One, SHAP)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                            Store (0x08, WID)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                            Store (0x03, HGT)
                            Return (PCKG)
                        }

                        Method (TUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Store (Arg1, Index (PCKG, One))
                            Return (PCKG)
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (HS01)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (HS02)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (SS01)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (One, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (One, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (SS02)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x02, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x02, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (HS03)
                            {
                                Name (_ADR, 0x05)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (HS04)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (SS03)
                            {
                                Name (_ADR, 0x07)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x03, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x03, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (SS04)
                            {
                                Name (_ADR, 0x08)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x04, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x04, 0x02))
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    If (LAnd (LEqual (TBTS, One), LOr (LEqual (RPS0, 0x05), LEqual (RPS1, 0x05))))
    {
        Scope (\_SB.PCI0.RP05.PXSX)
        {
            Name (TURP, 0x05)
            Device (TBDU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Device (XHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (SLMS, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (And (TP1D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (And (TP2D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (And (TP3D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (And (TP4D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (And (TP5D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (And (TP6D, One))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (FPCP, 2, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (\_SB.UBTC.RUCC (One, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x02, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x03, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x04, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x05, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x06, Arg1))
                            }
                            ElseIf (LEqual (Arg1, One))
                            {
                                Return (TUPC (Zero, Zero))
                            }
                            Else
                            {
                                Return (TPLD (Zero, Zero))
                            }
                        }

                        Method (FPSP, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (TPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10){}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                            Store (One, SHAP)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                            Store (0x08, WID)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                            Store (0x03, HGT)
                            Return (PCKG)
                        }

                        Method (TUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Store (Arg1, Index (PCKG, One))
                            Return (PCKG)
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (HS01)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (HS02)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (SS01)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (One, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (One, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (SS02)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x02, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x02, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (HS03)
                            {
                                Name (_ADR, 0x05)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (HS04)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (SS03)
                            {
                                Name (_ADR, 0x07)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x03, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x03, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (SS04)
                            {
                                Name (_ADR, 0x08)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x04, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x04, 0x02))
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    If (LAnd (LEqual (TBTS, One), LOr (LEqual (RPS0, 0x09), LEqual (RPS1, 0x09))))
    {
        Scope (\_SB.PCI0.RP09.PXSX)
        {
            Name (TURP, 0x09)
            Device (TBDU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Device (XHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (SLMS, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (And (TP1D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (And (TP2D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (And (TP3D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (And (TP4D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (And (TP5D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (And (TP6D, One))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (FPCP, 2, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (\_SB.UBTC.RUCC (One, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x02, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x03, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x04, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x05, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x06, Arg1))
                            }
                            ElseIf (LEqual (Arg1, One))
                            {
                                Return (TUPC (Zero, Zero))
                            }
                            Else
                            {
                                Return (TPLD (Zero, Zero))
                            }
                        }

                        Method (FPSP, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (TPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10){}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                            Store (One, SHAP)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                            Store (0x08, WID)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                            Store (0x03, HGT)
                            Return (PCKG)
                        }

                        Method (TUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Store (Arg1, Index (PCKG, One))
                            Return (PCKG)
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (HS01)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (HS02)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (SS01)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (One, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (One, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (SS02)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x02, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x02, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (HS03)
                            {
                                Name (_ADR, 0x05)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (HS04)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (SS03)
                            {
                                Name (_ADR, 0x07)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x03, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x03, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (SS04)
                            {
                                Name (_ADR, 0x08)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x04, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x04, 0x02))
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    If (LAnd (LEqual (TBTS, One), LOr (LEqual (RPS0, 0x0D), LEqual (RPS1, 0x0D))))
    {
        Scope (\_SB.PCI0.RP13.PXSX)
        {
            Name (TURP, 0x0D)
            Device (TBDU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Device (XHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (SLMS, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (And (TP1D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (And (TP2D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (And (TP3D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (And (TP4D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (And (TP5D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (And (TP6D, One))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (FPCP, 2, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (\_SB.UBTC.RUCC (One, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x02, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x03, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x04, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x05, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x06, Arg1))
                            }
                            ElseIf (LEqual (Arg1, One))
                            {
                                Return (TUPC (Zero, Zero))
                            }
                            Else
                            {
                                Return (TPLD (Zero, Zero))
                            }
                        }

                        Method (FPSP, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (TPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10){}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                            Store (One, SHAP)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                            Store (0x08, WID)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                            Store (0x03, HGT)
                            Return (PCKG)
                        }

                        Method (TUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Store (Arg1, Index (PCKG, One))
                            Return (PCKG)
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (HS01)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (HS02)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (SS01)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (One, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (One, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (SS02)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x02, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x02, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (HS03)
                            {
                                Name (_ADR, 0x05)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (HS04)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (SS03)
                            {
                                Name (_ADR, 0x07)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x03, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x03, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (SS04)
                            {
                                Name (_ADR, 0x08)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x04, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x04, 0x02))
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    If (LAnd (LEqual (TBTS, One), LOr (LEqual (RPS0, 0x11), LEqual (RPS1, 0x11))))
    {
        Scope (\_SB.PCI0.RP17.PXSX)
        {
            Name (TURP, 0x11)
            Device (TBDU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Device (XHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (SLMS, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (And (TP1D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (And (TP2D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (And (TP3D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (And (TP4D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (And (TP5D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (And (TP6D, One))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (FPCP, 2, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (\_SB.UBTC.RUCC (One, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x02, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x03, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x04, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x05, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x06, Arg1))
                            }
                            ElseIf (LEqual (Arg1, One))
                            {
                                Return (TUPC (Zero, Zero))
                            }
                            Else
                            {
                                Return (TPLD (Zero, Zero))
                            }
                        }

                        Method (FPSP, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (TPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10){}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                            Store (One, SHAP)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                            Store (0x08, WID)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                            Store (0x03, HGT)
                            Return (PCKG)
                        }

                        Method (TUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Store (Arg1, Index (PCKG, One))
                            Return (PCKG)
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (HS01)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (HS02)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (SS01)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (One, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (One, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (SS02)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x02, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x02, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (HS03)
                            {
                                Name (_ADR, 0x05)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (HS04)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (SS03)
                            {
                                Name (_ADR, 0x07)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x03, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x03, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (SS04)
                            {
                                Name (_ADR, 0x08)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x04, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x04, 0x02))
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    If (LAnd (LEqual (TBTS, One), LOr (LEqual (RPS0, 0x15), LEqual (RPS1, 0x15))))
    {
        Scope (\_SB.PCI0.RP21.PXSX)
        {
            Name (TURP, 0x15)
            Device (TBDU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Device (XHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (SLMS, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (And (TP1D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (And (TP2D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (And (TP3D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (And (TP4D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (And (TP5D, One))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (And (TP6D, One))
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (FPCP, 2, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (\_SB.UBTC.RUCC (One, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x02, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x03, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x04, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x05, Arg1))
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (\_SB.UBTC.RUCC (0x06, Arg1))
                            }
                            ElseIf (LEqual (Arg1, One))
                            {
                                Return (TUPC (Zero, Zero))
                            }
                            Else
                            {
                                Return (TPLD (Zero, Zero))
                            }
                        }

                        Method (FPSP, 1, Serialized)
                        {
                            ShiftLeft (TURP, 0x02, Local0)
                            Or (Local0, One, Local0)
                            If (LAnd (LEqual (ShiftRight (TP1D, One), Local0), LEqual (Arg0, TP1T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP2D, One), Local0), LEqual (Arg0, TP2T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP3D, One), Local0), LEqual (Arg0, TP3T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP4D, One), Local0), LEqual (Arg0, TP4T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP5D, One), Local0), LEqual (Arg0, TP5T)))
                            {
                                Return (One)
                            }
                            ElseIf (LAnd (LEqual (ShiftRight (TP6D, One), Local0), LEqual (Arg0, TP6T)))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (TPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10){}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                            Store (One, SHAP)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                            Store (0x08, WID)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                            Store (0x03, HGT)
                            Return (PCKG)
                        }

                        Method (TUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                One, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Store (Arg1, Index (PCKG, One))
                            Return (PCKG)
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (HS01)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (One), Zero))
                                    {
                                        Return (FPCP (One, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (HS02)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x02), Zero))
                                    {
                                        Return (FPCP (0x02, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (One), One))
                        {
                            Device (SS01)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (One, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (One, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x02), One))
                        {
                            Device (SS02)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x02, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x02, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (HS03)
                            {
                                Name (_ADR, 0x05)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x03), Zero))
                                    {
                                        Return (FPCP (0x03, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (HS04)
                            {
                                Name (_ADR, 0x06)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, One))
                                    }
                                    Else
                                    {
                                        Return (TUPC (Zero, Zero))
                                    }
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    If (LEqual (SLMS (0x04), Zero))
                                    {
                                        Return (FPCP (0x04, 0x02))
                                    }
                                    Else
                                    {
                                        Return (TPLD (Zero, Zero))
                                    }
                                }
                            }
                        }

                        If (LEqual (FPSP (0x03), One))
                        {
                            Device (SS03)
                            {
                                Name (_ADR, 0x07)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x03, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x03, 0x02))
                                }
                            }
                        }

                        If (LEqual (FPSP (0x04), One))
                        {
                            Device (SS04)
                            {
                                Name (_ADR, 0x08)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (FPCP (0x04, One))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (FPCP (0x04, 0x02))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


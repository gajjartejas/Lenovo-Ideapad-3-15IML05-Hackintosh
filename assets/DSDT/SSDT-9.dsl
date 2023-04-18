/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-9.aml, Sun Apr  9 18:20:28 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000109 (265)
 *     Revision         0x02
 *     Checksum         0xD2
 *     OEM ID           "hack"
 *     OEM Table ID     "BRKEYS"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "BRKEYS", 0x00000000)
{
    /*
     * External declarations were imported from
     * a reference file -- DSDT.aml
     */

    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.XQ11, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.XQ12, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (PS2K, 0x0365)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ11 ()
            }
        }

        Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (PS2K, 0x0366)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ12 ()
            }
        }
    }
}


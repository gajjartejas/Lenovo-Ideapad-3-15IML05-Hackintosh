/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-18.aml, Sun Apr  9 18:20:29 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000BB (187)
 *     Revision         0x02
 *     Checksum         0xFB
 *     OEM ID           "hack"
 *     OEM Table ID     "I2Cpatch"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "I2Cpatch", 0x00000000)
{
    /*
     * External declarations were imported from
     * a reference file -- DSDT.aml
     */

    External (_SB_.PCI0.I2C0.TPD0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPD0.SBFB, IntObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPD0.SBFG, IntObj)    // (from opcode)
    External (OSYS, FieldUnitObj)    // (from opcode)

    Name (USTP, One)
    Scope (_SB.PCI0.I2C0.TPD0)
    {
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            If (LLess (OSYS, 0x07DC))
            {
                Return (ConcatenateResTemplate (SBFB, SBFG))
            }

            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }
}


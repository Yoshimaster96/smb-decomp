.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKSaveExtended1Block
TRKSaveExtended1Block:
/* 8010D99C 001098BC  3C 40 80 2E */	lis r2, lbl_802EFD90@h
/* 8010D9A0 001098C0  60 42 FD 90 */	ori r2, r2, lbl_802EFD90@l
/* 8010D9A4 001098C4  7E 00 04 A6 */	mfsr r16, 0
/* 8010D9A8 001098C8  7E 21 04 A6 */	mfsr r17, 1
/* 8010D9AC 001098CC  7E 42 04 A6 */	mfsr r18, 2
/* 8010D9B0 001098D0  7E 63 04 A6 */	mfsr r19, 3
/* 8010D9B4 001098D4  7E 84 04 A6 */	mfsr r20, 4
/* 8010D9B8 001098D8  7E A5 04 A6 */	mfsr r21, 5
/* 8010D9BC 001098DC  7E C6 04 A6 */	mfsr r22, 6
/* 8010D9C0 001098E0  7E E7 04 A6 */	mfsr r23, 7
/* 8010D9C4 001098E4  7F 08 04 A6 */	mfsr r24, 8
/* 8010D9C8 001098E8  7F 29 04 A6 */	mfsr r25, 9
/* 8010D9CC 001098EC  7F 4A 04 A6 */	mfsr r26, 0xa
/* 8010D9D0 001098F0  7F 6B 04 A6 */	mfsr r27, 0xb
/* 8010D9D4 001098F4  7F 8C 04 A6 */	mfsr r28, 0xc
/* 8010D9D8 001098F8  7F AD 04 A6 */	mfsr r29, 0xd
/* 8010D9DC 001098FC  7F CE 04 A6 */	mfsr r30, 0xe
/* 8010D9E0 00109900  7F EF 04 A6 */	mfsr r31, 0xf
/* 8010D9E4 00109904  BE 02 01 A8 */	stmw r16, 0x1a8(r2)
/* 8010D9E8 00109908  7D 4C 42 E6 */	mftb r10, 0x10c
/* 8010D9EC 0010990C  7D 6D 42 E6 */	mftbu r11
/* 8010D9F0 00109910  7D 90 FA A6 */	mfspr r12, 0x3f0
/* 8010D9F4 00109914  7D B1 FA A6 */	mfspr r13, 0x3f1
/* 8010D9F8 00109918  7D DB 02 A6 */	mfspr r14, 0x1b
/* 8010D9FC 0010991C  7D FF 42 A6 */	mfpvr r15
/* 8010DA00 00109920  7E 10 82 A6 */	mfibatu r16, 0
/* 8010DA04 00109924  7E 31 82 A6 */	mfibatl r17, 0
/* 8010DA08 00109928  7E 52 82 A6 */	mfibatu r18, 1
/* 8010DA0C 0010992C  7E 73 82 A6 */	mfibatl r19, 1
/* 8010DA10 00109930  7E 94 82 A6 */	mfibatu r20, 2
/* 8010DA14 00109934  7E B5 82 A6 */	mfibatl r21, 2
/* 8010DA18 00109938  7E D6 82 A6 */	mfibatu r22, 3
/* 8010DA1C 0010993C  7E F7 82 A6 */	mfibatl r23, 3
/* 8010DA20 00109940  7F 18 82 A6 */	mfdbatu r24, 0
/* 8010DA24 00109944  7F 39 82 A6 */	mfdbatl r25, 0
/* 8010DA28 00109948  7F 5A 82 A6 */	mfdbatu r26, 1
/* 8010DA2C 0010994C  7F 7B 82 A6 */	mfdbatl r27, 1
/* 8010DA30 00109950  7F 9C 82 A6 */	mfdbatu r28, 2
/* 8010DA34 00109954  7F BD 82 A6 */	mfdbatl r29, 2
/* 8010DA38 00109958  7F DE 82 A6 */	mfdbatu r30, 3
/* 8010DA3C 0010995C  7F FF 82 A6 */	mfdbatl r31, 3
/* 8010DA40 00109960  BD 42 01 E8 */	stmw r10, 0x1e8(r2)
/* 8010DA44 00109964  7E D9 02 A6 */	mfspr r22, 0x19
/* 8010DA48 00109968  7E F3 02 A6 */	mfdar r23
/* 8010DA4C 0010996C  7F 12 02 A6 */	mfdsisr r24
/* 8010DA50 00109970  7F 30 42 A6 */	mfspr r25, 0x110
/* 8010DA54 00109974  7F 51 42 A6 */	mfspr r26, 0x111
/* 8010DA58 00109978  7F 72 42 A6 */	mfspr r27, 0x112
/* 8010DA5C 0010997C  7F 93 42 A6 */	mfspr r28, 0x113
/* 8010DA60 00109980  3B A0 00 00 */	li r29, 0
/* 8010DA64 00109984  7F D2 FA A6 */	mfspr r30, 0x3f2
/* 8010DA68 00109988  7F FA 42 A6 */	mfspr r31, 0x11a
/* 8010DA6C 0010998C  BE C2 02 5C */	stmw r22, 0x25c(r2)
/* 8010DA70 00109990  7E 90 E2 A6 */	mfspr r20, 0x390
/* 8010DA74 00109994  7E B1 E2 A6 */	mfspr r21, 0x391
/* 8010DA78 00109998  7E D2 E2 A6 */	mfspr r22, 0x392
/* 8010DA7C 0010999C  7E F3 E2 A6 */	mfspr r23, 0x393
/* 8010DA80 001099A0  7F 14 E2 A6 */	mfspr r24, 0x394
/* 8010DA84 001099A4  7F 35 E2 A6 */	mfspr r25, 0x395
/* 8010DA88 001099A8  7F 56 E2 A6 */	mfspr r26, 0x396
/* 8010DA8C 001099AC  7F 77 E2 A6 */	mfspr r27, 0x397
/* 8010DA90 001099B0  7F 98 E2 A6 */	mfspr r28, 0x398
/* 8010DA94 001099B4  7F B9 E2 A6 */	mfspr r29, 0x399
/* 8010DA98 001099B8  7F DA E2 A6 */	mfspr r30, 0x39a
/* 8010DA9C 001099BC  7F FB E2 A6 */	mfspr r31, 0x39b
/* 8010DAA0 001099C0  BE 82 02 FC */	stmw r20, 0x2fc(r2)
/* 8010DAA4 001099C4  48 00 00 48 */	b lbl_8010DAEC
/* 8010DAA8 001099C8  7E 00 EA A6 */	mfspr r16, 0x3a0
/* 8010DAAC 001099CC  7E 27 EA A6 */	mfspr r17, 0x3a7
/* 8010DAB0 001099D0  7E 48 EA A6 */	mfspr r18, 0x3a8
/* 8010DAB4 001099D4  7E 69 EA A6 */	mfspr r19, 0x3a9
/* 8010DAB8 001099D8  7E 8A EA A6 */	mfspr r20, 0x3aa
/* 8010DABC 001099DC  7E AB EA A6 */	mfspr r21, 0x3ab
/* 8010DAC0 001099E0  7E CC EA A6 */	mfspr r22, 0x3ac
/* 8010DAC4 001099E4  7E ED EA A6 */	mfspr r23, 0x3ad
/* 8010DAC8 001099E8  7F 0E EA A6 */	mfspr r24, 0x3ae
/* 8010DACC 001099EC  7F 2F EA A6 */	mfspr r25, 0x3af
/* 8010DAD0 001099F0  7F 50 EA A6 */	mfspr r26, 0x3b0
/* 8010DAD4 001099F4  7F 77 EA A6 */	mfspr r27, 0x3b7
/* 8010DAD8 001099F8  7F 9F EA A6 */	mfspr r28, 0x3bf
/* 8010DADC 001099FC  7F B6 FA A6 */	mfspr r29, 0x3f6
/* 8010DAE0 00109A00  7F D7 FA A6 */	mfspr r30, 0x3f7
/* 8010DAE4 00109A04  7F FF FA A6 */	mfspr r31, 0x3ff
/* 8010DAE8 00109A08  BE 02 02 B8 */	stmw r16, 0x2b8(r2)
lbl_8010DAEC:
/* 8010DAEC 00109A0C  7E 75 FA A6 */	mfspr r19, 0x3f5
/* 8010DAF0 00109A10  7E 99 EA A6 */	mfspr r20, 0x3b9
/* 8010DAF4 00109A14  7E BA EA A6 */	mfspr r21, 0x3ba
/* 8010DAF8 00109A18  7E DD EA A6 */	mfspr r22, 0x3bd
/* 8010DAFC 00109A1C  7E FE EA A6 */	mfspr r23, 0x3be
/* 8010DB00 00109A20  7F 1B EA A6 */	mfspr r24, 0x3bb
/* 8010DB04 00109A24  7F 38 EA A6 */	mfspr r25, 0x3b8
/* 8010DB08 00109A28  7F 5C EA A6 */	mfspr r26, 0x3bc
/* 8010DB0C 00109A2C  7F 7C FA A6 */	mfspr r27, 0x3fc
/* 8010DB10 00109A30  7F 9D FA A6 */	mfspr r28, 0x3fd
/* 8010DB14 00109A34  7F BE FA A6 */	mfspr r29, 0x3fe
/* 8010DB18 00109A38  7F DB FA A6 */	mfspr r30, 0x3FB
/* 8010DB1C 00109A3C  7F F9 FA A6 */	mfspr r31, 0x3f9
/* 8010DB20 00109A40  BE 62 02 84 */	stmw r19, 0x284(r2)
/* 8010DB24 00109A44  48 00 00 2C */	b lbl_8010DB50
/* 8010DB28 00109A48  7F 30 F2 A6 */	mfspr r25, 0x3d0
/* 8010DB2C 00109A4C  7F 51 F2 A6 */	mfspr r26, 0x3d1
/* 8010DB30 00109A50  7F 72 F2 A6 */	mfspr r27, 0x3d2
/* 8010DB34 00109A54  7F 93 F2 A6 */	mfspr r28, 0x3d3
/* 8010DB38 00109A58  7F B4 F2 A6 */	mfspr r29, 0x3D4
/* 8010DB3C 00109A5C  7F D5 F2 A6 */	mfspr r30, 0x3D5
/* 8010DB40 00109A60  7F F6 F2 A6 */	mfspr r31, 0x3d6
/* 8010DB44 00109A64  BF 22 02 40 */	stmw r25, 0x240(r2)
/* 8010DB48 00109A68  7F F6 02 A6 */	mfspr r31, 0x16
/* 8010DB4C 00109A6C  93 E2 02 78 */	stw r31, 0x278(r2)
lbl_8010DB50:
/* 8010DB50 00109A70  4E 80 00 20 */	blr 

.global TRKRestoreExtended1Block
TRKRestoreExtended1Block:
/* 8010DB54 00109A74  3C 40 80 2E */	lis r2, lbl_802EFD90@h
/* 8010DB58 00109A78  60 42 FD 90 */	ori r2, r2, lbl_802EFD90@l
/* 8010DB5C 00109A7C  3C A0 80 1E */	lis r5, lbl_801ED868@h
/* 8010DB60 00109A80  60 A5 D8 68 */	ori r5, r5, lbl_801ED868@l
/* 8010DB64 00109A84  88 65 00 00 */	lbz r3, 0(r5)
/* 8010DB68 00109A88  88 C5 00 01 */	lbz r6, 1(r5)
/* 8010DB6C 00109A8C  38 00 00 00 */	li r0, 0
/* 8010DB70 00109A90  98 05 00 00 */	stb r0, 0(r5)
/* 8010DB74 00109A94  98 05 00 01 */	stb r0, 1(r5)
/* 8010DB78 00109A98  2C 03 00 00 */	cmpwi r3, 0
/* 8010DB7C 00109A9C  41 82 00 14 */	beq lbl_8010DB90
/* 8010DB80 00109AA0  83 02 01 E8 */	lwz r24, 0x1e8(r2)
/* 8010DB84 00109AA4  83 22 01 EC */	lwz r25, 0x1ec(r2)
/* 8010DB88 00109AA8  7F 1C 43 A6 */	mttbl r24
/* 8010DB8C 00109AAC  7F 3D 43 A6 */	mttbu r25
lbl_8010DB90:
/* 8010DB90 00109AB0  BA 82 02 FC */	lmw r20, 0x2fc(r2)
/* 8010DB94 00109AB4  7E 90 E3 A6 */	mtspr 0x390, r20
/* 8010DB98 00109AB8  7E B1 E3 A6 */	mtspr 0x391, r21
/* 8010DB9C 00109ABC  7E D2 E3 A6 */	mtspr 0x392, r22
/* 8010DBA0 00109AC0  7E F3 E3 A6 */	mtspr 0x393, r23
/* 8010DBA4 00109AC4  7F 14 E3 A6 */	mtspr 0x394, r24
/* 8010DBA8 00109AC8  7F 35 E3 A6 */	mtspr 0x395, r25
/* 8010DBAC 00109ACC  7F 56 E3 A6 */	mtspr 0x396, r26
/* 8010DBB0 00109AD0  7F 77 E3 A6 */	mtspr 0x397, r27
/* 8010DBB4 00109AD4  7F 98 E3 A6 */	mtspr 0x398, r28
/* 8010DBB8 00109AD8  7F DA E3 A6 */	mtspr 0x39a, r30
/* 8010DBBC 00109ADC  7F FB E3 A6 */	mtspr 0x39b, r31
/* 8010DBC0 00109AE0  48 00 00 1C */	b lbl_8010DBDC
/* 8010DBC4 00109AE4  BB 42 02 E0 */	lmw r26, 0x2e0(r2)
/* 8010DBC8 00109AE8  7F 50 EB A6 */	mtspr 0x3b0, r26
/* 8010DBCC 00109AEC  7F 77 EB A6 */	mtspr 0x3b7, r27
/* 8010DBD0 00109AF0  7F B6 FB A6 */	mtspr 0x3f6, r29
/* 8010DBD4 00109AF4  7F D7 FB A6 */	mtspr 0x3f7, r30
/* 8010DBD8 00109AF8  7F FF FB A6 */	mtspr 0x3ff, r31
lbl_8010DBDC:
/* 8010DBDC 00109AFC  BA 62 02 84 */	lmw r19, 0x284(r2)
/* 8010DBE0 00109B00  7E 75 FB A6 */	mtspr 0x3f5, r19
/* 8010DBE4 00109B04  7E 99 EB A6 */	mtspr 0x3b9, r20
/* 8010DBE8 00109B08  7E BA EB A6 */	mtspr 0x3ba, r21
/* 8010DBEC 00109B0C  7E DD EB A6 */	mtspr 0x3bd, r22
/* 8010DBF0 00109B10  7E FE EB A6 */	mtspr 0x3be, r23
/* 8010DBF4 00109B14  7F 1B EB A6 */	mtspr 0x3bb, r24
/* 8010DBF8 00109B18  7F 38 EB A6 */	mtspr 0x3b8, r25
/* 8010DBFC 00109B1C  7F 5C EB A6 */	mtspr 0x3bc, r26
/* 8010DC00 00109B20  7F 7C FB A6 */	mtspr 0x3fc, r27
/* 8010DC04 00109B24  7F 9D FB A6 */	mtspr 0x3fd, r28
/* 8010DC08 00109B28  7F BE FB A6 */	mtspr 0x3fe, r29
/* 8010DC0C 00109B2C  7F DB FB A6 */	mtictc r30
/* 8010DC10 00109B30  7F F9 FB A6 */	mtspr 0x3f9, r31
/* 8010DC14 00109B34  48 00 00 34 */	b lbl_8010DC48
/* 8010DC18 00109B38  2C 06 00 00 */	cmpwi r6, 0
/* 8010DC1C 00109B3C  41 82 00 0C */	beq lbl_8010DC28
/* 8010DC20 00109B40  83 42 02 78 */	lwz r26, 0x278(r2)
/* 8010DC24 00109B44  7F 56 03 A6 */	mtspr 0x16, r26
lbl_8010DC28:
/* 8010DC28 00109B48  BB 22 02 40 */	lmw r25, 0x240(r2)
/* 8010DC2C 00109B4C  7F 30 F3 A6 */	mtspr 0x3d0, r25
/* 8010DC30 00109B50  7F 51 F3 A6 */	mtspr 0x3d1, r26
/* 8010DC34 00109B54  7F 72 F3 A6 */	mtspr 0x3d2, r27
/* 8010DC38 00109B58  7F 93 F3 A6 */	mtspr 0x3d3, r28
/* 8010DC3C 00109B5C  7F B4 F3 A6 */	mtspr 0x3D4, r29
/* 8010DC40 00109B60  7F D5 F3 A6 */	mtspr 0x3D5, r30
/* 8010DC44 00109B64  7F F6 F3 A6 */	mtspr 0x3d6, r31
lbl_8010DC48:
/* 8010DC48 00109B68  BA 02 01 A8 */	lmw r16, 0x1a8(r2)
/* 8010DC4C 00109B6C  7E 00 01 A4 */	mtsr 0, r16
/* 8010DC50 00109B70  7E 21 01 A4 */	mtsr 1, r17
/* 8010DC54 00109B74  7E 42 01 A4 */	mtsr 2, r18
/* 8010DC58 00109B78  7E 63 01 A4 */	mtsr 3, r19
/* 8010DC5C 00109B7C  7E 84 01 A4 */	mtsr 4, r20
/* 8010DC60 00109B80  7E A5 01 A4 */	mtsr 5, r21
/* 8010DC64 00109B84  7E C6 01 A4 */	mtsr 6, r22
/* 8010DC68 00109B88  7E E7 01 A4 */	mtsr 7, r23
/* 8010DC6C 00109B8C  7F 08 01 A4 */	mtsr 8, r24
/* 8010DC70 00109B90  7F 29 01 A4 */	mtsr 9, r25
/* 8010DC74 00109B94  7F 4A 01 A4 */	mtsr 0xa, r26
/* 8010DC78 00109B98  7F 6B 01 A4 */	mtsr 0xb, r27
/* 8010DC7C 00109B9C  7F 8C 01 A4 */	mtsr 0xc, r28
/* 8010DC80 00109BA0  7F AD 01 A4 */	mtsr 0xd, r29
/* 8010DC84 00109BA4  7F CE 01 A4 */	mtsr 0xe, r30
/* 8010DC88 00109BA8  7F EF 01 A4 */	mtsr 0xf, r31
/* 8010DC8C 00109BAC  B9 82 01 F0 */	lmw r12, 0x1f0(r2)
/* 8010DC90 00109BB0  7D 90 FB A6 */	mtspr 0x3f0, r12
/* 8010DC94 00109BB4  7D B1 FB A6 */	mtspr 0x3f1, r13
/* 8010DC98 00109BB8  7D DB 03 A6 */	mtspr 0x1b, r14
/* 8010DC9C 00109BBC  7D FF 43 A6 */	mtspr 0x11f, r15
/* 8010DCA0 00109BC0  7E 10 83 A6 */	mtibatu 0, r16
/* 8010DCA4 00109BC4  7E 31 83 A6 */	mtibatl 0, r17
/* 8010DCA8 00109BC8  7E 52 83 A6 */	mtibatu 1, r18
/* 8010DCAC 00109BCC  7E 73 83 A6 */	mtibatl 1, r19
/* 8010DCB0 00109BD0  7E 94 83 A6 */	mtibatu 2, r20
/* 8010DCB4 00109BD4  7E B5 83 A6 */	mtibatl 2, r21
/* 8010DCB8 00109BD8  7E D6 83 A6 */	mtibatu 3, r22
/* 8010DCBC 00109BDC  7E F7 83 A6 */	mtibatl 3, r23
/* 8010DCC0 00109BE0  7F 18 83 A6 */	mtdbatu 0, r24
/* 8010DCC4 00109BE4  7F 39 83 A6 */	mtdbatl 0, r25
/* 8010DCC8 00109BE8  7F 5A 83 A6 */	mtdbatu 1, r26
/* 8010DCCC 00109BEC  7F 7B 83 A6 */	mtdbatl 1, r27
/* 8010DCD0 00109BF0  7F 9C 83 A6 */	mtdbatu 2, r28
/* 8010DCD4 00109BF4  7F BD 83 A6 */	mtdbatl 2, r29
/* 8010DCD8 00109BF8  7F DE 83 A6 */	mtdbatu 3, r30
/* 8010DCDC 00109BFC  7F FF 83 A6 */	mtdbatl 3, r31
/* 8010DCE0 00109C00  BA C2 02 5C */	lmw r22, 0x25c(r2)
/* 8010DCE4 00109C04  7E D9 03 A6 */	mtspr 0x19, r22
/* 8010DCE8 00109C08  7E F3 03 A6 */	mtdar r23
/* 8010DCEC 00109C0C  7F 12 03 A6 */	mtdsisr r24
/* 8010DCF0 00109C10  7F 30 43 A6 */	mtspr 0x110, r25
/* 8010DCF4 00109C14  7F 51 43 A6 */	mtspr 0x111, r26
/* 8010DCF8 00109C18  7F 72 43 A6 */	mtspr 0x112, r27
/* 8010DCFC 00109C1C  7F 93 43 A6 */	mtspr 0x113, r28
/* 8010DD00 00109C20  7F D2 FB A6 */	mtspr 0x3f2, r30
/* 8010DD04 00109C24  7F FA 43 A6 */	mtspr 0x11a, r31
/* 8010DD08 00109C28  4E 80 00 20 */	blr 

.global TRKTargetCPUMinorType
TRKTargetCPUMinorType:
/* 8010DD0C 00109C2C  38 60 00 54 */	li r3, 0x54
/* 8010DD10 00109C30  4E 80 00 20 */	blr 

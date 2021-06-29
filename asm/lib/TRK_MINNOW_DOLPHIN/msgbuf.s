.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKSetBufferUsed
TRKSetBufferUsed:
/* 80109E14 00105D34  90 83 00 04 */	stw r4, 4(r3)
/* 80109E18 00105D38  4E 80 00 20 */	blr 

.global TRKInitializeMessageBuffers
TRKInitializeMessageBuffers:
/* 80109E1C 00105D3C  7C 08 02 A6 */	mflr r0
/* 80109E20 00105D40  3C 60 80 2F */	lis r3, lbl_802EE270@ha
/* 80109E24 00105D44  90 01 00 04 */	stw r0, 4(r1)
/* 80109E28 00105D48  38 03 E2 70 */	addi r0, r3, lbl_802EE270@l
/* 80109E2C 00105D4C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80109E30 00105D50  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80109E34 00105D54  93 C1 00 08 */	stw r30, 8(r1)
/* 80109E38 00105D58  3B C0 00 00 */	li r30, 0
/* 80109E3C 00105D5C  1C 9E 08 90 */	mulli r4, r30, 0x890
/* 80109E40 00105D60  7F E0 22 14 */	add r31, r0, r4
lbl_80109E44:
/* 80109E44 00105D64  7F E3 FB 78 */	mr r3, r31
/* 80109E48 00105D68  48 00 21 99 */	bl TRKInitializeMutex
/* 80109E4C 00105D6C  7F E3 FB 78 */	mr r3, r31
/* 80109E50 00105D70  48 00 21 99 */	bl TRKAcquireMutex
/* 80109E54 00105D74  38 7F 00 00 */	addi r3, r31, 0
/* 80109E58 00105D78  38 80 00 00 */	li r4, 0
/* 80109E5C 00105D7C  4B FF FF B9 */	bl TRKSetBufferUsed
/* 80109E60 00105D80  7F E3 FB 78 */	mr r3, r31
/* 80109E64 00105D84  48 00 21 8D */	bl TRKReleaseMutex
/* 80109E68 00105D88  3B DE 00 01 */	addi r30, r30, 1
/* 80109E6C 00105D8C  3B FF 08 90 */	addi r31, r31, 0x890
/* 80109E70 00105D90  2C 1E 00 03 */	cmpwi r30, 3
/* 80109E74 00105D94  41 80 FF D0 */	blt lbl_80109E44
/* 80109E78 00105D98  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80109E7C 00105D9C  38 60 00 00 */	li r3, 0
/* 80109E80 00105DA0  83 C1 00 08 */	lwz r30, 8(r1)
/* 80109E84 00105DA4  38 21 00 10 */	addi r1, r1, 0x10
/* 80109E88 00105DA8  80 01 00 04 */	lwz r0, 4(r1)
/* 80109E8C 00105DAC  7C 08 03 A6 */	mtlr r0
/* 80109E90 00105DB0  4E 80 00 20 */	blr 

.global TRKGetFreeBuffer
TRKGetFreeBuffer:
/* 80109E94 00105DB4  7C 08 02 A6 */	mflr r0
/* 80109E98 00105DB8  90 01 00 04 */	stw r0, 4(r1)
/* 80109E9C 00105DBC  38 00 00 00 */	li r0, 0
/* 80109EA0 00105DC0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80109EA4 00105DC4  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 80109EA8 00105DC8  3B 84 00 00 */	addi r28, r4, 0
/* 80109EAC 00105DCC  3B 63 00 00 */	addi r27, r3, 0
/* 80109EB0 00105DD0  3B E0 03 00 */	li r31, 0x300
/* 80109EB4 00105DD4  3B C0 00 00 */	li r30, 0
/* 80109EB8 00105DD8  90 04 00 00 */	stw r0, 0(r4)
/* 80109EBC 00105DDC  48 00 00 54 */	b lbl_80109F10
lbl_80109EC0:
/* 80109EC0 00105DE0  7F C3 F3 78 */	mr r3, r30
/* 80109EC4 00105DE4  48 00 00 6D */	bl TRKGetBuffer
/* 80109EC8 00105DE8  7C 7D 1B 78 */	mr r29, r3
/* 80109ECC 00105DEC  48 00 21 1D */	bl TRKAcquireMutex
/* 80109ED0 00105DF0  80 1D 00 04 */	lwz r0, 4(r29)
/* 80109ED4 00105DF4  2C 00 00 00 */	cmpwi r0, 0
/* 80109ED8 00105DF8  40 82 00 2C */	bne lbl_80109F04
/* 80109EDC 00105DFC  38 7D 00 00 */	addi r3, r29, 0
/* 80109EE0 00105E00  38 80 00 01 */	li r4, 1
/* 80109EE4 00105E04  48 00 00 E1 */	bl TRKResetBuffer
/* 80109EE8 00105E08  38 7D 00 00 */	addi r3, r29, 0
/* 80109EEC 00105E0C  38 80 00 01 */	li r4, 1
/* 80109EF0 00105E10  4B FF FF 25 */	bl TRKSetBufferUsed
/* 80109EF4 00105E14  93 BC 00 00 */	stw r29, 0(r28)
/* 80109EF8 00105E18  3B E0 00 00 */	li r31, 0
/* 80109EFC 00105E1C  93 DB 00 00 */	stw r30, 0(r27)
/* 80109F00 00105E20  3B C0 00 03 */	li r30, 3
lbl_80109F04:
/* 80109F04 00105E24  7F A3 EB 78 */	mr r3, r29
/* 80109F08 00105E28  48 00 20 E9 */	bl TRKReleaseMutex
/* 80109F0C 00105E2C  3B DE 00 01 */	addi r30, r30, 1
lbl_80109F10:
/* 80109F10 00105E30  2C 1E 00 03 */	cmpwi r30, 3
/* 80109F14 00105E34  41 80 FF AC */	blt lbl_80109EC0
/* 80109F18 00105E38  7F E3 FB 78 */	mr r3, r31
/* 80109F1C 00105E3C  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 80109F20 00105E40  38 21 00 20 */	addi r1, r1, 0x20
/* 80109F24 00105E44  80 01 00 04 */	lwz r0, 4(r1)
/* 80109F28 00105E48  7C 08 03 A6 */	mtlr r0
/* 80109F2C 00105E4C  4E 80 00 20 */	blr 

.global TRKGetBuffer
TRKGetBuffer:
/* 80109F30 00105E50  2C 03 00 00 */	cmpwi r3, 0
/* 80109F34 00105E54  38 00 00 00 */	li r0, 0
/* 80109F38 00105E58  41 80 00 1C */	blt lbl_80109F54
/* 80109F3C 00105E5C  2C 03 00 03 */	cmpwi r3, 3
/* 80109F40 00105E60  40 80 00 14 */	bge lbl_80109F54
/* 80109F44 00105E64  1C 83 08 90 */	mulli r4, r3, 0x890
/* 80109F48 00105E68  3C 60 80 2F */	lis r3, lbl_802EE270@ha
/* 80109F4C 00105E6C  38 03 E2 70 */	addi r0, r3, lbl_802EE270@l
/* 80109F50 00105E70  7C 00 22 14 */	add r0, r0, r4
lbl_80109F54:
/* 80109F54 00105E74  7C 03 03 78 */	mr r3, r0
/* 80109F58 00105E78  4E 80 00 20 */	blr 

.global TRKReleaseBuffer
TRKReleaseBuffer:
/* 80109F5C 00105E7C  7C 08 02 A6 */	mflr r0
/* 80109F60 00105E80  2C 03 FF FF */	cmpwi r3, -1
/* 80109F64 00105E84  90 01 00 04 */	stw r0, 4(r1)
/* 80109F68 00105E88  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80109F6C 00105E8C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80109F70 00105E90  41 82 00 40 */	beq lbl_80109FB0
/* 80109F74 00105E94  2C 03 00 00 */	cmpwi r3, 0
/* 80109F78 00105E98  41 80 00 38 */	blt lbl_80109FB0
/* 80109F7C 00105E9C  2C 03 00 03 */	cmpwi r3, 3
/* 80109F80 00105EA0  40 80 00 30 */	bge lbl_80109FB0
/* 80109F84 00105EA4  1C 83 08 90 */	mulli r4, r3, 0x890
/* 80109F88 00105EA8  3C 60 80 2F */	lis r3, lbl_802EE270@ha
/* 80109F8C 00105EAC  38 03 E2 70 */	addi r0, r3, lbl_802EE270@l
/* 80109F90 00105EB0  7F E0 22 14 */	add r31, r0, r4
/* 80109F94 00105EB4  38 7F 00 00 */	addi r3, r31, 0
/* 80109F98 00105EB8  48 00 20 51 */	bl TRKAcquireMutex
/* 80109F9C 00105EBC  38 7F 00 00 */	addi r3, r31, 0
/* 80109FA0 00105EC0  38 80 00 00 */	li r4, 0
/* 80109FA4 00105EC4  4B FF FE 71 */	bl TRKSetBufferUsed
/* 80109FA8 00105EC8  7F E3 FB 78 */	mr r3, r31
/* 80109FAC 00105ECC  48 00 20 45 */	bl TRKReleaseMutex
lbl_80109FB0:
/* 80109FB0 00105ED0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80109FB4 00105ED4  38 21 00 10 */	addi r1, r1, 0x10
/* 80109FB8 00105ED8  80 01 00 04 */	lwz r0, 4(r1)
/* 80109FBC 00105EDC  7C 08 03 A6 */	mtlr r0
/* 80109FC0 00105EE0  4E 80 00 20 */	blr 

.global TRKResetBuffer
TRKResetBuffer:
/* 80109FC4 00105EE4  7C 08 02 A6 */	mflr r0
/* 80109FC8 00105EE8  38 A0 00 00 */	li r5, 0
/* 80109FCC 00105EEC  90 01 00 04 */	stw r0, 4(r1)
/* 80109FD0 00105EF0  54 80 06 3F */	clrlwi. r0, r4, 0x18
/* 80109FD4 00105EF4  94 21 FF F8 */	stwu r1, -8(r1)
/* 80109FD8 00105EF8  90 A3 00 08 */	stw r5, 8(r3)
/* 80109FDC 00105EFC  90 A3 00 0C */	stw r5, 0xc(r3)
/* 80109FE0 00105F00  40 82 00 14 */	bne lbl_80109FF4
/* 80109FE4 00105F04  38 63 00 10 */	addi r3, r3, 0x10
/* 80109FE8 00105F08  38 80 00 00 */	li r4, 0
/* 80109FEC 00105F0C  38 A0 08 80 */	li r5, 0x880
/* 80109FF0 00105F10  4B EF 94 99 */	bl TRK_memset
lbl_80109FF4:
/* 80109FF4 00105F14  38 21 00 08 */	addi r1, r1, 8
/* 80109FF8 00105F18  80 01 00 04 */	lwz r0, 4(r1)
/* 80109FFC 00105F1C  7C 08 03 A6 */	mtlr r0
/* 8010A000 00105F20  4E 80 00 20 */	blr 

.global TRKSetBufferPosition
TRKSetBufferPosition:
/* 8010A004 00105F24  28 04 08 80 */	cmplwi r4, 0x880
/* 8010A008 00105F28  38 A0 00 00 */	li r5, 0
/* 8010A00C 00105F2C  40 81 00 0C */	ble lbl_8010A018
/* 8010A010 00105F30  38 A0 03 01 */	li r5, 0x301
/* 8010A014 00105F34  48 00 00 18 */	b lbl_8010A02C
lbl_8010A018:
/* 8010A018 00105F38  90 83 00 0C */	stw r4, 0xc(r3)
/* 8010A01C 00105F3C  80 03 00 08 */	lwz r0, 8(r3)
/* 8010A020 00105F40  7C 04 00 40 */	cmplw r4, r0
/* 8010A024 00105F44  40 81 00 08 */	ble lbl_8010A02C
/* 8010A028 00105F48  90 83 00 08 */	stw r4, 8(r3)
lbl_8010A02C:
/* 8010A02C 00105F4C  7C A3 2B 78 */	mr r3, r5
/* 8010A030 00105F50  4E 80 00 20 */	blr 

.global TRKAppendBuffer
TRKAppendBuffer:
/* 8010A034 00105F54  7C 08 02 A6 */	mflr r0
/* 8010A038 00105F58  90 01 00 04 */	stw r0, 4(r1)
/* 8010A03C 00105F5C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A040 00105F60  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A044 00105F64  3B E0 00 00 */	li r31, 0
/* 8010A048 00105F68  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A04C 00105F6C  7C BE 2B 79 */	or. r30, r5, r5
/* 8010A050 00105F70  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8010A054 00105F74  3B A3 00 00 */	addi r29, r3, 0
/* 8010A058 00105F78  40 82 00 0C */	bne lbl_8010A064
/* 8010A05C 00105F7C  38 60 00 00 */	li r3, 0
/* 8010A060 00105F80  48 00 00 5C */	b lbl_8010A0BC
lbl_8010A064:
/* 8010A064 00105F84  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 8010A068 00105F88  20 03 08 80 */	subfic r0, r3, 0x880
/* 8010A06C 00105F8C  7C 00 F0 40 */	cmplw r0, r30
/* 8010A070 00105F90  40 80 00 0C */	bge lbl_8010A07C
/* 8010A074 00105F94  3B E0 03 01 */	li r31, 0x301
/* 8010A078 00105F98  7C 1E 03 78 */	mr r30, r0
lbl_8010A07C:
/* 8010A07C 00105F9C  28 1E 00 01 */	cmplwi r30, 1
/* 8010A080 00105FA0  40 82 00 14 */	bne lbl_8010A094
/* 8010A084 00105FA4  88 04 00 00 */	lbz r0, 0(r4)
/* 8010A088 00105FA8  7C 7D 1A 14 */	add r3, r29, r3
/* 8010A08C 00105FAC  98 03 00 10 */	stb r0, 0x10(r3)
/* 8010A090 00105FB0  48 00 00 14 */	b lbl_8010A0A4
lbl_8010A094:
/* 8010A094 00105FB4  38 63 00 10 */	addi r3, r3, 0x10
/* 8010A098 00105FB8  38 BE 00 00 */	addi r5, r30, 0
/* 8010A09C 00105FBC  7C 7D 1A 14 */	add r3, r29, r3
/* 8010A0A0 00105FC0  4B EF 93 C5 */	bl TRK_memcpy
lbl_8010A0A4:
/* 8010A0A4 00105FC4  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8010A0A8 00105FC8  38 7F 00 00 */	addi r3, r31, 0
/* 8010A0AC 00105FCC  7C 00 F2 14 */	add r0, r0, r30
/* 8010A0B0 00105FD0  90 1D 00 0C */	stw r0, 0xc(r29)
/* 8010A0B4 00105FD4  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8010A0B8 00105FD8  90 1D 00 08 */	stw r0, 8(r29)
lbl_8010A0BC:
/* 8010A0BC 00105FDC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A0C0 00105FE0  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A0C4 00105FE4  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8010A0C8 00105FE8  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A0CC 00105FEC  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A0D0 00105FF0  7C 08 03 A6 */	mtlr r0
/* 8010A0D4 00105FF4  4E 80 00 20 */	blr 

.global TRKReadBuffer
TRKReadBuffer:
/* 8010A0D8 00105FF8  7C 08 02 A6 */	mflr r0
/* 8010A0DC 00105FFC  90 01 00 04 */	stw r0, 4(r1)
/* 8010A0E0 00106000  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A0E4 00106004  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A0E8 00106008  3B E0 00 00 */	li r31, 0
/* 8010A0EC 0010600C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A0F0 00106010  7C BE 2B 79 */	or. r30, r5, r5
/* 8010A0F4 00106014  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8010A0F8 00106018  3B A3 00 00 */	addi r29, r3, 0
/* 8010A0FC 0010601C  38 64 00 00 */	addi r3, r4, 0
/* 8010A100 00106020  40 82 00 0C */	bne lbl_8010A10C
/* 8010A104 00106024  38 60 00 00 */	li r3, 0
/* 8010A108 00106028  48 00 00 40 */	b lbl_8010A148
lbl_8010A10C:
/* 8010A10C 0010602C  80 9D 00 0C */	lwz r4, 0xc(r29)
/* 8010A110 00106030  80 1D 00 08 */	lwz r0, 8(r29)
/* 8010A114 00106034  7C 04 00 50 */	subf r0, r4, r0
/* 8010A118 00106038  7C 1E 00 40 */	cmplw r30, r0
/* 8010A11C 0010603C  40 81 00 0C */	ble lbl_8010A128
/* 8010A120 00106040  3B E0 03 02 */	li r31, 0x302
/* 8010A124 00106044  7C 1E 03 78 */	mr r30, r0
lbl_8010A128:
/* 8010A128 00106048  38 84 00 10 */	addi r4, r4, 0x10
/* 8010A12C 0010604C  38 BE 00 00 */	addi r5, r30, 0
/* 8010A130 00106050  7C 9D 22 14 */	add r4, r29, r4
/* 8010A134 00106054  4B EF 93 31 */	bl TRK_memcpy
/* 8010A138 00106058  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8010A13C 0010605C  38 7F 00 00 */	addi r3, r31, 0
/* 8010A140 00106060  7C 00 F2 14 */	add r0, r0, r30
/* 8010A144 00106064  90 1D 00 0C */	stw r0, 0xc(r29)
lbl_8010A148:
/* 8010A148 00106068  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A14C 0010606C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A150 00106070  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8010A154 00106074  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A158 00106078  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A15C 0010607C  7C 08 03 A6 */	mtlr r0
/* 8010A160 00106080  4E 80 00 20 */	blr 

.global TRKAppendBuffer1_ui16
TRKAppendBuffer1_ui16:
/* 8010A164 00106084  7C 08 02 A6 */	mflr r0
/* 8010A168 00106088  3C A0 80 2F */	lis r5, lbl_802EE268@ha
/* 8010A16C 0010608C  90 01 00 04 */	stw r0, 4(r1)
/* 8010A170 00106090  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8010A174 00106094  B0 81 00 08 */	sth r4, 8(r1)
/* 8010A178 00106098  80 05 E2 68 */	lwz r0, lbl_802EE268@l(r5)
/* 8010A17C 0010609C  2C 00 00 00 */	cmpwi r0, 0
/* 8010A180 001060A0  41 82 00 0C */	beq lbl_8010A18C
/* 8010A184 001060A4  38 81 00 08 */	addi r4, r1, 8
/* 8010A188 001060A8  48 00 00 18 */	b lbl_8010A1A0
lbl_8010A18C:
/* 8010A18C 001060AC  88 01 00 09 */	lbz r0, 9(r1)
/* 8010A190 001060B0  38 81 00 0C */	addi r4, r1, 0xc
/* 8010A194 001060B4  98 01 00 0C */	stb r0, 0xc(r1)
/* 8010A198 001060B8  88 01 00 08 */	lbz r0, 8(r1)
/* 8010A19C 001060BC  98 01 00 0D */	stb r0, 0xd(r1)
lbl_8010A1A0:
/* 8010A1A0 001060C0  38 A0 00 02 */	li r5, 2
/* 8010A1A4 001060C4  4B FF FE 91 */	bl TRKAppendBuffer
/* 8010A1A8 001060C8  38 21 00 10 */	addi r1, r1, 0x10
/* 8010A1AC 001060CC  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A1B0 001060D0  7C 08 03 A6 */	mtlr r0
/* 8010A1B4 001060D4  4E 80 00 20 */	blr 

.global TRKAppendBuffer1_ui32
TRKAppendBuffer1_ui32:
/* 8010A1B8 001060D8  7C 08 02 A6 */	mflr r0
/* 8010A1BC 001060DC  3C A0 80 2F */	lis r5, lbl_802EE268@ha
/* 8010A1C0 001060E0  90 01 00 04 */	stw r0, 4(r1)
/* 8010A1C4 001060E4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8010A1C8 001060E8  90 81 00 08 */	stw r4, 8(r1)
/* 8010A1CC 001060EC  80 05 E2 68 */	lwz r0, lbl_802EE268@l(r5)
/* 8010A1D0 001060F0  2C 00 00 00 */	cmpwi r0, 0
/* 8010A1D4 001060F4  41 82 00 0C */	beq lbl_8010A1E0
/* 8010A1D8 001060F8  38 81 00 08 */	addi r4, r1, 8
/* 8010A1DC 001060FC  48 00 00 28 */	b lbl_8010A204
lbl_8010A1E0:
/* 8010A1E0 00106100  88 01 00 0B */	lbz r0, 0xb(r1)
/* 8010A1E4 00106104  38 81 00 0C */	addi r4, r1, 0xc
/* 8010A1E8 00106108  98 01 00 0C */	stb r0, 0xc(r1)
/* 8010A1EC 0010610C  88 01 00 0A */	lbz r0, 0xa(r1)
/* 8010A1F0 00106110  98 01 00 0D */	stb r0, 0xd(r1)
/* 8010A1F4 00106114  88 01 00 09 */	lbz r0, 9(r1)
/* 8010A1F8 00106118  98 01 00 0E */	stb r0, 0xe(r1)
/* 8010A1FC 0010611C  88 01 00 08 */	lbz r0, 8(r1)
/* 8010A200 00106120  98 01 00 0F */	stb r0, 0xf(r1)
lbl_8010A204:
/* 8010A204 00106124  38 A0 00 04 */	li r5, 4
/* 8010A208 00106128  4B FF FE 2D */	bl TRKAppendBuffer
/* 8010A20C 0010612C  38 21 00 10 */	addi r1, r1, 0x10
/* 8010A210 00106130  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A214 00106134  7C 08 03 A6 */	mtlr r0
/* 8010A218 00106138  4E 80 00 20 */	blr 

.global TRKAppendBuffer1_ui64
TRKAppendBuffer1_ui64:
/* 8010A21C 0010613C  7C 08 02 A6 */	mflr r0
/* 8010A220 00106140  3C 80 80 2F */	lis r4, lbl_802EE268@ha
/* 8010A224 00106144  90 01 00 04 */	stw r0, 4(r1)
/* 8010A228 00106148  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A22C 0010614C  90 A1 00 08 */	stw r5, 8(r1)
/* 8010A230 00106150  90 C1 00 0C */	stw r6, 0xc(r1)
/* 8010A234 00106154  80 04 E2 68 */	lwz r0, lbl_802EE268@l(r4)
/* 8010A238 00106158  2C 00 00 00 */	cmpwi r0, 0
/* 8010A23C 0010615C  41 82 00 0C */	beq lbl_8010A248
/* 8010A240 00106160  38 81 00 08 */	addi r4, r1, 8
/* 8010A244 00106164  48 00 00 48 */	b lbl_8010A28C
lbl_8010A248:
/* 8010A248 00106168  88 01 00 0F */	lbz r0, 0xf(r1)
/* 8010A24C 0010616C  38 81 00 10 */	addi r4, r1, 0x10
/* 8010A250 00106170  98 01 00 10 */	stb r0, 0x10(r1)
/* 8010A254 00106174  88 01 00 0E */	lbz r0, 0xe(r1)
/* 8010A258 00106178  98 01 00 11 */	stb r0, 0x11(r1)
/* 8010A25C 0010617C  88 01 00 0D */	lbz r0, 0xd(r1)
/* 8010A260 00106180  98 01 00 12 */	stb r0, 0x12(r1)
/* 8010A264 00106184  88 01 00 0C */	lbz r0, 0xc(r1)
/* 8010A268 00106188  98 01 00 13 */	stb r0, 0x13(r1)
/* 8010A26C 0010618C  88 01 00 0B */	lbz r0, 0xb(r1)
/* 8010A270 00106190  98 01 00 14 */	stb r0, 0x14(r1)
/* 8010A274 00106194  88 01 00 0A */	lbz r0, 0xa(r1)
/* 8010A278 00106198  98 01 00 15 */	stb r0, 0x15(r1)
/* 8010A27C 0010619C  88 01 00 09 */	lbz r0, 9(r1)
/* 8010A280 001061A0  98 01 00 16 */	stb r0, 0x16(r1)
/* 8010A284 001061A4  88 01 00 08 */	lbz r0, 8(r1)
/* 8010A288 001061A8  98 01 00 17 */	stb r0, 0x17(r1)
lbl_8010A28C:
/* 8010A28C 001061AC  38 A0 00 08 */	li r5, 8
/* 8010A290 001061B0  4B FF FD A5 */	bl TRKAppendBuffer
/* 8010A294 001061B4  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A298 001061B8  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A29C 001061BC  7C 08 03 A6 */	mtlr r0
/* 8010A2A0 001061C0  4E 80 00 20 */	blr 

.global TRKAppendBuffer_ui8
TRKAppendBuffer_ui8:
/* 8010A2A4 001061C4  39 20 00 00 */	li r9, 0
/* 8010A2A8 001061C8  38 00 00 00 */	li r0, 0
/* 8010A2AC 001061CC  48 00 00 48 */	b lbl_8010A2F4
lbl_8010A2B0:
/* 8010A2B0 001061D0  80 E3 00 0C */	lwz r7, 0xc(r3)
/* 8010A2B4 001061D4  89 04 00 00 */	lbz r8, 0(r4)
/* 8010A2B8 001061D8  28 07 08 80 */	cmplwi r7, 0x880
/* 8010A2BC 001061DC  41 80 00 0C */	blt lbl_8010A2C8
/* 8010A2C0 001061E0  38 E0 03 01 */	li r7, 0x301
/* 8010A2C4 001061E4  48 00 00 24 */	b lbl_8010A2E8
lbl_8010A2C8:
/* 8010A2C8 001061E8  38 C7 00 01 */	addi r6, r7, 1
/* 8010A2CC 001061EC  38 07 00 10 */	addi r0, r7, 0x10
/* 8010A2D0 001061F0  90 C3 00 0C */	stw r6, 0xc(r3)
/* 8010A2D4 001061F4  38 E0 00 00 */	li r7, 0
/* 8010A2D8 001061F8  7D 03 01 AE */	stbx r8, r3, r0
/* 8010A2DC 001061FC  80 C3 00 08 */	lwz r6, 8(r3)
/* 8010A2E0 00106200  38 06 00 01 */	addi r0, r6, 1
/* 8010A2E4 00106204  90 03 00 08 */	stw r0, 8(r3)
lbl_8010A2E8:
/* 8010A2E8 00106208  38 07 00 00 */	addi r0, r7, 0
/* 8010A2EC 0010620C  39 29 00 01 */	addi r9, r9, 1
/* 8010A2F0 00106210  38 84 00 01 */	addi r4, r4, 1
lbl_8010A2F4:
/* 8010A2F4 00106214  2C 00 00 00 */	cmpwi r0, 0
/* 8010A2F8 00106218  40 82 00 0C */	bne lbl_8010A304
/* 8010A2FC 0010621C  7C 09 28 00 */	cmpw r9, r5
/* 8010A300 00106220  41 80 FF B0 */	blt lbl_8010A2B0
lbl_8010A304:
/* 8010A304 00106224  7C 03 03 78 */	mr r3, r0
/* 8010A308 00106228  4E 80 00 20 */	blr 

.global TRKAppendBuffer_ui32
TRKAppendBuffer_ui32:
/* 8010A30C 0010622C  7C 08 02 A6 */	mflr r0
/* 8010A310 00106230  90 01 00 04 */	stw r0, 4(r1)
/* 8010A314 00106234  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A318 00106238  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A31C 0010623C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A320 00106240  3B C0 00 00 */	li r30, 0
/* 8010A324 00106244  57 C0 10 3A */	slwi r0, r30, 2
/* 8010A328 00106248  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8010A32C 0010624C  7F E4 02 14 */	add r31, r4, r0
/* 8010A330 00106250  3B A5 00 00 */	addi r29, r5, 0
/* 8010A334 00106254  93 81 00 08 */	stw r28, 8(r1)
/* 8010A338 00106258  3B 83 00 00 */	addi r28, r3, 0
/* 8010A33C 0010625C  38 60 00 00 */	li r3, 0
/* 8010A340 00106260  48 00 00 18 */	b lbl_8010A358
lbl_8010A344:
/* 8010A344 00106264  7F 83 E3 78 */	mr r3, r28
/* 8010A348 00106268  80 9F 00 00 */	lwz r4, 0(r31)
/* 8010A34C 0010626C  4B FF FE 6D */	bl TRKAppendBuffer1_ui32
/* 8010A350 00106270  3B DE 00 01 */	addi r30, r30, 1
/* 8010A354 00106274  3B FF 00 04 */	addi r31, r31, 4
lbl_8010A358:
/* 8010A358 00106278  2C 03 00 00 */	cmpwi r3, 0
/* 8010A35C 0010627C  40 82 00 0C */	bne lbl_8010A368
/* 8010A360 00106280  7C 1E E8 00 */	cmpw r30, r29
/* 8010A364 00106284  41 80 FF E0 */	blt lbl_8010A344
lbl_8010A368:
/* 8010A368 00106288  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A36C 0010628C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A370 00106290  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8010A374 00106294  83 81 00 08 */	lwz r28, 8(r1)
/* 8010A378 00106298  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A37C 0010629C  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A380 001062A0  7C 08 03 A6 */	mtlr r0
/* 8010A384 001062A4  4E 80 00 20 */	blr 

.global TRKReadBuffer1_ui8
TRKReadBuffer1_ui8:
/* 8010A388 001062A8  7C 08 02 A6 */	mflr r0
/* 8010A38C 001062AC  38 A0 00 01 */	li r5, 1
/* 8010A390 001062B0  90 01 00 04 */	stw r0, 4(r1)
/* 8010A394 001062B4  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010A398 001062B8  4B FF FD 41 */	bl TRKReadBuffer
/* 8010A39C 001062BC  38 21 00 08 */	addi r1, r1, 8
/* 8010A3A0 001062C0  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A3A4 001062C4  7C 08 03 A6 */	mtlr r0
/* 8010A3A8 001062C8  4E 80 00 20 */	blr 

.global TRKReadBuffer1_ui16
TRKReadBuffer1_ui16:
/* 8010A3AC 001062CC  7C 08 02 A6 */	mflr r0
/* 8010A3B0 001062D0  3C A0 80 2F */	lis r5, lbl_802EE268@ha
/* 8010A3B4 001062D4  90 01 00 04 */	stw r0, 4(r1)
/* 8010A3B8 001062D8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A3BC 001062DC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A3C0 001062E0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A3C4 001062E4  3B C4 00 00 */	addi r30, r4, 0
/* 8010A3C8 001062E8  80 05 E2 68 */	lwz r0, lbl_802EE268@l(r5)
/* 8010A3CC 001062EC  2C 00 00 00 */	cmpwi r0, 0
/* 8010A3D0 001062F0  41 82 00 0C */	beq lbl_8010A3DC
/* 8010A3D4 001062F4  7F DF F3 78 */	mr r31, r30
/* 8010A3D8 001062F8  48 00 00 08 */	b lbl_8010A3E0
lbl_8010A3DC:
/* 8010A3DC 001062FC  3B E1 00 08 */	addi r31, r1, 8
lbl_8010A3E0:
/* 8010A3E0 00106300  38 9F 00 00 */	addi r4, r31, 0
/* 8010A3E4 00106304  38 A0 00 02 */	li r5, 2
/* 8010A3E8 00106308  4B FF FC F1 */	bl TRKReadBuffer
/* 8010A3EC 0010630C  3C 80 80 2F */	lis r4, lbl_802EE268@ha
/* 8010A3F0 00106310  80 04 E2 68 */	lwz r0, lbl_802EE268@l(r4)
/* 8010A3F4 00106314  2C 00 00 00 */	cmpwi r0, 0
/* 8010A3F8 00106318  40 82 00 1C */	bne lbl_8010A414
/* 8010A3FC 0010631C  2C 03 00 00 */	cmpwi r3, 0
/* 8010A400 00106320  40 82 00 14 */	bne lbl_8010A414
/* 8010A404 00106324  88 1F 00 01 */	lbz r0, 1(r31)
/* 8010A408 00106328  98 1E 00 00 */	stb r0, 0(r30)
/* 8010A40C 0010632C  88 1F 00 00 */	lbz r0, 0(r31)
/* 8010A410 00106330  98 1E 00 01 */	stb r0, 1(r30)
lbl_8010A414:
/* 8010A414 00106334  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A418 00106338  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A41C 0010633C  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A420 00106340  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A424 00106344  7C 08 03 A6 */	mtlr r0
/* 8010A428 00106348  4E 80 00 20 */	blr 

.global TRKReadBuffer1_ui32
TRKReadBuffer1_ui32:
/* 8010A42C 0010634C  7C 08 02 A6 */	mflr r0
/* 8010A430 00106350  3C A0 80 2F */	lis r5, lbl_802EE268@ha
/* 8010A434 00106354  90 01 00 04 */	stw r0, 4(r1)
/* 8010A438 00106358  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A43C 0010635C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A440 00106360  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A444 00106364  3B C4 00 00 */	addi r30, r4, 0
/* 8010A448 00106368  80 05 E2 68 */	lwz r0, lbl_802EE268@l(r5)
/* 8010A44C 0010636C  2C 00 00 00 */	cmpwi r0, 0
/* 8010A450 00106370  41 82 00 0C */	beq lbl_8010A45C
/* 8010A454 00106374  7F DF F3 78 */	mr r31, r30
/* 8010A458 00106378  48 00 00 08 */	b lbl_8010A460
lbl_8010A45C:
/* 8010A45C 0010637C  3B E1 00 08 */	addi r31, r1, 8
lbl_8010A460:
/* 8010A460 00106380  38 9F 00 00 */	addi r4, r31, 0
/* 8010A464 00106384  38 A0 00 04 */	li r5, 4
/* 8010A468 00106388  4B FF FC 71 */	bl TRKReadBuffer
/* 8010A46C 0010638C  3C 80 80 2F */	lis r4, lbl_802EE268@ha
/* 8010A470 00106390  80 04 E2 68 */	lwz r0, lbl_802EE268@l(r4)
/* 8010A474 00106394  2C 00 00 00 */	cmpwi r0, 0
/* 8010A478 00106398  40 82 00 2C */	bne lbl_8010A4A4
/* 8010A47C 0010639C  2C 03 00 00 */	cmpwi r3, 0
/* 8010A480 001063A0  40 82 00 24 */	bne lbl_8010A4A4
/* 8010A484 001063A4  88 1F 00 03 */	lbz r0, 3(r31)
/* 8010A488 001063A8  98 1E 00 00 */	stb r0, 0(r30)
/* 8010A48C 001063AC  88 1F 00 02 */	lbz r0, 2(r31)
/* 8010A490 001063B0  98 1E 00 01 */	stb r0, 1(r30)
/* 8010A494 001063B4  88 1F 00 01 */	lbz r0, 1(r31)
/* 8010A498 001063B8  98 1E 00 02 */	stb r0, 2(r30)
/* 8010A49C 001063BC  88 1F 00 00 */	lbz r0, 0(r31)
/* 8010A4A0 001063C0  98 1E 00 03 */	stb r0, 3(r30)
lbl_8010A4A4:
/* 8010A4A4 001063C4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A4A8 001063C8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A4AC 001063CC  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A4B0 001063D0  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A4B4 001063D4  7C 08 03 A6 */	mtlr r0
/* 8010A4B8 001063D8  4E 80 00 20 */	blr 

.global TRKReadBuffer1_ui64
TRKReadBuffer1_ui64:
/* 8010A4BC 001063DC  7C 08 02 A6 */	mflr r0
/* 8010A4C0 001063E0  3C A0 80 2F */	lis r5, lbl_802EE268@ha
/* 8010A4C4 001063E4  90 01 00 04 */	stw r0, 4(r1)
/* 8010A4C8 001063E8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A4CC 001063EC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A4D0 001063F0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A4D4 001063F4  3B C4 00 00 */	addi r30, r4, 0
/* 8010A4D8 001063F8  80 05 E2 68 */	lwz r0, lbl_802EE268@l(r5)
/* 8010A4DC 001063FC  2C 00 00 00 */	cmpwi r0, 0
/* 8010A4E0 00106400  41 82 00 0C */	beq lbl_8010A4EC
/* 8010A4E4 00106404  7F DF F3 78 */	mr r31, r30
/* 8010A4E8 00106408  48 00 00 08 */	b lbl_8010A4F0
lbl_8010A4EC:
/* 8010A4EC 0010640C  3B E1 00 08 */	addi r31, r1, 8
lbl_8010A4F0:
/* 8010A4F0 00106410  38 9F 00 00 */	addi r4, r31, 0
/* 8010A4F4 00106414  38 A0 00 08 */	li r5, 8
/* 8010A4F8 00106418  4B FF FB E1 */	bl TRKReadBuffer
/* 8010A4FC 0010641C  3C 80 80 2F */	lis r4, lbl_802EE268@ha
/* 8010A500 00106420  80 04 E2 68 */	lwz r0, lbl_802EE268@l(r4)
/* 8010A504 00106424  2C 00 00 00 */	cmpwi r0, 0
/* 8010A508 00106428  40 82 00 4C */	bne lbl_8010A554
/* 8010A50C 0010642C  2C 03 00 00 */	cmpwi r3, 0
/* 8010A510 00106430  40 82 00 44 */	bne lbl_8010A554
/* 8010A514 00106434  88 1F 00 07 */	lbz r0, 7(r31)
/* 8010A518 00106438  98 1E 00 00 */	stb r0, 0(r30)
/* 8010A51C 0010643C  88 1F 00 06 */	lbz r0, 6(r31)
/* 8010A520 00106440  98 1E 00 01 */	stb r0, 1(r30)
/* 8010A524 00106444  88 1F 00 05 */	lbz r0, 5(r31)
/* 8010A528 00106448  98 1E 00 02 */	stb r0, 2(r30)
/* 8010A52C 0010644C  88 1F 00 04 */	lbz r0, 4(r31)
/* 8010A530 00106450  98 1E 00 03 */	stb r0, 3(r30)
/* 8010A534 00106454  88 1F 00 03 */	lbz r0, 3(r31)
/* 8010A538 00106458  98 1E 00 04 */	stb r0, 4(r30)
/* 8010A53C 0010645C  88 1F 00 02 */	lbz r0, 2(r31)
/* 8010A540 00106460  98 1E 00 05 */	stb r0, 5(r30)
/* 8010A544 00106464  88 1F 00 01 */	lbz r0, 1(r31)
/* 8010A548 00106468  98 1E 00 06 */	stb r0, 6(r30)
/* 8010A54C 0010646C  88 1F 00 00 */	lbz r0, 0(r31)
/* 8010A550 00106470  98 1E 00 07 */	stb r0, 7(r30)
lbl_8010A554:
/* 8010A554 00106474  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A558 00106478  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A55C 0010647C  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A560 00106480  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A564 00106484  7C 08 03 A6 */	mtlr r0
/* 8010A568 00106488  4E 80 00 20 */	blr 

.global TRKReadBuffer_ui8
TRKReadBuffer_ui8:
/* 8010A56C 0010648C  7C 08 02 A6 */	mflr r0
/* 8010A570 00106490  90 01 00 04 */	stw r0, 4(r1)
/* 8010A574 00106494  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A578 00106498  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A57C 0010649C  3B E0 00 00 */	li r31, 0
/* 8010A580 001064A0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A584 001064A4  3B C5 00 00 */	addi r30, r5, 0
/* 8010A588 001064A8  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8010A58C 001064AC  3B A4 00 00 */	addi r29, r4, 0
/* 8010A590 001064B0  93 81 00 08 */	stw r28, 8(r1)
/* 8010A594 001064B4  3B 83 00 00 */	addi r28, r3, 0
/* 8010A598 001064B8  38 60 00 00 */	li r3, 0
/* 8010A59C 001064BC  48 00 00 14 */	b lbl_8010A5B0
lbl_8010A5A0:
/* 8010A5A0 001064C0  38 7C 00 00 */	addi r3, r28, 0
/* 8010A5A4 001064C4  7C 9D FA 14 */	add r4, r29, r31
/* 8010A5A8 001064C8  4B FF FD E1 */	bl TRKReadBuffer1_ui8
/* 8010A5AC 001064CC  3B FF 00 01 */	addi r31, r31, 1
lbl_8010A5B0:
/* 8010A5B0 001064D0  2C 03 00 00 */	cmpwi r3, 0
/* 8010A5B4 001064D4  40 82 00 0C */	bne lbl_8010A5C0
/* 8010A5B8 001064D8  7C 1F F0 00 */	cmpw r31, r30
/* 8010A5BC 001064DC  41 80 FF E4 */	blt lbl_8010A5A0
lbl_8010A5C0:
/* 8010A5C0 001064E0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A5C4 001064E4  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A5C8 001064E8  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8010A5CC 001064EC  83 81 00 08 */	lwz r28, 8(r1)
/* 8010A5D0 001064F0  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A5D4 001064F4  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A5D8 001064F8  7C 08 03 A6 */	mtlr r0
/* 8010A5DC 001064FC  4E 80 00 20 */	blr 

.global TRKReadBuffer_ui32
TRKReadBuffer_ui32:
/* 8010A5E0 00106500  7C 08 02 A6 */	mflr r0
/* 8010A5E4 00106504  90 01 00 04 */	stw r0, 4(r1)
/* 8010A5E8 00106508  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8010A5EC 0010650C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8010A5F0 00106510  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8010A5F4 00106514  3B C0 00 00 */	li r30, 0
/* 8010A5F8 00106518  57 C0 10 3A */	slwi r0, r30, 2
/* 8010A5FC 0010651C  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8010A600 00106520  7F E4 02 14 */	add r31, r4, r0
/* 8010A604 00106524  3B A5 00 00 */	addi r29, r5, 0
/* 8010A608 00106528  93 81 00 08 */	stw r28, 8(r1)
/* 8010A60C 0010652C  3B 83 00 00 */	addi r28, r3, 0
/* 8010A610 00106530  38 60 00 00 */	li r3, 0
/* 8010A614 00106534  48 00 00 18 */	b lbl_8010A62C
lbl_8010A618:
/* 8010A618 00106538  38 7C 00 00 */	addi r3, r28, 0
/* 8010A61C 0010653C  38 9F 00 00 */	addi r4, r31, 0
/* 8010A620 00106540  4B FF FE 0D */	bl TRKReadBuffer1_ui32
/* 8010A624 00106544  3B DE 00 01 */	addi r30, r30, 1
/* 8010A628 00106548  3B FF 00 04 */	addi r31, r31, 4
lbl_8010A62C:
/* 8010A62C 0010654C  2C 03 00 00 */	cmpwi r3, 0
/* 8010A630 00106550  40 82 00 0C */	bne lbl_8010A63C
/* 8010A634 00106554  7C 1E E8 00 */	cmpw r30, r29
/* 8010A638 00106558  41 80 FF E0 */	blt lbl_8010A618
lbl_8010A63C:
/* 8010A63C 0010655C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8010A640 00106560  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8010A644 00106564  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8010A648 00106568  83 81 00 08 */	lwz r28, 8(r1)
/* 8010A64C 0010656C  38 21 00 18 */	addi r1, r1, 0x18
/* 8010A650 00106570  80 01 00 04 */	lwz r0, 4(r1)
/* 8010A654 00106574  7C 08 03 A6 */	mtlr r0
/* 8010A658 00106578  4E 80 00 20 */	blr 

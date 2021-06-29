.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global TRKInitializeNub
TRKInitializeNub:
/* 80109C58 00105B78  7C 08 02 A6 */	mflr r0
/* 80109C5C 00105B7C  90 01 00 04 */	stw r0, 4(r1)
/* 80109C60 00105B80  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80109C64 00105B84  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80109C68 00105B88  93 C1 00 08 */	stw r30, 8(r1)
/* 80109C6C 00105B8C  48 00 01 0D */	bl TRKInitializeEndian
/* 80109C70 00105B90  7C 7E 1B 79 */	or. r30, r3, r3
/* 80109C74 00105B94  40 82 00 08 */	bne lbl_80109C7C
/* 80109C78 00105B98  48 00 0B AD */	bl usr_put_initialize
lbl_80109C7C:
/* 80109C7C 00105B9C  2C 1E 00 00 */	cmpwi r30, 0
/* 80109C80 00105BA0  40 82 00 0C */	bne lbl_80109C8C
/* 80109C84 00105BA4  4B FF FD 79 */	bl TRKInitializeEventQueue
/* 80109C88 00105BA8  7C 7E 1B 78 */	mr r30, r3
lbl_80109C8C:
/* 80109C8C 00105BAC  2C 1E 00 00 */	cmpwi r30, 0
/* 80109C90 00105BB0  40 82 00 0C */	bne lbl_80109C9C
/* 80109C94 00105BB4  48 00 01 89 */	bl TRKInitializeMessageBuffers
/* 80109C98 00105BB8  7C 7E 1B 78 */	mr r30, r3
lbl_80109C9C:
/* 80109C9C 00105BBC  2C 1E 00 00 */	cmpwi r30, 0
/* 80109CA0 00105BC0  40 82 00 0C */	bne lbl_80109CAC
/* 80109CA4 00105BC4  48 00 0B 85 */	bl TRKInitializeDispatcher
/* 80109CA8 00105BC8  7C 7E 1B 78 */	mr r30, r3
lbl_80109CAC:
/* 80109CAC 00105BCC  2C 1E 00 00 */	cmpwi r30, 0
/* 80109CB0 00105BD0  40 82 00 40 */	bne lbl_80109CF0
/* 80109CB4 00105BD4  3C 60 80 2F */	lis r3, lbl_802EFC34@ha
/* 80109CB8 00105BD8  3B E3 FC 34 */	addi r31, r3, lbl_802EFC34@l
/* 80109CBC 00105BDC  3C 60 00 01 */	lis r3, 0x0000E100@ha
/* 80109CC0 00105BE0  38 DF 00 00 */	addi r6, r31, 0
/* 80109CC4 00105BE4  38 63 E1 00 */	addi r3, r3, 0x0000E100@l
/* 80109CC8 00105BE8  38 80 00 01 */	li r4, 1
/* 80109CCC 00105BEC  38 A0 00 00 */	li r5, 0
/* 80109CD0 00105BF0  48 00 42 39 */	bl TRKInitializeIntDrivenUART
/* 80109CD4 00105BF4  7C 60 1B 78 */	mr r0, r3
/* 80109CD8 00105BF8  80 7F 00 00 */	lwz r3, 0(r31)
/* 80109CDC 00105BFC  7C 1F 03 78 */	mr r31, r0
/* 80109CE0 00105C00  48 00 3A B9 */	bl TRKTargetSetInputPendingPtr
/* 80109CE4 00105C04  2C 1F 00 00 */	cmpwi r31, 0
/* 80109CE8 00105C08  41 82 00 08 */	beq lbl_80109CF0
/* 80109CEC 00105C0C  7F FE FB 78 */	mr r30, r31
lbl_80109CF0:
/* 80109CF0 00105C10  2C 1E 00 00 */	cmpwi r30, 0
/* 80109CF4 00105C14  40 82 00 0C */	bne lbl_80109D00
/* 80109CF8 00105C18  48 00 0B 01 */	bl TRKInitializeSerialHandler
/* 80109CFC 00105C1C  7C 7E 1B 78 */	mr r30, r3
lbl_80109D00:
/* 80109D00 00105C20  2C 1E 00 00 */	cmpwi r30, 0
/* 80109D04 00105C24  40 82 00 0C */	bne lbl_80109D10
/* 80109D08 00105C28  48 00 3C 55 */	bl TRKInitializeTarget
/* 80109D0C 00105C2C  7C 7E 1B 78 */	mr r30, r3
lbl_80109D10:
/* 80109D10 00105C30  7F C3 F3 78 */	mr r3, r30
/* 80109D14 00105C34  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80109D18 00105C38  83 C1 00 08 */	lwz r30, 8(r1)
/* 80109D1C 00105C3C  38 21 00 10 */	addi r1, r1, 0x10
/* 80109D20 00105C40  80 01 00 04 */	lwz r0, 4(r1)
/* 80109D24 00105C44  7C 08 03 A6 */	mtlr r0
/* 80109D28 00105C48  4E 80 00 20 */	blr 

.global TRKTerminateNub
TRKTerminateNub:
/* 80109D2C 00105C4C  7C 08 02 A6 */	mflr r0
/* 80109D30 00105C50  90 01 00 04 */	stw r0, 4(r1)
/* 80109D34 00105C54  94 21 FF F8 */	stwu r1, -8(r1)
/* 80109D38 00105C58  48 00 0A E5 */	bl TRKTerminateSerialHandler
/* 80109D3C 00105C5C  38 60 00 00 */	li r3, 0
/* 80109D40 00105C60  38 21 00 08 */	addi r1, r1, 8
/* 80109D44 00105C64  80 01 00 04 */	lwz r0, 4(r1)
/* 80109D48 00105C68  7C 08 03 A6 */	mtlr r0
/* 80109D4C 00105C6C  4E 80 00 20 */	blr 

.global TRKNubWelcome
TRKNubWelcome:
/* 80109D50 00105C70  7C 08 02 A6 */	mflr r0
/* 80109D54 00105C74  3C 60 80 17 */	lis r3, lbl_80172310@ha
/* 80109D58 00105C78  90 01 00 04 */	stw r0, 4(r1)
/* 80109D5C 00105C7C  38 63 23 10 */	addi r3, r3, lbl_80172310@l
/* 80109D60 00105C80  94 21 FF F8 */	stwu r1, -8(r1)
/* 80109D64 00105C84  48 00 43 2D */	bl TRK_board_display
/* 80109D68 00105C88  38 21 00 08 */	addi r1, r1, 8
/* 80109D6C 00105C8C  80 01 00 04 */	lwz r0, 4(r1)
/* 80109D70 00105C90  7C 08 03 A6 */	mtlr r0
/* 80109D74 00105C94  4E 80 00 20 */	blr 

.global TRKInitializeEndian
TRKInitializeEndian:
/* 80109D78 00105C98  3C 60 80 2F */	lis r3, lbl_802EE268@ha
/* 80109D7C 00105C9C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80109D80 00105CA0  38 A3 E2 68 */	addi r5, r3, lbl_802EE268@l
/* 80109D84 00105CA4  38 C0 00 01 */	li r6, 1
/* 80109D88 00105CA8  90 C5 00 00 */	stw r6, 0(r5)
/* 80109D8C 00105CAC  38 00 00 12 */	li r0, 0x12
/* 80109D90 00105CB0  38 60 00 34 */	li r3, 0x34
/* 80109D94 00105CB4  98 01 00 08 */	stb r0, 8(r1)
/* 80109D98 00105CB8  38 80 00 56 */	li r4, 0x56
/* 80109D9C 00105CBC  38 00 00 78 */	li r0, 0x78
/* 80109DA0 00105CC0  98 61 00 09 */	stb r3, 9(r1)
/* 80109DA4 00105CC4  38 60 00 00 */	li r3, 0
/* 80109DA8 00105CC8  98 81 00 0A */	stb r4, 0xa(r1)
/* 80109DAC 00105CCC  98 01 00 0B */	stb r0, 0xb(r1)
/* 80109DB0 00105CD0  80 81 00 08 */	lwz r4, 8(r1)
/* 80109DB4 00105CD4  3C 04 ED CC */	addis r0, r4, 0xedcc
/* 80109DB8 00105CD8  28 00 56 78 */	cmplwi r0, 0x5678
/* 80109DBC 00105CDC  40 82 00 0C */	bne lbl_80109DC8
/* 80109DC0 00105CE0  90 C5 00 00 */	stw r6, 0(r5)
/* 80109DC4 00105CE4  48 00 00 20 */	b lbl_80109DE4
lbl_80109DC8:
/* 80109DC8 00105CE8  3C 04 87 AA */	addis r0, r4, 0x87aa
/* 80109DCC 00105CEC  28 00 34 12 */	cmplwi r0, 0x3412
/* 80109DD0 00105CF0  40 82 00 10 */	bne lbl_80109DE0
/* 80109DD4 00105CF4  38 00 00 00 */	li r0, 0
/* 80109DD8 00105CF8  90 05 00 00 */	stw r0, 0(r5)
/* 80109DDC 00105CFC  48 00 00 08 */	b lbl_80109DE4
lbl_80109DE0:
/* 80109DE0 00105D00  38 60 00 01 */	li r3, 1
lbl_80109DE4:
/* 80109DE4 00105D04  38 21 00 10 */	addi r1, r1, 0x10
/* 80109DE8 00105D08  4E 80 00 20 */	blr 

#ifndef _FIRMM_H
#define _FIRMM_H

#define reg_fir_start (*(volatile uint32_t*)0x380002ac)

int taps[11] __attribute__ ( ( section ( ".FIR_TAP" ) ) ) = {0,-10,-9,23,56,63,56,23,-9,-10,0};

int fir_inputsignal[64] __attribute__ ( ( section ( ".FIR_X" ) ) ) = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63};

int A[16] __attribute__ ( ( section ( ".MATRIX_A" ) ) ) = {0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
	};

int B[16] __attribute__ ( ( section ( ".MATRIX_B" ) ) )  = {1, 2, 3, 4,
		5, 6, 7, 8,
		9, 10, 11, 12,
		13, 14, 15, 16,
	};

/* deprecated
#define reg_user_tap0  (*(volatile uint32_t*)0x38000100)
#define reg_user_tap1  (*(volatile uint32_t*)0x38000104)
#define reg_user_tap2  (*(volatile uint32_t*)0x38000108)
#define reg_user_tap3  (*(volatile uint32_t*)0x3800010c)
#define reg_user_tap4  (*(volatile uint32_t*)0x38000110)
#define reg_user_tap5  (*(volatile uint32_t*)0x38000114)
#define reg_user_tap6  (*(volatile uint32_t*)0x38000118)
#define reg_user_tap7  (*(volatile uint32_t*)0x3800011c)
#define reg_user_tap8  (*(volatile uint32_t*)0x38000120)
#define reg_user_tap9  (*(volatile uint32_t*)0x38000124)
#define reg_user_tap10 (*(volatile uint32_t*)0x38000128)
#define reg_user_x0  (*(volatile uint32_t*)0x3800012c)
#define reg_user_x1  (*(volatile uint32_t*)0x38000130)
#define reg_user_x2  (*(volatile uint32_t*)0x38000134)
#define reg_user_x3  (*(volatile uint32_t*)0x38000138)
#define reg_user_x4  (*(volatile uint32_t*)0x3800013c)
#define reg_user_x5  (*(volatile uint32_t*)0x38000140)
#define reg_user_x6  (*(volatile uint32_t*)0x38000144)
#define reg_user_x7  (*(volatile uint32_t*)0x38000148)
#define reg_user_x8  (*(volatile uint32_t*)0x3800014c)
#define reg_user_x9  (*(volatile uint32_t*)0x38000150)
#define reg_user_x10 (*(volatile uint32_t*)0x38000154)
#define reg_user_x11 (*(volatile uint32_t*)0x38000158)
#define reg_user_x12 (*(volatile uint32_t*)0x3800015c)
#define reg_user_x13 (*(volatile uint32_t*)0x38000160)
#define reg_user_x14 (*(volatile uint32_t*)0x38000164)
#define reg_user_x15 (*(volatile uint32_t*)0x38000168)
#define reg_user_x16 (*(volatile uint32_t*)0x3800016c)
#define reg_user_x17 (*(volatile uint32_t*)0x38000170)
#define reg_user_x18 (*(volatile uint32_t*)0x38000174)
#define reg_user_x19 (*(volatile uint32_t*)0x38000178)
#define reg_user_x20 (*(volatile uint32_t*)0x3800017c)
#define reg_user_x21 (*(volatile uint32_t*)0x38000180)
#define reg_user_x22 (*(volatile uint32_t*)0x38000184)
#define reg_user_x23 (*(volatile uint32_t*)0x38000188)
#define reg_user_x24 (*(volatile uint32_t*)0x3800018c)
#define reg_user_x25 (*(volatile uint32_t*)0x38000190)
#define reg_user_x26 (*(volatile uint32_t*)0x38000194)
#define reg_user_x27 (*(volatile uint32_t*)0x38000198)
#define reg_user_x28 (*(volatile uint32_t*)0x3800019c)
#define reg_user_x29 (*(volatile uint32_t*)0x380001a0)
#define reg_user_x30 (*(volatile uint32_t*)0x380001a4)
#define reg_user_x31 (*(volatile uint32_t*)0x380001a8)
#define reg_user_x32 (*(volatile uint32_t*)0x380001ac)
#define reg_user_x33 (*(volatile uint32_t*)0x380001b0)
#define reg_user_x34 (*(volatile uint32_t*)0x380001b4)
#define reg_user_x35 (*(volatile uint32_t*)0x380001b8)
#define reg_user_x36 (*(volatile uint32_t*)0x380001bc)
#define reg_user_x37 (*(volatile uint32_t*)0x380001c0)
#define reg_user_x38 (*(volatile uint32_t*)0x380001c4)
#define reg_user_x39 (*(volatile uint32_t*)0x380001c8)
#define reg_user_x40 (*(volatile uint32_t*)0x380001cc)
#define reg_user_x41 (*(volatile uint32_t*)0x380001d0)
#define reg_user_x42 (*(volatile uint32_t*)0x380001d4)
#define reg_user_x43 (*(volatile uint32_t*)0x380001d8)
#define reg_user_x44 (*(volatile uint32_t*)0x380001dc)
#define reg_user_x45 (*(volatile uint32_t*)0x380001e0)
#define reg_user_x46 (*(volatile uint32_t*)0x380001e4)
#define reg_user_x47 (*(volatile uint32_t*)0x380001e8)
#define reg_user_x48 (*(volatile uint32_t*)0x380001ec)
#define reg_user_x49 (*(volatile uint32_t*)0x380001f0)
#define reg_user_x50 (*(volatile uint32_t*)0x380001f4)
#define reg_user_x51 (*(volatile uint32_t*)0x380001f8)
#define reg_user_x52 (*(volatile uint32_t*)0x380001fc)
#define reg_user_x53 (*(volatile uint32_t*)0x38000200)
#define reg_user_x54 (*(volatile uint32_t*)0x38000204)
#define reg_user_x55 (*(volatile uint32_t*)0x38000208)
#define reg_user_x56 (*(volatile uint32_t*)0x3800020c)
#define reg_user_x57 (*(volatile uint32_t*)0x38000210)
#define reg_user_x58 (*(volatile uint32_t*)0x38000214)
#define reg_user_x59 (*(volatile uint32_t*)0x38000218)
#define reg_user_x60 (*(volatile uint32_t*)0x3800021c)
#define reg_user_x61 (*(volatile uint32_t*)0x38000220)
#define reg_user_x62 (*(volatile uint32_t*)0x38000224)
#define reg_user_x63 (*(volatile uint32_t*)0x38000228)
#define reg_user_A0  (*(volatile uint32_t*)0x3800022c)
#define reg_user_A1  (*(volatile uint32_t*)0x38000230)
#define reg_user_A2  (*(volatile uint32_t*)0x38000234)
#define reg_user_A3  (*(volatile uint32_t*)0x38000238)
#define reg_user_A4  (*(volatile uint32_t*)0x3800023c)
#define reg_user_A5  (*(volatile uint32_t*)0x38000240)
#define reg_user_A6  (*(volatile uint32_t*)0x38000244)
#define reg_user_A7  (*(volatile uint32_t*)0x38000248)
#define reg_user_A8  (*(volatile uint32_t*)0x3800024c)
#define reg_user_A9  (*(volatile uint32_t*)0x38000250)
#define reg_user_A10 (*(volatile uint32_t*)0x38000254)
#define reg_user_A11 (*(volatile uint32_t*)0x38000258)
#define reg_user_A12 (*(volatile uint32_t*)0x3800025c)
#define reg_user_A13 (*(volatile uint32_t*)0x38000260)
#define reg_user_A14 (*(volatile uint32_t*)0x38000264)
#define reg_user_A15 (*(volatile uint32_t*)0x38000268)
#define reg_user_B0  (*(volatile uint32_t*)0x3800026c)
#define reg_user_B1  (*(volatile uint32_t*)0x38000270)
#define reg_user_B2  (*(volatile uint32_t*)0x38000274)
#define reg_user_B3  (*(volatile uint32_t*)0x38000278)
#define reg_user_B4  (*(volatile uint32_t*)0x3800027c)
#define reg_user_B5  (*(volatile uint32_t*)0x38000280)
#define reg_user_B6  (*(volatile uint32_t*)0x38000284)
#define reg_user_B7  (*(volatile uint32_t*)0x38000288)
#define reg_user_B8  (*(volatile uint32_t*)0x3800028c)
#define reg_user_B9  (*(volatile uint32_t*)0x38000290)
#define reg_user_B10 (*(volatile uint32_t*)0x38000294)
#define reg_user_B11 (*(volatile uint32_t*)0x38000298)
#define reg_user_B12 (*(volatile uint32_t*)0x3800029c)
#define reg_user_B13 (*(volatile uint32_t*)0x380002a0)
#define reg_user_B14 (*(volatile uint32_t*)0x380002a4)
#define reg_user_B15 (*(volatile uint32_t*)0x380002a8)
*/
#endif

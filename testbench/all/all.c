/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>
#include "firmm.h"
#include <user_uart.h>
#ifdef USER_PROJ_IRQ0_EN
#include <irq_vex.h>
#endif


extern void uart_write();
extern void uart_write_char();
extern void uart_write_string();
extern void uart_reset_write_fifo();
extern int uart_isr();
extern int uart_read();
extern int* qsort();
// --------------------------------------------------------

/*
	MPRJ Logic Analyzer Test:
		- Observes counter value through LA probes [31:0] 
		- Sets counter initial value through LA probes [63:32]
		- Flags when counter value exceeds 500 through the management SoC gpio
		- Outputs message to the UART when the test concludes successfuly
*/

void main()
{
#ifdef USER_PROJ_IRQ0_EN
    int mask;
#endif
	/* Set up the housekeeping SPI to be connected internally so	*/
	/* that external pin changes don't affect it.			*/

	// reg_spi_enable = 1;
	// reg_spimaster_cs = 0x00000;

	// reg_spimaster_control = 0x0801;

	// reg_spimaster_control = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// Connect the housekeeping SPI to the SPI master
	// so that the CSB line is not left floating.  This allows
	// all of the GPIO pins to be used for user functions.

	// The upper GPIO pins are configured to be output
	// and accessble to the management SoC.
	// Used to flad the start/end of a test 
	// The lower GPIO pins are configured to be output
	// and accessible to the user project.  They show
	// the project count value, although this test is
	// designed to read the project count through the
	// logic analyzer probes.
	// I/O 6 is configured for the UART Tx line

    //reg_spi_enable = 1;
    reg_wb_enable = 1;

    reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_29 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_28 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_26 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_25 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_24 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_23 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_22 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_21 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_20 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_19 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_18 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_17 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_16 = GPIO_MODE_MGMT_STD_OUTPUT;

    reg_mprj_io_15 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_14 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_13 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_12 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_11 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_10 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_9  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_8  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_7  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_4  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_3  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_2  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_1  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_0  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_6  = GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_5  = GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_uart_enable = 1;
    #ifdef USER_PROJ_IRQ0_EN	
	// unmask USER_IRQ_0_INTERRUPT
	mask = irq_getmask();
	mask |= 1 << USER_IRQ_0_INTERRUPT; // USER_IRQ_0_INTERRUPT = 2
	irq_setmask(mask);
	// enable user_irq_0_ev_enable
	user_irq_0_ev_enable_write(1);	
    #endif
	/* Apply configuration */
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);
	// Flag start of the test 
	reg_user_tap0 = 0;
	reg_user_tap1 = -10;
	reg_user_tap2 = -9;
	reg_user_tap3 = 23;
	reg_user_tap4 = 56;
	reg_user_tap5 = 63;
	reg_user_tap6 = 56;
	reg_user_tap7 = 23;
	reg_user_tap8 = -9;
	reg_user_tap9 = -10;
	reg_user_tap10 = 0;
	reg_user_x0 = 0;
	reg_user_x1 = 1;
	reg_user_x2 = 2;
	reg_user_x3 = 3;
	reg_user_x4 = 4;
	reg_user_x5 = 5;
	reg_user_x6 = 6;
	reg_user_x7 = 7;
	reg_user_x8 = 8;
	reg_user_x9 = 9;
	reg_user_x10 = 10;
	reg_user_x11 = 11;
	reg_user_x12 = 12;
	reg_user_x13 = 13;
	reg_user_x14 = 14;
	reg_user_x15 = 15;
	reg_user_x16 = 16;
	reg_user_x17 = 17;
	reg_user_x18 = 18;
	reg_user_x19 = 19;
	reg_user_x20 = 20;
	reg_user_x21 = 21;
	reg_user_x22 = 22;
	reg_user_x23 = 23;
	reg_user_x24 = 24;
	reg_user_x25 = 25;
	reg_user_x26 = 26;
	reg_user_x27 = 27;
	reg_user_x28 = 28;
	reg_user_x29 = 29;
	reg_user_x30 = 30;
	reg_user_x31 = 31;
	reg_user_x32 = 32;
	reg_user_x33 = 33;
	reg_user_x34 = 34;
	reg_user_x35 = 35;
	reg_user_x36 = 36;
	reg_user_x37 = 37;
	reg_user_x38 = 38;
	reg_user_x39 = 39;
	reg_user_x40 = 40;
	reg_user_x41 = 41;
	reg_user_x42 = 42;
	reg_user_x43 = 43;
	reg_user_x44 = 44;
	reg_user_x45 = 45;
	reg_user_x46 = 46;
	reg_user_x47 = 47;
	reg_user_x48 = 48;
	reg_user_x49 = 49;
	reg_user_x50 = 50;
	reg_user_x51 = 51;
	reg_user_x52 = 52;
	reg_user_x53 = 53;
	reg_user_x54 = 54;
	reg_user_x55 = 55;
	reg_user_x56 = 56;
	reg_user_x57 = 57;
	reg_user_x58 = 58;
	reg_user_x59 = 59;
	reg_user_x60 = 60;
	reg_user_x61 = 61;
	reg_user_x62 = 62;
	reg_user_x63 = 63;
	reg_user_A0 = 0;
	reg_user_A1 = 1;
	reg_user_A2 = 2;
	reg_user_A3 = 3;
	reg_user_A4 = 0;
	reg_user_A5 = 1;
	reg_user_A6 = 2;
	reg_user_A7 = 3;
	reg_user_A8 = 0;
	reg_user_A9 = 1;
	reg_user_A10 = 2;
	reg_user_A11 = 3;
	reg_user_A12 = 0;
	reg_user_A13 = 1;
	reg_user_A14 = 2;
	reg_user_A15 = 3;
	reg_user_B0 = 1;
	reg_user_B1 = 2;
	reg_user_B2 = 3;
	reg_user_B3 = 4;
	reg_user_B4 = 5;
	reg_user_B5 = 6;
	reg_user_B6 = 7;
	reg_user_B7 = 8;
	reg_user_B8 = 9;
	reg_user_B9 = 10;
	reg_user_B10 = 11;
	reg_user_B11 = 12;
	reg_user_B12 = 13;
	reg_user_B13 = 14;
	reg_user_B14 = 15;
	reg_user_B15 = 16;
	reg_fir_start = 1;
	reg_mprj_datal = 0xAB500000;
	int *tmp = qsort();
	reg_mprj_datal = *tmp << 16;
	reg_mprj_datal = *(tmp+1) << 16;
	reg_mprj_datal = *(tmp+2) << 16;
	reg_mprj_datal = *(tmp+3) << 16;
	reg_mprj_datal = *(tmp+4) << 16;
	reg_mprj_datal = *(tmp+5) << 16;
	reg_mprj_datal = *(tmp+6) << 16;
	reg_mprj_datal = *(tmp+7) << 16;
	reg_mprj_datal = *(tmp+8) << 16;
	reg_mprj_datal = *(tmp+9) << 16;
	reg_mprj_datal = 0xAB610000;
}

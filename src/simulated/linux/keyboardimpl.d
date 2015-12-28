module simulated.linux.keyboardimpl;

import simulated.keyboard;

import simulated.linux.xcb;



class KeyboardImpl
{

	/**
	* Cause a keyboard key to be pressed down.
	*
	* The key will stay in a "pressed down" state until it is released.
	*
	* Params:
	* 	key = The key to be pressed down.
	**/
	static void keyPress(Keyboard.Keys key)
	{

		xcb_void_cookie_t test = xcb_test_fake_input(getConnection(), XCB_KEY_PRESS, getKeyCode(key), XCB_CURRENT_TIME, XCB_NONE, 0,0,0);

		//Won't usually need to check the code, but calling this processes the request
		assert(xcb_request_check(getConnection(), test) is null);
	}

	/**
	* Cause a keyboard key to be released into an "up" state.
	*
	* This method does nothing on a key that is already up.
	*
	* Params:
	* 	key = The key to be released.
	**/
	static void keyRelease(Keyboard.Keys key)
	{
		xcb_void_cookie_t test = xcb_test_fake_input(getConnection(), XCB_KEY_RELEASE, getKeyCode(key), XCB_CURRENT_TIME, XCB_NONE, 0,0,0);

		//Won't usually need to check the code, but calling this processes the request
		assert(xcb_request_check(getConnection(), test) is null);
	}


	//get the keycode for a particular key on linux
	private static ubyte getKeyCode(int key)
	{
		static ubyte[int] keyCodes;
		//set up keyCodes on first usage
		if(keyCodes.length == 0)
		{

			//key symbols gotten from X11/keysymdef.h

			//for the time being, we only assume a Latin(US) keyboard

			//A
			keyCodes[0] = xcbGetKeyCode(0x0041);
			//B
			keyCodes[1] = xcbGetKeyCode(0x0042);
			//C
			keyCodes[2] = xcbGetKeyCode(0x0043);
			//D
			keyCodes[3] = xcbGetKeyCode(0x0044);
			//E
			keyCodes[4] = xcbGetKeyCode(0x0045);
			//F
			keyCodes[5] = xcbGetKeyCode(0x0046);
			//G
			keyCodes[6] = xcbGetKeyCode(0x0047);
			//H
			keyCodes[7] = xcbGetKeyCode(0x0048);
			//I
			keyCodes[8] = xcbGetKeyCode(0x0049);
			//J
			keyCodes[9] = xcbGetKeyCode(0x004a);
			//K
			keyCodes[10] = xcbGetKeyCode(0x004b);
			//L
			keyCodes[11] = xcbGetKeyCode(0x004c);
			//M
			keyCodes[12] = xcbGetKeyCode(0x004d);
			//N
			keyCodes[13] = xcbGetKeyCode(0x004e);
			//O
			keyCodes[14] = xcbGetKeyCode(0x004f);
			//P
			keyCodes[15] = xcbGetKeyCode(0x0050);
			//Q
			keyCodes[16] = xcbGetKeyCode(0x0051);
			//R
			keyCodes[17] = xcbGetKeyCode(0x0052);
			//S
			keyCodes[18] = xcbGetKeyCode(0x0053);
			//T
			keyCodes[19] = xcbGetKeyCode(0x0054);
			//U
			keyCodes[20] = xcbGetKeyCode(0x0055);
			//V
			keyCodes[21] = xcbGetKeyCode(0x0056);
			//W
			keyCodes[22] = xcbGetKeyCode(0x0057);
			//X
			keyCodes[23] = xcbGetKeyCode(0x0058);
			//Y
			keyCodes[24] = xcbGetKeyCode(0x0059);
			//Z
			keyCodes[25] = xcbGetKeyCode(0x005a);

			//0
			keyCodes[26] = xcbGetKeyCode(0x0030);
			//1
			keyCodes[27] = xcbGetKeyCode(0x0031);
			//2
			keyCodes[28] = xcbGetKeyCode(0x0032);
			//3
			keyCodes[29] = xcbGetKeyCode(0x0033);
			//4
			keyCodes[30] = xcbGetKeyCode(0x0034);
			//5
			keyCodes[31] = xcbGetKeyCode(0x0035);
			//6
			keyCodes[32] = xcbGetKeyCode(0x0036);
			//7
			keyCodes[33] = xcbGetKeyCode(0x0037);
			//8
			keyCodes[34] = xcbGetKeyCode(0x0038);
			//9
			keyCodes[35] = xcbGetKeyCode(0x0039);

			//Escape
			keyCodes[36] = xcbGetKeyCode(0xff1b);
			//Left Control
			keyCodes[37] = xcbGetKeyCode(0xffe3);
			//Left Shift
			keyCodes[38] = xcbGetKeyCode(0xffe1);
			//Left Alt
			keyCodes[39] = xcbGetKeyCode(0xffe9);
			//Left System
			keyCodes[40] = xcbGetKeyCode(0xffeb);
			//Right Control
			keyCodes[41] = xcbGetKeyCode(0xffe4);
			//Right Shift
			keyCodes[42] = xcbGetKeyCode(0xffe2);
			//Right Alt
			keyCodes[43] = xcbGetKeyCode(0xffea);
			//Right System
			keyCodes[44] = xcbGetKeyCode(0xffec);
			//Menu
			keyCodes[45] = xcbGetKeyCode(0xff67);


			//Left Braket [
			keyCodes[46] = xcbGetKeyCode(0x005b);
			//Right Bracket ]
			keyCodes[47] = xcbGetKeyCode(0x005d);
			//Semicolon ;
			keyCodes[48] = xcbGetKeyCode(0x003b);
			//Comma ,
			keyCodes[49] = xcbGetKeyCode(0x002c);
			//Period .
			keyCodes[50] = xcbGetKeyCode(0x002e);
			//Quote '
			keyCodes[51] = xcbGetKeyCode(0x0027);
			//Forward Slash /
			keyCodes[52] = xcbGetKeyCode(0x002f);
			//Backslash \
			keyCodes[53] = xcbGetKeyCode(0x005c);
			//Tilde ~
			keyCodes[54] = xcbGetKeyCode(0x007e);
			//Equals =
			keyCodes[55] = xcbGetKeyCode(0x003d);
			//Dash -
			keyCodes[56] = xcbGetKeyCode(0x002d);
			//Space
			keyCodes[57] = xcbGetKeyCode(0x0020);
			//Return (or Enter)
			keyCodes[58] = xcbGetKeyCode(0xff0d);
			//Backspace
			keyCodes[59] = xcbGetKeyCode(0xff08);
			//Tab
			keyCodes[60] = xcbGetKeyCode(0xff09);
			//Page up
			keyCodes[61] = xcbGetKeyCode(0xff55);
			//page down
			keyCodes[62] = xcbGetKeyCode(0xff56);
			//End
			keyCodes[63] = xcbGetKeyCode(0xff57);
			//Home
			keyCodes[64] = xcbGetKeyCode(0xff50);
			//Insert
			keyCodes[65] = xcbGetKeyCode(0xff63);
			//Delete
			keyCodes[66] = xcbGetKeyCode(0xffff);


			//Add +
			keyCodes[67] = xcbGetKeyCode(0xffab);
			//Subtract -
			keyCodes[68] = xcbGetKeyCode(0xffad);
			//Multiply *
			keyCodes[69] = xcbGetKeyCode(0xffaa);
			//Divide /
			keyCodes[70] = xcbGetKeyCode(0xffaf);

			//Left
			keyCodes[71] = xcbGetKeyCode(0xff51);
			//Right
			keyCodes[72] = xcbGetKeyCode(0xff53);
			//Up
			keyCodes[73] = xcbGetKeyCode(0xff53);
			//Down
			keyCodes[74] = xcbGetKeyCode(0xff54);

			//Numpad 0
			keyCodes[75] = xcbGetKeyCode(0xffb0);
			//Numpad 1
			keyCodes[76] = xcbGetKeyCode(0xffb1);
			//Numpad 2
			keyCodes[77] = xcbGetKeyCode(0xffb2);
			//Numpad 3
			keyCodes[78] = xcbGetKeyCode(0xffb3);
			//Numpad 4
			keyCodes[79] = xcbGetKeyCode(0xffb4);
			//Numpad 5
			keyCodes[80] = xcbGetKeyCode(0xffb5);
			//Numpad 6
			keyCodes[81] = xcbGetKeyCode(0xffb6);
			//Numpad 7
			keyCodes[82] = xcbGetKeyCode(0xffb7);
			//Numpad 8
			keyCodes[83] = xcbGetKeyCode(0xffb8);
			//Numpad 9
			keyCodes[84] = xcbGetKeyCode(0xffb9);

			//F1
			keyCodes[85] = xcbGetKeyCode(0xffbe);
			//F2
			keyCodes[86] = xcbGetKeyCode(0xffbf);
			//F3
			keyCodes[87] = xcbGetKeyCode(0xffc0);
			//F4
			keyCodes[88] = xcbGetKeyCode(0xffc1);
			//F5
			keyCodes[89] = xcbGetKeyCode(0xffc2);
			//F6
			keyCodes[90] = xcbGetKeyCode(0xffc3);
			//F7
			keyCodes[91] = xcbGetKeyCode(0xffc4);
			//F8
			keyCodes[92] = xcbGetKeyCode(0xffc5);
			//F9
			keyCodes[93] = xcbGetKeyCode(0xffc6);
			//F10
			keyCodes[94] = xcbGetKeyCode(0xffc7);
			//F11
			keyCodes[95] = xcbGetKeyCode(0xffc8);
			//F12
			keyCodes[96] = xcbGetKeyCode(0xffc9);
			//F13
			keyCodes[97] = xcbGetKeyCode(0xffca);
			//F14
			keyCodes[98] = xcbGetKeyCode(0xffcb);
			//F15
			keyCodes[99] = xcbGetKeyCode(0xffcc);

			//Pause
			keyCodes[100] = xcbGetKeyCode(0xff13);



		}

		return keyCodes[key];

	}

}



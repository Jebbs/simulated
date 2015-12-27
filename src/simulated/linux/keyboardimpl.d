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
		xcb_test_fake_input(getConnection(), XCB_KEY_PRESS, getKeyCode(key), XCB_CURRENT_TIME, XCB_NONE, 0,0,0);
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
		xcb_test_fake_input(getConnection(), XCB_KEY_RELEASE, getKeyCode(key), XCB_CURRENT_TIME, XCB_NONE, 0,0,0);
	}


	//get the keycode for a particular key on linux
	private static ubyte getKeyCode(int key)
	{
		static ubyte[int] keyCodes;

		//set up keyCodes on first usage
		if(keyCodes.length == 0)
		{

			//set up keycodes here

		}

		return keyCodes[key];

	}

}



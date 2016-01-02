module simulated.osx.keyboardimpl;

import simulated.keyboard;

import simulated.osx.coregraphics;



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

	}


	//get the keycode for a particular key on linux
	private static ubyte getKeyCode(int key)
	{
		static ubyte[int] keyCodes;
		//set up keyCodes on first usage
		if(keyCodes.length == 0)
		{

		}

		return keyCodes[key];

	}

}



module simulated.keyboard;

version(Windows)
{
	import simulated.windows.keyboardimpl;
}
else version(linux)
{
	import simulated.linux.keyboardimpl;
}
else version(OSX)
{
	import simulated.osx.keyboardimpl;
}
else
{
	static assert("Unsupported system. Sorry :(");
}

class Keyboard
{
	enum Keys:int
	{
		A,
		B,
		C

	}

	/**
	* Cause a keyboard key to be pressed down.
	*
	* The key will stay in a "pressed down" state until it is released.
	*
	* Params:
	* 	key = The key to be pressed down.
	**/
	static void keyPress(Keys key)
	{
		KeyboardImpl.keyPress(key);
	}

	/**
	* Cause a keyboard key to be released into an "up" state.
	*
	* This method does nothing on a key that is already up.
	*
	* Params:
	* 	key = The key to be released.
	**/
	static void keyRelease(Keys key)
	{
		KeyboardImpl.keyRelease(key);
	}

	/**
	* Cause a keyboard key to be typed.
	*
	* This method is analogous to pressing and releasing a key qucikly.
	*
	* Params:
	* 	key = The key to be typed.
	**/
	static void keyType(Keys key)
	{
		import core.thread, core.time;

		keyPress(key);
		Thread.sleep(dur!("msecs")(15));
		keyRelease(key);
	} 
}
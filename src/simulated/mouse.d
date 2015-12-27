module simulated.mouse;

version(Windows)
{
	import simulated.windows.mouseimpl;
}
else version(linux)
{
	import simulated.linux.mouseimpl;
	pragma(msg, "using the linux thing!");
}
else version(OSX)
{
	import simulated.osx.mouseimpl;
}
else
{
	static assert("Unsupported system. Sorry :(");
}

final abstract class Mouse
{
	enum Buttons:int
	{
		Left = 0,
		Right,
		Middle
	}

	/**
	* Move the mouse to a specific location
	*
	* Params:
	* 	x =	x-pos of the screen.
	*	y = y-pos of the screen.
	**/
	static void moveTo(short x, short y)
	{
		MouseImpl.moveTo(x,y);
	}

	/**
	* Move the mouse to a location relative to the current mouse position.
	*
	* Params:
	* 	x =	x-pos of the screen, relative to current x-pos.
	*	y = y-pos of the screen, relative to current y-pos.
	**/
	static void moveToRelative(short x, short y)
	{
		MouseImpl.moveToRelative(x,y);
	}

	/**
	* Cause a mouse button to be pressed down.
	*
	* The button will stay in a "pressed down" state until it is released.
	*
	* Params:
	* 	button = The button to be pressed down.
	**/
	static void buttonPress(Buttons button)
	{
		MouseImpl.buttonPress(button);
	}

	/**
	* Cause a mouse button to be released into an "up" state.
	*
	* This method does nothing on a button that is already up.
	*
	* Params:
	* 	button = The button to be released.
	**/
	static void buttonRelease(Buttons button)
	{
		MouseImpl.buttonRelease(button);
	}

	/**
	* Cause a mouse button to be clicked.
	*
	* This method is analogous to pressing and releasing a button qucikly.
	*
	* Params:
	* 	button = The button to be clicked.
	**/
	static void buttonClick(Buttons button)
	{
		import core.thread, core.time;

		buttonPress(button);
		Thread.sleep(dur!("msecs")(30));
		buttonRelease(button);

	}

}
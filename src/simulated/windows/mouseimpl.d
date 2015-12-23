module simulated.windows.mouseimpl;

import simulated.mouse;

final abstract class MouseImpl
{

	//TODO:Put things here!

	/**
	* Move the mouse to a specific location
	*
	* Params:
	* 	x =	x-pos of the screen.
	*	y = y-pos of the screen.
	**/
	static void moveTo(uint x, uint y)
	{

	}

	/**
	* Move the mouse to a location relative to the current mouse position.
	*
	* Params:
	* 	x =	x-pos of the screen, relative to current x-pos.
	*	y = y-pos of the screen, relative to current y-pos.
	**/
	static void moveToRelative(uint x uint y)
	{

	}

	/**
	* Cause a mouse button to be pressed down.
	*
	* The button will stay in a "pressed down" state until it is released.
	*
	* Params:
	* 	button = The button to be pressed down.
	**/
	static void buttonPress(Mouse.Buttons button)
	{

	}

	/**
	* Cause a mouse button to be released into an "up" state.
	*
	* This method does nothing on a button that is already up.
	*
	* Params:
	* 	button = The button to be released.
	**/
	static void buttonRelease(Mouse.Buttons button)
	{

	}

}
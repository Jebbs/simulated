module simulated.linux.mouseimpl;

import simulated.mouse;
import simulated.linux.xcb;

final abstract class MouseImpl
{


	//start at (0,0) and store coordinates. It just makes things easier for the time being.
	static short xpos,ypos;
	
	/**
	* Move the mouse to a specific location
	*
	* Params:
	* 	x =	x-pos of the screen.
	*	y = y-pos of the screen.
	**/
	static void moveTo(short x, short y)
	{
		import std.stdio;

		writeln("attempting to move to ", x, ",", y);

		xpos = x;
		ypos = y;

		xcb_void_cookie_t test = xcb_test_fake_input(getConnection(), XCB_MOTION_NOTIFY, 0, XCB_CURRENT_TIME, XCB_NONE, x, y, 0);

		//Won't usually need to check the code, but calling this processes the request
		assert(xcb_request_check(getConnection(), test) is null);

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
		
		moveTo(cast(short)(x + xpos), cast(short)(y + ypos));
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

		xcb_void_cookie_t test = xcb_test_fake_input_checked(getConnection(), XCB_BUTTON_PRESS, getButtonCode(button), XCB_CURRENT_TIME, XCB_NONE, 0,0,0);

		//Won't usually need to check the code, but calling this processes the request
		assert(xcb_request_check(getConnection(), test) is null);
		
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

		xcb_void_cookie_t test = xcb_test_fake_input_checked(getConnection(), XCB_BUTTON_RELEASE, getButtonCode(button), XCB_CURRENT_TIME, XCB_NONE, 0,0,0);

		//Won't usually need to check the code, but calling this processes the request
		assert(xcb_request_check(getConnection(), test) is null);
	}

	//get the buttoncode for a particular button on linux
	private static ubyte getButtonCode(int button)
	{
		static ubyte[int] buttonCodes;

		//set up buttonCodes on first usage
		if(buttonCodes.length == 0)
		{

			//set up buttonCodes here

			//left mouse button
			buttonCodes[0] = 1;
			//right mouse button
			buttonCodes[1] = 3;
			//middle mouse button
			buttonCodes[2] = 2;

		}

		return buttonCodes[button];

	}

}
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
		///The A key
		A = 0,
		///The B key
		B,
		///The C key
		C,
		///The D key
		D,
		///The E key
		E,
		///The F key
		F,
		///The G key
		G,
		///The H key
		H,
		///The I key
		I,
		///The J key
		J,
		///The K key
		K,
		///The L key
		L,
		///The M key
		M,
		///The N key
		N,
		///The O key
		O,
		///The P key
		P,
		///The Q key
		Q,
		///The R key
		R,
		///The S key
		S,
		///The T key
		T,
		///The U key
		U,
		///The V key
		V,
		///The W key
		W,
		///The X key
		X,
		///The Y key
		Y,
		///The Z key
		Z,
		///The 0 key
		Num0,
		///The 1 key
		Num1,
		///The 2 key
		Num2,
		///The 3 key
		Num3,
		///The 4 key
		Num4,
		///The 5 key
		Num5,
		///The 6 key
		Num6,
		///The 7 key
		Num7,
		///The 8 key
		Num8,
		///The 9 key
		Num9,
		///The Escape key
		Escape,
		///The left Control key
		LControl,
		///The left Shift key
		LShift,
		///The left Alt key
		LAlt,
		///The left OS specific key: window (Windows and Linux), apple (MacOS X), ...
		LSystem,
		///The right Control key
		RControl,
		///The right Shift key
		RShift,
		///The right Alt key
		RAlt,
		///The right OS specific key: window (Windows and Linux), apple (MacOS X), ...
		RSystem,
		///The Menu key
		Menu,
		///The [ key
		LBracket,
		///The ] key
		RBracket,
		///The ; key
		SemiColon,
		///The , key
		Comma,
		///The . key
		Period,
		///The ' key
		Quote,
		///The / key
		Slash,
		///The \ key
		BackSlash,
		///The ~ key
		Tilde,
		///The = key
		Equal,
		///The - key
		Dash,
		///The Space key
		Space,
		///The Return key
		Return,
		///The Backspace key
		BackSpace,
		///The Tabulation key
		Tab,
		///The Page up key
		PageUp,
		///The Page down key
		PageDown,
		///The End key
		End,
		///The Home key
		Home,
		///The Insert key
		Insert,
		///The Delete key
		Delete,
		///The + key
		Add,
		///The - key
		Subtract,
		///The * key
		Multiply,
		///The / key
		Divide,
		///Left arrow
		Left,
		///Right arrow
		Right,
		///Up arrow
		Up,
		///Down arrow
		Down,
		///The numpad 0 key
		Numpad0,
		///The numpad 1 key
		Numpad1,
		///The numpad 2 key
		Numpad2,
		///The numpad 3 key
		Numpad3,
		///The numpad 4 key
		Numpad4,
		///The numpad 5 key
		Numpad5,
		///The numpad 6 key
		Numpad6,
		///The numpad 7 key
		Numpad7,
		///The numpad 8 key
		Numpad8,
		///The numpad 9 key
		Numpad9,
		///The F1 key
		F1,
		///The F2 key
		F2,
		///The F3 key
		F3,
		///The F4 key
		F4,
		///The F5 key
		F5,
		///The F6 key
		F6,
		///The F7 key
		F7,
		///The F8 key
		F8,
		///The F9 key
		F9,
		///The F10 key
		F10,
		///The F11 key
		F11,
		///The F12 key
		F12,
		///The F13 key
		F13,
		///The F14 key
		F14,
		///The F15 key
		F15,
		///The Pause key
		Pause,

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
		//Thread.sleep(dur!("msecs")(15));
		keyRelease(key);
	} 
}
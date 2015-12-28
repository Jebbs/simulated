# simulated
A keyboard and mouse input simulator.


What works:

Both Mouse and Keyboard simulation work on Linux.

The library uses xcb instead of X11 and depends on libxcb, libxcb-keysyms, and libxcb-xtest.

Here's what the api looks like:

```d
	
	//Moving the mouse
	Mouse.moveTo(200,100);

	//Move the mouse relative to its current position
	Mouse.moveToRelative(-100, 50);

	//Press (and hold down) a mouse button
	Mouse.buttonPress(Mouse.Buttons.Left);

	//Release (if currently down) a mouse mutton
	Mouse.buttonRelease(Mouse.Buttons.Left);

	//Click a button (down and release in succession)
	Mouse.buttonClick(Mouse.Buttons.Right);


	//Press (and hold down) a keyboard key
	Keyboard.keyPress(Keyboard.Keys.A);

	//Release (if currently down) a keyboard key
	Keyboard.keyRelease(Keyboard.Keys.A);

	//Type a key (down and release in succession)
	Keyboard.keyType(Keyboard.Keys.A);

	//And of course you can combine them for things like alt+tab

	Keyboard.keyPress(Keyboard.Keys.LAlt);
	Keyboard.keyPress(Keyboard.Keys.Tab);
	Keyboard.keyRelease(Keyboard.Keys.Tab);
	Keyboard.keyRelease(Keyboard.Keys.LAlt);

```
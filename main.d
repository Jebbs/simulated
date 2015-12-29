module main;

import simulated;

import core.thread, core.time;

import std.stdio;


void main()
{


	Mouse.moveTo(100,200);

	Mouse.buttonClick(Mouse.Buttons.Left);


	Keyboard.keyPress(Keyboard.Keys.LShift);
	Keyboard.keyType(Keyboard.Keys.A);
	Keyboard.keyRelease(Keyboard.Keys.LShift);
	Keyboard.keyType(Keyboard.Keys.B);	


}






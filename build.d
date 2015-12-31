module build;



version(DigitalMars)
{
	bool isDMD = true;
	bool isGDC = false;
	bool isLDC = false;
	string compiler = "dmd ";
}
else version(GNU)
{
	bool isDMD = false;
	bool isGDC = true;
	bool isLDC = false;
	string compiler = "gdc ";
}
else version(LDC)
{
	bool isDMD = false;
	bool isGDC = false;
	bool isLDC = true;
	string compiler = "ldc2 ";
}
else
{
	static assert(false, "Unknown or unsupported compiler.");
}



version(Windows)
{
	bool isWindows = true;
	bool isLinux = false;
	bool isMac = false;
}
else version(linux)
{
	bool isWindows = false;
	bool isLinux = true;
	bool isMac = false;
}
else version(OSX)
{
	bool isWindows = false;
	bool isLinux = false;
	bool isMac = true;
}
else
{
	static assert(false, "DSFML is only supported on OSX, Windows, and Linux.");
}


string coreFiles = "main.d -Isrc/ src/simulated/package.d src/simulated/mouse.d src/simulated/keyboard.d";
string implementationFiles;
string dependencies;

void initialize()
{
	if(isDMD)
	{
		initializeDMD();
	}
	else if(isGDC)
	{
		initializeGDC();
	}
	else
	{
		initializeLDC();
	}
}

void initializeDMD()
{
	if(isWindows)
	{
		
	}
	else if(isLinux)
	{
		implementationFiles = "src/simulated/linux/mouseimpl.d src/simulated/linux/keyboardimpl.d src/simulated/linux/xcb.d ";
		dependencies = "-L-lxcb -L-lxcb-xtest -L-lxcb-keysyms";
	}
	else
	{
		implementationFiles = "src/simulated/osx/mouseimpl.d src/simulated/osx/keyboardimpl.d src/simulated/osx/coregraphics.d ";
		dependencies = "";
	}
}

void initializeGDC()
{
	if(isWindows)
	{
		
	}
	else if(isLinux)
	{
		implementationFiles = "src/simulated/linux/mouseimpl.d src/simulated/linux/keyboardimpl.d src/simulated/linux/xcb.d ";
		dependencies = "-lxcb -lxcb-xtest -lxcb-keysyms";
	}
	else
	{
		//GDC is unsupported on OSX :(
	}
}

void initializeLDC()
{
	//The stuff for windows probbly needs to be fixed
	if(isWindows)
	{
		
	}
	else if(isLinux)
	{
		implementationFiles = "src/simulated/linux/mouseimpl.d src/simulated/linux/keyboardimpl.d src/simulated/linux/xcb.d ";
		dependencies = "-L=-lxcb -L=-lxcb-xtest -L=-lxcb-keysyms";
	}
	else
	{
		implementationFiles = "src/simulated/osx/mouseimpl.d src/simulated/osx/keyboardimpl.d src/simulated/osx/coregraphics.d ";
		dependencies = "";
	}
}
	



int main()
{
	import std.process;
	import std.stdio;

	string buildCommand = compiler ~ coreFiles ~ implementationFiles ~ dependencies;

	writeln(buildCommand);

	auto status = executeShell(buildCommand);

	if(status.status !=0)
	{
		writeln(status.output);
		return -1;
	}
	return 0;

}

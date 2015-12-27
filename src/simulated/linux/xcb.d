module simulated.linux.xcb;

//module with some bindings to the xcb stuff



//Get the xcb connection
xcb_connection_t* getConnection()
{
	static XcbConnection c;

	if(c is null)
	{
		c = new XcbConnection();
		c.connect();
	}

	return c.xcbPointer;
}

//Wrapper around
class XcbConnection
{
	xcb_connection_t* xcbPointer;


	//connect to xcb with default everything.
	void connect()
	{
		import std.stdio;
		xcbPointer = xcb_connect(null, null);
		if(xcb_connection_has_error(xcbPointer) == 0)
		{
			writeln("No problems!");
		}
		else
		{
			writeln("Connection issues!");
		}
	}


	~this()
	{
		if(xcbPointer !is null)
		{
			import std.stdio;
			writeln("Destroying the connection.");
			xcb_disconnect(xcbPointer);
		}
	}
}




extern(C):

enum XCB_NONE = 0;
enum XCB_CURRENT_TIME = 0;
enum XCB_KEY_PRESS = 2;
enum XCB_KEY_RELEASE = 3;
enum XCB_BUTTON_PRESS = 4;
enum XCB_BUTTON_RELEASE = 5;
enum XCB_MOTION_NOTIFY = 6;


struct xcb_connection_t;

xcb_connection_t* xcb_connect(const(char)* displayname, int* screenp);
int xcb_connection_has_error(xcb_connection_t* c);

void xcb_disconnect(xcb_connection_t* c);

alias xcb_window_t = uint;

struct xcb_void_cookie_t
{
	uint sequence;
}

xcb_void_cookie_t xcb_test_fake_input(xcb_connection_t* c, ubyte type, ubyte detail, uint time, xcb_window_t root, short rootX, short rootY, ubyte deciveid);
xcb_void_cookie_t xcb_test_fake_input_checked(xcb_connection_t* c, ubyte type, ubyte detail, uint time, xcb_window_t root, short rootX, short rootY, ubyte deciveid);

struct xcb_generic_error_t;

xcb_generic_error_t* xcb_request_check(xcb_connection_t* c, xcb_void_cookie_t cookie);









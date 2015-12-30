module simulated.linux.xcb;

//module with some bindings to the xcb stuff


//helper things

package:

//Get the xcb connection
xcb_connection_t* getConnection()
{
	static XcbConnection c;

	if(c is null)
	{
		c = new XcbConnection();
	}

	return c.xcbPointer;
}

xcb_key_symbols_t* getSymbols()
{
	static XcbKeySymbols s;

	if(s is null)
	{
		s = new XcbKeySymbols();
	}

	return s.xcbPointer;
}

//Wrapper around
class XcbConnection
{
	xcb_connection_t* xcbPointer;

	this()
	{
		xcbPointer = xcb_connect(null, null);

		int err = xcb_connection_has_error(xcbPointer);

		if(err!=0)
		{
			string errorMessage;
			final switch(err)
			{

			    case XCB_CONN_ERROR:
			    	{
			    		errorMessage = "Socket errors, pipe errors or other stream errors.";
			    		break;
			    	}
			    	case XCB_CONN_CLOSED_EXT_NOTSUPPORTED:
			    	{
			    		errorMessage = "Extension not supported.";
			    		break;
			    	}
			    	case XCB_CONN_CLOSED_MEM_INSUFFICIENT:
			    	{
			    		errorMessage = "Memory not available.";
			    		break;
			    	}
			    	case XCB_CONN_CLOSED_REQ_LEN_EXCEED:
			    	{
			    		errorMessage = "Exceeding request length that server accepts.";
			    		break;
			    	}
			    	case XCB_CONN_CLOSED_PARSE_ERR:
			    	{
			    		errorMessage = "Error during parsing display string.";
			    		break;
			    	}
			    	case XCB_CONN_CLOSED_INVALID_SCREEN:
			    	{
			    		errorMessage = "Server does not have a screen matching the display.";
			    		break;
			    	}
			} 


    	assert(0, "xcb Connection failed: " ~ );
		}
		
	}
	
	~this()
	{
		if(xcbPointer !is null)
		{
			xcb_disconnect(xcbPointer);
		}
	}
}

class XcbKeySymbols
{
	xcb_key_symbols_t* xcbPointer;

	this()
	{
		xcbPointer = xcb_key_symbols_alloc(getConnection());
	}

	~this()
	{
		xcb_key_symbols_free(xcbPointer);
	}
}

ubyte xcbGetKeyCode(uint keySymbol)
{
	import core.stdc.stdlib:free;

	xcb_keycode_t* codes = xcb_key_symbols_get_keycode(getSymbols(),keySymbol);


	//some codes only exist if they are on your actual keyboard layout
	if(codes is null)
	{
		return 0;
	}

	//xcb demo uses only first key code if multiple codes are returned.
	ubyte ret = codes[0];


	//returned codes need to be free'd before exiting scope
	free(codes);

	return ret;
}


//binding
extern(C):
enum XCB_NO_SYMBOL = 0;
enum XCB_NONE = 0;
enum XCB_CURRENT_TIME = 0;
enum XCB_KEY_PRESS = 2;
enum XCB_KEY_RELEASE = 3;
enum XCB_BUTTON_PRESS = 4;
enum XCB_BUTTON_RELEASE = 5;
enum XCB_MOTION_NOTIFY = 6;

//connection errors
enum XCB_CONN_ERROR = 1;
enum XCB_CONN_CLOSED_EXT_NOTSUPPORTED = 2;
enum XCB_CONN_CLOSED_MEM_INSUFFICIENT = 3;
enum XCB_CONN_CLOSED_REQ_LEN_EXCEED = 4;
enum XCB_CONN_CLOSED_PARSE_ERR = 5;
enum XCB_CONN_CLOSED_INVALID_SCREEN = 6;

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

alias xcb_keycode_t = ubyte;
alias xcb_keysym_t = uint;
struct xcb_key_symbols_t;

xcb_key_symbols_t *xcb_key_symbols_alloc(xcb_connection_t* c);

void xcb_key_symbols_free(xcb_key_symbols_t* syms);

xcb_keycode_t * xcb_key_symbols_get_keycode(xcb_key_symbols_t* syms, xcb_keysym_t keysym);









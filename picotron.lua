---@meta
--------------------------------
--- Staging Area
--------------------------------


--------------------------------
--- Program Stucture
--------------------------------

---called once just before the main loop
function _init() end

---called 60 times per second
function _update() end

---called each time the window manager asks for a frame
---normally 60, 30 or 20 times per second
function _draw() end

--------------------------------
--- 9 API Reference
--------------------------------

----- 9.1 Graphics -----

---sets the clipping rectangle in pixels. all drawing operations will be clipped to the rectangle at x, y with a width and height of w,h.
---
---clip() to reset.
---
---when clip_previous is true, clip the new clipping region by the old one.
---@param  x number
---@param y number
---@param w number
---@param h number
---@param clip_previous boolean?
function clip(x, y, w, h, clip_previous) end

---sets the pixel at x, y to colour index col (0..63).
---
---when col is not specified, the current draw colour is used.
---@param x number
---@param y number
---@param col number?
function pset(x, y, col) end

---returns the colour of a pixel on the screen at (x, y).
---
---when x and y are out of bounds, pget returns 0.
---@param x number
---@param y number
---@return number
function pget(x, y) end

---set the colour of a sprite sheet pixel
---
---when col is not specified, the current draw colour is used.
---@param x number
---@param y number
---@param col number?
function sset(x, y, col) end

---get the colour of a sprite sheet pixel
---
---when x and y are out of bounds, sget returns 0.
---@param x number
---@param y number
---@return number
function sget(x, y) end

---set the value (val) of sprite n's flag f.
---
---the initial state of flags 0..7 are settable in the sprite editor, so can be used to create    custom sprite attributes. it is also possible to draw only a subset of map tiles by providing a mask in @map().
---
---when f is omitted, all flags are retrieved/set as a single bitfield.
---```
---fset(2, 1 | 2 | 8) -- sets bits 0,1 and 3
---fset(2, 4, true)   -- sets bit 4
---print(fget(2))     -- 27 (1 | 2 | 8 | 16)
---```
---@param n number
---@param f number? -- flag index 0..7
---@param val boolean
function fset(n, f, val) end

---get the value of sprite n's flag f.
---@param n number
---@param f number? -- flag index 0..7
function fget(n, f) end

---print a string str and optionally set the draw colour to col.
---
---shortcut: written on a single line, ? can be used to call print without brackets:
---```
---?"hi"
---```
---@param str string
---@param x number
---@param y number
---@param col number?
---@return number
function print(str, x, y, col) end

---print a string str and optionally set the draw colour to col.
---
---shortcut: written on a single line, ? can be used to call print without brackets:
---```
---?"hi"
---```
---when x, y are not specified, a newline is automatically appended, printing text below 122 causes the console to scroll. this can be disabled during runtime with poke(0x5f36,0x40).
---
---print returns the right-most x position that occurred while printing. this can be used to find out the width of some text by printing it off-screen.
---@param str string
---@param col number?
---@return number
function print(str, col) end

---set the cursor position.
---
---if col is specified, also set the current colour.
---@param x number
---@param y number
---@param col number?
function cursor(x, y, col) end

---set the current colour to be used by shape drawing functions (pset, circ, rect..), when one is not given as the last argument.
---
---if col is not specified, the current colour is set to 6.
---@param col number?
function color(col) end

---clear the screen and reset the clipping rectangle.
---
---col defaults to 0 (black)
---@param col number?
function cls(col) end

---set a screen offset of -x, -y for all drawing operations
---
---camera() to reset
---@param x number?
---@param y number?
function camara(x, y) end

---draw a circle at x,y with radius r
---
---if r is negative, the circle is not drawn.
---
---When bit 0x800000000 in col is set, circfill draws inverted (everything outside the circle is drawn).
---@param x number
---@param y number
---@param r number
---@param col number?
function circ(x, y, r, col) end

---draw a filled circle at x,y with radius r
---
---if r is negative, the circle is not drawn.
---
---When bit 0x800000000 in col is set, circfill draws inverted (everything outside the circle is drawn).
---@param x number
---@param y number
---@param r number
---@param col number?
function circfill(x, y, r, col) end

---draw an oval that is symmetrical in x and y (an ellipse), with the given bounding rectangle.
---
---When bit 0x800000000 in col is set, ovalfill is drawn inverted.
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function oval(x0, y0, x1, y1, col) end

---draw an filled oval that is symmetrical in x and y (an ellipse), with the given bounding rectangle.
---
---When bit 0x800000000 in col is set, ovalfill is drawn inverted.
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function ovalfill(x0, y0, x1, y1, col) end

---draw a line from (x0, y0) to (x1, y1)
---
---if (x1, y1) are not given, the end of the last drawn line is used.
---
---line() with no parameters means that the next call to line(x1, y1) will only set the end points without drawing.
---@param x0 number
---@param y0 number
---@param x1 number?
---@param y1 number?
---@param col number?
function line(x0, y0, x1, y1, col) end

---draw a rectangle or filled rectangle with corners at (x0, y0), (x1, y1).
---
---When bit 0x800000000 in col is set, rectfill draws inverted.
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function rect(x0, y0, x1, y1, col) end

---draw a filled rectangle or filled rectangle with corners at (x0, y0), (x1, y1).
---
---When bit 0x800000000 in col is set, rectfill draws inverted.
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param col number?
function rectfill(x0, y0, x1, y1, col) end

---pal() swaps colour c0 for c1 for one of three palette re-mappings (p defaults to 0):
---
---0: draw palette
---
---The draw palette re-maps colours when they are drawn. For example, an orange flower sprite can be drawn as a red flower by setting the 9th palette value to 8:
---```
---pal(9,8)     -- draw subsequent orange (colour 9) pixels as red (colour 8)
---spr(1,70,60) -- any orange pixels in the sprite will be drawn with red instead
---```
---Changing the draw palette does not affect anything that was already drawn to the screen.
---
---1: display palette
---
---The display palette re-maps the whole screen when it is displayed at the end of a frame.
---@param c0 number
---@param c1 number
---@param p number?
function pal(c0, c1, p) end

---Set transparency for colour index c to is_transparent (boolean) transparency is observed by spr(), sspr(), map() and tline3d()
---```
---palt(8, true) -- red pixels not drawn in subsequent sprite/tline draw calls
---```
---When c is the only parameter, it is treated as a bitfield used to set all 64 values. for example: to set colours 0 and 1 as transparent:
---```
---palt(0x13) -- set colours 0,1 and 4 as transparent
---```
---palt() resets to default: all colours opaque except colour 0. Same as palt(1)
---@param c number
---@param is_transparent boolean
function palt(c, is_transparent) end

---Draw sprite s at position x,y
---
---s can be either a userdata (type "u8" -- see Userdata) or sprite index (0..255 for bank 0 (gfx/0.gfx), 256..511 for bank 1 (gfx/1.gfx) etc).
---
---Colour 0 drawn as transparent by default (see palt())
---
---When flip_x is true, flip horizontally. When flip_y is true, flip vertically.
---@param s number
---@param x number
---@param y number
---@param flip_x number?
---@param flip_y number?
function spr(s, x, y, flip_x, flip_y) end

---Stretch a source rectangle of sprite s (sx, sy, sw, sh) to a destination rectangle on the screen (dx, dy, dw, dh). In both cases, the x and y values are coordinates (in pixels) of the rectangle's top left corner, with a width of w, h.
---
---s can be either a userdata (type "u8") or the sprite index.
---
---Colour 0 drawn as transparent by default (see palt())
---
---dw, dh defaults to sw, sh.
---
---When flip_x is true, flip horizontally. When flip_y is true, flip vertically.
---@param s number
---@param sx number
---@param sy number
---@param sw number
---@param sh number
---@param dx number
---@param dy number
---@param dw number?
---@param dh number?
---@param flip_x number?
---@param flip_y number?
function sspr(s, sx, sy, sw, sh, dx, dy, dw, dh, flip_x, flip_y) end

---Get the sprite (a 2d userdata object of type "u8") for a given index (0..16383).
---
---When a cartridge is run, files in gfx/ that start with an integer (0..63) are automatically loaded if they exist. Each file has 256 sprites indexes, so the sprites in gfx/0.gfx are given indexes 0..255, the sprites in gfx/1.gfx are given indexes 256..511, and so on up to gfx/63.gfx (16128..16383).
---@param index number
---@return userdata
function get_spr(index) end

---Set the sprite (a 2d userdata object of type "u8") for a given index (0..16383).
---
---When a cartridge is run, files in gfx/ that start with an integer (0..63) are automatically loaded if they exist. Each file has 256 sprites indexes, so the sprites in gfx/0.gfx are given indexes 0..255, the sprites in gfx/1.gfx are given indexes 256..511, and so on up to gfx/63.gfx (16128..16383).
---@param index number
---@param userdata userdata
function set_spr(index, userdata) end

---Set a 4x4 fill pattern using PICO-8 style fill patterns. p is a bitfield in reading order starting from the highest bit.
---
---Observed by circ() circfill() rect() rectfill() oval() ovalfill() pset() line()
---
---Fill patterns in Picotron are 64-bit specified 8 bytes from 0x5500, where each byte is a row (top to bottom) and the low bit is on the left. To define an 8x8 with high bits on the right (so that binary numbers visually match), fillp can be called with 8 arguments:
---```
---fillp(
---  0b10000000,
---  0b01011110,
---  0b00101110,
---  0b00010110,
---  0b00001010,
---  0b00000100,
---  0b00000010,
---  0b00000001
---)
---circfill(240, 135, 50, 9)
---```
---Two different colours can be specified in the last parameter
---```
---circfill(320,135,50,0x1c08) -- draw with colour 28 (0x1c) and 8
---```
---To get transparency while drawing shapes, the shape target mask (see Masks) should be set:
---```
---poke(0x550b,0x3f)
---palt()
-----> black pixels won't be drawn
---```
---@param p any
function fillp(p) end

----- 9.2 Map -----

---Draw section of a map (starting from tile_x, tile_y) at screen position sx, sy (pixels), from the userdata src, or from the current working map when src is not given. Note that the src parameter can be omitted entirely to give a PICO-8 compatible form.
---@param src userdata?
---@param tile_x number
---@param tile_y number
---@param sx number?
---@param sy number?
---@param tiles_x number?
---@param tiles_y number?
---@param p8layers bitfield?
---@param tile_w number?
---@param tile_h number?
function map(src, tile_x, tile_y, sx, sy, tiles_x, tiles_y, p8layers, tile_w, tile_h) end

---PICO-8 style getters & setters that operate on the current working map. These are equivalent to using the userdata methods :get and :set directly:
---```
---mymap = userdata("i16", 32,32)
---mymap:set(1,3,42)
---?mymap:get(1,3) -- 42
---
---memmap(mymap, 0x100000)
---?mget(1,3) -- 42
---```
---@param x number
---@param y number
function mget(x, y) end

---PICO-8 style getters & setters that operate on the current working map. These are equivalent to using the userdata methods :get and :set directly:
---```
---mymap = userdata("i16", 32,32)
---mymap:set(1,3,42)
---?mymap:get(1,3) -- 42
---
---memmap(mymap, 0x100000)
---?mget(1,3) -- 42
---```
---@param x number
---@param y number
---@param val userdata
function mset(x, y, val) end

---Draw a textured line from (x0,y0) to (x1,y1), sampling colour values from userdata src. When src is type u8, it is considered to be a single texture image, and the coordinates are in pixels. When src is type i16 it is considered to be a map, and coordinates are in tiles. When the (src) is not given, the current map is used.
---@param src_ud userdata?
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param u0 number
---@param v0 number
---@param u1 number
---@param v1 number
---@param w0 number
---@param w1 number
---@param flags number?
function tline3d(src_ud, x0, y0, x1, y1, u0, v0, u1, v1, w0, w1, flags) end

----- 9.3 Audio -----

---Play sfx n (0..63) on channel (0..15) from note offset (0..63 in notes) for length notes.
---
---Giving -1 as the sfx index stops playing any sfx on that channel. The existing channel state is not altered: stopping an sfx that uses an instrument with a long echo will not cut the echo short.
---
---Giving -2 as the sfx index stops playing any sfx on that channel, and also clears the channel state state: echos are cut short and the channel is immediately silent.
---
---Giving nil or -1 as the channel automatically chooses a channel that is not being used.
---
---Negative offsets can be used to delay before playing.
---
---When the sfx is looping, length still means the number of (posisbly repeated) notes to play.
---@param n number -- 0~63
---@param channel number? -- 0~15
---@param offset number? -- 0~63
---@param length number?
function sfx(n, channel, offset, length) end

---Play music starting from pattern n.
---n -1 to stop music
---
---fade_len is in ms (default: 0). so to fade pattern 0 in over 1 second:
---```
---music(0, 1000)
---```
---channel_mask is bitfield that specifies which channels to reserve for music only, low bits first.
---
---For example, to play only on the first three channels 0..2, the lowest three bits should be set:
---```
---music(0, nil, 0x7) -- bits: 0x1 | 0x2 | 0x4
---```
---Reserved channels can still be used to play sound effects on, but only when that channel index is explicitly requested by sfx().
---@param n number
---@param fade_len number?
---@param channel_mask bitfield?
function music(n, fade_len, channel_mask) end

---This provides low level control over the state of a channel. It is useful in more niche situations, like audio authoring tools and size-coding.
---
---Internally this is what is used to play each row of a sfx when one is active. Use 0xff to indicate an attribute should not be altered.
---To kill all channels (including leftover echo and decay envelopes):
---```
---note() -- same as sfx(-2, -1)
---```
---@param pitch number -- channel pitch (default 48 -- middle C)
---@param inst number -- instrument index (default 0)
---@param vol number -- channel volume (default 64)
---@param effect number -- channel effect (default 0)
---@param effect_p number  -- effect parameter (default 0)
---@param channel number -- channel index (0..15 -- default 0)
---@param retrig number -- (boolean) force retrigger -- default to false
---@param panning number -- set channel panning (-128..127)
function note(pitch, inst, vol, effect, effect_p, channel, retrig, panning) end

----- 9.4 Input -----

--Returns the state of button b for player index pl
---```
---0 1 2 3     LEFT RIGHT UP DOWN
---4 5         Buttons: O X
---6           MENU
---7           reserved
---8 9 10 11   Secondary Stick L,R,U,D
---12 13       Buttons (not named yet!)
---14 15       SL SR
---```
---@param b number? -- 0~15
---@param pl number? -- default 0 -- means Player 1
---@return boolean|number
function btn(b, pl) end

---btnp is short for "Button Pressed"; Instead of being true when a button is held down, btnp returns true when a button is down and it was not down the last frame. It also repeats after 30 frames, returning true every 8 frames after that. This can be used for things like menu navigation or grid-wise player movement.
---
---The state that btnp() reads is reset at the start of each call to _update60, so it is preferable to use btnp only from inside that call and not from _draw(), which might be called less frequently.
---
---Custom delays (in frames 60fps) can be set by poking the following memory addresses:
---```
---poke(0x5f5c, delay) -- set the initial delay before repeating. 255 means never repeat.
---poke(0x5f5d, delay) -- set the repeating delay.
---```
---In both cases, 0 can be used for the default behaviour (delays 30 and 8)
---@param b number -- 0~15
---@param pl number -- default 0 -- means Player 1
function btnp(b, pl) end

---returns the state of key k
---
---To get the raw layout, use true as the second parameter to indicate that k should be the name of the raw scancode.
---@param k string
---@param raw boolean?
function key(k, raw) end

---keyp() has the same behaviour key(), but true when the key is pressed or repeating.
---
---To get the raw layout, use true as the second parameter to indicate that k should be the name of the raw scancode.
---@param k number
---@param raw boolean?
function keyp(k, raw) end

---To read text from the keyboard via the host operating system's text entry system, peektext() can be used to find out if there is some text waiting, and readtext() can be used to consume the next piece of text:
---```
---while (peektext())
---  c = readtext()
---  printh("read text: "..c)
---end
---```
---@return string
function peektext() end

---To read text from the keyboard via the host operating system's text entry system, peektext() can be used to find out if there is some text waiting, and readtext() can be used to consume the next piece of text:
---```
---while (peektext())
---  c = readtext()
---  printh("read text: "..c)
---end
---```
---When "clear" is true, any remaining text in the queue is discarded.
---@param clear boolean?
---@return string
function readtext(clear) end

---mouse_b is a bitfield: 0x1 means left mouse button, 0x2 right mouse button
---@return number mouse_x, number mouse_y, bitfield mouse_b, number wheel_x, number wheel_y
function mouse() end

---@param lock boolean -- --when lock is true, Picotron makes a request to the host operating system's window manager to capture the mouse, allowing it to control sensitivity and movement speed.
---@param event_sensitivity number -- 0~4, determines how fast dx, dy change (1.0 means once per picotron pixel)
---@param move_sensitivity number -- 0~4, 1.0 means the cursor continues to move at the same speed.
---@return number dx,number dy -- the relative position since the last frame
function mouselock(lock, event_sensitivity, move_sensitivity) end

----- 9.5 Strings -----

---Convert one or more ordinal character codes to a string.
---@param val0 char|number
---@param val1 char|number
---@param ... char|number
---@return string
function chr(val0, val1, ...) end

---Convert one or more characters from string STR to their ordinal (0..255) character codes.
---@param str string
---@param index number -- specify which character in the string to use
---@param num_results number -- When num_results is given, ord returns multiple values starting from index.
---@return number|nil -- When index is out of range or str is not a string, ord returns nil.
function ord(str, index, num_results) end

---grab a substring from string str, from pos0 up to and including pos1. when pos1 is not specified, the remainder of the string is returned. when pos1 is specified, but not a number, a single character at pos0 is returned.
---@param str string
---@param pos0 number
---@param pos1 number?
function sub(str, pos0, pos1) end

---Split a string into a table of elements delimited by the given separator (defaults to ",").
---
---When separator is a number n, the string is split into n-character groups.
---
---When convert_numbers is true, numerical tokens are stored as numbers (defaults to true).
---
---Empty elements are stored as empty strings.
---@param str string
---@param separator charater|number?
---@param convert_numbers boolean?
function split(str, separator, convert_numbers) end

---Returns the type of val as a string.
---@param val any
---@return string
function type(val) end

---create_delta returns a string encoding all of the information needed to get from str0 to str1 ("delta"). The delta can then be used by apply_delta to reproduce str1 given only str0.
---@param str0 string
---@param str1 string
---@return delta
function create_delta(str0, str1) end

---create_delta returns a string encoding all of the information needed to get from str0 to str1 ("delta"). The delta can then be used by apply_delta to reproduce str1 given only str0.
---@param str0 string
---@param delta delta
---@return string
function apply_delta(str0, delta) end

----- 9.6 Tables -----

---Add value val to the end of table tbl.
---
---If index is given then the element is inserted at that position.
---@param tbl table
---@param val any
---@param index number?
function add(tbl, val, index) end

---Delete the first instance of value VAL in table TBL. The remaining entries are shifted left one index to avoid holes.
---
---Note that val is the value of the item to be deleted, not the index into the table.
---@param tbl table
---@param val any
---@return any -- returns the deleted item, or returns no value when nothing was deleted.
function del(tbl, val) end

---Like del(), but remove the item from table tbl at index. When index is not given, the last element of the table is removed and returned.
---@param tbl table
---@param index number?
---@return any -- returns the deleted item, or returns no value when nothing was deleted.
function deli(tbl, index) end

---Returns the length of table t (same as #tbl) When val is given, returns the number of instances of VAL in that table.
---@param tbl table
---@param val any
---@return number
function count(tbl, val) end

---Used in for loops to iterate over all items in a table (that have a 1-based integer index), in the order they were added.
---@param tbl table
function all(tbl) end

---For each item in table tbl, call function func with the item as a single parameter.
---@param tbl table
---@param func function
function foreach(tbl, func) end

---Used in for loops to iterate over table tbl, providing both the key and value for each item.
---
---Unlike all(), pairs() iterates over every item regardless of indexing scheme.
---
---Order is not guaranteed.
---@param tbl table
function pairs(tbl) end

----- 9.7 PODs -----

---Returns a binary string encoding val.
---
---flags determine the encoding format (default: 0x0)
---
---metadata is an optional value that is encoded into the string and stores additional information about the pod.
---@param val any
---@param flags any?
---@param metadata any?
---@return string
function pod(val, flags, metadata) end

---returns the decoded value, and the decoded metadata as a second result.
---@param str string
---@return any,metadata
function unpod(str) end

----- 9.8 Files -----

---store a lua object (tables, strings, userdata, booleans and numbers are allowed) as a file.
---
---filenames can contain alphanumeric characters, "_", "-" and "."
---
---When metadata is given, each field is added to the file's metadata without clobbering any existing fields.
---@param filename string
---@param obj any
---@param metadata metadata?
function store(filename, obj, metadata) end

---Return a lua object stored in a given file. Returns the object and metadata.
---@param filename string
---@return any,metadata
function fetch(filename) end

---Store and fetch just the metadata fork of a file or directory. This can be faster in some cases.
---@param filename string
---@param metadata metadata
function store_metadata(filename, metadata) end

---Store and fetch just the metadata fork of a file or directory. This can be faster in some cases.
---@param filename string
---@return metadata
function fetch_metadata(filename) end

---Create a directory
---@param name any
function mkdir(name) end

---list files and folders in given path relative to the current directory.
---@param path any?
function ls(path) end

---Copy a file from src to dest. Folders are copied recursively, and dest is overwritten.
---@param src any
---@param dest any
function cp(src, dest) end

---Move a file from src to dest. Folders are moved recursively, and dest is overwritten.
---@param src any
---@param dest any
function mv(src, dest) end

---Delete a file or folder (recursive).
---
---Mount points are also deleted, but the contents of their origin folder are not deleted unless explicitly given as a parameter to rm.
function rm(filename) end

---Return the present working directory. Relative filenames (that do not start with "/") all resolve relative to this path.
function pwd() end

---Change directory.
function cd() end

---Resolve a filename to its canonical path based on the present working directory (pwd()).
function fullpath(filename) end

---@param filename any
---@return string,number,string -- file or folder, size of file, origin of path
function fstat(filename) end

---Load and run a lua file.
function include(filename) end

----- 9.9 System -----

---print a string to the host operating system's console for debugging.
---@param str string
function printh(str) end

---Returns a table of environment variables given to the process at the time of creation.
---@return table
function env() end

---stop the cart and optionally print a message
---@param message any?
function stop(message) end

---if condition is false, stop the program and print message if it is given. this can be useful for debugging cartridges, by assert()'ing that things that you expect to be true are indeed true.
---@param condition any
---@param message any?
function assert(condition, message) end

---Returns the number of seconds elapsed since the cartridge was run.
function time() end

---Returns the number of seconds elapsed since the cartridge was run.
function t() end

---Returns the current day and time formatted using Lua's standard date strings.
---@param format string -- specifies the output string format, and defaults to "!%Y-%m-%d %H:%M:%S" (UTC) when not given.
---@param t string -- specifies the moment in time to be encoded as a string
---@param delta number --  number of seconds to add to t.
function date(format, t, delta) end

----- 9.10 Memory -----

---read a byte from an address in ram. if n is specified, peek() returns that number of results (max: 65536). for example, to read the first 2 bytes of video memory:
---```
---a, b = peek(0x10000, 2)
---```
---@param addr any
---@param n any?
function peek(addr, n) end

---write one or more bytes to an address in base ram. if more than one parameter is provided, they are written sequentially (max: 65536).
---@param addr any
---@param val1 any
---@param ... any?
function poke(addr, val1, ...) end

---peek i16 version
function peek2(addr) end

---pook i16 version
function poke2(addr, val, ...) end

---peek i32 version
function peek4(addr) end

---pook i32 version
function poke4(addr, val, ...) end

---peek i64 version
function peek8(addr) end

---pook i64 version
function poke8(addr, val, ...) end

---copy len bytes of base ram from source to dest. sections can be overlapping (but is slower)
function memcpy(dest_addr, src_addr, len) end

---write the 8-bit value val into memory starting at dest_addr, for len bytes.
function memset(dest_addr, val, len) end

----- 9.11 Windows -----
---Returns the current display as a u8, 2d userdata.
---
---There is no way to set the display userdata directly;
---
---it can be resized using the window() function.
function get_display() end

---Set the draw target to ud, which must be a u8, 2d userdata. When ud is not given, set_draw_target() defaults to the current display.
function set_draw_target(ud) end

function get_draw_target() end

---Create a window and/or set the window's attributes.
---
---attribs is table of desired attributes for the window.
function window(attribs) end

function window(width, height) end

---Set a fullscreen video mode. Currently supported modes:
---- 0: 480x270
---- 1: 240x135
---- 2: 160x90
---@param video_mode number
function vid(video_mode) end

----- 9.* Math -----

---Returns the maximum of x and y.
---@param x number
---@param y number
function max(x, y) end

---Returns the minimum of x and y.
---@param x number
---@param y number
function min(x, y) end

---Returns the middle value of parameters.
---@param x any
---@param y any
---@param z any
function mid(x, y, z) end

---Rounds x down to the nearest integer.
function flr(x) end

---Rounds x up to the nearest integer.
function ceil(x) end

---Returns the cosine of x.
function cos(x) end

---Returns the sine of x.
function sin(x) end

---Converts DX, DY into an angle from 0..1
function atan2(dx, dy) end

---Returns the square root of x.
function sqrt(x) end

---Returns the absolute value of x.
function abs(x) end

---returns a random number n, 0 <= n < x.
function rnd(x) end

---Sets the random number seed. The seed is automatically randomized on cart startup.
function srand(x) end

--------------------------------
--- 10 Userdata(WIP)
--------------------------------

----- 10.1 userdata -----

---@class userdata
userdata = {}
userdata.__call = function() end

function vec() end

function userdata:width() end

function userdata:height() end

function userdata:attribs() end

function userdata:get() end

function userdata:set() end

function userdata:row(i) end

function userdata:column(i) end

function userdata:blit() end

function userdata:mutate() end

function userdata:lerp() end

function userdata_op() end

----- 10.2 Matrices and Vectors  -----

----- 10.3 Userdata Memory Functions  -----
function memmap(ud, addr) end

---@param ud any
---@param addr any?
function memunmap(ud, addr) end

function userdata:peek(addr, offset, elements) end

function userdata:poke(addr, offset, elements) end

----- 10.4 Batch GFX Operations  -----

function gfx_func(p, offset, num, num_params, stride) end

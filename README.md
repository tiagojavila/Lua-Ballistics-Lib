# Lua-Ballistics-Lib
30+ functions for external ballistics written in Lua.

# What the project does and Why the project is useful
This project can help developers to save time while creating games or utility apps that require external ballistics calculations. There are more than 30 functions like several unit converters, energy calculations (joule, ft.lb); corrections range x drop: MOA, MRAD (MIL), 1" @100 yd; scope clicks and more.

# How users can get started with the project
It's a single file library ***ballistics.lua***. There are no dependencies, so you can just include this file in your project's root and start using all available functions. The repository does include a file ***main.lua*** as example of application (outuputs to the console). All code has been tested using Solar2D game engine v2021.3661 or newer versions, available on https://solar2d.com/.

### For your project's *main.lua* file, you can add the code shown below:
```lua
local ballistics = require( "ballistics" )
```
### Prepare your default ballistic values:
```lua
local bullet_drop_inches = -2.1
local range_yards = 55
```
### And then, you can use any function from *ballistics.lua*:
```lua
local bullet_drop_yards = ballistics.In_to_Yd(bullet_drop_inches)
local moa = ballistics.MOAcorrection( range_yards, bullet_drop_yards )
print( moa )
```
### Or, if you prefer some code like this:
```lua
local moa = ballistics.MOAcorrection( range_yards, ballistics.In_to_Yd( bullet_drop_inches ) )
print( moa )
```
### That's it.
This project is in public domain under the *UNLICENSE* "license".

# (UN)LICENSE
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.
In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
For more information, please refer to <http://unlicense.org/>

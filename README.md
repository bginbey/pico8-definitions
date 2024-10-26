# pico-api

pico-api is a definition file used to enable the VSCode extension sumneko/Lua to support Picotron code.

## How to use

Install and enable sumneko/Lua extensions in [VSCode Marketplace](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).

New a Folder named `.vscode` and add files of this repo to it.

Use this at the top of main.lua in your p64 cart:

```lua
cd("/myproj")        -- files stored in here will be accessible to the host OS text editor
include("main.lua")  -- /myproj/main.lua
```

Then write all of the code in `myproj/`.

## Issues

[Picotron Shorthand](https://www.lexaloffle.com/dl/docs/picotron_manual.html#Picotron_Shorthand) is not supported

## reference

https://github.com/LuaLS/lua-language-server

https://luals.github.io/wiki/definition-files/

https://www.lexaloffle.com/dl/docs/picotron_manual.html#Using_External_Editors

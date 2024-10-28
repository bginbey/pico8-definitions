---@meta

---print a string to the host operating system's console for debugging.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#printh)
---@param str string
function printh(str) end

---Returns a table of environment variables given to the process at the time of creation.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#env)
---@return table
function env() end

---stop the cart and optionally print a message
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#stop)
---@param message any?
function stop(message) end

---if condition is false, stop the program and print message if it is given. this can be useful for debugging cartridges, by assert()'ing that things that you expect to be true are indeed true.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#assert)
---@param condition any
---@param message any?
function assert(condition, message) end

---Returns the number of seconds elapsed since the cartridge was run.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#time)
---@return number
function time() end

---Returns the number of seconds elapsed since the cartridge was run.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#time)
---@return number
function t() end

---Returns the current day and time formatted using Lua's standard date strings.
---
---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#date)
---@param format string -- specifies the output string format, and defaults to "!%Y-%m-%d %H:%M:%S" (UTC) when not given.
---@param t string -- specifies the moment in time to be encoded as a string
---@param delta number --  number of seconds to add to t.
---@return string
function date(format, t, delta) end

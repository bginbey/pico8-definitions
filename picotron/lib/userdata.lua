---@meta

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#Userdata)
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

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#matmul)
---@param m0 any
---@param m1 any
---@param m_out any?
function matmul(m0, m1, m_out) end

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#matmul3d)
---@param m0 any
---@param m1 any
---@param m_out any?
function matmul3d(m0, m1, m_out) end

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#memmap)
---@param ud any
---@param addr any
function memmap(ud, addr) end

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#memunmap)
---@param ud any
---@param addr any?
function memunmap(ud, addr) end

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_peek)
---@param addr any
---@param offset any
---@param elements any
function userdata:peek(addr, offset, elements) end

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#userdata_poke)
---@param addr any
---@param offset any
---@param elements any
function userdata:poke(addr, offset, elements) end

---[View Online](https://www.lexaloffle.com/dl/docs/picotron_manual.html#gfx_func)
---
---@param p any p is the f64 userdata -- normally 2d with a row for each call
---@param offset number offset is the flat offset into the userdata for the first call. Default: 0
---@param num number num is the number of gfx calls to make. Default: p:height()
---@param num_params numher params is the number of parameters to pass to the gfx function. Default: p:width()
---@param stride number stride is the number of elements to jump after each call. Default: p:width()
function gfx_func(p, offset, num, num_params, stride) end

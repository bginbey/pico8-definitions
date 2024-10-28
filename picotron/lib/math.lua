---@meta

---Pico-8 math functions.
---The Picotron manual currently does not have a chapter on math functions.

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

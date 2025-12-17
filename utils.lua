-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local M = {}

local kosten_multiplikator = settings.startup["BRE-Kosten-Multiplikator"].value

function M.cost(v)
  return math.max(1, math.floor(v * kosten_multiplikator + 0.5))
end

return M
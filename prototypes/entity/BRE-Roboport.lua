local function deepCopy(original)
  local copy = {}
  for k, v in pairs(original) do
      -- as before, but if we find a table, make sure we copy that too
      if type(v) == "table" then
          v = deepCopy(v)
      end
      copy[k] = v
  end
  return copy
end
local Loading_Speed = settings.startup["BRE-loading-speed"].value

BRE_roboportmk2 = deepCopy(data.raw.roboport["roboport"])
BRE_roboportmk2.name = "bre-roboport-mk2"
BRE_roboportmk2.fast_replaceable_group = "roboport"
BRE_roboportmk2.next_upgrade = "bre-roboport-mk3"
BRE_roboportmk2.logistics_radius = settings.startup["BRE-logistic-radius-mk2"].value
BRE_roboportmk2.construction_radius = settings.startup["BRE-construction-radius-mk2"].value
BRE_roboportmk2.minable = {mining_time = 0.5, result = "bre-roboport-mk2"}
BRE_roboportmk2.energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    input_flow_limit = 16 * Loading_Speed .. "MW",
    buffer_capacity = 600 * Loading_Speed .. "MJ",
  }
BRE_roboportmk2.recharge_minimum = "160MJ"
BRE_roboportmk2.energy_usage = "500kW"
BRE_roboportmk2.charging_energy = 1 * Loading_Speed .. "MW"
BRE_roboportmk2.robot_slots_count = 16
BRE_roboportmk2.material_slots_count = 10
BRE_roboportmk2.charging_offsets = {
{-1.5,1.5},	{-0.5,1.5},	{0.0,1.5},	{0.5,1.5},	{1.5,1.5},
{-1.5,0.5},										{1.5,0.5},
{-1.5,-0.5},									{1.5,0.0},
{-1.5,-1.0},									{1.5,-0.5},
{-1.5,-1.5},{-0.5,-1.5},{0.0,-1.5},	{0.5,-1.5},	{1.5,-1.5}
}
BRE_roboportmk2.charging_station_count_affected_by_quality = true
BRE_roboportmk2.base.layers =
  {
    {
        filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk2-base.png",
        width = 228,
        height = 277,
        shift = util.by_pixel(2, -2.25),
        scale = 0.5
    },
    {
		filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
		width = 294,
        height = 201,
        draw_as_shadow = true,
        shift = util.by_pixel(28.5, 9.25),
        scale = 0.5
    }
  }
BRE_roboportmk2.base_patch =
    {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk2-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    }
BRE_roboportmk2.base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-17.75, -71.25),
      scale = 0.5
    }
BRE_roboportmk2.door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    }
BRE_roboportmk2.door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
    }
BRE_roboportmk2.recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    }

BRE_roboportmk3 = deepCopy(data.raw.roboport["roboport"])
BRE_roboportmk3.name = "bre-roboport-mk3"
BRE_roboportmk3.fast_replaceable_group = "roboport"
BRE_roboportmk3.logistics_radius = settings.startup["BRE-logistic-radius-mk3"].value
BRE_roboportmk3.construction_radius = settings.startup["BRE-construction-radius-mk3"].value
BRE_roboportmk3.minable = {mining_time = 1, result = "bre-roboport-mk3"}
BRE_roboportmk3.energy_source = {
  type = "electric",
  usage_priority = "secondary-input",
  input_flow_limit = 48 * Loading_Speed .. "MW",
  buffer_capacity = 1200 * Loading_Speed .. "MJ",
}
BRE_roboportmk3.recharge_minimum = "240MJ"
BRE_roboportmk3.energy_usage = "1MW"
BRE_roboportmk3.charging_energy = 2 * Loading_Speed .. "MW"
BRE_roboportmk3.robot_slots_count = 24
BRE_roboportmk3.material_slots_count = 10
BRE_roboportmk3.charging_offsets = {
{-1.5,1.5},	{-1.0,1.5},	{-0.5,1.5},	{0.0,1.5},	{0.5,1.5},	{1.0,1.5},	{1.5,1.5},
{-1.5,1.0},																{1.5,1.0},
{-1.5,0.5},																{1.5,0.5},
{-1.5,-0.5},															{1.5,0.0},
{-1.5,-1.0},															{1.5,-0.5},
{-1.5,-1.5},															{1.5,-1.5},
{-1.5,-1.5},{-1.0,-1.5},{-0.5,-1.5},{0.0,-1.5},	{0.5,-1.5},	{1.0,-1.5},	{1.5,-1.5}
}
BRE_roboportmk3.base.layers =
  {
    {
		filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk3-base.png",
		width = 228,
        height = 277,
        shift = util.by_pixel(2, -2.25),
        scale = 0.5
    },
    {
		filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
		width = 294,
        height = 201,
        draw_as_shadow = true,
        shift = util.by_pixel(28.5, 9.25),
        scale = 0.5
    }
  }
  BRE_roboportmk3.base_patch =
    {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk3-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    }
BRE_roboportmk3.base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-17.75, -71.25),
      scale = 0.5
    }
BRE_roboportmk3.door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    }
BRE_roboportmk3.door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
    }
BRE_roboportmk3.recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    }
  

data:extend(
  {
    BRE_roboportmk2,
    BRE_roboportmk3
  }
)
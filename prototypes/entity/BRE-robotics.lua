local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local Speed_MK2 = settings.startup["BRE-Speed-MK2"].value
local Speed_MK3 = settings.startup["BRE-Speed-MK3"].value
local Speed_MK4 = settings.startup["BRE-Speed-MK4"].value
local Speed_MK5 = settings.startup["BRE-Speed-MK5"].value
local Carry_MK2 = settings.startup["BRE-Carry-MK2"].value
local Carry_MK3 = settings.startup["BRE-Carry-MK3"].value
local Carry_MK4 = settings.startup["BRE-Carry-MK4"].value
local Carry_MK5 = settings.startup["BRE-Carry-MK5"].value
local Roboter_Battery = settings.startup["BRE-Roboter-Battery"].value

local robot_animations = {}
robot_animations.sparks =
{
  {
    filename = "__base__/graphics/entity/sparks/sparks-01.png",
    draw_as_glow = true,
    width = 39,
    height = 34,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.3125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-02.png",
    draw_as_glow = true,
    width = 36,
    height = 32,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-03.png",
    draw_as_glow = true,
    width = 42,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.203125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-04.png",
    draw_as_glow = true,
    width = 40,
    height = 35,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.234375},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-05.png",
    draw_as_glow = true,
    width = 39,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.171875},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-06.png",
    draw_as_glow = true,
    width = 44,
    height = 36,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.3125},
    tint = {1.0, 0.9, 0.0, 1.0},
    animation_speed = 0.3
  }
}

data:extend(
{
	{
    type = "construction-robot",
    name = "BRE-construction-robotics-mk2",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-construction-robot-mk2.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-construction-robotics-mk2"},
    resistances =
    {
      {
        type = "fire",
        percent = 85
      },
      {
        type = "electric",
        percent = 50
      }
    },
    max_health = 200,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "construction-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_construction_robot,
    max_payload_size = Carry_MK2,
    speed = 0.06 * Speed_MK2,
    max_energy = 3.5 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.15,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3
    },
    sparks = robot_animations.sparks,
    repairing_sound = sound_variations("__base__/sound/robot-repair", 6, 0.6),
    working_sound = sounds.construction_robot(0.47),
    charging_sound = sounds.robot_charging,
    mined_sound_volume_modifier = 0.6,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    construction_vector = {0.30, 0.22},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk2.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk2.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk2.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk2.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/construction-robot-working.png",
			priority = "high",
            line_length = 2,
            width = 57,
            height = 74,
            frame_count = 2,
            shift = util.by_pixel(-0.25, -5),
            direction_count = 16,
            animation_speed = 0.3,
            scale = 0.5
        },
    shadow_working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            repeat_count = 2,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        }
  },
	{
    type = "construction-robot",
    name = "BRE-construction-robotics-mk3",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-construction-robot-mk3.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-construction-robotics-mk3"},
    resistances =
    {
      {
        type = "fire",
        percent = 85
      },
      {
        type = "electric",
        percent = 50
      }
    },
    max_health = 300,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "construction-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_construction_robot,
    max_payload_size = Carry_MK3,
    speed = 0.06 * Speed_MK3,
    max_energy = 4.0 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.1,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3
    },
    sparks = robot_animations.sparks,
    repairing_sound = sound_variations("__base__/sound/robot-repair", 6, 0.6),
    working_sound = sounds.construction_robot(0.47),
    charging_sound = sounds.robot_charging,
    mined_sound_volume_modifier = 0.6,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    construction_vector = {0.30, 0.22},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk3.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk3.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk3.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk3.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/construction-robot-working.png",
			priority = "high",
            line_length = 2,
            width = 57,
            height = 74,
            frame_count = 2,
            shift = util.by_pixel(-0.25, -5),
            direction_count = 16,
            animation_speed = 0.3,
            scale = 0.5
        },
    shadow_working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            repeat_count = 2,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        }
  },
	{
    type = "construction-robot",
    name = "BRE-construction-robotics-mk4",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-construction-robot-mk4.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-construction-robotics-mk4"},
    resistances =
    {
      {
        type = "fire",
        percent = 85
      },
      {
        type = "electric",
        percent = 50
      }
    },
    max_health = 400,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "construction-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_construction_robot,
    max_payload_size = Carry_MK4,
    speed = 0.06 * Speed_MK4,
    max_energy = 5.0 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3
    },
    sparks = robot_animations.sparks,
    repairing_sound = sound_variations("__base__/sound/robot-repair", 6, 0.6),
    working_sound = sounds.construction_robot(0.47),
    charging_sound = sounds.robot_charging,
    mined_sound_volume_modifier = 0.6,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    construction_vector = {0.30, 0.22},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk4.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk4.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk4.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk4.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/construction-robot-working.png",
			priority = "high",
            line_length = 2,
            width = 57,
            height = 74,
            frame_count = 2,
            shift = util.by_pixel(-0.25, -5),
            direction_count = 16,
            animation_speed = 0.3,
            scale = 0.5
        },
    shadow_working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            repeat_count = 2,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        }
  },
	{
    type = "construction-robot",
    name = "BRE-construction-robotics-mk5",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-construction-robot-mk5.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-construction-robotics-mk5"},
    resistances =
    {
      {
        type = "fire",
        percent = 85
      },
      {
        type = "electric",
        percent = 50
      }
    },
    max_health = 500,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "construction-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_construction_robot,
    max_payload_size = Carry_MK5,
    speed = 0.06 * Speed_MK5,
    max_energy = 6.0 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.8,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3
    },
    sparks = robot_animations.sparks,
    repairing_sound = sound_variations("__base__/sound/robot-repair", 6, 0.6),
    working_sound = sounds.construction_robot(0.47),
    charging_sound = sounds.robot_charging,
    mined_sound_volume_modifier = 0.6,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    construction_vector = {0.30, 0.22},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk5.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk5.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk5.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-mk5.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        },
    working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/construction-robot-working.png",
			priority = "high",
            line_length = 2,
            width = 57,
            height = 74,
            frame_count = 2,
            shift = util.by_pixel(-0.25, -5),
            direction_count = 16,
            animation_speed = 0.3,
            scale = 0.5
        },
    shadow_working = {
			filename = "__Better_Robots_Extended__/graphics/entity/construction-robot/bre-construction-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 104,
            height = 49,
            repeat_count = 2,
            shift = util.by_pixel(33.5, 18.75),
            direction_count = 16,
            scale = 0.5,
            draw_as_shadow = true
        }
  },
  
  
    {
    type = "logistic-robot",
    name = "BRE-logistic-robotics-mk2",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-logistic-robot-mk2.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-logistic-robotics-mk2"},
    is_military_target = false,
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 200,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "logistic-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_logistic_robot,
    max_payload_size = Carry_MK2,
    speed = 0.06 * Speed_MK2,
    max_energy = 2.0 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.15,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.48),
    charging_sound = sounds.robot_charging,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk2.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 84,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk2.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk2.png",
			priority = "high",
            line_length = 16,
            width = 80,
            height = 84,
            shift = util.by_pixel(0, -3),
            direction_count = 16,
            y = 252,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk2.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 168,
			scale = 0.5
		},
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 57,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 115,
            height = 57,
            shift = util.by_pixel(31.75, 19.75),
            direction_count = 16,
            y = 57*3,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 114,
			scale = 0.5,
			draw_as_shadow = true
		}
  },
    {
    type = "logistic-robot",
    name = "BRE-logistic-robotics-mk3",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-logistic-robot-mk3.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-logistic-robotics-mk3"},
    is_military_target = false,
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 300,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "logistic-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_logistic_robot,
    max_payload_size = Carry_MK3,
    speed = 0.06 * Speed_MK3,
    max_energy = 2.5 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.1,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.48),
    charging_sound = sounds.robot_charging,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk3.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 84,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk3.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk3.png",
			priority = "high",
            line_length = 16,
            width = 80,
            height = 84,
            shift = util.by_pixel(0, -3),
            direction_count = 16,
            y = 252,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk3.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 168,
			scale = 0.5
		},
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 57,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 115,
            height = 57,
            shift = util.by_pixel(31.75, 19.75),
            direction_count = 16,
            y = 57*3,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 114,
			scale = 0.5,
			draw_as_shadow = true
		}
  },
    {
    type = "logistic-robot",
    name = "BRE-logistic-robotics-mk4",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-logistic-robot-mk4.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-logistic-robotics-mk4"},
    is_military_target = false,
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 400,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "logistic-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_logistic_robot,
    max_payload_size = Carry_MK4,
    speed = 0.06 * Speed_MK4,
    max_energy = 3.5 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.15,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.48),
    charging_sound = sounds.robot_charging,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk4.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 84,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk4.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk4.png",
			priority = "high",
            line_length = 16,
            width = 80,
            height = 84,
            shift = util.by_pixel(0, -3),
            direction_count = 16,
            y = 252,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk4.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 168,
			scale = 0.5
		},
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 57,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 115,
            height = 57,
            shift = util.by_pixel(31.75, 19.75),
            direction_count = 16,
            y = 57*3,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 114,
			scale = 0.5,
			draw_as_shadow = true
		}
  },
    {
    type = "logistic-robot",
    name = "BRE-logistic-robotics-mk5",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-logistic-robot-mk5.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-logistic-robotics-mk5"},
    is_military_target = false,
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 500,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "logistic-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_logistic_robot,
    max_payload_size = Carry_MK5,
    speed = 0.06 * Speed_MK5,
    max_energy = 4.5 * Roboter_Battery .. "MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.8,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.48),
    charging_sound = sounds.robot_charging,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk5.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 84,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk5.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk5.png",
			priority = "high",
            line_length = 16,
            width = 80,
            height = 84,
            shift = util.by_pixel(0, -3),
            direction_count = 16,
            y = 168,
            scale = 0.5
        },
    in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-mk5.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 168,
			scale = 0.5
		},
    shadow_idle = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 57,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_idle_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_in_motion = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
            line_length = 16,
            width = 115,
            height = 57,
            shift = util.by_pixel(31.75, 19.75),
            direction_count = 16,
            y = 57*3,
            scale = 0.5,
            draw_as_shadow = true
        },
    shadow_in_motion_with_cargo = {
			filename = "__Better_Robots_Extended__/graphics/entity/logistic-robot/bre-logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 114,
			scale = 0.5,
			draw_as_shadow = true
		}
  },
})

data:extend(
{
	{
    type = "construction-robot",
    name = "BRE-construction-robotics-mk1",
    icon = "__base__/graphics/icons/construction-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-construction-robotics-mk1"},
    resistances =
    {
      {
        type = "fire",
        percent = 85
      },
      {
        type = "electric",
        percent = 50
      }
    },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "construction-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_construction_robot,
    max_payload_size = 1,
    speed = 0.06,
    max_energy = "3MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3
    },
    sparks = robot_animations.sparks,
    repairing_sound = sound_variations("__base__/sound/robot-repair", 6, 0.6),
    working_sound = sounds.construction_robot(0.47),
    charging_sound = sounds.robot_charging,
    mined_sound_volume_modifier = 0.6,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    construction_vector = {0.30, 0.22},
    water_reflection = robot_reflection(1),
    idle = {
    filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
    priority = "high",
    line_length = 16,
    width = 66,
    height = 76,
    shift = util.by_pixel(0,-4.5),
    direction_count = 16,
    scale = 0.5
  },
    idle_with_cargo = {
			filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0,-4.5),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
			priority = "high",
			line_length = 16,
			width = 66,
			height = 76,
			shift = util.by_pixel(0, -4.5),
			direction_count = 16,
			y = 76,
			scale = 0.5
		},
    in_motion_with_cargo = {
			filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
			priority = "high",
            line_length = 16,
            width = 66,
            height = 76,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 76,
            scale = 0.5
        },
    shadow_idle = {
			filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 104,
			height = 49,
			shift = util.by_pixel(33.5, 18.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_in_motion = {
			filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 104,
			height = 49,
			shift = util.by_pixel(33.5, 18.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		},
    working = {
			filename = "__base__/graphics/entity/construction-robot/construction-robot-working.png",
			priority = "high",
			line_length = 2,
			width = 57,
			height = 74,
			frame_count = 2,
			shift = util.by_pixel(-0.25, -5),
			direction_count = 16,
			animation_speed = 0.3,
			scale = 0.5
		},
    shadow_working = {
			filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 104,
			height = 49,
			repeat_count = 2,
			shift = util.by_pixel(33.5, 18.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		}
	},
	{
    type = "logistic-robot",
    name = "BRE-logistic-robotics-mk1",
    icon = "__base__/graphics/icons/logistic-robot.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "BRE-logistic-robotics-mk1"},
    is_military_target = false,
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    max_health = 100,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    dying_explosion = "logistic-robot-explosion",
    factoriopedia_simulation = simulations.factoriopedia_logistic_robot,
    max_payload_size = 1,
    speed = 0.05,
    max_energy = "1.5MJ",
    energy_per_tick = "0.05kJ",
    speed_multiplier_when_out_of_energy = 0.2,
    energy_per_move = "5kJ",
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = sounds.flying_robot(0.48),
    charging_sound = sounds.robot_charging,
    icon_draw_specification = {shift = {0, -0.2}, scale = 0.5, render_layer = "air-entity-info-icon"},
    water_reflection = robot_reflection(1),
    idle = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 84,
			scale = 0.5
		},
    idle_with_cargo = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			scale = 0.5
		},
    in_motion = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 252,
			scale = 0.5
		},
    in_motion_with_cargo = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
			priority = "high",
			line_length = 16,
			width = 80,
			height = 84,
			shift = util.by_pixel(0, -3),
			direction_count = 16,
			y = 168,
			scale = 0.5
		},
    shadow_idle = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 57,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_idle_with_cargo = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_in_motion = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 57*3,
			scale = 0.5,
			draw_as_shadow = true
		},
    shadow_in_motion_with_cargo = {
			filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
			priority = "high",
			line_length = 16,
			width = 115,
			height = 57,
			shift = util.by_pixel(31.75, 19.75),
			direction_count = 16,
			y = 114,
			scale = 0.5,
			draw_as_shadow = true
		}
	}
})
local vanilla = data.raw.roboport["roboport"]
if vanilla then
    vanilla.next_upgrade = nil
    
    if vanilla.minable and vanilla.minable.result == "roboport" then
        vanilla.minable = { mining_time = 0.1 }
    end

    vanilla.fast_replaceable_group = "roboport"
end
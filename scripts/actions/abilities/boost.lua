local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Add 20 evasion
    player:addMod(xi.mod.EVASION, 20)

    -- Add 5 vitality
    player:addMod(xi.mod.VIT, 5)

    -- Add 5 strength
    player:addMod(xi.mod.STR, 5)

    -- Add 5 attack
    player:addMod(xi.mod.ATTACK, 5)

    -- Set a timer to remove the modifications after 1 minute
    local abilityDuration = 60 -- 1 minute duration
    xi.timers.createTimer(player, "ability_duration", xi.timer.TYPE_ABILITY, abilityDuration, function()
        -- Remove the modifications
        player:addMod(xi.mod.EVASION, -20)
        player:addMod(xi.mod.VIT, -5)
        player:addMod(xi.mod.STR, -5)
        player:addMod(xi.mod.ATTACK, -5)
    end)
end

return abilityObject
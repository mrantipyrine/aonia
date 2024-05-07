local abilityObject = {}

local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Increase counter chance by 80%
    local counterChanceIncrease = 0.8 -- 80% increase
    player:addMod(xi.mod.COUNTER_CHANCE, counterChanceIncrease)

    -- Set a timer to remove the counter chance increase after the ability duration
    local abilityDuration = 60 -- Adjust duration as needed
    xi.timers.createTimer(player, "ability_duration", xi.timer.TYPE_ABILITY, abilityDuration, function()
        player:addMod(xi.mod.COUNTER_CHANCE, -counterChanceIncrease) -- Remove the counter chance increase
    end)
end

return abilityObject
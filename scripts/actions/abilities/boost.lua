local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Increase TP gain by 25%
    local tpGainMultiplier = 1.25 -- 25% increase
    player:addMod(xi.mod.TP_GAIN_MULTIPLIER, tpGainMultiplier)

    -- Set a timer to remove the TP gain increase after the ability duration
    local abilityDuration = 60 -- Adjust duration to 1 minute
    xi.timers.createTimer(player, "ability_duration", xi.timer.TYPE_ABILITY, abilityDuration, function()
        player:addMod(xi.mod.TP_GAIN_MULTIPLIER, -tpGainMultiplier) -- Remove the TP gain increase
    end)
end

return abilityObject    
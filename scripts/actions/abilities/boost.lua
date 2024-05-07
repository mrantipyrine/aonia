local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Add a 10% chance to add blink
    if math.random() <= 0.1 then -- Change to 10% chance
        local blinkDuration = 60 -- Adjust duration to 1 minute
        local blinkCharges = 3 -- Adjust blink charges as needed
        player:addStatusEffect(xi.effect.BLINK, blinkCharges, 3, blinkDuration, 0, 10, 1)
    end
end

return abilityObject
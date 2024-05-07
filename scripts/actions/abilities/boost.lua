-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------

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
        player:addStatusEffect(xi.effect.BLINK, blinkCharges, 3, blinkDuration, 3, 10, 3)
    end
end

return abilityObject
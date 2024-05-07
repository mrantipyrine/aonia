-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.
-- Obtained: Monk Level 15
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Add a 50% chance to grant haste
    if math.random() <= 0.5 then
        local blinkDuration = 60 -- Adjust duration to 1 minute
        local blinkCharges = 3 -- Adjust blink charges as needed
        player:addStatusEffect(xi.effect.BLINK, blinkCharges, 3, blinkDuration, 0, 10, 1)
    end
end 

return abilityObject

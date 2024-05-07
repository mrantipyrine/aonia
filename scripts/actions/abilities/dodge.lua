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
    -- Apply Blink effect
    local blinkDuration = 120 -- Adjust duration as needed
    player:addStatusEffect(xi.effect.BLINK, 0, 3, blinkDuration, 0, 10, 1)
end 

return abilityObject
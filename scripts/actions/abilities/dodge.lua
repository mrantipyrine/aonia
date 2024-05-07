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
    -- Add a 50% chance to grant Regen
    if math.random() <= 0.5 then
        local regenDuration = 120 -- Adjust duration as needed
        player:addStatusEffect(xi.effect.REGEN, 0, 3, regenDuration, 0, 5, 1)
    end
end 

return abilityObject

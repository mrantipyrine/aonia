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
    -- Add 500 TP
    player:addTP(500)

    -- Add a 50% chance to grant haste
    if math.random() <= 0.5 then
        local hasteDuration = 180 -- Adjust duration as needed
        player:addStatusEffect(xi.effect.HASTE, 30, 3, hasteDuration, 0, 10, 1)
    end 
end

return abilityObject
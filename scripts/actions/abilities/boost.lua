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

    -- Add a 50% chance to apply Stoneskin
    if math.random() <= 0.5 then
        local stoneskinDuration = 60 -- Adjust duration to 1 minute
        local stoneskinAmount = 200 -- Adjust Stoneskin amount as needed
        player:addStatusEffect(xi.effect.STONESKIN, stoneskinAmount, 3, stoneskinDuration, 0, 10, 1)
    end
end

return abilityObject
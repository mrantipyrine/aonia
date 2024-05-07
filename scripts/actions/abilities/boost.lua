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

    -- Add a 50% chance to apply Blink
    if math.random() <= 0.5 then
        local blinkDuration = 60 -- Adjust duration to 1 minute
        local blinkCharges = 3 -- Adjust blink charges as needed
        player:addStatusEffect(xi.effect.BLINK, blinkCharges, 3, blinkDuration, 0, 10, 1)
    end
end

return abilityObject
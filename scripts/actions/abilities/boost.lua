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
    -- Apply Regen II effect
    local regenDuration = 120 -- 2 minutes duration
    local regenAmount = 2 -- Adjust Regen amount as needed
    player:addStatusEffect(xi.effect.REGEN_II, regenAmount, 3, regenDuration, 0, 10, 1)

    -- Add a 50% chance to grant haste
    if math.random() <= 0.2 then
        local hasteDuration = 180 -- Adjust duration as needed
        player:addStatusEffect(xi.effect.HASTE, 30, 3, hasteDuration, 0, 10, 1)
    end

    -- Add a 10% chance to gain Regen status effect
    if math.random() <= 0.5 then
        local regenEffectDuration = 120 -- 2 minutes duration
        local regenEffectAmount = 2 -- Adjust Regen amount as needed
        player:addStatusEffect(xi.effect.REGEN, regenEffectAmount, 3, regenEffectDuration, 0, 10, 1)
    end
end

return abilityObject
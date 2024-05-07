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

    -- Add a 50% chance to gain Regen
    if math.random() <= 0.5 then
        local regenDuration = 180 -- 3 minutes duration
        local regenAmount = 2 -- Adjust Regen amount as needed
        player:addStatusEffect(xi.effect.REGEN, regenAmount, 3, regenDuration, 0, 10, 1)
    end

    -- Add a 20% chance to gain Haste
    if math.random() <= 0.2 then
        local hasteDuration = 180 -- 3 minutes duration
        player:addStatusEffect(xi.effect.HASTE, 30, 3, hasteDuration, 0, 10, 1)
    end
end

return abilityObject
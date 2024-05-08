-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    local strIncrease = math.random(10, 30)

    local duration = 300 -- Duration in seconds

    -- Increase STR
    player:addStatusEffect(xi.effect.STR_BOOST, strIncrease, 3, duration, 0, 10, 1)

    -- Apply the Haste effect
    local regenDuration = 180 -- 3 minutes in seconds
    player:addStatusEffect(xi.effect.REGEN, 15, 6, regenDuration, 0, 10, 1)
end

return abilityObject

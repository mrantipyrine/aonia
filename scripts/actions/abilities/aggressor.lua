-----------------------------------
-- Ability: Aggressor
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

   -- Randomly generate values for VIT and STR increases
   local strIncrease = math.random(50, 100)
   -- Duration for both VIT and STR boosts
   local duration = 180 -- Duration in seconds

   -- Increase STR
   player:addStatusEffect(xi.effect.STR_BOOST, strIncrease, 3, duration, 0, 10, 1)

    xi.job_utils.warrior.useAggressor(player, target, ability)
end

return abilityObject

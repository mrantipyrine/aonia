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
   local accIncrease = 50
   -- Duration for both VIT and STR boosts
   local duration = 180 -- Duration in seconds

    if player:getMainJob() == xi.job.WAR then
        accIncrease = math.random(50, 100) * 2
        duration = math.random(180, 200) * 2
    end   
   player:addStatusEffect(xi.effect.ACCURACY_BOOST, accIncrease, 3, duration, 0, 10, 1)

    xi.job_utils.warrior.useAggressor(player, target, ability)
end

return abilityObject

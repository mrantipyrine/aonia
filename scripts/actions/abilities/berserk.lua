-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    strIncrease = math.random(10, 20)
    accIncrease = math.random(30, 100)

    duration = 180

    -- Increase if WAR is main job
    if player:getMainJob() == xi.job.WAR then
        strIncrease = strIncrease * 4
        accIncrease = accIncrease * 3
    end 

    -- Increase STR / Accg
    player:addStatusEffect(xi.effect.STR_BOOST, strIncrease, 3, duration, 0, 10, 1)
    player:addMod(xi.mod.ACC, accIncrease, 3, duration, 3, 10, 1)
    
    -- Apply the Haste effect
   -- local regenDuration = 60 -- 1 minutes in seconds

    -- if player:getMainJob() == xi.job.WAR then
    --    regenDuration = regenDuration * 10
    --end

    -- Incrase Medidate
     ---player:addStatusEffect(xi.effect.MEDITATE, 15, 6, regenDuration, 0, 10, 1)
end

return abilityObject

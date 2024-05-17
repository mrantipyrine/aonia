-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-- Adds Str and Acc 
-----------------------------------
local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    vitIncrease = player:getMainJob() / 2
    defIncrease = player:getMainLvl() / 2

    duration = 180

    -- Increase if WAR is main job
    if player:getMainJob() == xi.job.WAR then
        vitIncrease = player:getMainJob()
        defIncrease = player:getMainJob() * 2 
    end 

    -- Increase STR / Accg
    player:addStatusEffect(xi.effect.VIT_BOOST, strIncrease, 3, duration, 0, 10, 1)
    player:addMod(xi.mod.DEF, accIncrease, 3, duration, 3, 10, 1)
    
    -- Apply the Haste effect
   -- local regenDuration = 60 -- 1 minutes in seconds

    -- if player:getMainJob() == xi.job.WAR then
    --    regenDuration = regenDuration * 10
    --end

    -- Incrase Medidate
     ---player:addStatusEffect(xi.effect.MEDITATE, 15, 6, regenDuration, 0, 10, 1)
end

return abilityObject

-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    -- STR Increase 
    local strIncrease = math.random(5, 20) 
    -- Duration in Seconds
    local duration = 300 

    -- Increase if WAR is main job
    if player:getMainJob() == xi.job.WAR then
        strIncrease = math.random(10, 30) * 2
    end 
    -- Increase STR
    player:addStatusEffect(xi.effect.STR_BOOST, strIncrease, 3, duration, 0, 10, 1)


    -- Apply the Haste effect
    local regenDuration = 60 -- 1 minutes in seconds

    if player:getMainJob() == xi.job.WAR then
        regenDuration = regenDuration * 5
    end
    
    -- Incrase Haste 
    player:addStatusEffect(xi.effect.REGEN, 15, 6, regenDuration, 0, 10, 1)
end

return abilityObject

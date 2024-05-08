-----------------------------------
-- Ability: Warcry
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    
    if player:getMainJob() == xi.job.WAR then
        local tpGain = math.random(1000, 3000)
    else 
        local tpGain = math.random(250, 1000)
    end 

    return xi.job_utils.warrior.useWarcry(player, target, ability)
end

return abilityObject

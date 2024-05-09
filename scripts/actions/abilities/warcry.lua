-----------------------------------
-- Ability: Warcry
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    
    accDuration = 180
    accIncrease = math.random(20, 50)

    if player:getMainJob() == xi.job.WAR then
        accIncrease = accIncrease * 3
    end 

    player:addMod(xi.mod.ATT, accIncrease, 3, accDuration, 3, 10, 1)
    
    return xi.job_utils.warrior.useWarcry(player, target, ability)
end

return abilityObject

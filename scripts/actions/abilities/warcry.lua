-----------------------------------
-- Ability: Warcry
-- Job: Warrior
-- Adds Att
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    
    attDuration = 180
    attIncrease = math.random(20, 50)

    if player:getMainJob() == xi.job.WAR then
        accIncrease = accIncrease * 2
    end 

    player:addMod(xi.mod.ATT, attIncrease, 3, attDuration, 3, 10, 1)
    
    return xi.job_utils.warrior.useWarcry(player, target, ability)
end

return abilityObject

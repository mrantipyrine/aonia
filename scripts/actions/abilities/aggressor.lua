-----------------------------------
-- Ability: Aggressor
-- Job: Warrior
-- Adds Regain 
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    local duration = 180
    local attIncrease = player:getMainLvl() / 4 
    local tripleAtt = player:getMainLvl() / 8 
    local tripleDmg = player:getMainLvl() / 6
    
    if player:getMainJob() == xi.job.WAR then
        attIncrease = player:getMainLvl()
        tripleAtt = player:getMainLvl() 
        tripleDmg = player:getMainLvl() / 2
        duration = 290
    end 

    -- Increase ATT + Double Attack 
    player:addMod(xi.mod.ATT, attIncrease, 3, duration, 0, 10, 1)
    player:addMod(xi.mod.TRIPLE_ATTACK, doubleAtt, 3, duration, 0, 10, 1)
    player:addMod(xi.mod.TRIPLE_ATTACK_DMG, doubleDmg, 3, duration, 0, 10, 1)

    xi.job_utils.warrior.useAggressor(player, target, ability)
end

return abilityObject

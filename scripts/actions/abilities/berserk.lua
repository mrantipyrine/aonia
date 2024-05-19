-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-- Adds Str and Acc 
-----------------------------------
local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    attIncrease = player:getMainLvl() / 2
    doubleAtt = player:getMainLvl() / 2
    doubleDmg = player:getMainLvl() / 4
    duration = 180

    -- Increase Acc and Attk 
    if player:getMainJob() == xi.job.WAR then
        attIncrease = player:getMainLvl()
        doubleAtt = player:getMainLvl()
        doubleDmg = player:getMainLvl() / 2
        duration = 290
    end 

    -- Increase ATT + Double Attack 
    player:addMod(xi.effect.ATT, attIncrease, 3, duration, 0, 10, 1)
    player:addMod(xi.mod.DOUBLE_ATTACK, doubleAtt, 3, duration, 0, 10, 1)
    player:addMod(xi.mod.DOUBLE_ATTACK_DMG, doubleDmg, 3, duration, 0, 10, 1)
    
end

return abilityObject

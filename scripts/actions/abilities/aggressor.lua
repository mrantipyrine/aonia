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

    local accIncrease = player:getMainLvl()
    local attIncrease = player:getMainLvl()
    local duration = 180
    
    if attack.weaponType == xi.skill.GREAT_AXE or xi.skill.GREAT_SWORD then 
        player:addMod(xi.mod.TRIPLE_ATTACK, player:getMainLvl(), 3, duration, 0, 10, 1)
        player:addMod(xi.mod.TRIPLE_ATTACK_DMG, player:getMainLvl() / 2 , 3, duration, 0, 10, 1)
        player:addStatusEffect(xi.effect.HASTE, 60, 3, duration, 0, 10, 1)
    else
        player:addStatusEffect(xi.mod.ACC, accIncrease, 3, duration, 0, 10, 1)
        player:addMod(xi.mod.DOUBLE_ATTACK, player:getMainLvl(), 3, duration, 0, 10, 1)
        player:addMod(xi.mod.DOUBLE_ATTACK_DMG, player:getMainLvl() / 2 , 3, duration, 0, 10, 1)
    end 
    

    -- Increase ATT + Double Attack 
    player:addMod(xi.mod.ATT, attIncrease, 3, duration, 0, 10, 1)

    xi.job_utils.warrior.useAggressor(player, target, ability)
end

return abilityObject

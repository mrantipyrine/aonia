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


    local equippedWeaponType = player:getEquippedWeaponType()
    
    -- Check if the equipped weapon type is Greataxe (assuming 11 is Greataxe)
    if equippedWeaponType ~= 11 then

        return 0, 0, false, 0 -- Return early if the player does not have a Greataxe equipped
    end

    local duration = 290

    local attIncrease = player:getMainLvl()

    if equippedWeaponType then 
        player:addMod(xi.mod.TRIPLE_ATTACK, player:getMainLvl(), 3, duration, 0, 10, 1)
        player:addMod(xi.mod.TRIPLE_ATTACK_DMG, player:getMainLvl() / 2 , 3, duration, 0, 10, 1)
        player:addStatusEffect(xi.effect.HASTE, 60, 3, duration, 0, 10, 1)
    else
        player:addStatusEffect(xi.effect.ACC, 60, 3, duration, 0, 10, 1)
        player:addMod(xi.mod.DOUBLE_ATTACK, player:getMainLvl(), 3, duration, 0, 10, 1)
        player:addMod(xi.mod.DOUBLE_ATTACK_DMG, player:getMainLvl() / 2 , 3, duration, 0, 10, 1)
    end 
    

    end 

    -- Increase ATT + Double Attack 
    player:addMod(xi.mod.ATT, attIncrease, 3, duration, 0, 10, 1)

    xi.job_utils.warrior.useAggressor(player, target, ability)
end

return abilityObject

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
    local mainLvl = player:getMainLvl()
    local duration = 180
    local accIncrease = mainLvl 
    local attIncrease = mainLvl
    local weaponType = player:getWeaponSkillType(xi.slot.MAIN)

    if weaponType == xi.skill.GREAT_AXE or weaponType == xi.skill.GREAT_SWORD then
        player:addMod(xi.mod.QUAD_ATTACK, mainLvl / 4)
        player:addMod(xi.mod.QUAD_ATTACK_DMG, mainLvl / 4)
        player:addStatusEffect(xi.effect.HASTE, 60, 0, duration)
    else
        player:addMod(xi.mod.ACC, accIncrease)
        player:addMod(xi.mod.TRIPLE_ATTACK, mainLvl / 4)
        player:addMod(xi.mod.TRIPLE_ATTACK_DMG, mainLvl / 4)
    end 

    player:addMod(xi.mod.ATT, attIncrease)

    xi.job_utils.warrior.useAggressor(player, target, ability)
end

return abilityObject
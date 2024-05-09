-----------------------------------
-- Ability: Mug
-- Steal gil from enemy.
-- Obtained: Thief Level 35
-- Recast Time: 5:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability, action)


    local lostHP = player:getMaxHP() - player:getHP()
    local lostTP = 3000 - player:getTP()   
    local dexMod = player:getStat(xi.mod.DEX) * 0.3
    local agiMod = player:getStat(xi.mod.AGI) * 0.3

    local targetHP = target:getHP()
    local targetTP = target:getTP()
    

    hpDrain = math.random(0, targetHP / dexMod )

    tpDrain = math.random(0, targetHP / agiMod)

    player:setTP(player:getTP() + tpDrain)

    player:setHP(player:getHP() + hpDrain)

    -- player:addHP(targetHP)
    target:addTP(-tpDrain)
    target:addHP(-hpDrain)

    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject

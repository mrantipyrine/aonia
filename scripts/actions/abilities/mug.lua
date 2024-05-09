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

    totalDex = player:getStat(xi.mod.DEX)
    totalAgi = player:getStat(xi.mod.AGI)

    targetHP = target:getHP()
    targetTP = target:getTP()
    

    hpDrain = math.random(totalDex * 0.8 , targetHP)

    tpDrain = math.random(totalAgi * 0.8 , targetTP * math.random(0, 3000))

    player:setTP(tpDrain)

    player:setHP(hpDrain)

    -- player:addHP(targetHP)
    target:addTP(-tpDrain)
    target:addHP(-hpDrain)

    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject

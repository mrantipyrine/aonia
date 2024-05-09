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

    targetHP = target:getHP()
    targetTP = target:getTP()
    
    player:setTP(player:getTP + math.random(0, targetTP))
    player:setHP(player:getHP() + math.random(0, targetHP ))
    -- player:addHP(targetHP)
   

    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject

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

    local targetTP = target:getTP()
    
    target:addTP(-targetTP)

    player.addTP(targetTP)

    --if player:getMainJob() == xi.job.THF then
        -- tpGain = math.random(0)   
        
    -- end 


    -- player:addTP(tpGain)
    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject

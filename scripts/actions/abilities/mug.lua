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

    if target:isEnemy() then
        -- Calculate TP gain for the thief
        local tpDrained = math.max(target:getTP(), tpGain)

        target:addTP(-tpDrained)

    if player:getMainJob() == xi.job.THF then
        -- tpGain = math.random(1, 3000)   
        player.addTP(tpDrained)
    end 


    -- player:addTP(tpGain)
    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject

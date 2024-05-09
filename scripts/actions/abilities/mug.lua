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

    if player:getMainJob() == xi.job.THF then
        xi.weaponskill.VIPER_BITE 
       -- xi.job_utils.thief.useHide(player, target, ability)
    end 

    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject

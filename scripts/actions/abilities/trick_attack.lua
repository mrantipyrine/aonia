-----------------------------------
-- Ability: Trick Attack
-- Deals extra damage when striking from behind a party or alliance member.
-- Obtained: Thief Level 30
-- Recast Time: 1:00
-- Duration: 1:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end


--- maybe into their own if statements instead of one block?



abilityObject.onUseAbility = function(player, target, ability)

    if player:getMainJob() == xi.job.THF then
        if math.random(0,100) >= .1 then
            xi.job_utils.thief.useSneakAttack(player, target, ability)
            xi.job_utils.thief.useHide(player, target, ability)
    end 

    xi.job_utils.thief.useTrickAttack(player, target, ability)
end

return abilityObject

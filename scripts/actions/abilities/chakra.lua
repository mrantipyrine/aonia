local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    
    attackIncrease = 50
    attackDuration = 120 

    if player:getMainJob() == xi.job.MNK then
       attackIncrease = attackIncrease * 3
       attackDuration = attackDuration * 3
    end  

    player:addMod(xi.mod.ATTACK, attackIncrease, 3, attackDuration, 0, 10, 1)
                                              
    return xi.job_utils.monk.useChakra(player, target, ability)
end

return abilityObject
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    
    -- local attackIncrease = 50
    -- local attackDuration = 120 

    if player:getMainJob() == xi.job.MNK then
        player:addStatusEffect(xi.effect.MIGHTY_STRIKES, 1, 0, 0)
        Timer.after(20, player:delStatusEffect(xi.effect.HUNDRED_FISTS))
    end  

    player:addMod(xi.mod.ATT, 50, 120)
    
                                              
    return xi.job_utils.monk.useChakra(player, target, ability)
end

return abilityObject
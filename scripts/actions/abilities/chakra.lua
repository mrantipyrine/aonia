local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    local attIncrease = 50
    local attDuration = 120 

    -- Give 20% to grant Hundred Fists for 20 seconds. Maybe it should be 10 seconds 
    if player:getMainJob() == xi.job.MNK then
        if math.random(0, 100) <= 20 then
            end
        else
            player:addStatusEffect(xi.effect.HUNDRED_FISTS, 3, 1, 10)
        end 
        -- Increase attack and attack duration if mainjob is Monk
        attIncrease = attIncrease * 2
        attackDuration = attackDuration * 2 
    end 

    player:addMod(xi.mod.ATT, attIncrease, attDuration)


    return xi.job_utils.monk.useChakra(player, target, ability)
end

return abilityObject
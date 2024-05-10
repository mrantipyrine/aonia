local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    local attIncrease = 50
    local attDuration = 120 

    -- Give 10% to grant Hundred Fists for 20 seconds. Maybe it should be 10 seconds 
    if player:getMainJob() == xi.job.MNK then
        if math.random(0, 100) >= 0.1 then
            player:addStatusEffect(xi.effect.HUNDRED_FISTS, 1, 1, 20)
        end 
    end 

    player:addMod(xi.mod.ATT, attIncrease, attDuration)


    return xi.job_utils.monk.useChakra(player, target, ability)
end

return abilityObject
~                        return abilityObject
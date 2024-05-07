local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Add a 10% chance to boost HP
    if math.random() <= 0.1 then -- Change to 10% chance
        local hpBoostDuration = 60 -- Adjust duration to 1 minute
        local hpBoostAmount = 100 -- Adjust HP boost amount as needed
        player:addStatusEffect(xi.effect.MAX_HP_BOOST, hpBoostAmount, 3, hpBoostDuration, 0, 10, 1)
    end
end

return abilityObject
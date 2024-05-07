local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Add a 10% chance to boost HP
    if math.random() <= 0.5 then
        local hpBoostDuration = 180 -- Adjust duration as needed
        local hpBoostAmount = 100 -- Adjust HP boost amount as needed
        player:addStatusEffect(xi.effect.MAX_HP_BOOST, hpBoostAmount, 3, hpBoostDuration, 0, 10, 1)
    end
end

return abilityObject
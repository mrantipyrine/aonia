local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Calculate the HP boost amount based on player level
    local playerLevel = player:getLevel()
    local baseLevel = 5 -- Start scaling from level 5
    local hpBoostAmount = (playerLevel - baseLevel + 1) * 50 -- Scale by 50 for every player level starting from level 5

    -- Add a 10% chance to boost HP
    if math.random() <= 0.9 then
        local hpBoostDuration = 60 -- Adjust duration to 1 minute
        player:addStatusEffect(xi.effect.MAX_HP_BOOST, hpBoostAmount, 3, hpBoostDuration, 0, 10, 1)
    end
end

return abilityObject

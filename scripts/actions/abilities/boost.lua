local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    if player then
        xi.job_utils.monk.useBoost(player, target, ability)

        -- Calculate the HP boost amount based on player level
        local playerLevel = player:getLevel()
        local baseLevel = 5 -- Start scaling from level 5
        local hpBoostAmount = (playerLevel - baseLevel + 1) * 50 -- Scale by 50 for every player level starting from level 5

        -- Add a 10% chance to boost HP
        if math.random() <= 0.1 then
            local hpBoostDuration = 60 -- Adjust duration to 1 minute
            player:addStatusEffect(xi.effect.MAX_HP_BOOST, hpBoostAmount, 3, hpBoostDuration, 0, 10, 1)
        end
    else
        print("Error: Player object is nil.")
    end
end
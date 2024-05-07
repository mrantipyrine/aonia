local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Apply regen effect for 1 minute
    local regenDuration = 60 -- 1 minute duration
    local regenAmount = 2 -- Adjust regen amount as needed
    player:addStatusEffect(xi.effect.REGEN, regenAmount, 3, regenDuration, 0, 10, 1)

    -- Restore 80% of lost HP after 1 minute
    local lostHP = player:getMaxHP() - player:getHP()
    local hpToRestore = math.floor(lostHP * 0.8)

    local restoreHealth = function()
        player:setHP(player:getHP() + hpToRestore)

        -- Grant 500 TP after restoring health
        player:addTP(500)
    end

    -- Schedule the restoration of health after 1 minute
    xi.scheduler:schedule(restoreHealth, 60)

    xi.job_utils.monk.useBoost(player, target, ability)
end

return abilityObject
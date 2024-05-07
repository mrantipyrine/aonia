local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Apply a temporary health increase effect
    local healthIncreaseDuration = 60 -- Default to 60 seconds if not properly initialized
    local healthIncreaseAmount = 100 -- Adjust health increase amount as needed

    if healthIncreaseDuration == nil then
        print("Warning: healthIncreaseDuration is not properly initialized. Using default value.")
        healthIncreaseDuration = 60
    end

    local statusEffectAdded, statusEffectError = player:addStatusEffect(xi.effect.HEALTH_INCREASE, healthIncreaseAmount, 3, healthIncreaseDuration, 0, 10, 1)

    if not statusEffectAdded then
        print("Error adding status effect:", statusEffectError)
        return
    end

    -- Schedule a delayed action to restore health and grant TP after 1 minute
    local startTime = os.time()
    local delay = 60 -- 60 seconds delay for 1 minute

    local restoreHealthAndGrantTP = function()
        -- Restore 80% of lost HP
        local lostHP = player:getMaxHP() - player:getHP()
        local hpToRestore = math.floor(lostHP * 0.8)
        player:setHP(player:getHP() + hpToRestore)

        -- Grant 500 TP
        player:addTP(500)
    end

    -- Perform the boost action immediately
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Check for elapsed time to execute the delayed action
    xi.onTick("BoostTimer", function()
        if os.time() - startTime >= delay then
            restoreHealthAndGrantTP()
            xi.clearTick("BoostTimer") -- Remove the tick after executing the action
        end
    end)
end

return abilityObject
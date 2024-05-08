-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function increaseAttack(player)
    -- Increase attack by 100
    player:addMod(xi.mod.ATTACK, 100)
end

local function removeAttackIncrease(player)
    -- Remove the attack increase
    player:addMod(xi.mod.ATTACK, -100)
end

abilityObject.onUseAbility = function(user, target, ability)
    -- Apply Stoneskin
    local stoneskinAmount = 100 -- Adjust Stoneskin amount as needed
    local stoneskinDuration = attackDuration -- Stoneskin duration matches attack duration
    
    player:addStatusEffect(xi.effect.STONESKIN, stoneskinAmount, 3, stoneskinDuration, 0, 10, 1)

    -- Increase attack by 100
    increaseAttack(player)

    -- Set up a timer to remove the attack increase after 1 minute
    local duration = 25 -- 25 seconds

    xi.timers.createTimer(player, "ability_duration", xi.timer.TYPE_ABILITY, duration, function()
        removeAttackIncrease(player)
    end)

    local healthRestore = user:getMaxHP() * 0.8
    user:setHP(user:getHP() + healthRestore)

end

return abilityObject
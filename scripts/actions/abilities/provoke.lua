-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(user, target, ability)
    local attackIncrease = 100
    local attackDuration = 25 -- Duration in seconds

    -- Increase attack power
    user:addMod(xi.mod.ATTACK, attackIncrease)

    -- Apply Stoneskin
    local stoneskinAmount = 100 -- Adjust Stoneskin amount as needed
    local stoneskinDuration = attackDuration -- Stoneskin duration matches attack duration
    player:addStatusEffect(xi.effect.STONESKIN, stoneskinAmount, 3, stoneskinDuration, 0, 10, 1)

    -- Set up a timer to remove the attack increase after the duration
    xi.timers.createTimer(user, "ability_duration", xi.timer.TYPE_ABILITY, attackDuration, function()
        user:addMod(xi.mod.ATTACK, -attackIncrease)
    end)

    local healthRestore = user:getMaxHP() * 0.8
    user:setHP(user:getHP() + healthRestore)

end

return abilityObject
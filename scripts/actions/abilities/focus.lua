-----------------------------------
-- Ability: Focus
-- Enhances user's accuracy.
-- Obtained: Monk Level 25
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
local playerTempData = {}  -- Table to store temporary data for players

local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Set a flag to indicate whether Focus is active for the player
    playerTempData[player] = true

    -- Set a timer to remove the flag when Focus expires (assuming 120 seconds duration)
    xi.timers.createTimer(player, "focus_timer", xi.timer.TYPE_ABILITY, 120, function()
        playerTempData[player] = nil  -- Clear the flag when Focus expires
    end)
end

abilityObject.onWeaponSkillAttempt = function(player, target, ability, weaponskill)
    -- Check if Focus is active for the player
    local focusActive = playerTempData[player]

    -- Check if player is engaged with a target and in range
    local engaged = player:isEngaged()
    local inRange = player:isInWeaponSkillRange(target)

    -- Check for a 10% chance
    local chance = math.random()
    local chanceThreshold = 0.1

    -- If Focus is active, player is engaged, and in range, and the weapon skill is Raging Fist, and the chance is met, allow the use of the weapon skill
    if focusActive and engaged and inRange and weaponskill == xi.weapon_skill.RAGING_FIST and chance <= chanceThreshold then
        return true
    else
        return false
    end
end

return abilityObject
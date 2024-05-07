-----------------------------------
-- Ability: Counterstance
-- Increases chance to counter but lowers defense.
-- Obtained: Monk Level 45
-- Recast Time: 5:00
-- Duration: 5:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function adjustAttributes(player)
    -- Increase evasion by 50 and defense by 50
    player:addMod(xi.mod.EVASION, 50)
    player:addMod(xi.mod.DEFENSE, 50)
end

local function removeAttributes(player)
    -- Remove the adjustments made to evasion and defense
    player:addMod(xi.mod.EVASION, -50)
    player:addMod(xi.mod.DEFENSE, -50)
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Adjust attributes for Counterstance
    adjustAttributes(player)

    -- Set up cleanup function to remove attribute adjustments after ability duration
    xi.timers.createTimer(player, "counterstance_cleanup", xi.timer.TYPE_ABILITY, ability:getDuration(), function()
        removeAttributes(player)
    end)
end

return abilityObject
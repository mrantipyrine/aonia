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
    player:addMod(xi.mod.EVASION, 80)
    player:addMod(xi.mod.DEFENSE, 80)
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Adjust attributes for Counterstance
    adjustAttributes(player)
end

return abilityObject

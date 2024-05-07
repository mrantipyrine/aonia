-----------------------------------
-- Ability: Chakra
-- Cures certain status effects and restores a small amount of HP to user.
-- Obtained: Monk Level 35
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function increaseStats(player)
    -- Increase STR and VIT by 30
    player:addMod(xi.mod.STR, 30)
    player:addMod(xi.mod.VIT, 30)
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Increase STR and VIT by 30
    increaseStats(player)
end

return abilityObject


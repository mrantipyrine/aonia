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

local function useBoost(player, target)
    -- Add logic to use the Boost ability
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Calculate TP amount based on a range from 1000 to 3000
    local tpAmount = math.random(1000, 3000)
    
    -- Probability adjustment: Lower probability for higher TP amounts
    local probability = 1 - ((tpAmount - 1000) / 2000) -- Probability decreases linearly from 1000 to 3000

    -- Check if the random probability is met for TP gain
    if math.random() <= probability then
        -- Add TP to the player's current TP count
        player:addTP(tpAmount)
    end

    -- 50% chance to cast Boost job ability on the user
    if math.random() <= 0.5 then
        useBoost(player, player)
    end
end

abilityObject.onWeaponSkillAttempt = function(player, target, ability, weaponskill)
    -- No special checks needed for weapon skill attempts
    return false
end

return abilityObject
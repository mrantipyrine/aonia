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

local function useFocus(player, target)
    -- Add logic to use the Focus ability
end

local function useDodge(player, target)
    -- Add logic to use the Dodge ability
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

    -- 50% chance to use either Focus, Dodge, or Boost job ability
    if math.random() <= 0.5 then
        local abilityIndex = math.random(1, 3) -- Randomly select ability index (1 for Focus, 2 for Dodge, 3 for Boost)
        if abilityIndex == 1 then
            useFocus(player, target)
        elseif abilityIndex == 2 then
            useDodge(player, target)
        else
            useBoost(player, target)
        end
    end
end

abilityObject.onWeaponSkillAttempt = function(player, target, ability, weaponskill)
    -- No special checks needed for weapon skill attempts
    return false
end

return abilityObject
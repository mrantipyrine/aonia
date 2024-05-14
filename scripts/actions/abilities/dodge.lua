-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.
-- Obtained: Monk Level 15
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Set default evasion increase and duration
    local evasionIncrease = player:getMainLvl() * 2
    local evasionDuration = 120
    
    -- Adjust values if main job is MNK
    if player:getMainJob() == xi.job.MNK then
        evasionIncrease = player:getMainLvl() * 5
        evasionDuration = 240
        
        -- Add counter boost status effect
        local counterIncrease = evasionIncrease
        local counterDuration = evasionDuration
        player:addStatusEffect(xi.effect.COUNTER_BOOST, counterIncrease, 3, counterDuration, 0, 10, 1)
    end 

    -- Add evasion boost status effect
    -- player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

    -- Use the Dodge ability
    xi.job_utils.monk.useDodge(player, target, ability)
end 

return abilityObject

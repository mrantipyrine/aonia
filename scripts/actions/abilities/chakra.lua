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

abilityObject.onUseAbility = function(player, target, ability)

    local attIncrease = player:getMainJob() * 5
    local attDuration = 120
    local hasteAmount = player:getMainJob() * 2
    local hasteDuration = 120

    -- Adjust values if main job is MNK
    if player:getMainJob() == xi.job.MNK then
        attIncrease = player:getMainJob() * 10
        attDuration = 240
        hasteAmount = player:getMainJob() * 5
        hasteDuration = 240
    end 
    
    -- Placeholder for when the Fist of Wu Tang is fully implemented
    --if math.random(0, 100) >= 10 then
    --    player:addStatusEffect(xi.effect.HUNDRED_FISTS, 3, 1, 10)
    --end 

    -- Apply haste and attack increase effects
    player:addStatusEffect(xi.effect.HASTE, hasteAmount, 3, hasteDuration, 0, 10, 1)
    player:addMod(xi.mod.ATT, attIncrease, attDuration)

    -- Trigger Chakra ability and return its result
    return xi.job_utils.monk.useChakra(player, target, ability)
end

return abilityObject

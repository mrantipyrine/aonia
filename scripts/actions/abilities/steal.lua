-----------------------------------
-- Ability: Steal
-- Steal items from enemy.
-- Obtained: Thief Level 5
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.thief.checkSteal(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)

    accIncrease = 50
    accDuration = 120 

    evasionIncrease = 20
    evasionDuration = 120 -- 2 minutes in seconds  

    tp = math.random(250, 500)

    if player:getMainJob() == xi.job.TH then
        accIncrease = accIncrease * 2
        attIncrease = accDuration * 2
        tp = tp * 3
    end 

    player:addMod(xi.mod.ACC, accIncrease, 3, accDuration, 3, 10, 1)
    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

    player:addTP(tpGain)

    return xi.job_utils.thief.useSteal(player, target, ability, action)
end

return abilityObject

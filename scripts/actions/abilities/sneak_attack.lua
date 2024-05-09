-----------------------------------
-- Ability: Sneak Attack
-- Deals critical damage when striking from behind.
-- Obtained: Thief Level 15
-- Recast Time: 1:00
-- Duration: 1:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    attIncrease = 20
    attDuration = 120 

    dexIncrease = 10
    dexDuration = 120 -- 2 minutes in seconds  

    tpGain = math.random(250, 500)

    --- maybe into their own if statements instead of one block?
    if player:getMainJob() == xi.job.TH then
        attIncrease = attIncrease * 2
        attIncrease = attDuration * 2

        dexIncrease = dexIncrease * 2
        dexDuration = dexDuration * 2


        local evasionIncrease = 20
        local evasionDuration = 120 -- 2 minutes in seconds

        tpGain = tpGain * 3
    end 

    player:addTP(tpGain)

    player:addMod(xi.mod.ATT, attIncrease, 3, attDuration, 3, 10, 1)
    
    player:addStatusEffect(xi.effect.DEX_BOOST, dexIncrease, 3, dexDuration, 0, 10, 1)
    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

    xi.job_utils.thief.useSneakAttack(player, target, ability)
end

return abilityObject

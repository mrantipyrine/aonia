-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
local abilityObject = {}


abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)

    local evasionIncrease = 10
    local evasionDuration = 60

    if player:getMainJob() == xi.job.WAR then
        evasionIncrease = evasionIncrease * 5
        evasionDuration = evasionDuration * 5
    end 

    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

end

return abilityObject
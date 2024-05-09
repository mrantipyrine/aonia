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

    local maxHP = 100
    local maxHPDuration = 60

    if player:getMainJob() == xi.job.WAR then
        maxHP = math.random(100, 200) * 2 
        --target:delStatusEffect(xi.effect.MAX_HP_BOOST) -- TODO: confirm which versions of HP boost mantra can overwrite
        player:addStatusEffect(xi.effect.MAX_HP_BOOST, 200, 0, 0)
    end 

    --player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

end

return abilityObject
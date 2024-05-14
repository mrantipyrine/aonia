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
    -- Increase evasion by 50 for 2 minutes
    local evasionIncrease = 50
    local duration = 120

    if player:getMainJob() == xi.job.MNK then
        evasionIncrease = 100
        duration = 240
    end

    -- Apply evasion boost
    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, duration)

    -- Increase Max HP and restore 80% missing if main job is MNK
    if player:getMainJob() == xi.job.MNK then
        local maxHPBoost = player:getMaxHP() * 1.5
        player:addStatusEffect(xi.effect.MAX_HP_BOOST, maxHPBoost, 1, duration)
        local lostHP = player:getMaxHP() - player:getHP()
        local hpToRestore = math.floor(lostHP * 0.8)
        player:setHP(player:getHP() + hpToRestore)
    end

    -- Trigger the Dodge ability
    xi.job_utils.monk.useDodge(player, target, ability)
end 

return abilityObject

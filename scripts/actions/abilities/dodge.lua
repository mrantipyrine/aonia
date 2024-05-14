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
    -- Set base evasion increase and duration
    local evasionIncrease = 50
    local duration = 120

    -- Increase evasion and duration if main job is MNK
    if player:getMainJob() == xi.job.MNK then
        evasionIncrease = 100
        duration = 240

        -- Increase Max HP and restore 80% missing HP if main job is MNK
        local maxHPBoost = player:getMaxHP() * math.random(2, 3)
        player:addStatusEffect(xi.effect.MAX_HP_BOOST, maxHPBoost, 1, duration)
        local lostHP = player:getMaxHP() - player:getHP()
        local hpToRestore = math.floor(lostHP * 0.8)
        player:setHP(player:getHP() + hpToRestore)
    end

    -- Apply evasion boost
    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, duration)

    -- Trigger the Dodge ability
    xi.job_utils.monk.useDodge(player, target, ability)
end 

return abilityObject

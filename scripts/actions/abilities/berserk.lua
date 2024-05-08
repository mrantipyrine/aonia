-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    -- Increase HP by 30%
    local maxHP = player:getMaxHP()
    local hpIncrease = math.floor(maxHP * 0.3)
    if hpIncrease > 0 then
        player:addMod(xi.mod.MAX_HP, hpIncrease)
    end

    -- Restore HP to 100%
    player:setHP(maxHP)

    -- Apply the Haste effect
    local hasteDuration = 180 -- 3 minutes in seconds
    player:addStatusEffect(xi.effect.HASTE, 30, 3, hasteDuration, 0, 10, 1)
end

return abilityObject

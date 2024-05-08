-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    -- Increase HP by 50%
    abilityObject.onUseAbility = function(player, target, ability)
        local healthIncrease = target:getMaxHealth() * 0.5
        target:increaseHealth(healthIncrease)
        xi.job_utils.warrior.useBerserk(player, target, ability)
    end
    
    -- Apply the Haste effect
    local hasteDuration = 180 -- 3 minutes in seconds
    player:addStatusEffect(xi.effect.HASTE, 30, 3, hasteDuration, 0, 10, 1)
end

return abilityObject

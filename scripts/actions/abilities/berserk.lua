-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

        -- Grant the attack bonus
        local attackBonus = 30
        local attackDuration = 150 -- 2 minutes and 30 seconds in seconds
        player:addMod(xi.mod.ATTACK, attackBonus)
    
        -- Apply the "Advancing March" effect
        local marchDuration = 150 -- 2 minutes and 30 seconds in seconds
        player:addStatusEffect(xi.effect.ADVANCING_MARCH, 0, 3, marchDuration, 0, 10, 1)
    end
end

return abilityObject

-----------------------------------
-- Ability: Counterstance
-- Increases chance to counter but lowers defense.
-- Obtained: Monk Level 45
-- Recast Time: 5:00
-- Duration: 5:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    --evasionIncrease = 150
    --evasionDuration = 270

    --attackIncrease = 180
    --attackDuration  = 270
    
 
    --player:addMod(xi.mod.ATT, attIncrease, 3, attDuration, 3, 10, 1)
    -- player:addMod(xi.mod.ATT, evasionIncrease, 3, evaDuration, 3, 10, 1)
    if math.random(0, 1) >= 1 then
        xi.weaponskill.RAGING_FISTS()
    end 
    xi.job_utils.monk.useCounterstance(player, target, ability)
end

return abilityObject
-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
local abilityObject = {}

-- Define the EVASION_BOOST effect directly within the ability script
local effectObject = {
    onEffectGain = function(target, effect)
        target:addMod(xi.mod.EVA, effect:getPower())
    end,
    onEffectTick = function(target, effect)
        -- You can add any necessary functionality here if needed
    end,
    onEffectLose = function(target, effect)
        target:delMod(xi.mod.EVA, effect:getPower())
    end
}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)
    -- Apply the EVASION_BOOST effect directly to the target
    target:addEffect(effectObject)
end

return abilityObject
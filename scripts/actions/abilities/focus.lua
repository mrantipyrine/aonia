local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useFocus(player, target, ability)

    -- Add a 5% chance to use Raging Fist weapon skill
    if math.random() <= 0.05 then
        xi.job_utils.monk.useWeaponSkill(player, target, xi.weapon_skill.RAGING_FIST)
    end
end

return abilityObject

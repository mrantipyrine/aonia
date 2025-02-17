-----------------------------------
-- Viper Bite
-- Dagger weapon skill
-- Skill level: 100
-- Deals double damage and Poisons target. Duration of poison varies with TP.
-- Doubles attack and not damage.
-- Despite the animation showing two swings, this is a single-hit weapon skill.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: :
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-- what to do here
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits   = 1
    params.ftpMod    = { 1.0, 1.0, 1.0 }
    params.atkVaries = { 2.0, 2.0, 2.0 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.dex_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if damage > 0 and not target:hasStatusEffect(xi.effect.POISON) then
        local duration = (30 + (tp / 1000 * 60)) * applyResistanceAddEffect(player, target, xi.element.WATER, 0)
        target:addStatusEffect(xi.effect.POISON, 3, 0, duration)    
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject

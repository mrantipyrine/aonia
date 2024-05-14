-----------------------------------
-- Combo
-- Hand-to-Hand weapon skill
-- Skill level: 5
-- Delivers a threefold attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: None
-- Modifiers: STR:20%  DEX:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      2.00
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 3
    params.ftpMod = { 1.0, 1.5, 2.0 }
    params.str_wsc = 0.2
    params.dex_wsc = 0.2

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitfTP = true
        params.ftpMod = { 1.0, 2.4, 3.4 }
        params.str_wsc = 0.3
        params.dex_wsc = 0.3
    end

    -- Calculate HP restoration based on TP
    hpRestore = math.floor(tp / 1000) * 0.2 * player:getMaxHP()
    player:addHP(hpRestore)

    -- Restore HP to the player
   
    if math.random() <= 0.3 then
        player:addTP(1500)
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject

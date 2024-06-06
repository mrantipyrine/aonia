-----------------------------------
-- Spell: Water
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)

    local duration = 180
    local player = caster -- Assuming 'caster' is the player object

    local mainJob = player:getMainJob()
    local subJob = player:getSubJob()
    local mainLvl = player:getMainLvl()
    local effect
    local power

    -- Determine power based on main job and level
    local isMagicJob = mainJob == xi.job.RDM or mainJob == xi.job.BLM or mainJob == xi.job.WHM
    local isMagicSub = subJob == xi.job.RDM or subJob == xi.job.BLM or subJob == xi.job.WHM

    if mainJob == xi.job.RDM or subJob == xi.job.RDM then
        effect = xi.effect.ENWATER
        power = isMagicJob and (mainLvl >= 50 and mainLvl * 4 or mainLvl * 2) or math.floor(mainLvl / 2)

        player:addStatusEffect(effect, power, 3, duration)
    end 
    
    if isMagicJob or isMagicSub then 
        effect = xi.effect.AQUAVEIL
        power = isMagicJob and (mainLvl >= 50 and mainLvl * 8 or mainLvl * 6) or math.floor(mainLvl / 2)

        player:addStatusEffect(effect, power, 3, duration)
    else
        return nil
    end

    if mainJob == xi.job.BLM and math.random() <= 0.20 then
       xi.spells.damage.useDamageSpell(caster, target, spell)
       xi.spells.damage.useDamageSpell(caster, target, spell)
    end 

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject

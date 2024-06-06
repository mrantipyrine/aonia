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

    local effect, power

    if mainJob == xi.job.RDM or xi.job.BLM or mainJob == xi.job.WHM then 
        power = mainLvl * 50
    else 
        power = mainLvl / 4
    end 

    if mainJob == xi.job.RDM or subJob == xi.job.RDM then
        effect = xi.effect.ENWATER
    end 
    if mainJob == xi.job.BLM or mainJob == xi.job.WHM or mainJob == xi.job.RDM or subJob == xi.job.BLM or subJob == xi.job.WHM or subJob == xi.job.RDM then
        effect = xi.effect.AQUAVEIL
    else
        return nil
    end
    
    player:addStatusEffect(effect, power, 3, duration)

    if mainJob == xi.job.BLM and math.random() <= 0.30 then
       xi.spells.damage.useDamageSpell(caster, target, spell)
       xi.spells.damage.useDamageSpell(caster, target, spell)
    end 

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject

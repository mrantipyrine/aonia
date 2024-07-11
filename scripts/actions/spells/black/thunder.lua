-----------------------------------
-- Spell: Water
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 180
    local mainJob = caster:getMainJob()
    local subJob = caster:getSubJob()
    local mainLvl = caster:getMainLvl()
    local effect, power

    -- Determine power based on main job and level
    local isMagicJob = mainJob == xi.job.RDM or mainJob == xi.job.BLM or mainJob == xi.job.WHM
    local isMagicSub = subJob == xi.job.RDM or subJob == xi.job.BLM or subJob == xi.job.WHM

    if mainJob == xi.job.RDM or subJob == xi.job.RDM then
        effect = xi.effect.ENTHUNDER
        power = isMagicJob and (mainLvl >= 50 and mainLvl * 4 or mainLvl * 2) or math.floor(mainLvl / 2)
        caster:addStatusEffect(effect, power, 3, duration)
    end
    
    if isMagicJob or isMagicSub then 
        effect = xi.effect.SHOCK_SPIKES
        power = isMagicJob and (mainLvl >= 50 and mainLvl * 4 or mainLvl * 2) or math.floor(mainLvl / 2)
        caster:addStatusEffect(effect, power, 3, duration)
    else
        return nil
    end

    -- 20% chance to double 
    if caster:hasStatusEffect(xi.effect.SHOCK_SPIKES) then
        local chance = math.random()
        if mainJob == xi.job.BLM then
            if chance <= 0.10 then
                xi.spells.damage.useDamageSpell(caster, target, spell)
                xi.spells.damage.useDamageSpell(caster, target, spell)
            elseif chance <= 0.30 then
                xi.spells.damage.useDamageSpell(caster, target, spell)
            end
        end
    end 

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject

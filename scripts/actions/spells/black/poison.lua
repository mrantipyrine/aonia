-----------------------------------
-- Spell: Poison
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 120
    local mainJob = caster:getMainJob()
    local equippedHead = caster:getEquipID(xi.slot.HEAD)
    local dotdmg

    -- Check if Fungus Hat is equipped
    if equippedHead == 12485 then
        if mainJob == xi.job.BLM then
            dotdmg = 20
        elseif mainJob == xi.job.RDM then
            dotdmg = 15
        else
            return nil
        end

        target:addStatusEffect(xi.effect.BIO, dotdmg, 3, duration, 0, 20, 3)
    end

    return xi.spells.enfeebling.useEnfeeblingSpell(caster, target, spell)
end

return spellObject

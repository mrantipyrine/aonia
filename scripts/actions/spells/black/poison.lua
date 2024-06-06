-----------------------------------
--   Spell: Poison
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)

    local equippedBody = caster:getEquipID(xi.slot.BODY)
    -- Fungus Hat 
    if equippedBody == 12485 then
        local duration = 60
        local dotdmg = 1000
        target:addStatusEffect(xi.effect.BIO, dotdmg, 3, duration, 0, 20, 3)
    end 

    return xi.spells.enfeebling.useEnfeeblingSpell(caster, target, spell)
end


return spellObject

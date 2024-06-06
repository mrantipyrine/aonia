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
        xi.spells.enfeebling.useEnfeeblingSpell(caster, target, bio)
    end 
    --
    --
    return xi.spells.enfeebling.useEnfeeblingSpell(caster, target, spell)
end

return spellObject

-----------------------------------
--   Spell: Poison
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)

    local equippedBody = caster:getEquipID(xi.slot.HEAD)
    -- Fungus Hat 
    if equippedBody == 12485 then
        local dotdmg = 1 
        local skillLvl = caster:getSkillLevel(xi.skill.DARK_MAGIC)
        if skillLvl > 80 then
            dotdmg = 10
        elseif skillLvl > 40 then
            dotdmg = 5
        end
        target:addStatusEffect(xi.effect.BIO, dotdmg, 3, duration, 0, 20, 3)
    end 

    return xi.spells.enfeebling.useEnfeeblingSpell(caster, target, spell)
end


return spellObject

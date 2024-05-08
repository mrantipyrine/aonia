-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function grantAttackBoost(player, weaponType)
    local attackBoostDuration = 60 -- 1 minute in seconds
    local attackBoostAmount = 50 -- Adjust attack boost amount as needed
    player:addMod(xi.mod.ATTACK, attackBoostAmount, attackBoostDuration)
end

local function grantHaste(player)
    local hasteDuration = 60 -- 1 minute in seconds
    local hasteAmount = 30 -- Haste amount (in percentage)
    player:addStatusEffect(xi.effect.HASTE, hasteAmount, 3, hasteDuration, 0, 10, 1)
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Restore 80% of missing health
    local missingHealth = player:getMaxHP() - player:getHP()
    local healthToRestore = math.floor(missingHealth * 0.8)
    player:addHP(healthToRestore)

    -- Check the equipped weapon type
    local weapon = player:getMainWeapon()
    if weapon then
        local weaponType = weapon:getType()
        if weaponType == xi.enum.WEAPON_TYPE_AXE or weaponType == xi.enum.WEAPON_TYPE_SWORD then
            grantAttackBoost(player, weaponType)
        elseif weaponType == xi.enum.WEAPON_TYPE_GREAT_AXE or weaponType == xi.enum.WEAPON_TYPE_TWO_HAND_SWORD then
            grantHaste(player)
        end
    end
end

return abilityObject

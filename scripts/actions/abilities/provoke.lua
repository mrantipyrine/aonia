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
    local mainHandEquipment = player:getEquipment(0) -- Main hand slot index is 0
    if mainHandEquipment then
        local weaponType = mainHandEquipment:getType()
        if weaponType == 1 or weaponType == 2 then -- Axe: 1, Sword: 2
            grantAttackBoost(player, weaponType)
        elseif weaponType == 4 or weaponType == 6 then -- Great Axe: 4, Two Hand Sword: 6
            grantHaste(player)
        end
    end
end

return abilityObject

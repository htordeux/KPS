--[[[
@module Priest Holy Rotation
@author htordeux
@version 7.2
]]--

local spells = kps.spells.priest
local env = kps.env.priest
local HolyWordSanctify = tostring(spells.holyWordSanctify)
local SpiritOfRedemption = tostring(spells.spiritOfRedemption)
local MassDispel = tostring(spells.massDispel)
local AngelicFeather = tostring(spells.angelicFeather)

kps.rotations.register("PRIEST","HOLY",{

    {{"macro"}, 'not target.exists and mouseover.inCombat and mouseover.isAttackable' , "/target mouseover" },
    env.ShouldInterruptCasting,
    env.ScreenMessage,

    {{"macro"}, 'player.hasBuff(spells.spiritOfRedemption) and heal.lowestInRaid.isUnit("player")' , "/cancelaura "..SpiritOfRedemption },
    {{"nested"}, 'player.hasBuff(spells.spiritOfRedemption)' ,{
        {spells.guardianSpirit, 'true' , kps.heal.lowestInRaid},
        {spells.holyWordSerenity, 'true' , kps.heal.lowestInRaid},
        {spells.prayerOfMending, 'true' , kps.heal.lowestInRaid},
        {spells.holyWordSanctify, 'true' },
        {spells.divineHymn, 'true'},
        {spells.flashHeal, 'heal.lowestInRaid.hp < 0.80' , kps.heal.lowestInRaid},
        {spells.renew, 'heal.lowestInRaid.myBuffDuration(spells.renew) < 3' , kps.heal.lowestInRaid},
    }},
    
    -- "Holy Word: Sanctify" and "Holy Word: Serenity" gives buff  "Divinity" 197030 When you heal with a Holy Word spell, your healing is increased by 15% for 8 sec.
    {{"macro"}, 'keys.shift', "/cast [@cursor] "..HolyWordSanctify },
    -- "Dissipation de masse" 32375
    {{"macro"}, 'keys.ctrl', "/cast [@cursor] "..MassDispel },
    
    -- "Fade" 586 "Disparition"
    {spells.fade, 'player.isTarget' },
    -- "Pierre de soins" 5512
    {{"macro"}, 'player.useItem(5512) and player.hp < 0.80' ,"/use item:5512" },
    -- "Prière du désespoir" 19236 "Desperate Prayer"
    {spells.desperatePrayer, 'player.hp < 0.70' , "player" },
    -- "Angelic Feather"
    {{"macro"},'player.isMovingFor(1.2) and not player.hasBuff(spells.angelicFeather)' , "/cast [@player] "..AngelicFeather },
    -- "Body and Mind"
    {spells.bodyAndMind, 'player.isMoving and not player.hasBuff(spells.bodyAndMind)' , "player"},
    -- "Don des naaru" 59544
    {spells.giftOfTheNaaru, 'player.hp < 0.70' , "player" },
    
    -- "Guardian Spirit" 47788  -- track buff in case an other priest have casted guardianSpirit
    {{"nested"}, 'kps.interrupt' ,{
        {spells.guardianSpirit, 'player.hp < 0.30 and not heal.lowestTankInRaid.isUnit("player")' , kps.heal.lowestTankInRaid},
        {spells.guardianSpirit, 'player.hp < 0.30 and not heal.lowestInRaid.isUnit("player")' , kps.heal.lowestInRaid},
        {spells.guardianSpirit, 'heal.lowestTankInRaid.hp < 0.30 and not heal.lowestTankInRaid.hasBuff(spells.guardianSpirit)' , kps.heal.lowestTankInRaid},
        {spells.guardianSpirit, 'heal.lowestTargetInRaid.hp < 0.30 and not heal.lowestTargetInRaid.hasBuff(spells.guardianSpirit)' , kps.heal.lowestTargetInRaid},
        {spells.guardianSpirit, 'heal.lowestInRaid.hp < 0.30 and not heal.lowestInRaid.hasBuff(spells.guardianSpirit)' , kps.heal.lowestInRaid},
    }},

    -- "Holy Word: Serenity"
    {spells.holyWordSerenity, 'player.hp < 0.50' , "player"},
    {spells.holyWordSerenity, 'heal.lowestTankInRaid.hp < 0.50' , kps.heal.lowestTankInRaid},
    {spells.holyWordSerenity, 'heal.lowestTargetInRaid.hp < 0.50' , kps.heal.lowestTargetInRaid},
    {spells.holyWordSerenity, 'heal.lowestInRaid.hp < 0.40' , kps.heal.lowestInRaid},
    {spells.holyWordSerenity, 'heal.hasAbsorptionDebuff ~= nil' , kps.heal.hasAbsorptionDebuff , "ABSORB_HEAL" },
    
    -- "Dispel" "Purifier" 527
    {spells.purify, 'mouseover.isDispellable("Magic")' , "mouseover" },
    {{"nested"},'kps.cooldowns', {
        {spells.purify, 'heal.lowestTankInRaid.isDispellable("Magic")' , kps.heal.lowestTankInRaid},
        {spells.purify, 'heal.lowestTargetInRaid.isDispellable("Magic")' , kps.heal.lowestTargetInRaid},
        {spells.purify, 'player.isDispellable("Magic")' , "player" },
        {spells.purify, 'heal.isMagicDispellable ~= nil' , kps.heal.isMagicDispellable , "DISPEL" },
    }},
    
    -- TRINKETS
    -- "Archive of Faith"
    {{"macro"}, 'not player.isMoving and player.useTrinket(0) and player.hp < threshold()' , "/target player".."\n".."/use 13" },
    {{"macro"}, 'not player.isMoving and player.useTrinket(0) and heal.lowestTankInRaid.hp < threshold()' , "/target "..kps["env"].heal.lowestTankInRaid.unit.."\n".."/use 13" },
    {{"macro"}, 'not player.isMoving and player.useTrinket(0) and heal.lowestInRaid.hp < threshold()' , "/target "..kps["env"].heal.lowestInRaid.unit.."\n".."/use 13" },
    -- "Velen's Future Sight"
    {{"macro"}, 'player.useTrinket(1) and heal.countLossInRange(0.80) >= 3' , "/use 14" },
    -- "Apotheosis" 200183 increasing the effects of Serendipity by 200% and reducing the cost of your Holy Words by 100% -- "Benediction" for raid and "Apotheosis" for party
    {spells.apotheosis, 'player.hasTalent(7,1) and heal.countLossInRange(0.80) * 2 >= heal.maxcountInRange' },

    -- "Surge Of Light"
    {{"nested"}, 'player.hasBuff(spells.surgeOfLight)' , {
        {spells.flashHeal, 'player.hp < 0.80' , "player"},
        {spells.flashHeal, 'heal.lowestTankInRaid.hp < 0.80' , kps.heal.lowestTankInRaid},
        {spells.flashHeal, 'heal.lowestTargetInRaid.hp < 0.80' , kps.heal.lowestTargetInRaid},
        {spells.flashHeal, 'heal.lowestInRaid.hp < 0.80' , kps.heal.lowestInRaid},
        {spells.flashHeal, 'player.myBuffDuration(spells.surgeOfLight) < 3' , kps.heal.lowestInRaid},
    }},

    -- "Soins rapides" 2060
    {spells.bindingHeal, 'not player.isMoving and not heal.lowestInRaid.isUnit("player") and spells.flashHeal.isRecastAt(heal.lowestInRaid.unit)' , kps.heal.lowestInRaid ,"BINDINGHEAL_FLASH_LOWEST" },
    {spells.bindingHeal, 'not player.isMoving and kps.lastCast["name"] == spells.holyWordSanctify and heal.lowestInRaid.hp < 0.80 and not heal.lowestInRaid.isUnit("player")' , kps.heal.lowestInRaid},
    {spells.bindingHeal, 'not player.isMoving and kps.lastCast["name"] == spells.prayerOfHealing and heal.lowestInRaid.hp < 0.80 and not heal.lowestInRaid.isUnit("player")' , kps.heal.lowestInRaid},
    {spells.flashHeal, 'not player.isMoving and kps.lastCast["name"] == spells.holyWordSanctify and heal.lowestInRaid.hp < 0.50' , kps.heal.lowestInRaid},
    {spells.flashHeal, 'not player.isMoving and kps.lastCast["name"] == spells.prayerOfHealing and heal.lowestInRaid.hp < 0.50' , kps.heal.lowestInRaid},
    {spells.flashHeal, 'not player.isMoving and player.hp < 0.55 and heal.lowestInRaid.isUnit("player")' , "player" , "FLASH_PLAYER" },
    {spells.flashHeal, 'not player.isMoving and heal.lowestTankInRaid.hp < 0.55 and heal.lowestInRaid.isUnit(heal.lowestTankInRaid.unit)' , kps.heal.lowestTankInRaid , "FLASH_TANK" },
    {spells.flashHeal, 'heal.hasAbsorptionDebuff ~= nil' , kps.heal.hasAbsorptionDebuff , "ABSORB_HEAL" },

    -- "Light of T'uure" 208065 -- track buff in case an other priest have casted lightOfTuure
    {{spells.lightOfTuure,spells.flashHeal}, 'not player.isMoving and spells.lightOfTuure.cooldown == 0 and heal.lowestTankInRaid.hp > 0.55 and heal.lowestTankInRaid.hp < 0.85 and not heal.lowestTankInRaid.hasBuff(spells.lightOfTuure)' , kps.heal.lowestTankInRaid},
    {{spells.lightOfTuure,spells.flashHeal}, 'not player.isMoving and spells.lightOfTuure.cooldown == 0 and heal.lowestTargetInRaid.hp > 0.55 and heal.lowestTargetInRaid.hp < 0.85 and not heal.lowestTargetInRaid.hasBuff(spells.lightOfTuure)' ,kps.heal.lowestTargetInRaid},

    -- "Prayer of Mending" (Tank only)
    {spells.prayerOfMending, 'not player.isMoving and heal.hasRaidBuffStacks(spells.prayerOfMending) < 10 and not heal.lowestTankInRaid.hasBuff(spells.prayerOfMending)' , kps.heal.lowestTankInRaid },
    {spells.prayerOfMending, 'not player.isMoving and heal.hasRaidBuffStacks(spells.prayerOfMending) < 10 and not heal.lowestTargetInRaid.hasBuff(spells.prayerOfMending)' , kps.heal.lowestTargetInRaid},
    {spells.prayerOfMending, 'not player.isMoving and heal.hasRaidBuffStacks(spells.prayerOfMending) < 10 and not heal.lowestInRaid.hasBuff(spells.prayerOfMending)' , kps.heal.lowestInRaid},

    {{"nested"}, 'kps.defensive and mouseover.isHealable' , {
        {spells.guardianSpirit, 'mouseover.hp < 0.30' , "mouseover" },
        {spells.holyWordSerenity, 'mouseover.hp < 0.50' , "mouseover" },
        {spells.prayerOfHealing, 'not player.isMoving and heal.countLossInRange(0.80) >= 3 and not player.isInRaid' , "mouseover" },
        {spells.prayerOfHealing, 'not player.isMoving and heal.countLossInRange(0.70) >= 5 and player.isInRaid' , "mouseover" }, 
        {spells.lightOfTuure, 'mouseover.hp < 0.70' , "mouseover" },
        {spells.flashHeal, 'not player.isMoving and mouseover.hp < 0.70' , "mouseover" },
        {spells.renew, 'mouseover.myBuffDuration(spells.renew) < 3 and mouseover.hp < 0.90' , "mouseover" },
        {spells.heal, 'not player.isMoving and mouseover.hp < 0.90' , "mouseover" },
    }},
    
    {{"nested"}, 'kps.multiTarget and heal.lowestInRaid.hp > target.hp and heal.lowestInRaid.hp > 0.70' , {
        {spells.holyWordChastise, 'target.isAttackable' , "target" },
        {spells.holyFire, 'target.isAttackable' , "target" },
        {spells.holyNova, 'player.plateCount > 2 and kps.lastCast["name"] == spells.smite and target.distance < 10 and target.isAttackable ' , "target" },
        {spells.holyNova, 'player.isMoving and target.distance < 10 and target.isAttackable ' , "target" },
        {spells.holyNova, 'player.isMoving and targettarget.distance < 10 and targettarget.isAttackable' , "targettarget" },
        {spells.smite, 'not player.isMoving and target.isAttackable', "target" },
        {spells.smite, 'not player.isMoving and targettarget.isAttackable', "targettarget" },
        {spells.smite, 'not player.isMoving and focustarget.isAttackable', "focustarget" },
    }},

    -- "Holy Word: Serenity"
    {spells.holyWordSerenity, 'not player.hasBuff(spells.divinity) and heal.lowestInRaid.hp < 0.60 and heal.countLossInRange(0.80) >= 3 and not player.isInRaid' , kps.heal.lowestInRaid , "SERENITY_COUNT" },
    {spells.holyWordSerenity, 'not player.hasBuff(spells.divinity) and heal.lowestInRaid.hp < 0.60 and heal.countLossInRange(0.80) >= 5 and player.isInRaid' , kps.heal.lowestInRaid , "SERENITY_COUNT" },
    -- "Holy Word: Sanctify"
    {spells.holyWordSanctify, 'mouseover.isHealable and heal.countLossInRange(0.80) >= 3 and not player.isInRaid' },
    {spells.holyWordSanctify, 'mouseover.isHealable and heal.countLossInRange(0.80) >= 5 and player.isInRaid' },
    
    -- "Prayer of Healing" 596 -- A powerful prayer that heals the target and the 4 nearest allies within 40 yards for (250% of Spell power)
    -- "Holy Word: Sanctify" your healing is increased by 15% for 6 sec. Buff  "Divinity" 197030
    -- "Holy Word: Sanctify" augmente les soins de Prière de soins de 6% pendant 15 sec. Buff "Puissance des naaru" 196490
    {{"nested"}, 'not player.isMoving and heal.countLossInRange(0.76) >= 5 and player.isInRaid' ,{
        {spells.prayerOfHealing, 'player.hasBuff(spells.divinity)' , kps.heal.lowestInRaid , "POH_BUFF" },
        {spells.prayerOfHealing, 'player.hasBuff(spells.powerOfTheNaaru)' , kps.heal.lowestInRaid , "POH_BUFF" },
        {spells.prayerOfHealing, 'not spells.prayerOfHealing.isRecastAt(heal.lowestInRaid.unit)', kps.heal.lowestInRaid , "POH_COUNT" },
    }},
    {{"nested"}, 'not player.isMoving and heal.countLossInRange(0.82) >= 3 and not player.isInRaid' ,{
        {spells.prayerOfHealing, 'player.hasBuff(spells.divinity)' , kps.heal.lowestInRaid , "POH_BUFF_COUNT" },
        {spells.prayerOfHealing, 'player.hasBuff(spells.powerOfTheNaaru)' , kps.heal.lowestInRaid , "POH_BUFF_COUNT" },
        {spells.prayerOfHealing, 'not spells.prayerOfHealing.isRecastAt(heal.lowestInRaid.unit)' , kps.heal.lowestInRaid , "POH_COUNT" },
    }},

    -- "Divine Hymn" 64843
    {spells.divineHymn , 'not player.isMoving and heal.countLossInRange(0.60) * 2 >= heal.maxcountInRange and heal.hasRaidBuff(spells.prayerOfMending) ~= nil' },
    -- "Circle of Healing" 204883
    --{spells.circleOfHealing, 'player.isMoving and heal.countLossInRange(0.80) >= 3 and not player.isInRaid' , kps.heal.lowestInRaid},
    --{spells.circleOfHealing, 'player.isMoving and heal.countLossInRange(0.80) >= 5 and player.isInRaid' },
    
    -- "Renew" 139 PARTY
    {spells.renew, 'not player.isInRaid and heal.lowestInRaid.hp < 0.90 and heal.lowestInRaid.hp > threshold() and heal.lowestInRaid.myBuffDuration(spells.renew) < 3 and not heal.lowestInRaid.hasBuff(spells.masteryEchoOfLight)' , kps.heal.lowestInRaid, "RENEW_PARTY" },
    -- "Soins rapides" 2060
    {spells.flashHeal, 'not player.isMoving and heal.lowestInRaid.hp < threshold() and heal.lowestTankInRaid.hp > heal.lowestInRaid.hp' , kps.heal.lowestInRaid , "FLASH_LOWEST" },
    {spells.flashHeal, 'not player.isMoving and heal.lowestTankInRaid.hp < threshold()' , kps.heal.lowestTankInRaid , "FLASH_TANK" },
    -- "Soins de lien" 32546
    {spells.bindingHeal, 'not player.isMoving and not heal.lowestTankInRaid.isUnit("player") and heal.lowestTankInRaid.hp < 0.90 and holyWordSerenityOnCD()' , kps.heal.lowestTankInRaid ,"BINDINGHEAL_SERENITY_TANK" },
    {spells.bindingHeal, 'not player.isMoving and not heal.lowestInRaid.isUnit("player") and heal.lowestInRaid.hp < 0.90 and holyWordSerenityOnCD()' , kps.heal.lowestInRaid , "BINDINGHEAL_SERENITY_LOWEST" },
    {spells.bindingHeal, 'not player.isMoving and not heal.lowestTankInRaid.isUnit("player") and heal.lowestTankInRaid.hp < 0.90 and spells.holyWordSanctify.cooldown > 4  ' , kps.heal.lowestTankInRaid ,"BINDINGHEAL_SANCTIFY_TANK" },
    {spells.bindingHeal, 'not player.isMoving and not heal.lowestInRaid.isUnit("player") and heal.lowestInRaid.hp < 0.90 and spells.holyWordSanctify.cooldown > 4  ' , kps.heal.lowestInRaid ,"BINDINGHEAL_SANCTIFY_LOWEST" },
    {spells.bindingHeal, 'not player.isMoving and not heal.lowestInRaid.isUnit("player") and heal.countLossInRange(0.82) >= 3' , kps.heal.lowestInRaid ,"BINDINGHEAL_LOWEST" },
    -- "Soins" 2060 -- "Renouveau constant" 200153
    {spells.heal, 'not player.isMoving and heal.lowestTankInRaid.hp < 0.90' , kps.heal.lowestTankInRaid, "HEAL_TANK" },
    {spells.heal, 'not player.isMoving and heal.lowestInRaid.hp < 0.90' , kps.heal.lowestInRaid , "HEAL_LOWEST" },
    {spells.heal, 'not player.isMoving and holyWordSerenityOnCD()' , kps.heal.lowestInRaid , "HEAL_SERENITY" },

    -- "Renew" 139
    {spells.renew, 'player.isMoving and heal.lowestTankInRaid.hp < 0.95 and heal.lowestTankInRaid.myBuffDuration(spells.renew) < 3 and not heal.lowestTankInRaid.hasBuff(spells.masteryEchoOfLight)' , kps.heal.lowestTankInRaid, "RENEW_TANK" },
    {spells.renew, 'player.isMoving and heal.lowestInRaid.hp < 0.95 and heal.lowestInRaid.myBuffDuration(spells.renew) < 3 and not heal.lowestInRaid.hasBuff(spells.masteryEchoOfLight)' , kps.heal.lowestInRaid, "RENEW" },

    -- "Nova sacrée" 132157
    {spells.holyNova, 'player.isMoving and target.distance < 10 and target.isAttackable' , "target" },
    {spells.holyNova, 'player.isMoving and targettarget.distance < 10 and targettarget.isAttackable' , "targettarget" },
    -- "Surge Of Light" Your healing spells and Smite have a 8% chance to make your next Flash Heal instant and cost no mana
    {spells.smite, 'not player.isMoving and target.isAttackable', "target" },
    {spells.smite, 'not player.isMoving and targettarget.isAttackable', "targettarget" },
    {spells.smite, 'not player.isMoving and focustarget.isAttackable', "focustarget" },

}
,"Holy heal")

--For Raiding:  Enlightment
--For Dungeons: Trail of Light
--For Raiding:  Light of the Naaru
--For Dungeons: Guardian Angel
--For Raiding:  Piety
--For Dungeons: Surge of Light
--For Raiding:  Divinity
--For Dungeons: Divinity
--For Raiding:  Benediction
--For Dungeons: Apotheosis



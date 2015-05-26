--[[[
@module Spells
@description
Global Spells.
GENERATED BY *printSpells.py* - DO NOT EDIT MANUALLY!
]]--


kps.spells = {}



-- Draenic Potions
kps.spells.potion = {}
kps.spells.potion.draenicIntellectPotion = kps.Spell.fromId(156426) -- Draenic Intellect Potion
kps.spells.potion.draenicAgilityPotion = kps.Spell.fromId(156577) -- Draenic Agility Potion
kps.spells.potion.draenicStrengthPotion = kps.Spell.fromId(156428) -- Draenic Strength Potion


-- Spells which require a select (cast ond ground) - usually AE Spells
kps.spells.ae = {}
kps.spells.ae.bindingShot = kps.Spell.fromId(109248) -- Binding Shot
kps.spells.ae.shadowfury = kps.Spell.fromId(30283) -- Shadowfury
kps.spells.ae.holyWordSanctuary = kps.Spell.fromId(88685) -- Holy Word: Sanctuary
kps.spells.ae.lightwell = kps.Spell.fromId(724) -- Lightwell
kps.spells.ae.massDispel = kps.Spell.fromId(32375) -- Mass Dispel
kps.spells.ae.deathAndDecay = kps.Spell.fromId(43265) -- Death and Decay
kps.spells.ae.powerWordBarrier = kps.Spell.fromId(62618) -- Power Word: Barrier
kps.spells.ae.flamestrike = kps.Spell.fromId(2120) -- Flamestrike
kps.spells.ae.dizzyingHaze = kps.Spell.fromId(115180) -- Dizzying Haze
kps.spells.ae.lightsHammer = kps.Spell.fromId(114158) -- Light&#039;s Hammer
kps.spells.ae.healingRain = kps.Spell.fromId(73921) -- Healing Rain
kps.spells.ae.wildMushroom = kps.Spell.fromId(88747) -- Wild Mushroom
kps.spells.ae.explosiveTrap = kps.Spell.fromId(82939) -- Explosive Trap
kps.spells.ae.iceTrap = kps.Spell.fromId(82941) -- Ice Trap
kps.spells.ae.freezingTrap = kps.Spell.fromId(60192) -- Freezing Trap
kps.spells.ae.summonJadeSerpentStatue = kps.Spell.fromId(115313) -- Summon Jade Serpent Statue
kps.spells.ae.detonateChi = kps.Spell.fromId(115460) -- Detonate Chi
kps.spells.ae.mockingBanner = kps.Spell.fromId(114192) -- Mocking Banner
kps.spells.ae.heroicLeap = kps.Spell.fromId(6544) -- Heroic Leap
kps.spells.ae.freeze = kps.Spell.fromId(33395) -- Freeze
kps.spells.ae.runeOfPower = kps.Spell.fromId(116011) -- Rune of Power
kps.spells.ae.summonBlackOxStatue = kps.Spell.fromId(115315) -- Summon Black Ox Statue
kps.spells.ae.cataclysm = kps.Spell.fromId(152108) -- Cataclysm
kps.spells.ae.earthquake = kps.Spell.fromId(61882) -- Earthquake
kps.spells.ae.rainOfFireChanneled = kps.Spell.fromId(5740) -- Rain of Fire (Channeled)
kps.spells.ae.rainOfFireInstant = kps.Spell.fromId(104233) -- Rain of Fire (Instant)


-- Crowd Control Spells
kps.spells.cc = {}
kps.spells.cc.dominateMind = kps.Spell.fromId(605) -- Dominate Mind
kps.spells.cc.entanglingRoots = kps.Spell.fromId(339) -- Entangling Roots
kps.spells.cc.cyclone = kps.Spell.fromId(33786) -- Cyclone
-- Spell with ID 2637 not found!
kps.spells.cc.freezingTrap = kps.Spell.fromId(1499) -- Freezing Trap
kps.spells.cc.iceTrap = kps.Spell.fromId(13809) -- Ice Trap
kps.spells.cc.snakeTrap = kps.Spell.fromId(34600) -- Snake Trap
kps.spells.cc.polymorph = kps.Spell.fromId(118) -- Polymorph
kps.spells.cc.polymorphBlackCat = kps.Spell.fromId(61305) -- Polymorph (BlackCat)
kps.spells.cc.polymorphPig = kps.Spell.fromId(28272) -- Polymorph (Pig)
kps.spells.cc.polymorphRabbit = kps.Spell.fromId(61721) -- Polymorph (Rabbit)
kps.spells.cc.polymorphTurkey = kps.Spell.fromId(61780) -- Polymorph (Turkey)
kps.spells.cc.polymorphTurtle = kps.Spell.fromId(28271) -- Polymorph (Turtle)
kps.spells.cc.fear = kps.Spell.fromId(5782) -- Fear
kps.spells.cc.howlOfTerror = kps.Spell.fromId(5484) -- Howl of Terror
kps.spells.cc.hex = kps.Spell.fromId(51514) -- Hex


-- Nagrand Combat Mounts
kps.spells.mount = {}
kps.spells.mount.frostwolfWarWolf = kps.Spell.fromId(164222) -- Frostwolf War Wolf
kps.spells.mount.telaariTalbuk = kps.Spell.fromId(165803) -- Telaari Talbuk


-- Bloodlust
kps.spells.bloodlust = {}
kps.spells.bloodlust.bloodlust = kps.Spell.fromId(2825) -- Bloodlust
kps.spells.bloodlust.heroism = kps.Spell.fromId(32182) -- Heroism
kps.spells.bloodlust.timeWarp = kps.Spell.fromId(80353) -- Time Warp
kps.spells.bloodlust.ancientHysteria = kps.Spell.fromId(90355) -- Ancient Hysteria
kps.spells.bloodlust.drumsOfRage = kps.Spell.fromId(146555) -- Drums of Rage


-- Polymorph Spells
kps.spells.poly = {}
kps.spells.poly.polymorph = kps.Spell.fromId(118) -- Polymorph
kps.spells.poly.polymorphBlackCat = kps.Spell.fromId(61305) -- Polymorph (BlackCat)
kps.spells.poly.polymorphPig = kps.Spell.fromId(28272) -- Polymorph (Pig)
kps.spells.poly.polymorphRabbit = kps.Spell.fromId(61721) -- Polymorph (Rabbit)
kps.spells.poly.polymorphTurkey = kps.Spell.fromId(61780) -- Polymorph (Turkey)
kps.spells.poly.polymorphTurtle = kps.Spell.fromId(28271) -- Polymorph (Turtle)
kps.spells.poly.hex = kps.Spell.fromId(51514) -- Hex


-- User-Priorized Spells to ignore
kps.spells.ignore = {}
kps.spells.ignore.autoAttack = kps.Spell.fromId(6603) -- Auto Attack (prevents from toggling on/off)
kps.spells.ignore.roll = kps.Spell.fromId(109132) -- Roll (Unless you want to roll off cliffs, leave this here)
kps.spells.ignore.stormEarthAndFire = kps.Spell.fromId(137639) -- Storm, Earth, and Fire (prevents you from destroying your copy as soon as you make it)
kps.spells.ignore.detox = kps.Spell.fromId(115450) -- Detox (when casting Detox without any dispellable debuffs, the cooldown resets)
kps.spells.ignore.purifyingBrew = kps.Spell.fromId(119582) -- Purifying Brew (having more than 1 chi, this can prevent using it twice in a row)
kps.spells.ignore.chiTorpedo = kps.Spell.fromId(115008) -- Chi Torpedo (same as roll)
kps.spells.ignore.flyingSerpentKick = kps.Spell.fromId(101545) -- Flying Serpent Kick (prevents you from landing as soon as you start 'flying')
kps.spells.ignore.legacyOfTheEmperor = kps.Spell.fromId(115921) -- Legacy of The Emperor
kps.spells.ignore.legacyOfTheWhiteTiger = kps.Spell.fromId(116781) -- Legacy of the White Tiger
kps.spells.ignore.expelHarm = kps.Spell.fromId(115072) -- Expel Harm (below 35%, brewmasters ignores cooldown on this spell)
kps.spells.ignore.breathOfFire = kps.Spell.fromId(115181) -- Breath of Fire (if you are chi capped, this can make you burn all your chi)
kps.spells.ignore.provoke = kps.Spell.fromId(115546) -- Provoke (prevents you from wasting your taunt)
kps.spells.ignore.tigereyeBrew = kps.Spell.fromId(116740) -- Tigereye Brew (prevents you from wasting your stacks and resetting your buff)
kps.spells.ignore.manaTea = kps.Spell.fromId(115294) -- Mana Tea (This isn't an instant cast, but since it only has a 0.5 channeled time, it can triggers twice in the rotation)
kps.spells.ignore.burningRush = kps.Spell.fromId(111400) -- warlock burning rush
kps.spells.ignore.alterTime = kps.Spell.fromId(108978) -- Alter Time
kps.spells.ignore.evocation = kps.Spell.fromId(12051) -- Evocation
kps.spells.ignore.blink = kps.Spell.fromId(1953) -- Blink
kps.spells.ignore.deterrence = kps.Spell.fromId(19263) -- Deterrence
kps.spells.ignore.disengage = kps.Spell.fromId(781) -- Disengage
kps.spells.ignore.iceFloes = kps.Spell.fromId(108839) -- Ice Floes


-- Greater Draenic Flasks
kps.spells.flask = {}
kps.spells.flask.greaterDraenicAgilityFlask = kps.Spell.fromId(156064) -- Greater Draenic Agility Flask
kps.spells.flask.greaterDraenicIntellectFlask = kps.Spell.fromId(156079) -- Greater Draenic Intellect Flask
kps.spells.flask.greaterDraenicStrengthFlask = kps.Spell.fromId(156572) -- Greater Draenic Strength Flask
kps.spells.flask.greaterDraenicStaminaFlask = kps.Spell.fromId(156576) -- Greater Draenic Stamina Flask


-- Battle Rez
kps.spells.battlerez = {}
kps.spells.battlerez.rebirth = kps.Spell.fromId(20484) -- Rebirth
kps.spells.battlerez.raiseAlly = kps.Spell.fromId(61999) -- Raise Ally
kps.spells.battlerez.soulstone = kps.Spell.fromId(20707) -- Soulstone
kps.spells.battlerez.eternalGuardian = kps.Spell.fromId(126393) -- Eternal Guardian
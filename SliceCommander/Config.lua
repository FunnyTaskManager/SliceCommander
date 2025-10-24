local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("SliceCommander")


function SliceCommander:ArrayPos()
	local returnArray = {}
	for key = -20, 20, 1 do
		returnArray[key] = key
	end
	return returnArray
end

local SC_OptionsTable_Sound = {
	name = L["Sound settings"],
	handler = SliceCommander,
	type = "group",
	args = {--Sound settings
		headerSndSoundSetting = {--Slice and Dice
			order = 1,
			name = L["Slice and Dice"],
			type = "header"
		},
		Tick3 = {--Alert - 3 sec
			order = 2,
			name = L["Alert - 3 sec"],
			desc = L["Alert 3 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Tick")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Tick3 = val
			end,
			get = function(info) return SC.SET.Tick3 end
		},
		Tick2 = {--Alert - 2 sec
			order = 4,
			name = L["Alert - 2 sec"],
			desc = L["Alert 2 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Tick")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Tick2 = val
			end,
			get = function(info) return SC.SET.Tick2 end
		},
		Tick1 = {--Alert - 1 sec
			order = 6,
			name = L["Alert - 1 sec"],
			desc = L["Alert 1 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Tick")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Tick1 = val
			end,
			get = function(info) return SC.SET.Tick1 end
		},
		Apply3 = {--Refresh - 3 sec
			order = 3,
			name = L["Refresh - 3 sec"],
			desc = L["Refresh 3 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Apply3 = val
			end,
			get = function(info) return SC.SET.Apply3 end
		},
		Apply2 = {--Refresh - 2 sec
			order = 5,
			name = L["Refresh - 2 sec"],
			desc = L["Refresh 2 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Apply2 = val
			end,
			get = function(info) return SC.SET.Apply2 end
		},
		Apply1 = {--Refresh - 1 sec
			order = 7,
			name = L["Refresh - 1 sec"],
			desc = L["Refresh 1 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Apply1 = val
			end,
			get = function(info) return SC.SET.Apply1 end
		},
		Fail = {--Faillure
			order = 8,
			name = L["Faillure"],
			desc = L["The refresh failled"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Fail")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Fail = val
			end,
			get = function(info) return SC.SET.Fail end
		},

		Applied = {--Applied
			order = 9,
			name = L["Applied"],
			desc = L["Slice and Dice is applied"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Applied = val
			end,
			get = function(info) return SC.SET.Applied end
		},
		Expire = {--Expire
			order = 10,
			name = L["Expired"],
			desc = L["Slice and Dice buff expire"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Fail")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.Expire = val
			end,
			get = function(info) return SC.SET.Expire end
		},
		headerRupSoundSetting = {--Rupture
			order = 11,
			name = L["Rupture"],
			type = "header"
		},
		RUP_Alert = {--Alert
			order = 12,
			name = L["Alert"],
			desc = L["Alert 3, 2 and 1 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Tick")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.RUP_Alert = val
			end,
			get = function(info) return SC.SET.RUP_Alert end
		},
		RUP_Refresh3 = {--Refresh - 3 sec
			order = 13,
			name = L["Alert - 3 sec"],
			desc = L["Alert 3 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.RUP_Refresh3 = val
			end,
			get = function(info) return SC.SET.RUP_Refresh3 end
		},
		RUP_Refresh2 = {--Refresh - 2 sec
			order = 15,
			name = L["Alert - 2 sec"],
			desc = L["Alert 2 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.RUP_Refresh2 = val
			end,
			get = function(info) return SC.SET.RUP_Refresh2 end
		},
		RUP_Refresh1 = {--Refresh - 1 sec
			order = 17,
			name = L["Alert - 1 sec"],
			desc = L["Alert 1 secondes before fade"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.RUP_Refresh1 = val
			end,
			get = function(info) return SC.SET.RUP_Refresh1 end
		},
		RUP_Fail = {--Faillure
			order = 14,
			name = L["Faillure"],
			desc = L["The refresh failled"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Fail")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.RUP_Fail = val
			end,
			get = function(info) return SC.SET.RUP_Fail end
		},
		RUP_Applied = {--Applied
			order = 16,
			name = L["Applied"],
			desc = L["Rupture is applied"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Apply")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.RUP_Applied = val
			end,
			get = function(info) return SC.SET.RUP_Applied end
		},
		RUP_Expire = {--Expire
			order = 18,
			name = L["Expired"],
			desc = L["Rupture debuff expire"],
			type = "select",
			values = function()
				return SliceCommander:ConfigSoundMenuInit("Fail")
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.RUP_Expire = val
			end,
			get = function(info) return SC.SET.RUP_Expire end
		},
	}
}

local SC_OptionsTable_DisplayTimer = {
	name = L["Display settings"],
	handler = SliceCommander,
	type = "group",
	args = {--Display setting
		displayDescription = {
			order = 0,
			name = L["displayDescription"],
			fontSize = "medium",
			type = "description"
		},
		headerEnergySetting = {--Combo Point Settings
			order = 1,
			name = L["Energy bar Settings"],
			type = "header"
		},
		HideEnergy = {--Hide Energy
			order = 2,
			name = L["Hide Energy bar"],
			desc = L["Hide Energy bar"],
			type = "toggle",
			set = function(info,val)
				if val then
					VTimerEnergy:Hide()
				else
					VTimerEnergy:Show()
				end
				SC.SET.HideEnergy = val
			end,
			get = function(info) return SC.SET.HideEnergy end
		},
		ShowBG = {--Show Bandit's Guile
			order = 3,
			name = L["Show Bandit's Guile"],
			desc = L["Show Bandit's Guile"],
			type = "toggle",
			set = function(info,val)
				SC.SET.BanditGuild = val
			end,
			get = function(info) return SC.SET.BanditGuild end
		},
		BGSound = {--Bandit's Guile Sound
			order = 4,
			name = L["Bandit's Guile Sound"],
			desc = L["Bandit's Guile Sound. It has no effect if Bandit's Guile is not display."],
			type = "select",
			values = function()
				local returnArray = { ["None"] = L["None"] }
				for ignore, SoundName in pairs(SliceCommander_SoundMenu['All']) do
					returnArray[SoundName] = SoundName
				end
				return returnArray
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.BGSound = val
			end,
			get = function(info)
				return SC.SET.BGSound
			end
		},
		EnergyTrans = {--Energy bar transparency
			order = 5,
			name = L["Transparency (Full)"],
			desc = L["The fade out value of the energy bar when it is full."],
			type = "range",
			min = 0,
			max = 100,
			step = 1,
			bigStep = 1,
			set = function(info,val)
				SliceCommander:SetPoisonTransparency(val)
				SC.SET.EnergyTrans = val
			end,
			get = function(info) return SC.SET.EnergyTrans end,
			isPercent = false
		},
		Energy1 = {--Energy Marker 1
			order = 6,
			name = L["Energy Marker 1"],
			type = "range",
			min = 0,
			max = 120,
			step = 1,
			bigStep = 1,
			set = function(info,val)
				if val > UnitManaMax("player") then
					val = UnitManaMax("player")
				end
				SC.SET.Energy1 = val
				SliceCommander:Config_OtherVars()
			end,
			get = function(info) return SC.SET.Energy1 end,
			isPercent = false
		},
		Energy2 = {--Energy Marker 2
			order = 7,
			name = L["Energy Marker 2"],
			type = "range",
			min = 0,
			max = 120,
			step = 1,
			bigStep = 1,
			set = function(info,val)
				if val > UnitManaMax("player") then
					val = UnitManaMax("player")
				end
				SC.SET.Energy2 = val
				SliceCommander:Config_OtherVars()
			end,
			get = function(info) return SC.SET.Energy2 end,
			isPercent = false
		},
		Energy3 = {--Energy Marker 3
			order = 8,
			name = L["Energy Marker 3"],
			type = "range",
			min = 0,
			max = 120,
			step = 1,
			bigStep = 1,
			set = function(info,val)
				if val > UnitManaMax("player") then
					val = UnitManaMax("player")
				end
				SC.SET.Energy3 = val
				SliceCommander:Config_OtherVars()
			end,
			get = function(info) return SC.SET.Energy3 end,
			isPercent = false
		},
		headerHealthSetting = {--Health Settings
			order = 10,
			name = L["Health bar Settings"],
			type = "header"
		},
		HEALTHBarShow = {--Show Health
			order = 11,
			name = L["Show Health player bar"],
			desc = L["Show Health player bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.HEALTH = val
			end,
			get = function(info) return SC.SET.display.HEALTH end
		},
		PosHEALTH = {--Health position
			order = 12,
			name = L["Health bar position"],
			desc = L["The place where to display the Health bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.HEALTH = val
			end,
			get = function(info) return SC.SET.Pos.HEALTH end
		},
		MidHealthUnder = {
			order = 13,
			name = L["Sound under 50% health"],
			desc = L["The sound play when your health reach 50% health"],
			type = "select",
			values = function()
				local returnArray = { ["None"] = L["None"] }
				for ignore, SoundName in pairs(SliceCommander_SoundMenu['All']) do
					returnArray[SoundName] = SoundName
				end
				return returnArray
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.MidHealthUnder = val
			end,
			get = function(info)
				return SC.SET.MidHealthUnder
			end
		},
		LowHealthUnder = {
			order = 14,
			name = L["Sound under 35% health"],
			desc = L["The sound play when your health reach 35% health"],
			type = "select",
			values = function()
				local returnArray = { ["None"] = L["None"] }
				for ignore, SoundName in pairs(SliceCommander_SoundMenu['All']) do
					returnArray[SoundName] = SoundName
				end
				return returnArray
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.LowHealthUnder = val
			end,
			get = function(info)
				return SC.SET.LowHealthUnder
			end
		},
		healthPercentage = {
			order = 15,
			name = L["Show HP Value"],
			desc = L["Show HP value rather than health percentage."],
			type = "toggle",
			set = function(info,val)
				SC.SET.healthValue = val
				SliceCommander:PlayerHealth()
			end,
			get = function(info) return SC.SET.healthValue end
		},
		healthCombat = {
			order = 16,
			name = L["Hide out of combat"],
			desc = L["Hide health bar when you are not in combat."],
			type = "toggle",
			set = function(info,val)
				SC.SET.healthHideCombat = val
				SliceCommander:PlayerHealth()
			end,
			get = function(info) return SC.SET.healthHideCombat end
		},
		headerDPSetting = {--Poison bar Settings
			order = 28,
			name = L["Poison bar Settings"],
			type = "header"
		},
		DPBarShow = {--Show Poison
			order = 29,
			name = L["Show Poison bar"],
			desc = L["Display the Poison timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.DP = val
			end,
			get = function(info) return SC.SET.display.DP end
		},
		PosDP = {--Poison position
			order =30,
			name = L["Poison bar position"],
			desc = L["The place where to display the Poison bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.DP = val
			end,
			get = function(info) return SC.SET.Pos.DP end
		},
		EnvenomShow = {--Show Envenom
			order = 31,
			name = L["Show envenom buff"],
			desc = L["The timer bar in default will display the timer of deadly poison on the target."],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.ENV = val
			end,
			get = function(info) return SC.SET.display.ENV end
		},
		PosENV = {--Poison position
			order = 32,
			name = L["Envenom bar position"],
			desc = L["The place where to display the Envenom bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.ENV = val
			end,
			get = function(info) return SC.SET.Pos.ENV end
		},
		PoisonShow = {--Show Poison weapon enchant
			order = 33,
			name = L["Show poison weapon enchant"],
			desc = L["Display two thin poison bar timer on the energy bar corresponding of each temporary enchant on each weapon."],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.Poison = val
			end,
			get = function(info) return SC.SET.display.Poison end
		},
		PoisonTransparencyShow = {--Show Poison weapon enchant
			order = 34,
			name = L["Disable energy bar fade out"],
			desc = L["Disable energy bar and poison bar fade out when poison on weapon(s) is up"],
			type = "toggle",
			set = function(info,val)
				SC.SET.PoisonTransparencyShow = val
			end,
			get = function(info) return SC.SET.PoisonTransparencyShow end
		},
		headerCPSetting = {--Combo Point Settings
			order = 50,
			name = L["Combo Point bar Settings"],
			type = "header"
		},
		CPBarShow = {--Show Combo Point
			order = 51,
			name = L["Show Combo Point bar"],
			desc = L["Display the Combo Point timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.CP = val
			end,
			get = function(info) return SC.SET.display.CP end
		},
		PosCP = {--Combo Point position
			order = 52,
			name = L["Combo Point bar position"],
			desc = L["The place where to display the Combo Point bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.CP = val
			end,
			get = function(info) return SC.SET.Pos.CP end
		},
		CPColor = {--Combo Point Color
			order = 53,
			name = L["Color the entire combo point with DP"],
			desc = L["Color the entire combot point with green when a Deadly poison is associated with the combot point. If tukui border is enable then by default the defualt border is in green."],
			type = "toggle",
			set = function(info,val)
				SC.SET.colorCP = val
			end,
			get = function(info) return SC.SET.colorCP end
		},
		headerToTSetting = {--Tricks of the Trade Settings
			order = 104,
			name = L["Tricks of the Trade Settings"],
			type = "header"
		},
		TotTBarShow = {--Show ToT
			order = 105,
			name = L["Show Tricks of the Trade bar"],
			desc = L["Display the Tricks of the Trade timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.ToT = val
			end,
			get = function(info) return SC.SET.display.ToT end
		},
		PosToT = {--ToT position
			order = 106,
			name = L["Tricks of the Trade bar position"],
			desc = L["The place where to display the Tricks of the Trade bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.ToT = val
			end,
			get = function(info) return SC.SET.Pos.ToT end
		},
		ToTTarget = {
			order = 107,
			name = L["Taget name"],
			desc = L["Write a macro which Tricks the target if it is friendly, if not the target of target. Except if a modifier is down the Tricks will target the player name specify here."],
			type = "input",
			set = function(info,val)
				SC.SET.ToTTarget = val
				SliceCommander:CreateToTMacro()
			end,
			get = function(info) return SC.SET.ToTTarget end
		},
		headerKSSetting = {--Stun bar Settings
			order = 113,
			name = L["Kidney shot bar Settings"],
			type = "header"
		},
		KSBarShow = {--Show Stun
			order = 114,
			name = L["Kidney shot bar"],
			desc = L["Display the Kidney shot timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.KS = val
			end,
			get = function(info) return SC.SET.display.KS end
		},
		PosKS = {--Stun position
			order = 115,
			name = L["Kidney shot bar position"],
			desc = L["The place where to display the Kidney shot bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.KS = val
			end,
			get = function(info) return SC.SET.Pos.KS end
		},
		headerCSSetting = {--Stun bar Settings
			order = 116,
			name = L["Cheap shot bar Settings"],
			type = "header"
		},
		CSBarShow = {--Show Stun
			order = 117,
			name = L["Show Cheap shot bar"],
			desc = L["Display the Cheap shot timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.CS = val
			end,
			get = function(info) return SC.SET.display.CS end
		},
		PosCS = {--Stun position
			order = 118,
			name = L["Cheap shot bar position"],
			desc = L["The place where to display the Cheap shot bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.CS = val
			end,
			get = function(info) return SC.SET.Pos.CS end
		},
		headerRupSetting = {--Blood Settings
			order = 121,
			name = L["Rupture bar Settings"],
			type = "header"
		},
		RupBarShow = {--Show Blood
			order = 122,
			name = L["Show Rupture bar"],
			desc = L["Display the Blood timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.RUP = val
			end,
			get = function(info) return SC.SET.display.RUP end
		},
		PosRUP = {--Blood position
			order = 123,
			name = L["Rupture bar position"],
			desc = L["The place where to display the Rupture bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.RUP = val
			end,
			get = function(info) return SC.SET.Pos.RUP end
		},
		headerGarSetting = {--Blood Settings
			order = 124,
			name = L["Garrote bar Settings"],
			type = "header"
		},
		GarBarShow = {--Show Blood
			order = 125,
			name = L["Show Garrote bar"],
			desc = L["Display the Garrote timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.GAR = val
			end,
			get = function(info) return SC.SET.display.GAR end
		},
		PosGAR = {--Blood position
			order = 126,
			name = L["Garrote bar position"],
			desc = L["The place where to display the Garrote bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.GAR = val
			end,
			get = function(info) return SC.SET.Pos.GAR end
		},
		headerSndSetting = {--Slice and Dice Settings
			order = 127,
			name = L["Slice and Dice Settings"],
			type = "header"
		},
		SnDBarShow = {--Show Slice and Dice
			order = 128,
			name = L["Show Slice and Dice bar"],
			desc = L["Display the Slice and Dice timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.SnD = val
			end,
			get = function(info) return SC.SET.display.SnD end
		},
		PosSnD = {--Slice and Dice position
			order = 129,
			name = L["Slice and Dice bar position"],
			desc = L["The place where to display the Slice and Dice bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.SnD = val
			end,
			get = function(info) return SC.SET.Pos.SnD end
		},
		headerThreatSetting = {--Threat Settings
			order = 133,
			name = L["Threat bar Settings"],
			type = "header"
		},
		THREATBarShow = {--Show Threat
			order = 134,
			name = L["Show Threat bar"],
			desc = L["Display the Threat bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.THREAT = val
			end,
			get = function(info) return SC.SET.display.THREAT end
		},
		PosTHREAT = {--Threat position
			order = 135,
			name = L["Threat bar position"],
			desc = L["The place where to display the Threat bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.THREAT = val
			end,
			get = function(info) return SC.SET.Pos.THREAT end
		},
		ThreatGroupOnly = {--Show Threat bar only in group
			order = 136,
			name = L["Threat bar only in group"],
			desc = L["Display the Threat bar only if you are in a group or a raid"],
			type = "toggle",
			set = function(info,val)
				SC.SET.ThreatGroupOnly = val
			end,
			get = function(info) return SC.SET.ThreatGroupOnly end
		},
		headerARSetting = {--Adrenaline rush Settings
			order = 137,
			name = L["Adrenaline Rush Settings"],
			type = "header"
		},
		ARBarShow = {--Show Adrenaline rush
			order = 138,
			name = L["Show Adrenaline Rush bar"],
			desc = L["Display the Adrenaline rush timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.AR = val
			end,
			get = function(info) return SC.SET.display.AR end
		},
		PosAR = {--Adrenaline rush position
			order = 139,
			name = L["Adrenaline rush bar position"],
			desc = L["The place where to display the Adrenaline rush bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.AR = val
				SC.SET.Pos.ARCD = val
			end,
			get = function(info) return SC.SET.Pos.AR end
		},
		ARCDBarShow = {--Show Adrenaline rush CD
			order = 140,
			name = L["Show Adrenaline Rush bar CD"],
			desc = L["Display the Adrenaline rush cooldown bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.ARCD = val
			end,
			get = function(info) return SC.SET.display.ARCD end
		},
		ARMarioMod = {--Enable Mario mod
			order = 141,
			name = L["Enable Mario mod"],
			desc = L["Enable mario star music during Adrenaline rush buff"],
			type = "toggle",
			set = function(info,val)
				SC.SET.ARMarioMod = val
			end,
			get = function(info) return SC.SET.ARMarioMod end
		},
		headerEASetting = {--Expose Armor Settings
			order = 151,
			name = L["Expose Armor Settings"],
			type = "header"
		},
		EABarShow = {--Show EA
			order = 152,
			name = L["Show Expose Armor bar"],
			desc = L["Display the Expose Armor timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.EA = val
			end,
			get = function(info) return SC.SET.display.EA end
		},
		PosEA = {--EA position
			order = 153,
			name = L["Expose Armor bar position"],
			desc = L["The place where to display the Expose Armor bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.EA = val
			end,
			get = function(info) return SC.SET.Pos.EA end
		},
		headerFESetting = {--Feint Settings
			order = 161,
			name = L["Feint Settings"],
			type = "header"
		},
		FEBarShow = {--Show Feint
			order = 162,
			name = L["Show Feint bar"],
			desc = L["Display the Feint timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.FE = val
			end,
			get = function(info) return SC.SET.display.FE end
		},
		PosFE = {--Feint position
			order = 163,
			name = L["Feint bar position"],
			desc = L["The place where to display the Feint bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.FE = val
				SC.SET.Pos.FECD = val
			end,
			get = function(info) return SC.SET.Pos.FE end
		},
		headerSDSetting = {--Shadow Dance Settings
			order = 181,
			name = L["Shadow Dance Settings"],
			type = "header"
		},
		SDBarShow = {--Show Shadow Dance
			order = 182,
			name = L["Show Shadow Dance bar"],
			desc = L["Display the Shadow Dance timer bar"],
			type = "toggle",
			set = function(info,val)
				SC.SET.display.SD = val
				SC.SET.display.SDCD = val
			end,
			get = function(info) return SC.SET.display.SD end
		},
		PosSD = {--Show Shadow position
			order = 183,
			name = L["Shadow Dance bar position"],
			desc = L["The place where to display the Shadow Dance bar"],
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.SD = val
				SC.SET.Pos.SDCD = val
			end,
			get = function(info) return SC.SET.Pos.SD end
		},
		headerVANSetting = {--VAN Settings
			order = 210,
			name = string.format(L["%s Settings"], SC_SPELL_VAN),
			type = "header"
		},
		HemoVANShow = {--VAN Dance
			order = 211,
			name = string.format(L["Show %s bar"], SC_SPELL_VAN),
			desc = string.format(L["Display the %s timer bar"], SC_SPELL_VAN),
			type = "toggle",
			set = function(info,val)
				SC.SET.display.VAN = val
			end,
			get = function(info) return SC.SET.display.VAN end
		},
		PosVAN = {--VAN position
			order = 212,
			name = string.format(L["%s bar position"], SC_SPELL_VAN),
			desc = string.format(L["The place where to display the %s bar"], SC_SPELL_VAN),
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.VAN = val
			end,
			get = function(info) return SC.SET.Pos.VAN end
		},
		headerCBSetting = {--CB Settings
			order = 220,
			name = string.format(L["%s Settings"], SC_SPELL_CB),
			type = "header"
		},
		HemoCBShow = {--CB Dance
			order = 221,
			name = string.format(L["Show %s bar"], SC_SPELL_CB),
			desc = string.format(L["Display the %s timer bar"], SC_SPELL_CB),
			type = "toggle",
			set = function(info,val)
				SC.SET.display.CB = val
			end,
			get = function(info) return SC.SET.display.CB end
		},
		PosCB = {--CB position
			order = 222,
			name = string.format(L["%s bar position"], SC_SPELL_CB),
			desc = string.format(L["The place where to display the %s bar"], SC_SPELL_CB),
			type = "select",
			values = SliceCommander:ArrayPos(),
			set = function(info,val)
				SC.SET.Pos.CB = val
			end,
			get = function(info) return SC.SET.Pos.CB end
		},
	}
}

local SC_OptionsTable = {
	name = "SliceCommander",
	handler = SliceCommander,
	type = "group",
	args = {--SliceCommander
		IsLocked = {--Lock
			order = 1,
			name = L["Lock"],
			desc = L["Disable Left Click to Move"],
			type = "toggle",
			set = function(info,val)
				SliceCommander:LockCkecked(val)
			end,
			get = function(info) return SC.SET.IsLocked end
		},
		FullTimer = {--Full timer
			order = 2,
			name = L["Full Timer"],
			desc = L["Make timer full bar duration"],
			type = "toggle",
			set = function(info,val) SC.SET.FullTimer = val end,
			get = function(info) return SC.SET.FullTimer end
		},
		PadLatency = {--Latency
			order = 3,
			name = L["Enable Latency"],
			desc = L["Pad Alerts with Latency"],
			type = "toggle",
			set = function(info,val) SC.SET.PadLatency = val end,
			get = function(info) return SC.SET.PadLatency end
		},
		SpellText = {--Spell text
			order = 4,
			name = L["Spell Text"],
			desc = L["Enable spell text on bars"],
			type = "toggle",
			set = function(info,val) SC.SET.SpellText = val end,
			get = function(info) return SC.SET.SpellText end
		},
		GCD = {--Spell text
			order = 5,
			name = L["GCD Bar"],
			desc = L["Enable GCD bar"],
			type = "toggle",
			set = function(info,val) SC.SET.displayGCD = val end,
			get = function(info) return SC.SET.displayGCD end
		},
		headerDisplaySetting = {--CDisplay Setting
			order = 6,
			name = L["Display Setting"],
			type = "header"
		},
		BarTexture = {--Texture
			order = 7,
			name = L["Bar Texture"],
			desc = L["Bar Texture for timer and energy"],
			type = "select",
			values = function()
				local returnArray = {}
				for key, value in pairs(SliceCommander_BarTextures) do
					returnArray[key] = key
				end
				return returnArray
			end,
			set = function(info,val)
				SC.SET.BarTexture = val
				SliceCommander:Config_RetextureBars(SliceCommander:BarTexture())
			end,
			get = function(info) return SC.SET.BarTexture end
		},
		Width = {--Width
			order = 9,
			name = L["Width"],
			desc = L["widthDescription"],
			type = "range",
			min = 125,
			max = 300,
			step = 1,
			bigStep = 5,
			set = function(info,val)
				SC.SET.Width = val
				if SC.SET.skin then
					SliceCommander:ApplySkin(false)
				end
				SliceCommander:SetWidth(val)
				if SC.SET.skin then
					SliceCommander:ApplySkin(true)
				end

			end,
			get = function(info) return SC.SET.Width end,
			isPercent = false
		},
		EnergyHeight = {--Energy bar height
			order = 10,
			name = L["Energy Height"],
			desc = L["Energy Bar Height"],
			type = "range",
			min = 1,
			max = 40,
			step = 1,
			bigStep = 1,
			set = function(info,val)
				SC.SET.EnergyHeight = val
				SliceCommander:SetEnergyHeight(val)
			end,
			get = function(info) return SC.SET.EnergyHeight end,
			isPercent = false
		},
		TimerHeight = {--Timer height
			order = 11,
			name = L["Timer Height"],
			desc = L["Timer Bar Height"],
			type = "range",
			min = 1,
			max = 50,
			step = 1,
			bigStep = 1,
			set = function(info,val)
				SC.SET.TimerHeight = val
				SliceCommander:SetTimersHeight(val)
				SliceCommander:ApplySkin(SC.SET.skin)
			end,
			get = function(info) return SC.SET.TimerHeight end,
			isPercent = false
		},
		BarMargin = {--Margin
			order = 12,
			name = L["Bar Margin"],
			desc = L["Bar Margin"],
			type = "range",
			min = -2,
			max = 10,
			step = 1,
			bigStep = 1,
			set = function(info,val) SC.SET.BarMargin = val end,
			get = function(info) return SC.SET.BarMargin end,
			isPercent = false
		},
		FrameOpacity = {--Opacity
			order = 13,
			name = L["Frame opacity"],
			desc = L["Frame opacity"],
			type = "range",
			min = 25,
			max = 100,
			step = 1,
			bigStep = 1,
			set = function(info,val)
				SliceCommander:FrameOpacity(val)
				SC.SET.FrameOpacity = val
			end,
			get = function(info) return SC.SET.FrameOpacity end,
			isPercent = false
		},
		headerCheckHealth = {--Check health header
			order = 14,
			name = L["Enable 35% backstab warning"],
			type = "header"
		},
		checkHealthSpec1 = {--Check health spec1
			order = 15,
			name = L["Spec 1"],
			desc = L["Check health for Spec 1"],
			type = "toggle",
			set = function(info,val) SC.SET.checkHealthSpec1 = val end,
			get = function(info) return SC.SET.checkHealthSpec1 end
		},
		checkHealthSpec2 = {--Check health spec2
			order = 16,
			name = L["Spec 2"],
			desc = L["Check health for Spec 2"],
			type = "toggle",
			set = function(info,val) SC.SET.checkHealthSpec2 = val end,
			get = function(info) return SC.SET.checkHealthSpec2 end
		},
		HealthUnder = {
			order = 17,
			name = L["Sound under 35% health"],
			desc = L["The sound play when the health reach 35% health"],
			type = "select",
			values = function()
				local returnArray = { ["None"] = L["None"] }
				for ignore, SoundName in pairs(SliceCommander_SoundMenu['All']) do
					returnArray[SoundName] = SoundName
				end
				return returnArray
			end,
			set = function(info,val)
				SliceCommander:SoundTest(val)
				SC.SET.HealthUnder = val
			end,
			get = function(info)
				return SC.SET.HealthUnder
			end
		},
		headerKick = {
			order = 20,
			name = L["Kick Feature"],
			type = "header"
		},
		kickEnable = {
			order = 21,
			name = L["Enable"],
			desc = L["If enable, a warning message will be display when you succeed to interrupts spellcasting."],
			type = "toggle",
			set = function(info,val) SC.SET.kickEnable = val end,
			get = function(info) return SC.SET.kickEnable end
		},
		kickMessage = {
			order = 22,
			name = L["Warning message"],
			desc = L["The warning message which will be display when you kick is successful."],
			type = "input",
			width = "double",
			set = function(info,val) SC.SET.kickMessage = val end,
			get = function(info) return SC.SET.kickMessage end
		},
		headerSkin = {
			order = 30,
			name = L["Border Feature"],
			type = "header"
		},
		skinEnable = {
			order = 31,
			name = L["Enable"],
			desc = L["Add a border like the one on Tukui."],
			type = "toggle",
			set = function(info,val)
				SC.SET.skin = val
				SliceCommander:ApplySkin(val)
				SliceCommander:ShowHideBorder(val)
			end,
			get = function(info) return SC.SET.skin end
		},
		headerSound = {
			order = 40,
			name = L["Sound settings"],
			type = "header"
		},
		SoundCombat = {--Disable sound out of combat
			order = 41,
			name = L["Sound Combat"],
			desc = L["Disable sounds out of combat"],
			type = "toggle",
			set = function(info,val) SC.SET.SoundCombat = val end,
			get = function(info) return SC.SET.SoundCombat end
		},
		SoundVolume = {--Sound Volume
			order = 42,
			name = L["Sound Volume"],
			desc = L["Warning: It will change the sound channel volume. If other sounds are played with this channel it will also change their volume."],
			type = "range",
			min = 0,
			max = 1,
			step = 0.05,
			bigStep = 0.1,
			set = function(info,val)
				SliceCommander:ChangeVolume(val)
			end,
			get = function(info) return tonumber(SliceCommander:GetVolume()) end,
			isPercent = true
		},
	}
}

function SliceCommander:ChangeVolume(val)
	SetCVar("Sound_SFXVolume",val)
end

function SliceCommander:GetVolume()
	return GetCVar("Sound_SFXVolume")
end

function SliceCommander:OnInitialize()
	local _, englishClass = UnitClass("player")
	if englishClass == "ROGUE" then
		SliceCommander:RegisterEvent("PLAYER_REGEN_DISABLED")
		SliceCommander:RegisterEvent("PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED")
		SliceCommander:RegisterEvent("UNIT_COMBO_POINTS")
		SliceCommander:RegisterEvent("PLAYER_TARGET_CHANGED")
		SliceCommander:RegisterEvent("UNIT_HEALTH")
		SliceCommander:RegisterEvent("PLAYER_LOGIN")
		SliceCommander:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		SliceCommander:RegisterEvent("UNIT_SPELLCAST_START")
		SliceCommander:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED","UNIT_SPELLCAST_START")
	else
		SliceCommander:OnDisable()
		return 0
	end
end

function SliceCommander:InitConfigurationTable()
	AceConfig:RegisterOptionsTable("SliceCommander", SC_OptionsTable)
	AceConfig:RegisterOptionsTable("SliceCommander_DisplayTimer", SC_OptionsTable_DisplayTimer)
	AceConfig:RegisterOptionsTable("SliceCommander_Sound", SC_OptionsTable_Sound)

	local SetDefaultOpttion = AceConfigDialog:AddToBlizOptions("SliceCommander","SliceCommander")
	SetDefaultOpttion.default = function() SliceCommander:ResetOptions() end

	SetDefaultOpttion = AceConfigDialog:AddToBlizOptions("SliceCommander_DisplayTimer",L["Display settings"],"SliceCommander")
	SetDefaultOpttion.default = function() SliceCommander:ResetOptions() end

	SetDefaultOpttion = AceConfigDialog:AddToBlizOptions("SliceCommander_Sound",L["Sound settings"],"SliceCommander")
	SetDefaultOpttion.default = function() SliceCommander:ResetOptions() end
end

function SliceCommander:InitFont()
	SC.BarFont1 = SliceCommander:NewFont("VTimerFont2", 8, 0.7, 213/255, 200/255, 184/255)
	SC.BarFont2 = SliceCommander:NewFont("VTimerFont4", 8, 1, 213/255, 200/255, 184/255)
	SC.FontIcon = SliceCommander:NewFont("IconFont", 15, 0.5, 1, 1, 1)
end

function SliceCommander:InitIcon()
	SC.OTHER['BF']['obj'] = SliceCommander:NewIcon("Interface\\Icons\\Ability_Warrior_PunishingBlow", 'BF')--Create Blade fury icon display when BF is enable
	SC.OTHER['HEALTH']['obj'] = SliceCommander:NewIcon("Interface\\Icons\\Ability_BackStab", 'HEALTHICON')--Create Backstab icon display when Target is under 35% HP
end

function SliceCommander:InitPoisonBar()
	SC.OTHER['MH']['obj'] = SliceCommander:NewPoisonFrame("BOTTOMLEFT", "TOPLEFT", 0, -3*SC.V.pxH)--Create MH poison timer
	SC.OTHER['OH']['obj'] = SliceCommander:NewPoisonFrame("TOPLEFT", "BOTTOMLEFT", 0 , 3*SC.V.pxH)--Create OH poison timer
	SC.OTHER['AS']['obj'] = SliceCommander:NewPoisonFrame("BOTTOMLEFT", "TOPLEFT", 0 , 0)--Create Autoshot
	SC.OTHER['AS']['obj']:SetStatusBarColor(180/255, 38/255, 38/255)
end

function SliceCommander:DisableIcon(obj, val)
	obj.iconBackground:SetAlpha(0)--Hide icon
	for i,v in pairs(obj.iconBorder) do
		v:Hide()
	end
	obj:SetMinMaxValues(0, val)--Threat value should be between 0 and val
end

function SliceCommander:InitBar()
	SC.BARS['CP']['obj'] = SliceCommander:CPFrame()--create Combo Point bar
	for i,v in pairs(SC.BARS) do
		if i ~= "CP" then
			SC.BARS[i].obj = SliceCommander:NewFrame(v.color)
		end
	end
	SliceCommander:NewTickArray(SC.BARS['RUP'])--Create Ticks marker for Rupture Bar
	SliceCommander:NewTickArray(SC.BARS['GAR'])--Create Ticks marker for Garrote Bar

	SC.BARS['ARCD']['obj'].icon:SetTexture("Interface\\Icons\\Spell_Shadow_ShadowWordDominate")
	SC.BARS['ToT']['obj'].icon:SetTexture("Interface\\Icons\\Ability_Rogue_TricksOftheTrade")
	SC.BARS['FECD']['obj'].icon:SetTexture("Interface\\Icons\\ability_rogue_feint")
	SC.BARS['SDCD']['obj'].icon:SetTexture("Interface\\Icons\\Ability_Rogue_Shadowdance")
	SC.BARS['VAN']['obj'].icon:SetTexture("Interface\\Icons\\Ability_Vanish")
	SC.BARS['CB']['obj'].icon:SetTexture("Interface\\Icons\\Spell_Ice_Lament")

	SliceCommander:DisableIcon(SC.BARS['THREAT']['obj'], 110)
	SliceCommander:DisableIcon(SC.BARS['HEALTH']['obj'], 100)
end

function SliceCommander:InitConstantValue()
  	local height, width
	height = tonumber(string.match(GetCVar("gxResolution"), "%d+x(%d+)"))
	width = tonumber(string.match(GetCVar("gxResolution"), "(%d+)x+%d"))
	width = width*SC.SET.eyefinity--eyefinity is wired
	SC.LastEnergy = UnitMana('player')
	SC.curCombo = 0
	SC.soundRup = {'RUP_Alert', 'RUP_Alert', 'RUP_Alert'}--Initialise sounds array
	SC.soundSnd = {'Tick1', 'Tick2', 'Tick3' }
	SC.RUP_AlertPending = 3
	SC.SND_AlertPending = 3
	SC.V = {
		['bColor'] = {.1,.1,.1},
		['wColor'] = {.6,.6,.6},
		['pxH'] = UIParent:GetHeight() / height,
		['pxW'] = UIParent:GetWidth() / width,
		['CP'] = {
			[1] = {.33, .63, .33},
			[2] = {.46, .63, .35},
			[3] = {.65, .63, .35},
			[4] = {.65, .42, .31},
			[5] = {.69, .31, .31},
		  	[6] = {.25, .65, .25},
		  	[7] = {.50, .50, .50},
		},
	}
	SC.Backdrop = {
		bgFile="Interface\\AddOns\\SliceCommander\\Images\\solid.tga",
		edgeFile="",
		tile=true, tileSize=1, edgeSize=0,
		insets={left=-1*SC.V.pxW, right=-1*SC.V.pxW, top=-1*SC.V.pxH, bottom=-1*SC.V.pxH}
	}
	SC.Spark = {}
end

function SliceCommander:PLAYER_LOGIN()
	SliceCommander:TestValueOptions()
	SliceCommander:InitConfigurationTable()
	SliceCommander:InitFont()
	SliceCommander:InitConstantValue()
	SliceCommander:CreateCore()
	SliceCommander:InitBar()
	SliceCommander:InitIcon()
	SliceCommander:InitPoisonBar()
	SliceCommander:ApplyConf()
	collectgarbage()
	UpdateAddOnMemoryUsage()
  	print('|cffc14f2cSlice|r|cff40a740Commander|r v'..GetAddOnMetadata("SliceCommander", "Version")..' ('..L["memory use"]..':'..floor(GetAddOnMemoryUsage("SliceCommander"))..' kb)')
end

function SliceCommander:ResetOptions()
	SC.SET = nil
	SliceCommander:TestValueOptions()
	if SC.BARS['SnD']['obj'] ~= 0 then
		SliceCommander:ApplyConf()
		LibStub("AceConfigRegistry-3.0"):NotifyChange("SliceCommander")
	end
end

function SliceCommander:ShowHideBorder(visible)
	if visible then
		for i,v in pairs(VTimerEnergy.border) do
			v:Show()
		end
		for i,v in pairs(SC.BARS) do
			if i ~= "CP" then
				for j,w in pairs(v['obj'].border) do
					w:Show()
				end
				if i ~= "THREAT" and i ~= "HEALTH" then
					for j,w in pairs(v['obj'].iconBorder) do
						w:Show()
					end
				end
			end
		end
		for i,v in pairs(SC.BARS['CP']['obj'].combos) do
			for j,w in pairs(v.border) do
				  w:Show()
			end
		end
	else
		for i,v in pairs(VTimerEnergy.border) do
			v:Hide()
		end
		for i,v in pairs(SC.BARS) do
			if i ~= "CP" then
				for j,w in pairs(v['obj'].border) do
					w:Hide()
				end
				if i ~= "THREAT" and i ~= "CP" and i ~= "HEALTH" then
					for j,w in pairs(v['obj'].iconBorder) do
						w:Hide()
					end
				end
			end
			for i,v in pairs(SC.BARS['CP']['obj'].combos) do
				for j,w in pairs(v.border) do
					  w:Hide()
				end
			end
		end
	end
end

function SliceCommander:ApplyConf()
	SliceCommander:LockCkecked(SC.SET.IsLocked)
	SliceCommander:SetTimersHeight(SC.SET.TimerHeight)
	SliceCommander:SetWidth(SC.SET.Width)
	SliceCommander:SetEnergyHeight(SC.SET.EnergyHeight)
	SliceCommander:Config_RetextureBars(SliceCommander:BarTexture())
	SliceCommander:FrameOpacity(SC.SET.FrameOpacity)
	SliceCommander:SetPoisonTransparency(SC.SET.EnergyTrans)
	SliceCommander:ApplySkin(SC.SET.skin)
	SliceCommander:ShowHideBorder(SC.SET.skin)
end

function SliceCommander:ConfigSoundMenuInit(WhichMenu)
	local returnArray = { ["None"] = L["None"] }
	for ignore, SoundName in pairs(SliceCommander_SoundMenu[WhichMenu]) do
		returnArray[SoundName] = SoundName
	end
	return returnArray
end

function SliceCommander:Config_OtherVars()
	SC.Spark[1]:SetPoint("TOPLEFT", VTimerEnergy, "TOPLEFT", ((SC.SET.Energy1 / UnitManaMax("player") * SC.SET.Width)-1)*SC.V.pxW, 0)
	SC.Spark[2]:SetPoint("TOPLEFT", VTimerEnergy, "TOPLEFT", ((SC.SET.Energy2 / UnitManaMax("player") * SC.SET.Width)-1)*SC.V.pxW, 0)
	SC.Spark[3]:SetPoint("TOPLEFT", VTimerEnergy, "TOPLEFT", ((SC.SET.Energy3 / UnitManaMax("player") * SC.SET.Width)-1)*SC.V.pxW, 0)
end

function SliceCommander:LockCkecked(checked)
	if checked then
		SliceCommander:SetPoisonTransparency(SC.SET.FrameOpacity)
		SliceCommanderFrame:SetAlpha(0)
		SliceCommanderFrame:EnableMouse(false)
		SC.SET.IsLocked = true
	else
		SliceCommander:SetPoisonTransparency(100)
		SliceCommanderFrame:SetAlpha(.5)
		SliceCommanderFrame:EnableMouse(true)
		SC.SET.IsLocked = false
	end
end

function SliceCommander:Config_RetextureBars(texture)
	VTimerEnergy:SetStatusBarTexture(texture)
	for i,v in pairs(SC.BARS) do
		if v['expire'] ~= nil and i ~= 'CP' then
			v['obj']:SetStatusBarTexture(texture)
		end
	end

	for i = 1, 5 do
		SC.BARS['CP']['obj'].combos[i].bg:SetTexture(texture)
	end
end

function SliceCommander:SetWidth(w)
	local h = SC.BARS['RUP']['obj'].iconBackground:GetHeight()/SC.V.pxH
	for i,v in pairs(SC.BARS) do
		if v['expire'] ~= nil and i ~= 'THREAT' and i ~= 'CP' and i ~= "HEALTH" then
			local difW = (w-h-1) - v['obj']:GetWidth()/SC.V.pxW
			v['obj']:SetWidth((w-h-1)*SC.V.pxW)
			for y,w in pairs(v['obj'].border) do
				w:SetWidth(w:GetWidth()+difW*SC.V.pxW)
			end
		end
	end
	local difW = h-VTimerEnergy:GetWidth()/SC.V.pxW
	for i,v in pairs(VTimerEnergy.border) do
		v:SetWidth(v:GetWidth()+difW*SC.V.pxW)
	end
	VTimerEnergy:SetWidth(w*SC.V.pxW)
	SC.OTHER['MH']['obj']:SetWidth(w*SC.V.pxW)
	SC.OTHER['OH']['obj']:SetWidth(w*SC.V.pxW)
	SC.OTHER['AS']['obj']:SetWidth(w*SC.V.pxW)

	SC.BARS['CP']['obj']:SetWidth(w*SC.V.pxW)
	--[[for i,v in pairs(SC.BARS['CP']['obj'].border) do
		v:SetWidth(v:GetWidth()+difW*SC.V.pxW)
	end]]

	SC.BARS['THREAT']['obj']:SetWidth(w*SC.V.pxW)
	for i,v in pairs(SC.BARS['THREAT']['obj'].border) do
		v:SetWidth(v:GetWidth()+difW*SC.V.pxW)
	end

	SC.BARS['HEALTH']['obj']:SetWidth(w*SC.V.pxW)
	for i,v in pairs(SC.BARS['HEALTH']['obj'].border) do
		v:SetWidth(v:GetWidth()+difW*SC.V.pxW)
	end

	local cx = 0
	local pxBorder = 7
	local widthCP = (((w-(pxBorder*4))/5))*SC.V.pxW
	for i = 1, 5 do
		SC.BARS['CP']['obj'].combos[i]:ClearAllPoints()
		SC.BARS['CP']['obj'].combos[i]:SetPoint("TOPLEFT", SC.BARS['CP']['obj'], "TOPLEFT", cx, 0)
		SC.BARS['CP']['obj'].combos[i]:SetPoint("BOTTOMRIGHT", SC.BARS['CP']['obj'], "BOTTOMLEFT", cx + widthCP , 0)
		SC.BARS['CP']['obj'].combos[i]:SetWidth(widthCP)
		cx = cx + widthCP + pxBorder*SC.V.pxW
	end
	SliceCommander:Config_OtherVars()
end

function SliceCommander:SetSizeBorder(frame, border)
	local k = 6
	for i,v in pairs(border) do
		v:SetHeight(frame:GetHeight()+k*SC.V.pxH)
		v:SetWidth(frame:GetWidth()+k*SC.V.pxW)
		k = k-2
	end
end

function SliceCommander:SetEnergyHeight(h)
	SliceCommanderFrame:SetWidth(h*SC.V.pxW)
	SliceCommanderFrame:SetHeight(h*SC.V.pxH)
	VTimerEnergy:SetHeight(h*SC.V.pxH)
	VTimerEnergyTxt:SetHeight(h*SC.V.pxH)
	SliceCommander_Combo:SetHeight(h*SC.V.pxH)
	SC.Spark[1]:SetHeight(h*SC.V.pxH)
	SC.Spark[2]:SetHeight(h*SC.V.pxH)
	SC.Spark[3]:SetHeight(h*SC.V.pxH)
	SliceCommander:SetSizeBorder(VTimerEnergy, VTimerEnergy.border)
	SliceCommander:PlayerHealth()
end

function SliceCommander:SetTimersHeight(h)
	for i,v in pairs(SC.BARS) do
		if v['expire'] ~= nil and i ~= 'CP' then
			v['obj']:SetHeight(h*SC.V.pxH)
			v['obj'].text:SetHeight(h*SC.V.pxH)
			v['obj'].text2:SetHeight(h*SC.V.pxH)
			v['obj'].icon:SetHeight(h*SC.V.pxH)
			v['obj'].icon:SetWidth(h*SC.V.pxW)
			v['obj'].iconBackground:SetHeight((h+2)*SC.V.pxH)
			v['obj'].iconBackground:SetWidth((h+2)*SC.V.pxW)

			SliceCommander:SetSizeBorder(v['obj'], v['obj'].border)
			if i ~= 'THREAT' and i ~= 'HEALTH' then
				SliceCommander:SetSizeBorder(v['obj'].icon, v['obj'].iconBorder)
			end
		end
	end

	for i = 1, 3 do
		SC.BARS['GAR']['tick']['obj'][i]:SetHeight(h*SC.V.pxH)
	end
	for i = 1, 3 do
		SC.BARS['RUP']['tick']['obj'][i]:SetHeight(h*SC.V.pxH)
	end
	SC.BARS['CP']['obj']:SetHeight(h*SC.V.pxH)
	SC.BARS['CP']['obj'].comboText:SetHeight(h*SC.V.pxH)
	for i = 1, 5 do
		SC.BARS['CP']['obj'].combos[i]:SetHeight(h*SC.V.pxH)
	end

	SC.BarFont1:SetFont("Interface\\AddOns\\SliceCommander\\Fonts\\FRIZQT__.TTF", (h-2)*SC.V.pxH)
	SC.BarFont2:SetFont("Interface\\AddOns\\SliceCommander\\Fonts\\FRIZQT__.TTF", (h-2)*SC.V.pxH)
	SliceCommander:SetWidth(SC.SET.Width)
end

function SliceCommander:FrameOpacity(opValue)
	SliceCommander:SetPoisonTransparency(opValue)

	for i,v in pairs(SC.BARS) do
		if v['expire'] ~= nil then
			v['obj']:SetAlpha(opValue/100)
		end
	end

	SC.OTHER['BF']['obj']:SetAlpha(opValue/100)
	SC.OTHER['HEALTH']['obj']:SetAlpha(opValue/100)
end

function SliceCommander:TestValueOptions()
	if SC == nil then
		SC = {}
	end
	if SC.SET == nil or SC.SET.display == nil or SC.SET.Pos == nil then
		SC.SET = { display = {}, Pos = {} }
	end
	if SC.SET.ARSound == nil then
		SC.SET.ARSound = 'Mario'
	end
	if SC.SET.ARSound_Glyphed == nil then
		SC.SET.ARSound_Glyphed = 'Mario glyphed'
	end
	if SC.SET.IsLocked == nil then
		SC.SET.IsLocked = true
	end
	if SC.SET.HideEnergy == nil then
		SC.SET.HideEnergy = false
	end
	if SC.SET.Energy1 == nil then
		SC.SET.Energy1 = 35
	end
	if SC.SET.Energy2 == nil then
		SC.SET.Energy2 = 55
	end
	if SC.SET.Energy3 == nil then
		SC.SET.Energy3 = 25
	end
	if SC.SET.Fail == nil then
		SC.SET.Fail = 'None'
	end
	if SC.SET.Expire == nil then
		SC.SET.Expire = 'None'
	end
	if SC.SET.Tick3 == nil then
		SC.SET.Tick3 = 'None'
	end
	if SC.SET.Tick2 == nil then
		SC.SET.Tick2 = 'None'
	end
	if SC.SET.Tick1 == nil then
		SC.SET.Tick1 = 'None'
	end
	if SC.SET.Applied == nil then
		SC.SET.Applied = 'None'
	end
	if SC.SET.Apply3 == nil then
		SC.SET.Apply3 = 'None'
	end
	if SC.SET.Apply2 == nil then
		SC.SET.Apply2 = 'None'
	end
	if SC.SET.Apply1 == nil then
		SC.SET.Apply1 = 'None'
	end
	if SC.SET.EnergySound1 == nil then
		SC.SET.EnergySound1 = 'None'
	end
	if SC.SET.EnergySound2 == nil then
		SC.SET.EnergySound2 = 'None'
	end
	if SC.SET.EnergySound3 == nil then
		SC.SET.EnergySound3 = 'None'
	end
	if SC.SET.HealthUnder == nil then
		SC.SET.HealthUnder = 'None'
	end
	if SC.SET.RUP_Fail == nil then
		SC.SET.RUP_Fail = 'None'
	end
	if SC.SET.RUP_Expire == nil then
		SC.SET.RUP_Expire = 'None'
	end
	if SC.SET.RUP_Applied == nil then
		SC.SET.RUP_Applied = 'None'
	end
	if SC.SET.RUP_Refresh3 == nil then
		SC.SET.RUP_Refresh3 = 'None'
	end
	if SC.SET.RUP_Refresh2 == nil then
		SC.SET.RUP_Refresh2 = 'None'
	end
	if SC.SET.RUP_Refresh1 == nil then
		SC.SET.RUP_Refresh1 = 'None'
	end
	if SC.SET.RUP_Alert == nil then
		SC.SET.RUP_Alert = 'None'
	end
	if SC.SET.MidHealthUnder == nil then
		SC.SET.MidHealthUnder = 'None'
	end
	if SC.SET.LowHealthUnder == nil then
		SC.SET.LowHealthUnder = 'None'
	end
	if SC.SET.BGSound == nil then
		SC.SET.BGSound = 'None'
	end
	if SC.SET.FotDSound == nil then
		SC.SET.FotDSound = 'None'
	end
	if SC.SET.Width == nil then
		SC.SET.Width = 287
	end
	if SC.SET.PadLatency == nil then
		SC.SET.PadLatency = true
	end
	if SC.SET.SpellText == nil then
		SC.SET.SpellText = true
	end
	if SC.SET.FullTimer == nil then
		SC.SET.FullTimer = false
	end
	if SC.SET.SoundCombat == nil then
		SC.SET.SoundCombat = true
	end
	if SC.SET.EnergyTrans == nil then
		SC.SET.EnergyTrans = 0
	end
	if SC.SET.BarMargin == nil then
		SC.SET.BarMargin = 7
	end
	if SC.SET.PoisonTransparencyShow == nil then
		SC.SET.PoisonTransparencyShow = true
	end
	if SC.SET.checkHealthSpec1 == nil then
		SC.SET.checkHealthSpec1 = true
	end
	if SC.SET.checkHealthSpec2 == nil then
		SC.SET.checkHealthSpec2 = true
	end
	if SC.SET.ThreatGroupOnly == nil then
		SC.SET.ThreatGroupOnly = true
	end
	if SC.SET.EnergyHeight == nil then
		SC.SET.EnergyHeight = 28
	end
	if SC.SET.TimerHeight == nil then
		SC.SET.TimerHeight = 17
	end
	if SC.SET.BarTexture == nil then
		SC.SET.BarTexture = 'Tukui'
	end
	if SC.SET.display.CP == nil then
		SC.SET.display.CP = true
	end
	if SC.SET.display.Poison == nil then
		SC.SET.display.Poison = true
	end
	if SC.SET.display.DP == nil then
		SC.SET.display.DP = false
	end
	if SC.SET.display.ENV == nil then
		SC.SET.display.ENV = true
	end
	if SC.SET.display.EA == nil then
		SC.SET.display.EA = true
	end
	if SC.SET.display.SnD == nil then
		SC.SET.display.SnD = true
	end
	if SC.SET.display.SD == nil then
		SC.SET.display.SD = true
	end
	if SC.SET.display.SDCD == nil then
		SC.SET.display.SDCD = true
	end
	if SC.SET.display.KS == nil then
		SC.SET.display.KS = true
	end
	if SC.SET.display.CS == nil then
		SC.SET.display.CS = true
	end
	if SC.SET.display.ToT == nil then
		SC.SET.display.ToT = true
	end
	if SC.SET.display.RUP == nil then
		SC.SET.display.RUP = true
	end
	if SC.SET.display.GAR == nil then
		SC.SET.display.GAR = true
	end
	if SC.SET.display.THREAT == nil then
		SC.SET.display.THREAT = true
	end
	if SC.SET.display.AR == nil then
		SC.SET.display.AR = true
	end
	if SC.SET.display.ARCD == nil then
		SC.SET.display.ARCD = true
	end
	if SC.SET.display.BF == nil then
		SC.SET.display.BF = true
	end
	if SC.SET.display.FE == nil then
		SC.SET.display.FE = true
	end
	if SC.SET.display.HEALTH == nil then
		SC.SET.display.HEALTH = false
	end
	if SC.SET.display.VAN == nil then
		SC.SET.display.VAN = false
	end
	if SC.SET.display.CB == nil then
		SC.SET.display.CB = false
	end
	if SC.SET.Pos.CP == nil then
		SC.SET.Pos.CP = -1
	end
	if SC.SET.Pos.THREAT == nil then
		SC.SET.Pos.THREAT = -2
	end
	if SC.SET.Pos.CS == nil then
		SC.SET.Pos.CS = -3
	end
	if SC.SET.Pos.KS == nil then
		SC.SET.Pos.KS = -4
	end
	if SC.SET.Pos.HEALTH == nil then
		SC.SET.Pos.HEALTH = -5
	end
	if SC.SET.Pos.SnD == nil then
		SC.SET.Pos.SnD = 2
	end
	if SC.SET.Pos.RUP == nil then
		SC.SET.Pos.RUP = 3
	end
	if SC.SET.Pos.GAR == nil then
		SC.SET.Pos.GAR = 4
	end
	if SC.SET.Pos.ToT == nil then
		SC.SET.Pos.ToT = 5
	end
	if SC.SET.Pos.SD == nil then
		SC.SET.Pos.SD = 6
	end
	if SC.SET.Pos.SDCD == nil then
		SC.SET.Pos.SDCD = 6
	end
	if SC.SET.Pos.DP == nil then
		SC.SET.Pos.DP = 7
	end
	if SC.SET.Pos.ENV == nil then
		SC.SET.Pos.ENV = 8
	end
	if SC.SET.Pos.AR == nil then
		SC.SET.Pos.AR = 9
	end
	if SC.SET.Pos.ARCD == nil then
		SC.SET.Pos.ARCD = 9
	end
	if SC.SET.Pos.EA == nil then
		SC.SET.Pos.EA = 10
	end
	if SC.SET.Pos.FE == nil then
		SC.SET.Pos.FE = 11
	end
	if SC.SET.Pos.FECD == nil then
		SC.SET.Pos.FECD = 11
	end
	if SC.SET.Pos.VAN == nil then
		SC.SET.Pos.VAN = 13
	end
	if SC.SET.Pos.CB == nil then
		SC.SET.Pos.CB = 14
	end
	if SC.SET.FrameOpacity == nil then
		SC.SET.FrameOpacity = 100
	end
	if SC.SET.ARMarioMod == nil then
		SC.SET.ARMarioMod = false
	end
	if SC.SET.kickEnable == nil then
		SC.SET.kickEnable = true
	end
	if SC.SET.kickMessage == nil then
		SC.SET.kickMessage = "Kick successful"
	end
	if SC.SET.point == nil then
		SC.SET.point = "TOP"
	end
	if SC.SET.relativeTo == nil then
		SC.SET.relativeTo = "UIParent"
	end
	if SC.SET.relativePoint == nil then
		SC.SET.relativePoint = "TOP"
	end
	if SC.SET.xOfs == nil then
		SC.SET.xOfs = 0
	end
	if SC.SET.yOfs == nil then
		SC.SET.yOfs = -300
	end
	if SC.SET.skin == nil then
		SC.SET.skin = true
	end
	if SC.SET.eyefinity == nil then
		SC.SET.eyefinity = 1
	end
	if SC.SET.BanditGuild == nil then
		SC.SET.BanditGuild = true
	end
	if SC.SET.healthValue == nil then
		SC.SET.healthValue = false
	end
	if SC.SET.healthHideCombat == nil then
		SC.SET.healthHideCombat = true
	end
	if SC.SET.displayGCD == nil then
		SC.SET.displayGCD = true
	end
	if SC.SET.colorCP == nil then
		SC.SET.colorCP = false
	end
	SliceCommander:InitBarArray()
	SliceCommander:InitOtherArray()
end


function SliceCommander:InitOtherArray()
  	if SC.OTHER == nil then
		SC.OTHER = {}
	end
	if SC.OTHER['BF'] == nil then
		SC.OTHER['BF'] = {
			['obj'] = 0
		}
	end
	if SC.OTHER['HEALTH'] == nil then
		SC.OTHER['HEALTH'] = {
			['obj'] = 0
		}
	end
	if SC.OTHER['MH'] == nil then
		SC.OTHER['MH'] = {
			['obj'] = 0,
			['expire'] = 0,
			['color'] = 0
		}
	end
	if SC.OTHER['OH'] == nil then
		SC.OTHER['OH'] = {
			['obj'] = 0,
			['expire'] = 0,
			['color'] = 0
		}
	end
	if SC.OTHER['AS'] == nil then
		SC.OTHER['AS'] = {
			['obj'] = 0,
			['expire'] = 0,
			['color'] = 0
		}
	end
end

function SliceCommander:InitBarArray()
  	if SC.BARS == nil then
		SC.BARS = {}
	end
	if SC.BARS['HEALTH'] == nil then
		SC.BARS['HEALTH'] = {
			['obj'] = 0,
			['expire'] = 0,
			['color'] = {0, 0, 0}
		}
	end
	if SC.BARS['THREAT'] == nil then
		SC.BARS['THREAT'] = {
			['obj'] = 0,
			['expire'] = 0,
			['color'] = {0, 0, 0}
		}
	end
	if SC.BARS['KS'] == nil then
		SC.BARS['KS'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_KS,
			['type'] = 2,
			['color'] = {.89, .73, .52}
		}
	end
	if SC.BARS['CS'] == nil then
		SC.BARS['CS'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_CS,
			['type'] = 2,
			['color'] = {.89, .73, .2}
		}
	end
	if SC.BARS['EA'] == nil then
		SC.BARS['EA'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_EA,
			['type'] = 2,
			['color'] = {.59, .4, .78}
		}
	end
	if SC.BARS['CP'] == nil then
		SC.BARS['CP'] = {
			['obj'] = 0,
			['expire'] = 0,
			['target'] = '',
			['color'] = 0
		}
	end
	if SC.BARS['SD'] == nil then
		SC.BARS['SD'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_SD,
			['type'] = 1,
			['color'] = {.04, .24, .31}
		}
	end
	if SC.BARS['SDCD'] == nil then
		SC.BARS['SDCD'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_SD,
			['type'] = 1,
			['color'] = {0, .39, .65}
		}
	end
	if SC.BARS['ToT'] == nil then
		SC.BARS['ToT'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_TOT,
			['type'] = 1,
			['color'] = {.3, .3, 1}
		}
	end
	if SC.BARS['SnD'] == nil then
		SC.BARS['SnD'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_SND,
			['type'] = 1,
			['color'] = {.76, .31, .17}
		}
	end
	if SC.BARS['FE'] == nil then
		SC.BARS['FE'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_FE,
			['type'] = 1,
			['color'] = {.15, .42, .68}
		}
	end
	if SC.BARS['FECD'] == nil then
		SC.BARS['FECD'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_FE,
			['type'] = 1,
			['color'] = {.15, .42, .68}
		}
	end
	if SC.BARS['DP'] == nil then
		SC.BARS['DP'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_DP,
			['type'] = 2,
			['count'] = 0,
			['color'] = {.25, .65, .25}
		}
	end
	if SC.BARS['ENV'] == nil then
		SC.BARS['ENV'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_ENV,
			['type'] = 1,
			['color'] = {.25, .65, .25}
		}
	end
	if SC.BARS['RUP'] == nil then
		SC.BARS['RUP'] = {
			['obj'] = 0,
			['expire'] = 0,
			['tick'] = {
				['obj'] = {},
				['expire'] = {},
				['value'] = 2
			},
			['name'] = SC_SPELL_RUP,
			['type'] = 2,
			['color'] = {.71, .15, .15}
		}
	end
	if SC.BARS['GAR'] == nil then
		SC.BARS['GAR'] = {
			['obj'] = 0,
			['expire'] = 0,
			['tick'] = {
				['obj'] = {},
				['expire'] = {},
				['value'] = 3
			},
			['name'] = SC_SPELL_GAR,
			['type'] = 2,
			['color'] = {.71, .15, .15}
		}
	end
	if SC.BARS['AR'] == nil then
		SC.BARS['AR'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_AR,
			['type'] = 1,
			['color'] = {.89, .51, .35}
		}
	end
	if SC.BARS['ARCD'] == nil then
		SC.BARS['ARCD'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_AR,
			['type'] = 1,
			['color'] = {1, .68, .52}
		}
	end
	if SC.BARS['VAN'] == nil then
		SC.BARS['VAN'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_VAN,
			['type'] = 1,
			['color'] = {.42, .46, .51}
		}
	end
	if SC.BARS['CB'] == nil then
		SC.BARS['CB'] = {
			['obj'] = 0,
			['expire'] = 0,
			['name'] = SC_SPELL_CB,
			['type'] = 1,
			['color'] = {.25, .5, .5}
		}
	end
end
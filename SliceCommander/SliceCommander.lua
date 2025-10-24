SliceCommander = LibStub("AceAddon-3.0"):NewAddon("SliceCommander", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("SliceCommander")

function SliceCommander:MoveStart()
	if SC.SET.IsLocked == false then
		SliceCommanderFrame:StartMoving()
	end
end

function SliceCommander:MoveStop()
	if SC.SET.IsLocked == false then
		SliceCommanderFrame:StopMovingOrSizing()
		SliceCommanderFrame:SetUserPlaced(false)
		SC.SET.point, SC.SET.relativeTo, SC.SET.relativePoint, SC.SET.xOfs, SC.SET.yOfs = SliceCommanderFrame:GetPoint()
	end
end

function SliceCommander:BarTexture()
	if SC.SET.BarTexture then
		return SliceCommander_BarTextures[SC.SET.BarTexture]
	else
		return "Interface\\AddOns\\SliceCommander\\Images\\Smooth.tga"
	end

end

function SliceCommander:SoundTest(name)
	if SliceCommander_Sounds[name] and SliceCommander_Sounds[name] ~= "" and SliceCommander_Sounds[name] ~= nil then
		PlaySoundFile( SliceCommander_Sounds[name])
	end
end

function SliceCommander:Sound(saved)
	if isCombat()==1 then
		if SC.SET[saved] then
			if SliceCommander_Sounds[SC.SET[saved]] ~= "" and SliceCommander_Sounds[SC.SET[saved]] ~= nil then
				PlaySoundFile(SliceCommander_Sounds[SC.SET[saved]])
			end
		end
	end
end

function SliceCommander:ChangeAnchor()
	local offSetSize, LastAnchorNeg, LastAnchorNeg, AnchorFromNeg, AnchorToNeg, LastAnchorPos, AnchorFromPos, AnchorToPos
	offSetSize = SC.SET.BarMargin*SC.V.pxH -- other good values, -1, -2
	LastAnchorNeg = VTimerEnergy
	AnchorFromNeg = "BOTTOMRIGHT"
	AnchorToNeg = "TOPRIGHT"
	LastAnchorPos = VTimerEnergy
	AnchorFromPos = "TOPRIGHT"
	AnchorToPos = "BOTTOMRIGHT"
	for i = 1, 20 do
		for j,v in pairs(SC.BARS) do
			if SC.SET.Pos[j] == i and v['expire'] ~= 0 then
				v['obj']:ClearAllPoints()
				v['obj']:SetPoint(AnchorFromPos, LastAnchorPos, AnchorToPos, 0, offSetSize*-1)
				LastAnchorPos = v['obj']
			end
			if SC.SET.Pos[j] == i*-1 and v['expire'] ~= 0 then
				v['obj']:ClearAllPoints()
				v['obj']:SetPoint(AnchorFromNeg, LastAnchorNeg, AnchorToNeg, 0, offSetSize)
				LastAnchorNeg = v['obj']
			end
		end
	end
end

function isCombat()
	if SC.SET.SoundCombat==true then
		if UnitAffectingCombat("player")==1 then
			return 1
		else
			return 0
		end
	else
		return 1
	end
end

function SliceCommander:COMBAT_LOG_EVENT_UNFILTERED(_, event, _, sourceName)
	if event == "SPELL_INTERRUPT" and sourceName == UnitName("player") and SC.SET.kickEnable == true then
		SendChatMessage(SC.SET.kickMessage ,"SAY")
	end
end

function SliceCommander:UNIT_COMBO_POINTS(eventName, unit)
	if unit == "player" then
		SC.BARS['CP']['target'] = UnitGUID("target")
		SliceCommander:TestDPCP()
		SliceCommander:SetComboPts()
		SliceCommander:ChangeAnchor()
	end
end

function SliceCommander:PLAYER_TARGET_CHANGED(eventName, arg1)
	SC.OTHER['HEALTH']['obj']:Hide()
	SliceCommander:TestDPCP()
	SliceCommander:SetComboPts()
	SliceCommander:ChangeAnchor()
end

function SliceCommander:UNIT_SPELLCAST_START(eventName, unit, spell, rank)
	if unit == "player" and SC.SET.displayGCD then
		local start, dur = GetSpellCooldown(spell, rank)
		if dur and dur > 0 and dur <= 1.5 then
			SC.OTHER['AS']['expire'] = start+dur
			SC.OTHER['AS']['obj']:SetMinMaxValues(0, dur)
			SC.OTHER['AS']['obj']:Show()
		end
	end
end

function SliceCommander:SetComboPts()
	local points = GetComboPoints("player")
	if points == 0 then
		if UnitGUID("target") ~= SC.BARS['CP']['target'] then
			return
		end
	end

	SliceCommander_Combo:SetText("")
	SC.BARS['CP']['obj'].comboText:SetText("")
	for i = 1, 5 do
		SC.BARS['CP']['obj'].combos[i]:Hide()
	end
	SC.BARS['CP']['obj']:Hide()
	SC.BARS['CP']['expire'] = 0

	if points ~= 0 then
		SliceCommander_Combo:SetText(points)
		if SC.SET.display.CP == true then
			SC.BARS['CP']['expire'] = points
			SC.BARS['CP']['obj'].comboText:SetText(points)
			for i = 1, points do
				SC.BARS['CP']['obj'].combos[i]:Show()
			end
			SC.BARS['CP']['obj']:Show()
			if points < 3 then
				SC.BarFont2:SetShadowColor(0,0,0, 1)
				SC.BarFont2:SetTextColor(213/255,200/255,184/255,1)
			else
				SC.BarFont2:SetShadowColor(0,0,0, 0)
				SC.BarFont2:SetTextColor(0,0,0, 1)
			end
		end
	end
end

function SliceCommander:OnDisable()
	SliceCommander:UnregisterAllEvents()
end

function SliceCommander:NewFrame(color)
	local f = CreateFrame("StatusBar", nil, UIParent)

	f:SetStatusBarTexture(SliceCommander:BarTexture())
	f:SetValue(0)

	f:SetBackdrop(SC.Backdrop)
	f:SetBackdropBorderColor(unpack(SC.V.wColor))
	f:SetBackdropColor(unpack(SC.V.bColor))
	f:SetFrameStrata("MEDIUM")

	-- text on the right --
	f.text = f:CreateFontString(nil, nil, "GameFontWhite")
	f.text:SetFontObject(SC.BarFont1)
	f.text:SetWidth(120*SC.V.pxW)
	f.text:SetPoint("TOPRIGHT", f, "TOPRIGHT", -5*SC.V.pxW, 0)
	f.text:SetJustifyH("RIGHT")

	f.iconBackground = f:CreateTexture(nil, "BACKGROUND")
	f.iconBackground:SetPoint("RIGHT", f, "LEFT", -2*SC.V.pxW, 0)
	f.iconBackground:SetTexture(unpack(SC.V.bColor))

	f.icon = f:CreateTexture(nil, "OVERLAY")
	f.icon:SetPoint("CENTER", f.iconBackground, "CENTER", 0, 0)
	f.icon:SetTexCoord(.08, .92, .08, .92)

	-- text on the left --
	f.text2 = f:CreateFontString(nil, nil, nil)
	f.text2:SetPoint("TOPLEFT", f, "TOPLEFT", 2*SC.V.pxW, 0)
	f.text2:SetFontObject(SC.BarFont1)
	f.text2:SetWidth(120*SC.V.pxW)
	f.text2:SetPoint("RIGHT", f, "RIGHT", 0, 0)
	f.text2:SetJustifyH("CENTER")

	f:SetStatusBarColor(unpack(color))
	f.border = SliceCommander:tukSkin(f, false)
	f.iconBorder = SliceCommander:tukSkin(f, f.icon)

	return f

end

function SliceCommander:CPFrame()
	local f = CreateFrame("StatusBar", nil, UIParent)

	f.bg = f:CreateTexture(nil, "BACKGROUND")
	f.bg:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
	f.bg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
	f:SetFrameStrata("MEDIUM")

	f.combos = {}

	for i = 1, 5 do
		local combo = CreateFrame("Frame", nil, f)
		combo.bg = combo:CreateTexture(nil, "BACKGROUND")
		combo.bg:SetAllPoints(combo)
		combo.bg:SetTexture("Interface\\AddOns\\SliceCommander\\Images\\solid.tga")
		combo.border = SliceCommander:tukSkin(combo, false)
		combo:Hide()
		f.combos[i] = combo
	end

	f.overlay = CreateFrame("Frame", nil, f)
	f.overlay:SetAllPoints(f)

	f.comboText = f.overlay:CreateFontString(nil, "OVERLAY")
	f.comboText:SetFontObject(SC.BarFont2)
	f.comboText:SetWidth(120*SC.V.pxW)
	f.comboText:SetJustifyH("CENTER")
	f.comboText:SetAllPoints(f.overlay)

	f:Hide()
	return f

end

function SliceCommander:NewPoisonFrame(point, relativePoint, x, y)
	local f = CreateFrame("StatusBar", nil, UIParent)
	f:SetHeight(2*SC.V.pxH)
	f:SetFrameLevel(2)
	f:SetStatusBarTexture(SliceCommander:BarTexture())
	f:SetStatusBarColor(64/255, 167/255, 64/255)
	f:SetMinMaxValues(0, 3600*1000)
	f:SetFrameStrata("MEDIUM")
	f:Hide()
	f:SetBackdrop({
		bgFile="Interface\\AddOns\\SliceCommander\\Images\\solid.tga",
		edgeFile="",
		tile=true, tileSize=1, edgeSize=0,
		insets={left=0, right=0, top=0, bottom=0}
	})
	local r,v,b = unpack(SC.V.bColor)
	f:SetBackdropBorderColor(unpack(SC.V.wColor))
	f:SetBackdropColor(r,v,b,0)
	f:SetPoint(point, VTimerEnergy, relativePoint, x, y)
	return f
end

function SliceCommander:CreateMoveFrame()
	CreateFrame('Frame', 'SliceCommanderFrame', UIParent)
	SliceCommanderFrame:SetToplevel(true)
	SliceCommanderFrame:EnableMouse(false)
	SliceCommanderFrame:SetMovable(true)
	SliceCommanderFrame:SetWidth(28*SC.V.pxW)
	SliceCommanderFrame:SetHeight(28*SC.V.pxH)
	SliceCommanderFrame:SetPoint(SC.SET.point, SC.SET.relativeTo, SC.SET.relativePoint, SC.SET.xOfs, SC.SET.yOfs)
	SliceCommanderFrame:SetBackdrop(SC.Backdrop)
	SliceCommanderFrame:SetBackdropColor(0.7,0.2,0.2,1)
	SliceCommanderFrame:SetScript("OnMouseDown",function () SliceCommander:MoveStart() end)
	SliceCommanderFrame:SetScript("OnMouseUp",function () SliceCommander:MoveStop() end)
	SliceCommanderFrame:SetScript("OnUpdate",function () SliceCommander:OnUpdate() end)
end

function SliceCommander:CreateEnergyFrame()
	CreateFrame('StatusBar', 'VTimerEnergy', UIParent)
	VTimerEnergy:SetSize(200*SC.V.pxW,20*SC.V.pxH)
	VTimerEnergy:SetMinMaxValues(0,100)
	VTimerEnergy:SetPoint('TOPLEFT', SliceCommanderFrame, 'TOPRIGHT', 0, 0)
	VTimerEnergy:SetFrameLevel(1)
	VTimerEnergy:SetMinMaxValues(0,UnitManaMax("player"))
	VTimerEnergy:SetBackdrop(SC.Backdrop)
	VTimerEnergy:SetBackdropBorderColor(unpack(SC.V.wColor))
	VTimerEnergy:SetBackdropColor(unpack(SC.V.bColor))
	VTimerEnergy:SetStatusBarTexture(SliceCommander:BarTexture())
	VTimerEnergy:SetFrameStrata("MEDIUM")
	VTimerEnergy:SetFrameLevel(1)
	VTimerEnergy:SetStatusBarColor(234/255, 234/255, 234/255)
	VTimerEnergy.border = SliceCommander:tukSkin(VTimerEnergy, false)
	if SC.SET.HideEnergy then
		VTimerEnergy:Hide()
	else
		VTimerEnergy:Show()
	end

	VTimerEnergy:CreateFontString('VTimerEnergyTxt', 'OVERLAY', GameFontWhite)
	VTimerEnergyTxt:SetJustifyH("RIGHT")
	VTimerEnergyTxt:SetSize(49*SC.V.pxW,20*SC.V.pxH)
	VTimerEnergyTxt:SetPoint('RIGHT', VTimerEnergy, 'RIGHT', -5*SC.V.pxW, 0)
	VTimerEnergyTxt:SetFontObject(SliceCommander:NewFont("VTimerFont", 17, 0.7, 1, 1, 1))
end

function SliceCommander:CreateComboText()
	VTimerEnergy:CreateFontString('SliceCommander_Combo', 'OVERLAY', GameFontWhite)
	SliceCommander_Combo:SetJustifyH("LEFT")
	SliceCommander_Combo:SetSize(20*SC.V.pxW,20*SC.V.pxH)
	SliceCommander_Combo:SetPoint('TOPLEFT', VTimerEnergy, 'TOPLEFT', 5*SC.V.pxW, 0)
	SliceCommander_Combo:SetFontObject(SliceCommander:NewFont("VTimerFont1O", 17, 0.2, 0, 0, 0))
end

function SliceCommander:CreateSpark()
	for i = 1, 3 do
		SC.Spark[i] = VTimerEnergy:CreateTexture(nil, 'OVERLAY', GameFontWhite)
		SC.Spark[i]:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		SC.Spark[i]:SetBlendMode('ADD')
		SC.Spark[i]:SetSize(5*SC.V.pxW,20*SC.V.pxH)
	end
end

function SliceCommander:CreateCore()
	SliceCommander:CreateMoveFrame()
	SliceCommander:CreateEnergyFrame()
	SliceCommander:CreateComboText()
	SliceCommander:CreateSpark()
end

function SliceCommander:NewTickArray(BAR)
	for i = 1, 3 do
		BAR['tick']['obj'][i] = BAR['obj']:CreateTexture(nil, 'OVERLAY', GameFontWhite)
		BAR['tick']['obj'][i]:SetTexture('Interface\\AddOns\\SliceCommander\\Images\\solid.tga')
		BAR['tick']['obj'][i]:SetWidth(1*SC.V.pxW)
		BAR['tick']['obj'][i]:SetVertexColor(226/255, 226/255, 226/255, 0.75)
	end
end

function SliceCommander:NewIcon(icon, name)
	local f = CreateFrame("Frame" ,name ,VTimerEnergy)
	f:SetPoint("RIGHT", VTimerEnergy, "RIGHT", -50*SC.V.pxW, 0)
	f:SetFrameStrata("HIGH")
	f:SetFrameLevel(1)
	f:SetSize(20*SC.V.pxW, 20*SC.V.pxH)
	f:Hide()
	local fIcon = f:CreateTexture(nil, "OVERLAY")
	fIcon:SetSize(20*SC.V.pxW, 20*SC.V.pxH)
	fIcon:SetPoint("RIGHT", f, "RIGHT", 0, 0)
	fIcon:SetAlpha(1)
	fIcon:SetTexCoord(.08, .92, .08, .92)
	fIcon:SetTexture(icon)
	f.border = SliceCommander:tukSkin(f, fIcon)

	for i,v in pairs(f.border) do
		v:SetFrameStrata("MEDIUM")
		v:SetFrameLevel(i+1)
	end

	f.overlay = CreateFrame('Frame', nil, f)
	f.overlay:SetFrameStrata("HIGH")
	f.overlay:SetFrameLevel(2)
	f.overlay:SetSize(20*SC.V.pxW, 20*SC.V.pxH)
	f.overlay:SetPoint('CENTER', f:GetName(), 'CENTER', 0, 0)
	f.overlay:SetBackdrop({
		bgFile="Interface\\AddOns\\SliceCommander\\Images\\solid.tga",
		edgeFile="",
		tile=true, tileSize=1, edgeSize=0,
		insets={left=0, right=0, top=0, bottom=0}
	})
	f.overlay:SetBackdropColor(0,0,0,.3)
	f.overlay:Hide()

	f.iconTxt = f.overlay:CreateFontString(nil, 'OVERLAY', GameFontWhite)
	f.iconTxt:SetJustifyH("CENTER")
	f.iconTxt:SetJustifyV("MIDDLE")
	f.iconTxt:SetSize(20*SC.V.pxW, 15*SC.V.pxH)
	f.iconTxt:SetPoint('CENTER', f, "CENTER", 2*SC.V.pxW, 0)
	f.iconTxt:SetFontObject(SC.FontIcon)
	f.iconTxt:SetShadowColor(0,0,0,1)
	f.iconTxt:SetShadowOffset(2*SC.V.pxW, -2*SC.V.pxH)

	return f
end

function SliceCommander:NewFont(name, FontSize, aShadow, rColor, gColor, bColor)
	local f = CreateFont(name)
	f:SetFont("Interface\\AddOns\\SliceCommander\\Fonts\\FRIZQT__.TTF", FontSize)
	f:SetShadowColor(0, 0, 0, aShadow)
	f:SetTextColor(rColor, gColor, bColor, 1)
	f:SetShadowOffset(0.8, -0.8)

	return f
end

function SliceCommander:ApplySkin(isApply)
	if isApply then
		for i,v in pairs(SC.BARS) do
			if i ~= 'CP' then
				if i ~= 'THREAT' and i ~= 'HEALTH' then
					v['obj'].iconBackground:ClearAllPoints()
					v['obj'].iconBackground:SetPoint("RIGHT", v['obj'], "LEFT", -6*SC.V.pxW, 0)
					v['obj']:SetWidth(v['obj']:GetWidth()-4*SC.V.pxW)
				end
				SliceCommander:SetSizeBorder(v['obj'], v['obj'].border)
			end
		end
		for i,v in pairs(SC.BARS['CP']['obj'].combos) do
			SliceCommander:SetSizeBorder(v, v.border)
		end
		SliceCommander:SetSizeBorder(VTimerEnergy, VTimerEnergy.border)
	else
		for i,v in pairs(SC.BARS) do
			if i ~= 'CP' then
				if i ~= 'THREAT' and i ~= 'HEALTH' then
					v['obj'].iconBackground:ClearAllPoints()
					v['obj'].iconBackground:SetPoint("RIGHT", v['obj'], "LEFT", -2*SC.V.pxW, 0)
					v['obj']:SetWidth(v['obj']:GetWidth()+4*SC.V.pxW)
				end
				SliceCommander:SetSizeBorder(v['obj'], v['obj'].border)
			end
		end
		for i,v in pairs(SC.BARS['CP']['obj'].combos) do
			SliceCommander:SetSizeBorder(v, v.border)
		end
		SliceCommander:SetSizeBorder(VTimerEnergy, VTimerEnergy.border)
	end
end

function SliceCommander:CreateTextureSkin(frame, w, h, color, level, texture)
	local t = CreateFrame('Frame', nil, frame)
	t:SetBackdrop({
		bgFile="Interface\\AddOns\\SliceCommander\\Images\\solid.tga",
		edgeFile="",
		tile=true, tileSize=1, edgeSize=0,
		insets={left=0, right=0, top=0, bottom=0}
	})
	t:SetFrameLevel(level)
	t:SetFrameStrata("LOW")
	t:SetBackdropColor(unpack(color))
	if texture then
		t:SetPoint("CENTER", texture, "CENTER", 0, 0)
		t:SetSize(texture:GetWidth()+w, texture:GetHeight()+h)
	else
		t:SetPoint("CENTER", frame, "CENTER", 0, 0)
		t:SetSize(frame:GetWidth()+w, frame:GetHeight()+h)
	end
	t:Show()

	return t
end

function SliceCommander:tukSkin(frame, texture)
	return {
		[1] = SliceCommander:CreateTextureSkin(frame, 6*SC.V.pxW, 6*SC.V.pxH, SC.V.bColor, 1, texture),
		[2] = SliceCommander:CreateTextureSkin(frame, 4*SC.V.pxW, 4*SC.V.pxH, SC.V.wColor, 2, texture),
		[3] = SliceCommander:CreateTextureSkin(frame, 2*SC.V.pxW, 2*SC.V.pxH, SC.V.bColor, 3, texture)
	}
end

function SliceCommander:AbilityCDBar(BAR, display)
	if display ~= true then
		if BAR['obj']:IsVisible() then
			SliceCommander:HideBar(BAR)
		end
		return
	end

	local start, duration, enabled = GetSpellCooldown(BAR['name'])
	if start == nil or duration == nil or enabled == nil then--not in this spec
		if BAR['obj']:IsVisible()then--if you respect when a cd is enabled
			BAR['expire'] = 0
			SliceCommander:HideBar(BAR)
		end
		return
	end
	if start ~= 0 and duration > 2 and not BAR['obj']:IsVisible() and enabled == 1 then
		SliceCommander:EnableBar(BAR, duration, BAR['name'].." (CD)", (start+duration))
		return
	end
	if start == 0 and BAR['obj']:IsVisible()then
		BAR['expire'] = 0
		SliceCommander:HideBar(BAR)
		return
	end
	if start == 0 or duration < 2 or enabled ~= 1 then
		return
	end
	BAR['expire'] = (start+duration)
	local x
	if BAR['expire'] > 0 and SC.tNow < BAR['expire'] then
		x = BAR['expire'] - SC.tNow
	else
		x = 0
	end
	BAR['obj']:SetValue(x)
	BAR['obj'].text:SetText(string.format("%0.1f", x))
end

function SliceCommander:EnableBar(BAR, duration, text, expire)
	BAR['expire'] = expire
	if SC.SET.FullTimer == true then
		BAR['obj']:SetMinMaxValues(0, duration)
	else
		BAR['obj']:SetMinMaxValues(0, 6.0)
	end
	if SC.SET.SpellText == true then
		BAR['obj'].text2:SetText(string.format("%s", text))
	else
		BAR['obj'].text2:SetText("")
	end
	BAR['obj']:Show()
	SliceCommander:ChangeAnchor()
end

function SliceCommander:HideBar(BAR)
	BAR['obj'].text:SetText("")
	BAR['expire'] = 0
	SliceCommander:ChangeAnchor()
	BAR['obj']:Hide()
end

function SliceCommander:UpdateBar(BAR, display, soundTable, AlertPending, tick, soundTest)
	local expire, icon, duration, unitCaster, x, _, maxValue, widthSeconde, possible, value, timeLeftOnLast, spellId
	if display ~= true then
		SliceCommander:HideBar(BAR)
		return
	end

	local last = BAR['expire']
	if BAR['type'] == 1 then
		_, _, icon, _, _, duration, BAR['expire'], unitCaster = UnitAura("player", BAR['name'], nil, "PLAYER")
	else
		_, _, icon, _, _, duration, BAR['expire'], unitCaster = UnitDebuff("target", BAR['name'], nil, "PLAYER")
	end

	if unitCaster ~= "player" and unitCaster ~= nil then
		BAR['expire'] = last
	end

	if BAR['expire'] == nil then
		BAR['expire'] = 0
	end
	if SC.tNow == nil then
		SC.tNow = GetTime()
	end
	if BAR['expire'] > 0 and SC.tNow < BAR['expire'] then
		x = BAR['expire'] - SC.tNow
	else
		x = 0
	end
	if x > 0 then
		if BAR['obj']:IsVisible() ~= 1 then
			if soundTable ~= nil and AlertPending == nil  then
				SliceCommander:Sound(soundTable)
			end
			BAR['obj'].icon:SetTexture(icon)
			SliceCommander:EnableBar(BAR, duration, BAR['name'], BAR['expire'])
		end
		BAR['obj']:SetValue(x)
		BAR['obj'].text:SetText(string.format("%0.1f", x))
		if tick ~= false then
			_, maxValue = BAR['obj']:GetMinMaxValues()
			widthSeconde = (BAR['obj']:GetWidth())/maxValue
			possible = 0
			value = (x % tick)
			if value == 0 then
				value = tick
			end
			for i = 1,3 do
				if value > x or value > maxValue then
					BAR['tick']['obj'][i]:Hide()
				else
					BAR['tick']['obj'][i]:Show()
					BAR['tick']['obj'][i]:SetPoint("LEFT", BAR['obj'], "LEFT", widthSeconde*value, 0)
					value = value+tick
				end
			end
		end

		if soundTest == 1 and BAR['expire'] > last then
			if last == 0 and BAR['expire'] > 0 then
				SliceCommander:Sound("Applied")
			else
				timeLeftOnLast = last - GetTime()
				if timeLeftOnLast <= 1 then
					SliceCommander:Sound("Apply1")
				else
					if timeLeftOnLast <= 2 then
						SliceCommander:Sound("Apply2")
					else
						SliceCommander:Sound("Apply3")
					end
				end
			end
		elseif soundTest == 2 and BAR['expire'] > last then
			if last == 0 and BAR['expire'] > 0 then
				SliceCommander:Sound("RUP_Applied")
			else
				timeLeftOnLast = last - GetTime()
				if timeLeftOnLast <= 1 then
					SliceCommander:Sound("RUP_Refresh1")
				else
					if timeLeftOnLast <= 2 then
						SliceCommander:Sound("RUP_Refresh2")
					else
						SliceCommander:Sound("RUP_Refresh3")
					end
				end
			end
		elseif soundTest == 3 and BAR['expire'] > last then
			if SC.SET.ARMarioMod then
				if duration > 16 then
					SliceCommander:Sound('ARSound_Glyphed')
				else
					SliceCommander:Sound('ARSound')
				end
			end
			BAR['cd'] = true
			BAR['obj']:SetStatusBarColor(226/255, 130/255, 90/255)
		end
	else
		if BAR['obj']:IsVisible() then
			if soundTest == 1 then
				if UnitAffectingCombat("player") then
					SliceCommander:Sound("Fail")
				else
					SliceCommander:Sound("Expire")
				end
			elseif soundTest == 2 then
				if UnitAffectingCombat("player") then
					SliceCommander:Sound("RUP_Fail")
				else
					SliceCommander:Sound("RUP_Expire")
				end
			end

			if tick ~= false then
				for i = 1,3 do
					BAR['tick']['expire'][i] = 0
				end
			end
			SliceCommander:HideBar(BAR)
		end
	end
	if AlertPending ~= nil then
		if x > 0 then
			if x <= 3 then
				if AlertPending == 3 then
					SliceCommander:Sound(soundTable[3])
					AlertPending = 2
				else
					if x <= 2 then
						if AlertPending == 2 then
							SliceCommander:Sound(soundTable[2])
							AlertPending = 1
						else
							if x <= 1 then
								if AlertPending == 1 then
									SliceCommander:Sound(soundTable[1])
									AlertPending = 0
								end
							end
						end
					end
				end
			else
				AlertPending = 3
			end
		end
		return AlertPending
	end
end

function SliceCommander:CPColor(name, count, isMine)
	local nameUID = UnitGUID("target")
	local cpColor, borderColor
	if not nameUID then
		nameUID = UnitGUID("player")
	end
	for i = 1, 5 do
	  	if SC.BARS['CP']['target'] ~= nameUID then
			--noinspection ArrayElementZero
			cpColor = SC.V.CP[7]--Gray
		else
			if name and isMine == "player" and i <= count and SC.SET.colorCP then
				cpColor = SC.V.CP[6]--Green
			else
				cpColor = SC.V.CP[i]--Yellow
			end
		end
		if name and isMine == "player" and i <= count then
			borderColor = SC.V.CP[6]--Green
		else
			borderColor = SC.V.wColor--White
		end
		SC.BARS['CP']['obj'].combos[i].bg:SetVertexColor(unpack(cpColor))
	  	SC.BARS['CP']['obj'].combos[i].border[2]:SetBackdropColor(unpack(borderColor))
	end
end

function SliceCommander:PoisonBar()
	if SC.SET.display.Poison == true then
		local _, mainHandExpiration, _, _, offHandExpiration = GetWeaponEnchantInfo()
		if mainHandExpiration ~= nil then
			SC.OTHER['MH']['obj']:SetValue(mainHandExpiration)
			SC.OTHER['MH']['obj']:Show()
		else
			SC.OTHER['MH']['obj']:Hide()
		end
		if offHandExpiration ~= nil then
			SC.OTHER['OH']['obj']:SetValue(offHandExpiration)
			SC.OTHER['OH']['obj']:Show()
		else
			SC.OTHER['OH']['obj']:Hide()
		end
	else
		SC.OTHER['MH']['obj']:Hide()
		SC.OTHER['OH']['obj']:Hide()
	end
end

function SliceCommander:CreateToTMacro()
	if not UnitAffectingCombat("player") then
		DeleteMacro("SliceCommander_ToT")
		CreateMacro("SliceCommander_ToT", 1, "/cast [@"..SC.SET.ToTTarget..",modifier:alt] [help] [@targettarget, help][@none,@="..SC.SET.ToTTarget.."] "..SC_SPELL_TOT, 1, 1)
	end
end

function SliceCommander:UNIT_HEALTH()
	if (GetActiveTalentGroup(false,false) == 1 and SC.SET.checkHealthSpec1)
		or (GetActiveTalentGroup(false,false) == 2 and SC.SET.checkHealthSpec2) then
		local HP, maxHP, pourcentHP
		HP = UnitHealth("target")
		maxHP = UnitHealthMax("target")
		if HP ~= 0 and maxHP ~= 0 and not UnitIsFriend("player","target")then
			pourcentHP = (HP / maxHP) * 100
			if pourcentHP <= 35 then
				if not SC.OTHER['HEALTH']['obj']:IsVisible() then
					SliceCommander:Sound("HealthUnder")
					SC.OTHER['HEALTH']['obj']:Show()
				end
			else
				if SC.OTHER['HEALTH']['obj']:IsVisible() then
					SC.OTHER['HEALTH']['obj']:Hide()
				end
			end
		else
			if SC.OTHER['HEALTH']['obj']:IsVisible() then
				SC.OTHER['HEALTH']['obj']:Hide()
			end
		end
	end
	SliceCommander:PlayerHealth()
end

function SliceCommander:PlayerHealth()
	if SC.SET.display.HEALTH then
		local HP, maxHP, pourcentHP, hexCol, rCol, gCol, bCol, healthText
		HP = UnitHealth("player")
		maxHP = UnitHealthMax("player")
		if maxHP ~= 0 then
			pourcentHP = (HP / maxHP) * 100
		else
			pourcentHP = 0
		end
		if maxHP == nil then
			maxHP = 0
		end
		if HP == nil then
			HP = 0
		end

		if SC.BARS['HEALTH']['expire'] > 35 and pourcentHP < 35 then
			SliceCommander:Sound("LowHealthUnder")
		elseif SC.BARS['HEALTH']['expire'] > 50 and pourcentHP < 50 then
			SliceCommander:Sound("MidHealthUnder")
		end
		hexCol = (100-pourcentHP)*(255/100)
		rCol = hexCol
		gCol = 255-hexCol
		if rCol > 210 then
			rCol = 210
		end
		if rCol < 50 then
			rCol = 50
		end
		if gCol > 210 then
			gCol = 210
		end
		if gCol < 50 then
			gCol = 50
		end
		bCol = 50

		if SC.SET.healthHideCombat and not UnitAffectingCombat("player") then
			if SC.BARS['HEALTH']['obj']:IsVisible() then
				SC.BARS['HEALTH']['obj']:Hide()
			end
			SC.BARS['HEALTH']['expire'] = 0
		else
			if not SC.BARS['HEALTH']['obj']:IsVisible() then
				SC.BARS['HEALTH']['obj']:Show()
			end
			SC.BARS['HEALTH']['expire'] = pourcentHP
		end
		SC.BARS['HEALTH']['obj']:SetValue(pourcentHP)
		if SC.SET.healthValue then
			healthText = HP
		else
			healthText = string.format("%0.1f", pourcentHP)
		end
		SC.BARS['HEALTH']['obj'].text:SetText(healthText)
		SC.BARS['HEALTH']['obj']:SetStatusBarColor(rCol/255,gCol/255,bCol/255)
	else
		SC.BARS['HEALTH']['expire'] = 0
		SC.BARS['HEALTH']['obj']:Hide()
	end
end

function SliceCommander:PLAYER_REGEN_DISABLED()
	SliceCommander:PlayerHealth()
end


function SliceCommander:TargetThreat()
    local hexCol, rCol, gCol, bCol
	if SC.SET.display.THREAT == false or (SC.SET.ThreatGroupOnly and GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0) then
		SC.BARS['THREAT']['expire'] = 0
	else
		local isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation("player", "target")
		if rawthreatpct == nil then
			SC.BARS['THREAT']['expire'] = 0
		else
			hexCol = rawthreatpct *(255/110)
			rCol = hexCol-45
			gCol = 255-hexCol+50
			if isTanking == 1 then
				rCol = 210
				gCol = 50
				rawthreatpct = 100
			end
			if rCol > 210 then
				rCol = 210
			end
			if rCol < 50 then
				rCol = 50
			end
			if gCol > 210 then
				gCol = 210
			end
			if gCol < 50 then
				gCol = 50
			end
			bCol = 50
			SC.BARS['THREAT']['expire'] = rawthreatpct
		end
	end
	if SC.BARS['THREAT']['expire'] == 0 then
		SC.BARS['THREAT']['obj']:Hide()
	else
		SC.BARS['THREAT']['obj']:SetValue(SC.BARS['THREAT']['expire'])
		SC.BARS['THREAT']['obj'].text:SetText(string.format("%0.1f", SC.BARS['THREAT']['expire']))
		SC.BARS['THREAT']['obj']:SetStatusBarColor(rCol/255,gCol/255,bCol/255)
		SC.BARS['THREAT']['obj']:Show()
		SliceCommander:ChangeAnchor()
	end
end

function SliceCommander:SetPoisonTransparency(value)
	VTimerEnergy:SetAlpha(value/100)
	SC.OTHER['MH']['obj']:SetAlpha(value/100)
	SC.OTHER['OH']['obj']:SetAlpha(value/100)
	SC.OTHER['AS']['obj']:SetAlpha(value/100)
end

function SliceCommander:TestBF()
	if SC.SET.display.BF then
		local name = UnitAura("player", SC_SPELL_BF, nil, "PLAYER")
		if name and not SC.OTHER['BF']['obj']:IsVisible() then
			SC.OTHER['BF']['obj']:Show()
		elseif not name and SC.OTHER['BF']['obj']:IsVisible() then
			SC.OTHER['BF']['obj']:Hide()
		end
	else
		SC.OTHER['BF']['obj']:Hide()
	end
end

function SliceCommander:TestDPCP()
	local name, _, _, count, _, _, _, isMine = UnitDebuff("target", SC_SPELL_DP, nil, "PLAYER")
	if count == nil then
		count = 0
	end
	SliceCommander:CPColor(name, count, isMine)
end

function SliceCommander:Latency()
	local _
	SC.tNow = GetTime()
	if (SC.SET.PadLatency) then
		 _, _, SC.lag = GetNetStats()
		SC.tNow = SC.tNow + (SC.lag*2/1000)
	end
end

function SliceCommander:Energy()
	VTimerEnergy:SetValue(UnitMana("player"))
	VTimerEnergy:SetMinMaxValues(0,UnitManaMax("player"))
	VTimerEnergyTxt:SetText(VTimerEnergy:GetValue())

	if SC.LastEnergy < SC.SET.Energy2 and UnitMana('player') >= SC.SET.Energy2 then
		SliceCommander:Sound("EnergySound2")
	elseif SC.LastEnergy < SC.SET.Energy1 and UnitMana('player') >= SC.SET.Energy1 then
		SliceCommander:Sound("EnergySound1")
	elseif SC.LastEnergy < SC.SET.Energy3 and UnitMana('player') >= SC.SET.Energy3 then
		SliceCommander:Sound("EnergySound3")
	end
	SC.LastEnergy = UnitMana('player')

	if UnitManaMax("player") == UnitMana('player') and UnitAffectingCombat("player")~=1 then
		if SC.SET.display.Poison == true
		and SC.SET.PoisonTransparencyShow == true
		and ((SC.OTHER['MH']['obj']:GetValue() ~= 0
				and SC.OTHER['MH']['obj']:GetValue() ~= nil)
			or (SC.OTHER['OH']['obj']:GetValue() ~= 0
				and SC.OTHER['OH']['obj']:GetValue() ~= nil) ) then
			SliceCommander:SetPoisonTransparency(SC.SET.FrameOpacity)
		else
			SliceCommander:SetPoisonTransparency(SC.SET.EnergyTrans)
		end
	else
		SliceCommander:SetPoisonTransparency(SC.SET.FrameOpacity)
	end
end

function SliceCommander:GCD()
  	if not SC.OTHER['AS']['expire'] then return SC.OTHER['AS']['obj']:Hide() end

	local val = (SC.OTHER['AS']['expire']-GetTime())
	if val < 0 then
		SC.OTHER['AS']['expire'] = nil
	else
		SC.OTHER['AS']['obj']:SetValue(val)
	end
end

function SliceCommander:OnUpdate()
	SliceCommander:Energy()--Update energy value and play sound if necessary
	SliceCommander:Latency()--Update timer reference and latency

	SliceCommander:GCD()--Update Poisons Bar
	SliceCommander:PoisonBar()--Update Poisons Bar
	SliceCommander:TargetThreat()--Update Threat Bar

	SC.RUP_AlertPending = SliceCommander:UpdateBar(SC.BARS['RUP'], SC.SET.display.RUP, SC.soundRup, SC.RUP_AlertPending, 2, 2)--Update Rupture Bar
	SC.SND_AlertPending = SliceCommander:UpdateBar(SC.BARS['SnD'], SC.SET.display.SnD, SC.soundSnd, SC.SND_AlertPending, false, 1)--Update SnD Bar
	SliceCommander:UpdateBar(SC.BARS['GAR'], SC.SET.display.GAR, nil, nil, 3, 0)--Update Garrote Bar
	SliceCommander:UpdateBar(SC.BARS['EA'], SC.SET.display.EA, nil, nil, false, 0)--Update Expose Armor Bar
	SliceCommander:UpdateBar(SC.BARS['FE'], SC.SET.display.FE, nil, nil, false, 0)--Update Feint Bar
	SliceCommander:UpdateBar(SC.BARS['KS'], SC.SET.display.KS, nil, nil, false, 0)--Update Kidney Shot Bar
	SliceCommander:UpdateBar(SC.BARS['CS'], SC.SET.display.CS, nil, nil, false, 0)--Update Cheap Shot Bar
	SliceCommander:UpdateBar(SC.BARS['DP'], SC.SET.display.DP, nil, nil, false, 0)--Update Deadly poison Bar
	SliceCommander:UpdateBar(SC.BARS['ENV'], SC.SET.display.ENV, nil, nil, false, 0)--Update Envenom Bar
	SliceCommander:UpdateBar(SC.BARS['AR'], SC.SET.display.AR, nil, nil, false, 3)--Update Adrenaline rush Bar
	SliceCommander:UpdateBar(SC.BARS['SD'], SC.SET.display.SD, nil, nil, false, 0)--Update ShadowDance Bar
	SliceCommander:AbilityCDBar(SC.BARS['ToT'], SC.SET.display.ToT)--Update ToT CD bar
	SliceCommander:AbilityCDBar(SC.BARS['ARCD'], SC.SET.display.ARCD)--Update Adrenaline rush CD bar
	SliceCommander:AbilityCDBar(SC.BARS['FECD'], SC.SET.display.FE)--Update Feint CD bar
	SliceCommander:AbilityCDBar(SC.BARS['SDCD'], SC.SET.display.SDCD)--Update ShadowDance CD bar
	SliceCommander:AbilityCDBar(SC.BARS['VAN'], SC.SET.display.VAN)--Update Vanish CD bar
	SliceCommander:AbilityCDBar(SC.BARS['CB'], SC.SET.display.CB)--Update Vanish CD bar
	SliceCommander:TestDPCP()--Update Combo point color
	SliceCommander:TestBF()--Update BF bar display
end

--MAIN
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI

SLASH_SLICECOMMANDER1 = "/slicecommander"
SLASH_SLICECOMMANDER2 = "/sc"
SlashCmdList["SLICECOMMANDER"] = function(msg, editbox)
	local command, rest = msg:match("^(%S*)%s*(.-)$")
	if command == "lock" or command == "unlock" then
		SliceCommander:LockCkecked(not SC.SET.IsLocked)
	elseif command == "eyefinity" and tonumber(rest) then
		SC.SET.eyefinity = rest
		ReloadUI()
	elseif command == "tot" and tostring(rest) then
		SC.SET.ToTTarget = rest
		SliceCommander:CreateToTMacro()
		print(L['Macro update'])
	else
		InterfaceOptionsFrame_OpenToCategory("SliceCommander")
	end
end


	-- backported lua interpretation of ButtonFrameTemplate
	-- https://github.com/tekkub/wow-ui-source/blob/live/SharedXML/SharedUIPanelTemplates.xml#L600
	-- usage:
	--		ButtonFrameTemplate:SetParent(f)
	--		ButtonFrameTemplate:SetPoint('TOPLEFT', f)
	--		ButtonFrameTemplate:SetPoint('BOTTOMRIGHT', f)

	ButtonFrameTemplate = CreateFrame('Frame', 'ButtonFrameTemplate', UIParent)

	ButtonFrameTemplate.CloseButton = CreateFrame('Button', 'ButtonFrameTemplateCloseButton', ButtonFrameTemplate, 'UIPanelCloseButton')
	ButtonFrameTemplate.CloseButton:SetPoint('TOPRIGHT', 4, 5)
	ButtonFrameTemplate.CloseButton:SetScript('OnClick', CloseAllBags)

	ButtonFrameTemplate.PortraitFrame = CreateFrame('Frame', 'PortraitFrameTemplateNoCloseButton', ButtonFrameTemplate)
	ButtonFrameTemplate.PortraitFrame:SetWidth(338) ButtonFrameTemplate.PortraitFrame:SetHeight(424)

	ButtonFrameTemplate.PortraitFrame.BG = ButtonFrameTemplate:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.PortraitFrame.BG:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Background-Rock]], 1)
	ButtonFrameTemplate.PortraitFrame.BG:SetPoint('TOPLEFT', 2, -21)
	ButtonFrameTemplate.PortraitFrame.BG:SetPoint('BOTTOMRIGHT', -2, 2)

	ButtonFrameTemplate.PortraitFrame.TitleBG =  ButtonFrameTemplate:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.PortraitFrame.TitleBG:SetTexture([[Interface\AddOns\modui\bag\texture\_UI-Frame]], 1)
	ButtonFrameTemplate.PortraitFrame.TitleBG:SetWidth(256) ButtonFrameTemplate.PortraitFrame.TitleBG:SetHeight(17)
	ButtonFrameTemplate.PortraitFrame.TitleBG:SetTexCoord(0, 1, .28906250, .42187500)
	ButtonFrameTemplate.PortraitFrame.TitleBG:SetPoint('TOPLEFT', 2, -3)
	ButtonFrameTemplate.PortraitFrame.TitleBG:SetPoint('TOPRIGHT', -25, -3)

	ButtonFrameTemplate.PortraitFrame.Portrait =  ButtonFrameTemplate:CreateTexture(nil, 'ARTWORK')
	ButtonFrameTemplate.PortraitFrame.Portrait:SetWidth(60) ButtonFrameTemplate.PortraitFrame.Portrait:SetHeight(60)
	ButtonFrameTemplate.PortraitFrame.Portrait:SetPoint('TOPLEFT', -6, 7)
	SetPortraitToTexture(ButtonFrameTemplate.PortraitFrame.Portrait, [[Interface\ICONS\Inv_misc_bag_21]])

	ButtonFrameTemplate.PortraitFrame.PortraitFrame = ButtonFrameTemplate:CreateTexture(nil, 'OVERLAY')
	ButtonFrameTemplate.PortraitFrame.PortraitFrame:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]])
	ButtonFrameTemplate.PortraitFrame.PortraitFrame:SetWidth(78) ButtonFrameTemplate.PortraitFrame.PortraitFrame:SetHeight(78)
	ButtonFrameTemplate.PortraitFrame.PortraitFrame:SetTexCoord(.00781250, .61718750, .00781250, .61718750)
	ButtonFrameTemplate.PortraitFrame.PortraitFrame:SetPoint('TOPLEFT', -14, 11)

	ButtonFrameTemplate.PortraitFrame.TopRightCorner = ButtonFrameTemplate:CreateTexture(nil, 'OVERLAY')
	ButtonFrameTemplate.PortraitFrame.TopRightCorner:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]])
	ButtonFrameTemplate.PortraitFrame.TopRightCorner:SetWidth(33) ButtonFrameTemplate.PortraitFrame.TopRightCorner:SetHeight(33)
	ButtonFrameTemplate.PortraitFrame.TopRightCorner:SetTexCoord(.63281250, .89062500, .00781250, .26562500)
	ButtonFrameTemplate.PortraitFrame.TopRightCorner:SetPoint('TOPRIGHT', 0, 1)

	ButtonFrameTemplate.PortraitFrame.TopBorder = ButtonFrameTemplate:CreateTexture(nil, 'OVERLAY')
	ButtonFrameTemplate.PortraitFrame.TopBorder:SetTexture([[Interface\AddOns\modui\bag\texture\_UI-Frame]], true)
	ButtonFrameTemplate.PortraitFrame.TopBorder:SetWidth(256) ButtonFrameTemplate.PortraitFrame.TopBorder:SetHeight(28)
	ButtonFrameTemplate.PortraitFrame.TopBorder:SetTexCoord(0, 1, .43750000, .65625000)
	ButtonFrameTemplate.PortraitFrame.TopBorder:SetPoint('TOPLEFT', ButtonFrameTemplate.PortraitFrame.PortraitFrame, 'TOPRIGHT', 0, -10)
	ButtonFrameTemplate.PortraitFrame.TopBorder:SetPoint('TOPRIGHT', ButtonFrameTemplate.PortraitFrame.TopRightCorner, 'TOPLEFT')

	ButtonFrameTemplate.PortraitFrame.TopTileStreaks = ButtonFrameTemplate:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.PortraitFrame.TopTileStreaks:SetTexture([[Interface\AddOns\modui\bag\texture\_UI-Frame]], true)
	ButtonFrameTemplate.PortraitFrame.TopTileStreaks:SetWidth(256) ButtonFrameTemplate.PortraitFrame.TopTileStreaks:SetHeight(37)
	ButtonFrameTemplate.PortraitFrame.TopTileStreaks:SetTexCoord(0, 1, .67187500, .96093750)
	ButtonFrameTemplate.PortraitFrame.TopTileStreaks:SetPoint('TOPLEFT', 0, -21)
	ButtonFrameTemplate.PortraitFrame.TopTileStreaks:SetPoint('TOPRIGHT', -2, -21)
	ButtonFrameTemplate.PortraitFrame.TopTileStreaks:SetAlpha(1)

	ButtonFrameTemplate.PortraitFrame.BotLeftCorner = ButtonFrameTemplate:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.PortraitFrame.BotLeftCorner:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]], true)
	ButtonFrameTemplate.PortraitFrame.BotLeftCorner:SetWidth(14) ButtonFrameTemplate.PortraitFrame.BotLeftCorner:SetHeight(14)
	ButtonFrameTemplate.PortraitFrame.BotLeftCorner:SetTexCoord(.00781250, .11718750, .63281250, .74218750)
	ButtonFrameTemplate.PortraitFrame.BotLeftCorner:SetPoint('BOTTOMLEFT', -6, -5)

	ButtonFrameTemplate.PortraitFrame.BotRightCorner = ButtonFrameTemplate:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.PortraitFrame.BotRightCorner:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]], true)
	ButtonFrameTemplate.PortraitFrame.BotRightCorner:SetWidth(11) ButtonFrameTemplate.PortraitFrame.BotRightCorner:SetHeight(11)
	ButtonFrameTemplate.PortraitFrame.BotRightCorner:SetTexCoord(.13281250, .21875000, .89843750, .98437500)
	ButtonFrameTemplate.PortraitFrame.BotRightCorner:SetPoint('BOTTOMRIGHT', 0, -5)

	ButtonFrameTemplate.PortraitFrame.BottomBorder = ButtonFrameTemplate:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.PortraitFrame.BottomBorder:SetTexture([[Interface\AddOns\modui\bag\texture\_UI-Frame]], true)
	ButtonFrameTemplate.PortraitFrame.BottomBorder:SetWidth(256) ButtonFrameTemplate.PortraitFrame.BottomBorder:SetHeight(9)
	ButtonFrameTemplate.PortraitFrame.BottomBorder:SetTexCoord(0, 1, .20312500, .27343750)
	ButtonFrameTemplate.PortraitFrame.BottomBorder:SetPoint('BOTTOMLEFT', ButtonFrameTemplate.PortraitFrame.BotLeftCorner, 'BOTTOMRIGHT')
	ButtonFrameTemplate.PortraitFrame.BottomBorder:SetPoint('BOTTOMRIGHT', ButtonFrameTemplate.PortraitFrame.BotRightCorner, 'BOTTOMLEFT')

	ButtonFrameTemplate.PortraitFrame.LeftBorder = ButtonFrameTemplate:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.PortraitFrame.LeftBorder:SetTexture([[Interface\AddOns\modui\bag\texture\!UI-Frame]], true)
	ButtonFrameTemplate.PortraitFrame.LeftBorder:SetWidth(16) ButtonFrameTemplate.PortraitFrame.LeftBorder:SetHeight(256)
	ButtonFrameTemplate.PortraitFrame.LeftBorder:SetTexCoord(.35937500, .60937500, 0, 1)
	ButtonFrameTemplate.PortraitFrame.LeftBorder:SetPoint('TOPLEFT', ButtonFrameTemplate.PortraitFrame.PortraitFrame, 'BOTTOMLEFT', 8, 0)
	ButtonFrameTemplate.PortraitFrame.LeftBorder:SetPoint('BOTTOMLEFT', ButtonFrameTemplate.PortraitFrame.BotRightCorner, 'TOPLEFT')

	ButtonFrameTemplate.PortraitFrame.RightBorder = ButtonFrameTemplate:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.PortraitFrame.RightBorder:SetTexture([[Interface\AddOns\modui\bag\texture\!UI-Frame]], true)
	ButtonFrameTemplate.PortraitFrame.RightBorder:SetWidth(10) ButtonFrameTemplate.PortraitFrame.LeftBorder:SetHeight(256)
	ButtonFrameTemplate.PortraitFrame.RightBorder:SetTexCoord(.17187500, .32812500, 0, 1)
	ButtonFrameTemplate.PortraitFrame.RightBorder:SetPoint('TOPRIGHT', ButtonFrameTemplate.PortraitFrame.TopRightCorner, 'BOTTOMRIGHT', 1, 0)
	ButtonFrameTemplate.PortraitFrame.RightBorder:SetPoint('BOTTOMRIGHT', ButtonFrameTemplate.PortraitFrame.BotRightCorner, 'TOPRIGHT')

	ButtonFrameTemplate.BtnCornerLeft = ButtonFrameTemplate:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.BtnCornerLeft:SetTexture[[Interface\AddOns\modui\bag\texture\UI-Frame]]
	ButtonFrameTemplate.BtnCornerLeft:SetWidth(12) ButtonFrameTemplate.BtnCornerLeft:SetHeight(32)
	ButtonFrameTemplate.BtnCornerLeft:SetTexCoord(.89843750, .99218750, .28125000, .53125000)
	ButtonFrameTemplate.BtnCornerLeft:SetPoint('BOTTOMLEFT', -2, -1)

	ButtonFrameTemplate.BtnCornerRight = ButtonFrameTemplate:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.BtnCornerRight:SetTexture[[Interface\AddOns\modui\bag\texture\UI-Frame]]
	ButtonFrameTemplate.BtnCornerRight:SetWidth(12) ButtonFrameTemplate.BtnCornerRight:SetHeight(32)
	ButtonFrameTemplate.BtnCornerRight:SetTexCoord(.13281250, .22656250, .63281250, .88281250)
	ButtonFrameTemplate.BtnCornerRight:SetPoint('BOTTOMRIGHT', 0, -1)

	ButtonFrameTemplate.ButtonBottomBorder = ButtonFrameTemplate:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.ButtonBottomBorder:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]], true)
	ButtonFrameTemplate.ButtonBottomBorder:SetWidth(256) ButtonFrameTemplate.ButtonBottomBorder:SetHeight(3)
	ButtonFrameTemplate.ButtonBottomBorder:SetTexCoord(0, 1, .04687500, .07031250)
	ButtonFrameTemplate.ButtonBottomBorder:SetPoint('BOTTOMLEFT',  ButtonFrameTemplate.BtnCornerRight, 'BOTTOMRIGHT', 0, 3)
	ButtonFrameTemplate.ButtonBottomBorder:SetPoint('BOTTOMRIGHT', ButtonFrameTemplate.BtnCornerRight, 'BOTTOMLEFT')

	ButtonFrameTemplate.Inset = CreateFrame('Frame', 'ButtonFrameTemplateInset', ButtonFrameTemplate)
	ButtonFrameTemplate.Inset:SetPoint('TOPLEFT', 4, -60)
	ButtonFrameTemplate.Inset:SetPoint('BOTTOMRIGHT', -6, 26)

	ButtonFrameTemplate.Inset.BG = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.Inset.BG:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Background-Marble]], true)
	ButtonFrameTemplate.Inset.BG:SetPoint('TOPLEFT', ButtonFrameTemplate.Inset)
	ButtonFrameTemplate.Inset.BG:SetPoint('BOTTOMRIGHT', ButtonFrameTemplate.Inset)

	ButtonFrameTemplate.Inset.TopLeftCorner = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.Inset.TopLeftCorner:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]], true)
	ButtonFrameTemplate.Inset.TopLeftCorner:SetWidth(6) ButtonFrameTemplate.Inset.TopLeftCorner:SetHeight(6)
	ButtonFrameTemplate.Inset.TopLeftCorner:SetTexCoord(.63281250, .67968750, .54687500, .59375000)
	ButtonFrameTemplate.Inset.TopLeftCorner:SetPoint('TOPLEFT', ButtonFrameTemplate.Inset.BG)

	ButtonFrameTemplate.Inset.TopRightCorner = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.Inset.TopRightCorner:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]], true)
	ButtonFrameTemplate.Inset.TopRightCorner:SetWidth(6) ButtonFrameTemplate.Inset.TopRightCorner:SetHeight(6)
	ButtonFrameTemplate.Inset.TopRightCorner:SetTexCoord(.90625000, .95312500, .21875000, .26562500)
	ButtonFrameTemplate.Inset.TopRightCorner:SetPoint('TOPRIGHT', ButtonFrameTemplate.Inset.BG)

	ButtonFrameTemplate.Inset.BotLeftCorner = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.Inset.BotLeftCorner:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]], true)
	ButtonFrameTemplate.Inset.BotLeftCorner:SetWidth(6) ButtonFrameTemplate.Inset.BotLeftCorner:SetHeight(6)
	ButtonFrameTemplate.Inset.BotLeftCorner:SetTexCoord(.69531250, .74218750, .54687500, .59375000)
	ButtonFrameTemplate.Inset.BotLeftCorner:SetPoint('BOTTOMLEFT', ButtonFrameTemplate.Inset.BG, 0, -1)

	ButtonFrameTemplate.Inset.BotRightCorner = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BORDER')
	ButtonFrameTemplate.Inset.BotRightCorner:SetTexture([[Interface\AddOns\modui\bag\texture\UI-Frame]], true)
	ButtonFrameTemplate.Inset.BotRightCorner:SetWidth(6) ButtonFrameTemplate.Inset.BotRightCorner:SetHeight(6)
	ButtonFrameTemplate.Inset.BotRightCorner:SetTexCoord(.75781250, .80468750, .54687500, .59375000)
	ButtonFrameTemplate.Inset.BotRightCorner:SetPoint('BOTTOMRIGHT', ButtonFrameTemplate.Inset.BG, 0, -1)

	ButtonFrameTemplate.Inset.TopBorder = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.Inset.TopBorder:SetTexture([[Interface\AddOns\modui\bag\texture\_UI-Frame]], true)
	ButtonFrameTemplate.Inset.TopBorder:SetWidth(256) ButtonFrameTemplate.Inset.TopBorder:SetHeight(3)
	ButtonFrameTemplate.Inset.TopBorder:SetTexCoord(0, 1, .08593750, .10937500)
	ButtonFrameTemplate.Inset.TopBorder:SetPoint('TOPLEFT', ButtonFrameTemplate.Inset.TopLeftCorner,'TOPRIGHT')
	ButtonFrameTemplate.Inset.TopBorder:SetPoint('TOPRIGHT', ButtonFrameTemplate.Inset.BorderTopCorner,'TOPLEFT')

	ButtonFrameTemplate.Inset.BottomBorder = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.Inset.BottomBorder:SetTexture([[Interface\AddOns\modui\bag\texture\_UI-Frame]], true)
	ButtonFrameTemplate.Inset.BottomBorder:SetWidth(6) ButtonFrameTemplate.Inset.BottomBorder:SetHeight(6)
	ButtonFrameTemplate.Inset.BottomBorder:SetTexCoord(0, 1, .00781250, .03125000	)
	ButtonFrameTemplate.Inset.BottomBorder:SetPoint('BOTTOMLEFT', ButtonFrameTemplate.Inset.BottomLeftCorner,'BOTTOMRIGHT')
	ButtonFrameTemplate.Inset.BottomBorder:SetPoint('TOPRIGHT', ButtonFrameTemplate.Inset.BottomLeftCorner,'BOTTOMLEFT')

	ButtonFrameTemplate.Inset.LeftBorder = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.Inset.LeftBorder:SetTexture([[Interface\AddOns\modui\bag\texture\!UI-Frame]], true)
	ButtonFrameTemplate.Inset.LeftBorder:SetWidth(3) ButtonFrameTemplate.Inset.LeftBorder:SetHeight(256)
	ButtonFrameTemplate.Inset.LeftBorder:SetTexCoord(.09375000, .14062500, 0, 1)
	ButtonFrameTemplate.Inset.LeftBorder:SetPoint('TOPLEFT', ButtonFrameTemplate.Inset.TopLeftCorner,'BOTTOMLEFT')
	ButtonFrameTemplate.Inset.LeftBorder:SetPoint('BOTTOMLEFT', ButtonFrameTemplate.Inset.BottomLeftCorner,'TOPLEFT')

	ButtonFrameTemplate.Inset.RightBorder = ButtonFrameTemplate.Inset:CreateTexture(nil, 'BACKGROUND')
	ButtonFrameTemplate.Inset.RightBorder:SetTexture([[Interface\AddOns\modui\bag\texture\!UI-Frame]], true)
	ButtonFrameTemplate.Inset.RightBorder:SetWidth(3) ButtonFrameTemplate.Inset.LeftBorder:SetHeight(256)
	ButtonFrameTemplate.Inset.RightBorder:SetTexCoord(.01562500, .06250000, 0, 1)
	ButtonFrameTemplate.Inset.RightBorder:SetPoint('TOPRIGHT', ButtonFrameTemplate.Inset.TopRightCorner,'BOTTOMRIGHT')
	ButtonFrameTemplate.Inset.RightBorder:SetPoint('BOTTOMRIGHT', ButtonFrameTemplate.Inset.BottomRightCorner,'TOPRIGHT')

	--

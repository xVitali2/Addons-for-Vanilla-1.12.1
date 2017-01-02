EngBank_hookfunctions = {
	"BagSlotButton_OnClick",
	"BagSlotButton_OnDrag",
	"CloseAllWindows",
	"ToggleDropDownMenu"
	};


EngBank_savedhookfunctions = {};


-- reg :
EngBank_HOOKS_UNREGISTER = 0;
EngBank_HOOKS_REGISTER = 1;
EngBank_HOOKS_CHECK = 2;
--
function EngBank_RegisterHooks(reg)
	local func, func2;

	if (reg == 1) then
		for i = 1, table.getn(EngBank_hookfunctions) do
			func = getglobal( "EngBank_hook_"..EngBank_hookfunctions[i] );

			if (func) then
				EngBank_savedhookfunctions[ EngBank_hookfunctions[i] ] = getglobal( EngBank_hookfunctions[i] );
				setglobal( EngBank_hookfunctions[i], func);

				EngBags_PrintDEBUG("Hook function for '"..EngBank_hookfunctions[i].." installed.");
			else
				EngBags_PrintDEBUG("** Hook function for '"..EngBank_hookfunctions[i].." SKIPPED **");
			end
		end
	elseif (reg == 0) then
		-- unregister hooks
		for i = 1, table.getn(EngBank_hookfunctions) do
			func = getglobal( "EngBank_hook_"..EngBank_hookfunctions[i] );

			if ( (func) and (EngBank_savedhookfunctions[EngBank_hookfunctions[i]]) ) then
				setglobal( EngBank_hookfunctions[i], EngBank_savedhookfunctions[EngBank_hookfunctions[i]]);
				EngBank_savedhookfunctions[EngBank_hookfunctions[i]] = nil;

				EngBags_PrintDEBUG("Hook function for '"..EngBank_hookfunctions[i].." removed.");
			end
		end
	elseif (reg == 2) then
		-- check if hooks are registered
		EngBags_Print( "EngBank hooks:" ,1,1,0.2 );
		for i = 1, table.getn(EngBank_hookfunctions) do
			func = getglobal( "EngBank_hook_"..EngBank_hookfunctions[i] );
			func2 = getglobal( EngBank_hookfunctions[i] );

			if ( func == func2 ) then
				EngBags_Print( "  "..EngBank_hookfunctions[i].." is hooked properly." ,0,1,0.25 );
			else
				EngBags_Print( "  "..EngBank_hookfunctions[i].." is NOT hooked." ,1,0.2,0.2 );
			end
		end
	end

end


function EngBank_OpenOrClose(opt)
	if ( opt == "toggle" ) then
		if (EngBank_frame:IsVisible()) then
			opt = "close";
		else
			opt = "open";
		end
	end

	if ( opt == "open" ) then
		EngBank_resort_required = EngBank_MANDATORY;
		EngBank_edit_mode = 0;
		EngBank_frame:Show();
	elseif ( opt == "close" ) then
		EngBank_frame:Hide();
	end
end


function EngBank_hook_BagSlotButton_OnClick()
	EngBags_PrintDEBUG("event: BagSlotButton_OnClick()");
	EngBank_savedhookfunctions["BagSlotButton_OnClick"]();
	EngBank_UpdateWindow();
end

function EngBank_hook_BagSlotButton_OnDrag()
	EngBank_savedhookfunctions["BagSlotButton_OnDrag"]();
	EngBags_PrintDEBUG("event: BagSlotButton_OnDrag()");
	EngBank_UpdateWindow();
end

function EngBank_hook_CloseAllWindows()
	EngBags_PrintDEBUG("event: CloseAllWindows()");

	local itemsVisible = EngBank_savedhookfunctions["CloseAllWindows"]();
	local engVisible = EngBank_frame:IsVisible();
	
	if (engVisible) then
		EngBank_OpenOrClose("close");
	end
	CloseBankFrame();
	return (itemsVisible or engVisible);
end


function EngBank_hook_ToggleDropDownMenu(level, value, dropDownFrame, anchorName, xOffset, yOffset)
	EngBags_PrintDEBUG("event: ToggleDropDownMenu()");

	EngBank_savedhookfunctions["ToggleDropDownMenu"](level, value, dropDownFrame, anchorName, xOffset, yOffset);

	local frame = getglobal("DropDownList"..UIDROPDOWNMENU_MENU_LEVEL);	

	local adjustX, adjustY;
	
	if ( frame and frame:GetLeft() and frame:GetLeft() * frame:GetScale() < UIParent:GetLeft() * UIParent:GetScale() ) then
		adjustX = ( (UIParent:GetLeft()*UIParent:GetScale()) - (frame:GetLeft()*frame:GetScale()) ) / frame:GetScale();
	elseif ( frame and frame:GetRight() and frame:GetRight()*frame:GetScale() > UIParent:GetRight()*UIParent:GetScale() ) then
		adjustX = ( (UIParent:GetRight()*UIParent:GetScale()) - (frame:GetRight()*frame:GetScale()) ) / frame:GetScale();
	else
		adjustX = 0;
	end

	if ( frame and frame:GetTop() and frame:GetTop()*frame:GetScale() > UIParent:GetTop()*UIParent:GetScale() ) then
		adjustY = ( (UIParent:GetTop()*UIParent:GetScale()) - (frame:GetTop()*frame:GetScale()) ) / frame:GetScale();
	elseif ( frame and frame:GetBottom() and frame:GetBottom() * frame:GetScale() < UIParent:GetBottom() * UIParent:GetScale() ) then
		adjustY = ( (UIParent:GetBottom()*UIParent:GetScale()) - (frame:GetBottom()*frame:GetScale()) ) / frame:GetScale();
	else
		adjustY = 0;
	end

	if ( (adjustY ~= 0) or (adjustX ~= 0) ) then
		EngBags_PrintDEBUG("ToggleDropDownMenu() - adjusting window position by "..adjustX..", "..adjustY);

		adjustX = frame:GetLeft() + adjustX;
		adjustY = frame:GetTop() + adjustY;

		frame:ClearAllPoints();
		frame:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", adjustX, adjustY);
	end	
end

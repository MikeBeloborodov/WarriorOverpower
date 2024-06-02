function Print(msg, r, g, b)
	DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b)
end

function PrintRed(msg)
	Print(msg, 1.0, 0.2, 0.2)
end

function PrintWhite(msg)
	Print(msg, 1.0, 1.0, 1.0)
end

function OverpowerOnLoad()
	this:RegisterEvent("UNIT_COMBAT")
	this:RegisterEvent("PLAYER_REGEN_ENABLED")
end

function OverpowerOnEvent()
	if event == "UNIT_COMBAT" then
		if arg1 == "target" and arg2 == "DODGE" then
			local time = GetTime()
			this.startTime = time
			this.maxValue = this.startTime + 5
			this:Show();
		end
	end

	if event == "PLAYER_REGEN_ENABLED" then
		this:Hide()
	end
end

function OverpowerOnUpdate()
	local time = GetTime()
	
	if this.maxValue <= time then
		this:Hide()
	end
end
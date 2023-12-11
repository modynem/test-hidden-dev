--SPINS LOCALS

--SETTINGS
local players = game:GetService("Players")
local mps = game:GetService("MarketplaceService")
local ts = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")
local plr = players.LocalPlayer
--REMOTES
local re = RS.MainFolder_RS.Remotes:FindFirstChild("re")
local rs = RS.MainFolder_RS.Remotes:FindFirstChild("rs")
--MODULES
local prizes = require(RS.MainFolder_RS:WaitForChild("Modules").DailySpinPrizesSettingsUI2).prizes
local SpinSettings = require(RS.MainFolder_RS:WaitForChild("Modules").DailySpinSettingsUI2)
local sett = SpinSettings.settings
local reward = SpinSettings.rewards
local products = require(RS.MainFolder_RS:WaitForChild("Modules").ProductsIDModule).products
--UI
local frame = script.Parent
local btn = plr.PlayerGui:WaitForChild("MainUi").Buttons.TopRight.Spin
local label = frame.SpinFrameButton.Label
local use = frame.SpinBtn.ManySpins.Label
--VALUES
local Spinningg = plr:WaitForChild("Values").Spinning
local spins = plr:WaitForChild("Values").Spins
local buy1spinid = products["SpinsX1"]["ID"]

--REBIRTH LOCALS

--SETTINGS
local u1 = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "N", "d", "Ud", "Dd", "Td", "Qad", "Qid", "Sxd" }
local parent = script.Parent
--REMOTES
local rm = game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").Rebirth
local autoRM = game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").AutoRebirth
--MODULES
local rebirthSettings = require(game.ReplicatedStorage.MainFolder_RS:WaitForChild("Modules").RebirthSettings).rebirth
--UI
local barbg = parent.BarBg
local bar = barbg.Bar
local x = barbg.AbsoluteSize.X
local text = barbg.Value
local valueText = parent.StrengthValueBefore.TextLabel
local percentageBefore = parent.UpgradesBefore.TextLabel
local percentageAfter = parent.UpgradeAfter.TextLabel
local rebirthBtn = parent.Rebirth
local autorebirthbutton =script.Parent.AutoRebirth
local autoText = autorebirthbutton.TextLabel
--VALUES
local cost = rebirthSettings["Cost"]
local amount = rebirthSettings["Amount"]
local v1 = cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"])
local strength = plr.leaderstats.Strength
local active = plr:WaitForChild("Values").AutoRebirthActive
local function u4(p1) --nums changer (got it from github ;))
	for v8 = 1, #u1 do
		if tonumber(p1) < 10 ^ (v8 * 3) then
			return math.floor(p1 / (10 ^ ((v8 - 1) * 3) / 100)) / 100 .. u1[v8];
		end;
	end;
	return tostring(p1);
end

--NOTE
--SPINS SETTINGS
--[[local spinPrizes = {
	- MinChance = the MaxChance for the one before it
	- MaxChance = the MaxChance for the one before it + The chance that u wanna be
	- #If u wanna get the perecentage do this equation > perecentage that u wanna be * num of gift in spin(8) / 100 ..Ex: 15 * 8 / 100 = 1.2 --15%
	
	--pets #base on ur pet sys maybe that way wil not work with ur pet sys!
	["spins"] = {
		["Name"] = "Spins",
		["BaseAmount"] = 2, -- Num of prize that u wanna the player get when the spin stop on it
		["Chance"] = 0.5,
	},
	--strength
	["strength"] = {
		["Name"] = "Strength", --Name of intValue in ur leaderstats
		["BaseAmount"] = 2000, -- Num of prize that u wanna the player get when the spin stop on it
		["MinChance"] = 0.5,
		["MaxChance"] = 2,
	},
	--boosts
	["luckboost"] = {
		["Name"] = "LuckBoosts", --Name of the intvalue of the potion
		["BaseAmount"] = 1, -- Num of prize that u wanna the player get when the spin stop on it
		["MinChance"] = 2,
		["MaxChance"] = 3
	},
	["winsboost"] = {
		["Name"] = "WinsBoosts", --Name of the intvalue of the potion
		["BaseAmount"] = 1, -- Num of prize that u wanna the player get when the spin stop on it
		["MinChance"] = 3,
		["MaxChance"] = 4
	},
	["strengthboost"] = {
		["Name"] = "StrengthBoosts", --Name of the intvalue of the potion
		["BaseAmount"] = 1, -- Num of prize that u wanna the player get when the spin stop on it
		["MinChance"] = 4,
		["MaxChance"] = 5
	},
}

--REBIRTH SETTINGS
local Rebirth = {
	["Cost"] = 4750, --howmuch it costs (Starter Price)
	["Amount"] = 1, --how many rebirth per one time
	["Time"] = 20, --when u do rebirth the the cost will be x20
	["Percentage"] = 10, --10% boosts for every rebirth
	["Rebirth"] = 3 --How Time Wanna The Computer Wait To Do Auto Rebirth (Time In Sec)
}
local NameTags = {
	["0"] = {--starter tag
		["Tag"] = "Noob"
	},
	["1"] = {
		["Tag"] = "AdvNoob"
	},
	["2"] = {
		["Tag"] = "Lofta"
	},
	["3"] = {
		["Tag"] = "Medium"
	},
	["4"] = {
		["Tag"] = "Chicken"
	},
	--iam too lazy add more tags if u want u know how to do that now ;)
}
]]--
--SPIN(CLIENT)
frame.Visible = false --make the frame visable when start the game

--when start the game if player has 1 spin or more the button text will be "Spin" elseif player has no spins the the button text will buy 
if spins.Value >= 1 then
	label.Text = "SPIN"
elseif spins.Value <= 0 then
	label.Text = "BUY"
end
--[[
when player click on the spin button the computer will make sure the player has enough spins (1 or more) and the player is not spinning as the same time then the the remote will fire the server to send info to server script
elseif the player has no spins and the he is not spinning as the same time so the purchase window will appear to let him buy 1 spin
]]-- 
frame.SpinFrameButton.MouseButton1Click:Connect(function()
	if spins.Value >= 1 and Spinningg.Value == false then
		re:FireServer()
	elseif spins.Value <= 0 and Spinningg.Value == false then
		mps:PromptProductPurchase(plr,buy1spinid)
	end
end)

--SPIN(SERVER)
--[[
when the server script get data from the remote (re) then make player is spinning to dont crash is player press the spin button many time
and let the computer choose a num from the minimum num the the spin chances setting (prize 1 chance) to the num of all rewards
after that the computer also choose a random num again from 3 to 4 seconds (thats the time of the spin will revolve around it self)
after that fire the client with all of these data to the client script again
reduce the num of the spins the player has
]]
re.OnServerEvent:Connect(function(plr)
	plr:WaitForChild("Values").Spinning.Value = true
	local rewardPos = Random.new():NextNumber(prizes["spins"]["Chance"],#reward)
	local spinTime = Random.new():NextInteger(3,4)
	re:FireClient(plr,rewardPos, spinTime)
	plr.Values.Spins.Value -= 1
end)

--SPIN(CLIENT)
--[[
after we get the data from the the server script we start choosing the prize take a look on the (note) to know the chances
after that we a target the prize that choosen and get there rotation and chhose a random int from 1 to 5 and mul it in 360 + (360 - the rotation of the price that choosen)
start the animation (i used quint to get speed start and slow end that make it more smooth) after the starting the button text will change every sec by adding "." after "LOADING" when the spin animation end
we will fire the server with rewardPos data to give the player the player that he won (server script bellow) and make the button text = "CLAIMED" after the player get the prize after 2 secs the computer making sure if the player has more spins or not if yes spin button = "spin" else = "buy"
]]
re.OnClientEvent:Connect(function(rewardPos, spinTime)
	if rewardPos == prizes["spins"]["Chance"] then
		rewardPos = 1
	elseif rewardPos > prizes["strength3"]["MinChance"] and rewardPos <= prizes["strength3"]["MaxChance"] then
		rewardPos = 5
	elseif rewardPos > prizes["wins"]["MinChance"] and rewardPos <= prizes["wins"]["MaxChance"] then
		rewardPos = 2
	elseif rewardPos > prizes["strength"]["MinChance"] and rewardPos <= prizes["strength"]["MaxChance"] then
		rewardPos = 3
	elseif rewardPos > prizes["luckboost"]["MinChance"] and rewardPos <= prizes["luckboost"]["MaxChance"] then
		rewardPos = 4
	elseif rewardPos > prizes["winsboost"]["MinChance"] and rewardPos <= prizes["winsboost"]["MaxChance"] then
		rewardPos = 6
	elseif rewardPos > prizes["strength2"]["MinChance"] and rewardPos <= prizes["strength2"]["MaxChance"] then
		rewardPos = 7
	elseif rewardPos > prizes["strengthboost"]["MinChance"] and rewardPos <= prizes["strengthboost"]["MaxChance"] then
		rewardPos = 8
	end

	print(rewardPos)
	local goalSector = frame.SpinFrame[rewardPos]
	local sectorRot = goalSector.Rotation
	local rotAmount = Random.new():NextInteger(1,5) * 360 + (360 - sectorRot)

	local a = ts:Create(frame.Main.SpinFrame, TweenInfo.new(spinTime, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Rotation = rotAmount})
	a:Play()
	label.Text = "LOADING."
	wait(1)
	label.Text = "LOADING.."
	wait(1)
	label.Text = "LOADING..."
	
	a.Completed:Wait()
	rs:FireServer(rewardPos)
	label.Text = "CLAIMED!"
	wait(2)
	if spins.Value >= 1 then
		label.Text = "SPIN"
	else
		label.Text = "BUY"
	end
end)

--SPIN(SERVER)
--[[
after the animation done the computer will turn of the spinning bool to let the player if he has more spins try again
when we got the data from rewardPos after choosing the prize num the computer will choose the num of the price in the module script and getting the base amount and adding it to player profile
]]
rs.OnServerEvent:Connect(function(plr,rewardPos)
	plr:WaitForChild("Values").Spinning.Value = false
	if rewardPos == 1 then
		local amount = prizes["spins"]
		plr.Values[amount["Name"]].Value += amount["BaseAmount"]
	elseif rewardPos == 2 then
		local amount = prizes["strength"]
		plr.leaderstats[amount["Name"]].Value += amount["BaseAmount"] * plr.leaderstats.Rebirths.Value + amount["BaseAmount"]
	elseif rewardPos == 3 then
		local amount = prizes["winsboost"]
		plr.Values[amount["Name"]].Value += amount["BaseAmount"]
	elseif rewardPos == 4 then
		local amount = prizes["luckboost"]
		plr.Values[amount["Name"]].Value += amount["BaseAmount"]
	elseif rewardPos == 5 then
		local amount = prizes["strengthboost"]
		plr.Values[amount["Name"]].Value += amount["BaseAmount"]
	end
end)

--SPIN(CLIENT)
--always changing the text to the player spins
while wait() do
	use.Text = "You Have ("..spins.Value..") Spins!"
end


--REBIRTH(CLIENT)
--when click on rebirth button then remote fireserver to analyze data
rebirthBtn.MouseButton1Click:Connect(function()
	rm:FireServer()
end)
--REBIRTH(SERVER)
--when player added to the game the percentage value changing based on player rebirth * percentage settings in the rebirth module script
game.Players.PlayerAdded:Connect(function(plr)
	local rebirthBtn = plr.PlayerGui.MainUi.Frames.Rebirths.Rebirth
	plr.Values.Percentage.Value = plr.leaderstats.Rebirths.Value * rebirthSettings["Percentage"] / 100
end)
--[[
when player click on rebirth button if the player has strength more than required then player strength will be 0 player rebirth + amount (num of rebirth that will add in the module script (take a look on the note))
game the percentage value changing based on player rebirth * percentage settings in the rebirth module script
]]--
rm.OnServerEvent:Connect(function(plr)
	if plr:WaitForChild("leaderstats").Strength.Value >= cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"]) then
		plr:WaitForChild("leaderstats").Strength.Value = 0
		plr:WaitForChild("leaderstats").Rebirths.Value += amount
		plr.Values.Percentage.Value = plr.leaderstats.Rebirths.Value * rebirthSettings["Percentage"] / 100
	end
end)

--REBIRTH(CLIENT)
--bar animation changing based on player strength / cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"])
bar:TweenSize(UDim2.new(0,(strength.Value/v1 * x),1,0),"Out","Linear","1")
strength:GetPropertyChangedSignal("Value"):Connect(function()
	local v1 = cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"])
	local x = barbg.AbsoluteSize.X
	bar:TweenSize(UDim2.new(0,(strength.Value/v1 * x),1,0),"Out","Linear","1")
end)
--[[
if the player has strength more than or equal the required then rebirth button will be green else rebirth button will red
]]--
while wait() do
	text.Text = u4(strength.Value).." / "..u4(cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"]))
	valueText.Text = u4(strength.Value)
	percentageBefore.Text = plr.leaderstats.Rebirths.Value * rebirthSettings["Percentage"] ..("%")
	percentageAfter.Text = plr.leaderstats.Rebirths.Value * rebirthSettings["Percentage"] + rebirthSettings["Percentage"] ..("%")
	if plr.leaderstats.Strength.Value >= cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"]) then
		rebirthBtn.BackgroundColor3 = Color3.new(0, 255, 0)
	else
		if plr.leaderstats.Strength.Value < cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"]) then
			rebirthBtn.BackgroundColor3 = Color3.new(255, 0, 0)
		end
	end
end

--AUTO-REBIRTH
--[[
if player clicked on auto rebirth button if auto rebirth button is active then it will turn off and if it turn off it will be active
if auto rebirth button is active then the button will be green and the button text will be "AUTO REBIRTH: ON" else = red and the button text will be "AUTO REBIRTH: OFF",every 3 seconds the rebirth button will check if player has enough strength to do rebirth or not
]]--
autorebirthbutton.MouseButton1Click:Connect(function()
	if active.Value == false then
		active.Value = true
		autorebirthbutton.BackgroundColor3 = Color3.new(0, 1, 0)
		autoText.Text = "AUTO REBIRTH: ON"		
		repeat
			wait(3)
			game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").Rebirth:FireServer()
		until active.Value == false
	elseif active.Value == true then
		active.Value = false
		autoText.Text = "AUTO REBIRTH: OFF"
		autorebirthbutton.BackgroundColor3 = Color3.new(1, 0, 0)
	end
end)

--TY :)
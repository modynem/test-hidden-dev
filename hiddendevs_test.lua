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
local nametag = script:FindFirstChild("BillboardGui")
local nametagclone = nametag:Clone()
--REMOTES
local rm = game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").Rebirth
local autoRM = game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").AutoRebirth
--MODULES
local rebirthSettings = require(game.ReplicatedStorage.MainFolder_RS:WaitForChild("Modules").RebirthSettings)
local rebirthmodule = rebirthSettings.rebirth
local rebirthtags = rebirthSettings.tags
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
local textbefore = game.Players.LocalPlayer.PlayerGui.MainUi.Frames.Rebirths.NameBefore.ImageLabel.TextLabel
local textafter = game.Players.LocalPlayer.PlayerGui.MainUi.Frames.Rebirths.NameAfter.ImageLabel.TextLabel
--VALUES
local cost = rebirthmodule["Cost"]
local amount = rebirthmodule["Amount"]
local v1 = cost + cost * (plr.leaderstats.Rebirths.Value * rebirthmodule["Time"])
local strength = plr.leaderstats.Strength
local active = plr:WaitForChild("Values").AutoRebirthActive
local rebirth = plr.leaderstats.Rebirths
local string__l = nametagclone.Value
local string__l2 = nametagclone.Value2
local function u4(p1)
	for v8 = 1, #u1 do
		if tonumber(p1) < 10 ^ (v8 * 3) then
			return math.floor(p1 / (10 ^ ((v8 - 1) * 3) / 100)) / 100 .. u1[v8];
		end;
	end;
	return tostring(p1);
end

--QUESTS LOCALS
--REMOTES
local rme = game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").Quest
--MODULES
local module = require(game.ReplicatedStorage.MainFolder_RS:WaitForChild("Modules").QuestsSettings).quests
--UI
--bar1
local barbg1 = parent.BarBg1
local bar1 = barbg1.Bar
local x1 = barbg1.AbsoluteSize.X
local val = barbg1.Timer.Value
--bar2
local barbg2 = parent.BarBg2
local bar2 = barbg2.Bar
local x2 = barbg2.AbsoluteSize.X
local amount2 = barbg2.amount
--bar3
local barbg3 = parent.BarBg3
local bar3 = barbg3.Bar
local x3 = barbg3.AbsoluteSize.X
local amount3 = barbg3.amount
--images
local image1 = parent.rewardicon1
local image2 = parent.rewardicon2
local image3 = parent.rewardicon3
--req
local req1 = parent.questreq1
local req2 = parent.questreq2
local req3 = parent.questreq3
--rewards
local reward1 = parent.Reward1
local reward2 = parent.Reward2
local reward3 = parent.Reward3
--questNum
local num = parent.QuestNum
--buttons
local btn = parent.CLAIM
local btn = parent.SKIP
--VALUES
local wins = plr.leaderstats.Wins 
local done1 = false
local done2 = false
local done3 = false

--Products
--SETTINGS
local MPS = game:GetService("MarketplaceService")
--MODULES
local products = require(game.ReplicatedStorage.MainFolder_RS.Modules.ProductsIDModule).products

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
}
--QUESTS SETTINGS
local Quests = {
	["Quest1"] = {
		["QuestNum"] = 1,
		["Task1"] = {
			["Minutes"] = 100,
			["Seconds"] = 0,
			["Title"] = "Play For 1h&40m",
		},
		["Task2"] = {
			["Name"] = "Wins",
			["Title"] = "Earn 10K Wins",
			["Amount"] = 10000,
		},
		["Task3"] = {
			["Name"] = "Strength",
			["Title"] = "Earn 100k Strength",
			["Amount"] = 100000,
		},
		["Rewards"] = {
			["Reward1"] = {
				["Name"] = "Spins",
				["Image"] = "rbxassetid://13847231862",
				["Amount"] = 2,
			},
			["Reward2"] = {
				["Name"] = "StrengthBoosts",
				["Image"] = "rbxassetid://13895240508",
				["Amount"] = 3,
			},
			["Reward3"] = {
				["Name"] = "Wins",
				["Image"] = "rbxassetid://14758568556",
				["Amount"] = 20000,
			},
		},
	},
}
--PRODUCTS SETTINGS
local ProductsID = {
	["SpinsX1"] = {
		["ID"] = 00000
	},
	["SpinsX10"] = {
		["ID"] = 00000
	},
	["SpinX100"] = {
		["ID"] = 00000
	},
	["SkipQuest"] = {
		["ID"] = 1686988440
	},
	["SkipRebirth"] = {
		["ID"] = 1687526287
	},
	--Wins
	["Wins"] = {
		["Tiny Pack"] = {
			["ID"] = 1688004168,
		},
		["Small Pack"] = {
			["ID"] = 0,
		},
		["Medium Pack"] = {
			["ID"] = 0,
		},
		["Large Pack"] = {
			["ID"] = 0,
		},
		["Huge Pack"] = {
			["ID"] = 0,
		},
		["Mega Pack"] = {
			["ID"] = 0,
		},
	},
	--Strength
	["Strength"] = {
		["Tiny Pack"] = {
			["ID"] = 0,
		},
		["Small Pack"] = {
			["ID"] = 0,
		},
		["Medium Pack"] = {
			["ID"] = 0,
		},
		["Large Pack"] = {
			["ID"] = 0,
		},
		["Huge Pack"] = {
			["ID"] = 0,
		},
		["Mega Pack"] = {
			["ID"] = 0,
		},
	},
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
	plr.Values.Percentage.Value = plr.leaderstats.Rebirths.Value * rebirthmodule["Percentage"] / 100
end)
--[[
when player click on rebirth button if the player has strength more than required then player strength will be 0 player rebirth + amount (num of rebirth that will add in the module script (take a look on the note))
game the percentage value changing based on player rebirth * percentage settings in the rebirth module script
]]--
rm.OnServerEvent:Connect(function(plr)
	if plr:WaitForChild("leaderstats").Strength.Value >= cost + cost * (plr.leaderstats.Rebirths.Value * rebirthmodule["Time"]) then
		plr:WaitForChild("leaderstats").Strength.Value = 0
		plr:WaitForChild("leaderstats").Rebirths.Value += amount
		plr.Values.Percentage.Value = plr.leaderstats.Rebirths.Value * rebirthmodule["Percentage"] / 100
	end
end)

--REBIRTH(CLIENT)
--bar animation changing based on player strength / cost + cost * (plr.leaderstats.Rebirths.Value * rebirthSettings["Time"])
bar:TweenSize(UDim2.new(0,(strength.Value/v1 * x),1,0),"Out","Linear","1")
strength:GetPropertyChangedSignal("Value"):Connect(function()
	local v1 = cost + cost * (plr.leaderstats.Rebirths.Value * rebirthmodule["Time"])
	local x = barbg.AbsoluteSize.X
	bar:TweenSize(UDim2.new(0,(strength.Value/v1 * x),1,0),"Out","Linear","1")
end)
--[[
if the player has strength more than or equal the required then rebirth button will be green else rebirth button will red
]]--
while wait() do
	text.Text = u4(strength.Value).." / "..u4(cost + cost * (plr.leaderstats.Rebirths.Value * rebirthmodule["Time"]))
	valueText.Text = u4(strength.Value)
	percentageBefore.Text = plr.leaderstats.Rebirths.Value * rebirthmodule["Percentage"] ..("%")
	percentageAfter.Text = plr.leaderstats.Rebirths.Value * rebirthmodule["Percentage"] + rebirthmodule["Percentage"] ..("%")
	if plr.leaderstats.Strength.Value >= cost + cost * (plr.leaderstats.Rebirths.Value * rebirthmodule["Time"]) then
		rebirthBtn.BackgroundColor3 = Color3.new(0, 255, 0)
	else
		if plr.leaderstats.Strength.Value < cost + cost * (plr.leaderstats.Rebirths.Value * rebirthmodule["Time"]) then
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
			rm:FireServer()
		until active.Value == false
	elseif active.Value == true then
		active.Value = false
		autoText.Text = "AUTO REBIRTH: OFF"
		autorebirthbutton.BackgroundColor3 = Color3.new(1, 0, 0)
	end
end)

--REBIRTH-TAGS(CLIENT)
--[[
put the billboard gui in the head into the client
after that we computer choosing the tag based on player rebirths using the int value of rebirth to search for it in the module script
]]--
nametagclone.Parent = script.Parent:WaitForChild("Head")
nametagclone.Adornee = script.Parent:WaitForChild("Head")
while wait() do
	string__l2.Value = rebirth.Value + 1
	nametagclone.Strength.Text = u4(strength.Value)
	nametagclone.ImageLabel.Username.Text= rebirthSettings[rebirth.Value]["Tag"]
	textbefore.Text = rebirthSettings[rebirth.Value]["Tag"]
	textafter.Text = rebirthSettings[string__l2.Value]["Tag"]
end

--QUESTS(CLIENT)
--When player click on claim button the computer will make sure the player has already finished all tasks before fire the server and give him the rewardsA and make all task = false to start new quest if player is already finished all tasks the claim button text will be "CLAIMED"
btn.MouseButton1Click:Connect(function()
	if done1 == true and done2 == true and done3 == true then
		rme:FireServer()
		print("claimed")
		done1 = false
		done2 = false
		done3 = false
		btn.TextLabel.Text = "CLAIMED!"
	end
end)
--QUESTS(SERVER)
--after player clicked on click button and he did all tasks so computer will start give him the rewards but first the computer will he done any task after that will make the quest num of bool value = true
rme.OnServerEvent:Connect(function(plr)
	if plr.Values.Quest1.Value == false then
		plr.Values.Quest1.Value = true
		plr.Values[module["Quest1"]["Rewards"]["Reward1"]["Name"]].Value += module["Quest1"]["Rewards"]["Reward1"]["Amount"]
		plr.Values[module["Quest1"]["Rewards"]["Reward2"]["Name"]].Value += module["Quest1"]["Rewards"]["Reward2"]["Amount"]
		plr.leaderstats[module["Quest1"]["Rewards"]["Reward3"]["Name"]].Value += module["Quest1"]["Rewards"]["Reward3"]["Amount"]
	end
end)
--if player did skip then the computer the value of tasks to let him claim rewards ex (if task need u collect 100 wins if u did skip then the computer will give u the 100 wins to complete the task) after that the computer will fire the server to complete the timer task
rme.Parent.SkipQuest.OnServerEvent:Connect(function(plr)
	if plr.Values.Quest1.Value == false then
		plr.leaderstats[module["Quest1"]["Task2"]["Name"]].Value += module["Quest1"]["Task2"]["Amount"]
		plr.leaderstats[module["Quest1"]["Task3"]["Name"]].Value += module["Quest1"]["Task3"]["Amount"]
		game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").SkipQuestfs:FireClient(plr)
	end
end)
--QUESTS(CLIENT)
--first when player join the game the quest  frame will proccess the the num of quest after will take all data of it from module script after that make the bar animation (i added bars to make it more modern) then the computer will check if the timer value changed to animate the bar based on player time played / task time and the same thing with other bars
local function q1 ()
	image1.Image = module["Quest1"]["Rewards"]["Reward1"]["Image"]
	image2.Image = module["Quest1"]["Rewards"]["Reward2"]["Image"]
	image3.Image = module["Quest1"]["Rewards"]["Reward3"]["Image"]

	reward1.Text = "x"..u4(module["Quest1"]["Rewards"]["Reward1"]["Amount"])
	reward2.Text = "x"..u4(module["Quest1"]["Rewards"]["Reward2"]["Amount"])
	reward3.Text = "x"..u4(module["Quest1"]["Rewards"]["Reward3"]["Amount"])

	req1.Text = module["Quest1"]["Task1"]["Title"]
	req2.Text = module["Quest1"]["Task2"]["Title"]
	req3.Text = module["Quest1"]["Task3"]["Title"]

	num.Text = "Quest #"..module["Quest1"]["QuestNum"]
	--1
	bar1:TweenSize(UDim2.new(0,(val.Value/module["Quest1"]["Task1"]["Minutes"] * x1),1,0),"Out","Linear","1")
	if val.Value >= module["Quest1"]["Task1"]["Minutes"] then
		done1 = true
	end
	val:GetPropertyChangedSignal("Value"):Connect(function()
		local val = barbg1.Timer.Value
		local x1 = barbg1.AbsoluteSize.X
		bar1:TweenSize(UDim2.new(0,(val.Value/module["Quest1"]["Task1"]["Minutes"] * x1),1,0),"Out","Linear","1")
		if val.Value >= module["Quest1"]["Task1"]["Minutes"] then
			done1 = true
		end
	end)
	--2
	bar2:TweenSize(UDim2.new(0,(wins.Value/module["Quest1"]["Task2"]["Amount"] * x2),1,0),"Out","Linear","1")
	if wins.Value >= module["Quest1"]["Task2"]["Amount"] then
		parent.Done2.Visible = true
		done2 = true
	end
	wins:GetPropertyChangedSignal("Value"):Connect(function()
		local x2 = barbg2.AbsoluteSize.X
		bar2:TweenSize(UDim2.new(0,(wins.Value/module["Quest1"]["Task2"]["Amount"] * x2),1,0),"Out","Linear","1")
		if wins.Value >= module["Quest1"]["Task2"]["Amount"] then
			parent.Done2.Visible = true
			done2 = true
		end
	end)
	--3
	bar3:TweenSize(UDim2.new(0,(strength.Value/module["Quest1"]["Task3"]["Amount"] * x3),1,0),"Out","Linear","1")
	if strength.Value >= module["Quest1"]["Task3"]["Amount"] then
		parent.Done3.Visible = true
		done3 = true
	end
	strength:GetPropertyChangedSignal("Value"):Connect(function()
		local x3 = barbg3.AbsoluteSize.X
		bar3:TweenSize(UDim2.new(0,(strength.Value/module["Quest1"]["Task3"]["Amount"] * x3),1,0),"Out","Linear","1")
		if strength.Value >= module["Quest1"]["Task3"]["Amount"] then
			parent.Done3.Visible = true
			done3 = true
		end
	end)

	while wait() do
		amount2.Text = u4(wins.Value).."/"..u4(module["Quest1"]["Task2"]["Amount"])
		amount3.Text = u4(strength.Value).."/"..u4(module["Quest1"]["Task3"]["Amount"])
	end
end
--check if player didnt finish quest1 to start it 
if plr.Values.Quest1.Value == false then
	q1()
end

--PRODUCTS(SERVER)
--check the receipts by player id if the purchase == true then the computer will the id od the product and give the player the reward of this product
MPS.ProcessReceipt = function(receiptinfo)
	local player = plr:GetPlayerByUserId(receiptinfo.PlayerId)
	if not player then --failed purchase
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	if receiptinfo.ProductId == products["SpinsX1"]["ID"] then
		player.Values.Spins.Value += 1
		player.PlayerGui.MainUi.Frames.Spin.SpinFrameButton.Label.Text = "SPIN!"
	elseif receiptinfo.ProductId == products["SpinsX10"]["ID"] then
		player.Values.Spins.Value += 10
		player.PlayerGui.MainUi.Frames.Spin.SpinFrameButton.Label.Text = "SPIN!"
	elseif receiptinfo.ProductId == products["SkipQuest"]["ID"] then
		game.ReplicatedStorage.MainFolder_RS:WaitForChild("Remotes").SkipQuest:FireClient(player)
		print("paid")
	elseif receiptinfo.ProductId == products["SkipRebirth"]["ID"] then
		player.leaderstats.Rebirths.Value += 1
	end
	return Enum.ProductPurchaseDecision.PurchaseGranted
end
--TY :)
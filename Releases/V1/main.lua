local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/inmymum/RadioSilence/main/Lib/UI/main.lua"))()
local Window = Library.CreateLib("RadioSilenceV1", "DarkTheme")

function getPlayerNames() -- Get list of players for selection dropdown
    local playerNames = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    return playerNames
end

-- Initialize tabs and sections
local hubtab = Window:NewTab("Hubs")
local movehub = Window:NewTab("Movement")
local rapetab = Window:NewTab("Rape")
local hubs = hubtab:NewSection("List of scripts/hubs")
local movement = movehub:NewSection("Movement Tweaks")
local rape = rapetab:NewSection("Rape The hoes")

local dropdown = rape:NewDropdown("Rapist","", getPlayerNames(), function(x)
    rapist = x
end)
local dropdown1 = rape:NewDropdown("Victim","", getPlayerNames(), function(y)
    victim = y
end)
rape:NewLabel("")
rape:NewButton("Refresh playerlist", "Refreshes playerlist", function()
    local list = getPlayerNames()
    dropdown:Refresh(list)
    dropdown1:Refresh(list)
end)
rape:NewButton("Fuck the bitch", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/inmymum/RadioSilence/main/Lib/Scripts/rapefunc.lua"))()
    fun(rapist, victim)
end)
movement:NewLabel("Speed")
movement:NewSlider("Slider", "How fast you move", 100, 18, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
movement:NewButton("Default", "Set jump height to default", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 18
end)
movement:NewLabel("Jump height")
movement:NewSlider("Slider", "How high you jump obviously", 350, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
movement:NewButton("Default", "Set jump height to default", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 18
end)
hubs:NewButton("Infinite Yield", "Op all game admin panel", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/inmymum/RadioSilence/main/Lib/Scripts/Hubs/InfiniteYield.lua'))()
end)
hubs:NewButton("Tiger admin", "Op admin for prison life", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/inmymum/RadioSilence/main/Lib/Scripts/Hubs/tigeradminmain"))()
end)
hubs:NewButton("Nameless admin","",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "RadioSilence";
    Text = "Thank you for using RadioSilence"
})

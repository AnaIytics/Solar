--[[

$$$$$$$\                     $$\                                     
$$  __$$\                    $$ |                                    
$$ |  $$ |$$$$$$\   $$$$$$\  $$ |  $$\  $$$$$$\  $$\   $$\  $$$$$$\  
$$$$$$$  |\____$$\ $$  __$$\ $$ | $$  |$$  __$$\ $$ |  $$ |$$  __$$\ 
$$  ____/ $$$$$$$ |$$ |  \__|$$$$$$  / $$ /  $$ |$$ |  $$ |$$ |  \__|
$$ |     $$  __$$ |$$ |      $$  _$$<  $$ |  $$ |$$ |  $$ |$$ |      
$$ |     \$$$$$$$ |$$ |      $$ | \$$\ \$$$$$$  |\$$$$$$  |$$ |      
\__|      \_______|\__|      \__|  \__| \______/  \______/ \__|      

Tested Executors :
• Synapse
• Krnl

Features Coming Soon :
• No Cola Cooldown
• Loud Audio
• Staff Notifcations
• Bag Esp
• Bag Notifications
• Infinite Wingsuit Stamina
• Infinite Glider Stamina
• Infinite Magrail Gear
• Infinite Grappler Gear
• Instant Grappler Cast
• Autofarm Points                                            
]]

-- Functions
local function Import_Files()
    -- Check for folder.
    if isfolder("Solar") then
        -- If there is a folder then remove it to update it to current version.
        delfolder("Solar")
        Import_Files()
        return
    end

    -- Make the folders.
    makefolder("Solar")
    makefolder("Solar/Modules")
    makefolder("Solar/Source")

    -- Make the files.
    writefile("Solar/Modules/Util.lua", game:HttpGetAsync("https://raw.githubusercontent.com/AnaIytics/Solar/main/Modules/Util.lua"))
    writefile("Solar/Modules/UI.lua", game:HttpGetAsync("https://raw.githubusercontent.com/AnaIytics/Solar/main/Modules/UI.lua"))
    writefile("Solar/Modules/ACB.lua", game:HttpGetAsync("https://raw.githubusercontent.com/AnaIytics/Solar/main/Modules/ACB.lua"))
    writefile("Solar/Source/Runtime.lua", game:HttpGetAsync("https://raw.githubusercontent.com/AnaIytics/Solar/main/Source/Runtime.lua"))
end

local function Init()
    Import_Files()

    repeat
        task.wait()
    until isfile("Solar/Source/Runtime.lua")

    local Runtime = loadstring(readfile("Solar/Source/Runtime.lua"))()
    Runtime.Init()
end

-- Main
Init()
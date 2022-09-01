--================================--
--      Breezy_Safezones 1.0      --
--      by BreezyTheDev           --
--		GNU License v3.0		  --
--================================--

CreateThread(function()
    while true do
        playerCoords = GetEntityCoords(PlayerPedId()) -- Gets player coords every 5th of a second
        Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local locations = Config.Locations
        for i = 1, #locations do
            local x = locations[i][1];
            local y = locations[i][2];
            local z = locations[i][3];
            local radius = Config.Radius
            if #(playerCoords - vector3(x, y, z)) <= radius then
                DisplayHelpText(Config.Alert) 
                if IsControlJustPressed(0, 106) then
                    ShowInfo(Config.Warning)
                end
                SetPlayerCanDoDriveBy(player, false)
                DisablePlayerFiring(player, true)
                DisableControlAction(0, 140)
            end
        end
    end
end)

function DisplayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

function ShowInfo(text)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

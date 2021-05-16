local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    VorpInv.RegisterUsableItem("kit_bandana", function(data)
        local user = VorpCore.getUser(data.source).getUsedCharacter
        local skin = user.skin
        local comps = user.comps
        TriggerClientEvent("bandana", data.source, skin, comps)
        VorpInv.CloseInv(data.source)
    end)
end)
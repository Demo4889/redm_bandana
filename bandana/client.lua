local bandana = false
local cache_comps = {}
local cache_skin = {}

RegisterNetEvent("bandana")
AddEventHandler("bandana", function(skin, comps)
	local ped = PlayerPedId()
	local cache_comps = json.decode(comps)
	local cache_skin = json.decode(skin)
	if not bandana then
		print("bandana:", bandana)
		if not IsPedMale(ped) then
			Citizen.InvokeNative(0xAE72E7DF013AAA61, ped, GetHashKey("KIT_BANDANA"), GetHashKey("BANDANA_ON_RIGHT_HAND"), 1, 0, -1082130432)
			Citizen.Wait(700)
			Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0xC615A086, true, true, true) -- ApplyShopItemToPed()
		else
			Citizen.InvokeNative(0xAE72E7DF013AAA61, ped, GetHashKey("KIT_BANDANA"), GetHashKey("BANDANA_ON_RIGHT_HAND"), 1, 0, -1082130432)
			Citizen.Wait(700)
			Citizen.InvokeNative(0x1902C4CFCC5BE57C, ped, -1100875244) -- SetPedBodyComponent()
		end
		Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, 0, 1, 1, 1, false)
		bandana = true
	else
		print("bandana:", bandana)
		if not IsPedMale(ped) then
			Citizen.InvokeNative(0xAE72E7DF013AAA61, ped,GetHashKey("KIT_BANDANA"), GetHashKey("BANDANA_OFF_RIGHT_HAND"), 1, 0, -1082130432) --TaskItemInteraction()
			Citizen.Wait(700)
			Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x5FC29285, 0)
			Citizen.Wait(100)
			Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, cache_comps.NeckWear, true, true, true) --0xD710A5007C2AC539()
		else
			Citizen.InvokeNative(0xAE72E7DF013AAA61, ped,GetHashKey("KIT_BANDANA"), GetHashKey("BANDANA_OFF_RIGHT_HAND"), 1, 0, -1082130432) --TaskItemInteraction()
			Citizen.Wait(700)
			Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x5FC29285, 0)
			Citizen.Wait(100)
			Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xF8016BCA, 0) -- Must remove Male Beard prior to putting it back on
			Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, cache_skin.Beard, true, true, true) -- SetPedBodyComponent()
		end
		Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, 0, 1, 1, 1, false)
		bandana = false
	end
end)
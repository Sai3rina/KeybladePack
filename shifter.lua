function _OnInit()
GameVersion = 0
print('Weaponpack')
end

function GetVersion() --Define anchor addresses
if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
	OnPC = false
	GameVersion = 1
	print('not offical supportet')
	Now = 0x032BAE0 --Current Location
	Obj0Pointer = 0x1D5BA10 --00objentry.bin Pointer Address
	Obj0 = ReadInt(Obj0Pointer)
elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
	OnPC = true
	if ReadString(0x09A92F0,4) == 'KH2J' then --EGS
		GameVersion = 2
		print('Epic Version')
		Now = 0x0716DF8
		Obj0Pointer = 0x2A24A70
		Obj0 = ReadLong(Obj0Pointer)
	elseif ReadString(0x09A9830,4) == 'KH2J' then --Steam Global
		GameVersion = 3
		print('Steam Global Version')
		Now = 0x0717008
		Obj0Pointer = 0x2A24FB0
		Obj0 = ReadLong(Obj0Pointer)
	elseif ReadString(0x09A8830,4) == 'KH2J' then --Steam JP
		GameVersion = 4
		print('GoA Steam JP Version')
		Now = 0x0716008
		Obj0Pointer = 0x2A23FB0
		Obj0 = ReadLong(Obj0Pointer)
	end
end
end

function _OnFrame()
if GameVersion == 0 then --Get anchor addresses
	GetVersion()
	return
end
if true then --Define current values for common addresses
	World  = ReadByte(Now+0x00)
	Room   = ReadByte(Now+0x01)
	Place  = ReadShort(Now+0x00)
	end
    CostumeSwap()
end

function CostumeSwap()
    if World == 0x07 then --Agrabah
        WriteString(Obj0+0x1b70,'W_EX010_Aladin\0',OnPC)
    elseif World == 0x10 then --Port Royal
        WriteString(Obj0+0x1b70,'W_EX010_Jack\0',OnPC)
    elseif World == 0x02 then --Twilight Town
        WriteString(Obj0+0x1b70,'W_EX010_Twilight\0',OnPC)
    elseif World == 0x04 then --Hollow bastion
        WriteString(Obj0+0x1b70,'W_EX010_Hollow\0',OnPC)
    elseif World == 0x05 then --Beasts Castle
        WriteString(Obj0+0x1b70,'W_EX010_Beast\0',OnPC)
    elseif World == 0x06 then --olymp
        WriteString(Obj0+0x1b70,'W_EX010_Herc\0',OnPC)
    elseif World == 0x08 then --Mulan
        WriteString(Obj0+0x1b70,'W_EX010_Mulan\0',OnPC)
    elseif World == 0x09 then --100acer
        WriteString(Obj0+0x1b70,'W_EX010_puh\0',OnPC)
    elseif World == 0x0a then --Pride Lands
        WriteString(Obj0+0x1b70,'W_EX010_Lion\0',OnPC)
    elseif World == 0x0b then --Atlantica
        WriteString(Obj0+0x1b70,'W_EX010_atlantica\0',OnPC)
    elseif World == 0x0c then --Disney Castle
        WriteString(Obj0+0x1b70,'W_EX010_Mickey\0',OnPC)
    elseif World == 0x12 then --Final world
        WriteString(Obj0+0x1b70,'W_EX010_Final\0',OnPC)
    else --Revert costume changes
        WriteString(Obj0+0x1b70,'W_EX010_10\0',OnPC)
    end
end
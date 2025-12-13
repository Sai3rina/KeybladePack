LUAGUI_NAME = "Weaponpack"
LUAGUI_AUTH = "Kité"
LUAGUI_DESC = "World-based costume shifter"

--- Game Version Check ---
epiccheck = 0x585B61
stmcheck = epiccheck + 0x2F8
stmjpcheck = epiccheck + 0x2A8

function _OnInit()
    if ENGINE_TYPE == "BACKEND" then
        IsEpicGame = 0
        IsSteamGame = 0
        IsSteamJPGame = 0
    end
    print('Weaponpack')
end

function _OnFrame()
    -- Version Detection
    if ENGINE_TYPE == "BACKEND" then
        if ReadLong(epiccheck) == 0x7265737563697065 and IsEpicGame == 0 then
            IsEpicGame = 1
            Now = 0x0716DF8
            Obj0Pointer = 0x2A24A70
            print('Epic Version')
        end
        
        if ReadLong(stmcheck) == 0x7265737563697065 and IsSteamGame == 0 then
            IsSteamGame = 1
            Now = 0x0717008
            Obj0Pointer = 0x2A25030
            print('Steam Global Version')
        end
        
        if ReadLong(stmjpcheck) == 0x7265737563697065 and IsSteamJPGame == 0 then
            IsSteamJPGame = 1
            Now = 0x0716008
            Obj0Pointer = 0x2A23FB0
            print('Steam JP Version')
        end
    end
    
    -- Only run if version detected
    if IsEpicGame == 1 or IsSteamGame == 1 or IsSteamJPGame == 1 then
        World = ReadByte(Now + 0x00)
        Obj0 = ReadLong(Obj0Pointer)
        CostumeSwap()
    end
end

function CostumeSwap()
    if World == 0x07 then --Agrabah
        WriteString(Obj0 + 0x1b70, 'W_EX010_Aladin\0', true)
    elseif World == 0x10 then --Port Royal
        WriteString(Obj0 + 0x1b70, 'W_EX010_Jack\0', true)
    elseif World == 0x02 then --Twilight Town
        WriteString(Obj0 + 0x1b70, 'W_EX010_Twilight\0', true)
    elseif World == 0x04 then --Hollow Bastion
        WriteString(Obj0 + 0x1b70, 'W_EX010_Hollow\0', true)
    elseif World == 0x05 then --Beasts Castle
        WriteString(Obj0 + 0x1b70, 'W_EX010_Beast\0', true)
    elseif World == 0x06 then --Olympus
        WriteString(Obj0 + 0x1b70, 'W_EX010_Herc\0', true)
    elseif World == 0x08 then --Land of Dragons
        WriteString(Obj0 + 0x1b70, 'W_EX010_Mulan\0', true)
    elseif World == 0x09 then --100 Acre Wood
        WriteString(Obj0 + 0x1b70, 'W_EX010_puh\0', true)
    elseif World == 0x0a then --Pride Lands
        WriteString(Obj0 + 0x1b70, 'W_EX010_Lion\0', true)
    elseif World == 0x0b then --Atlantica
        WriteString(Obj0 + 0x1b70, 'W_EX010_atlantica\0', true)
    elseif World == 0x0c then --Disney Castle
        WriteString(Obj0 + 0x1b70, 'W_EX010_Mickey\0', true)
    elseif World == 0x12 then --The World That Never Was
        WriteString(Obj0 + 0x1b70, 'W_EX010_Final\0', true)
    else --Default
        WriteString(Obj0 + 0x1b70, 'W_EX010_10\0', true)
    end
end
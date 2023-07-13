function _OnInit()
    if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
        if ENGINE_VERSION < 3.0 then
            print('LuaEngine is Outdated. Things might not work properly.')
        end
        OnPC = false
        Now = 0x032BAE0 --Current Location
        Obj0 = 0x1C94100 --00objentry.bin
    elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
        if ENGINE_VERSION < 5.0 then
            ConsolePrint('LuaBackend is Outdated. Things might not work properly.',2)
        end
        OnPC = true
        Now = 0x0714DB8 - 0x56454E
        Obj0 = 0x2A22B90 - 0x56450E
    end
end

function _OnFrame()
    if true then --Define current values for common addresses
        World  = ReadByte(Now+0x00)
        Room   = ReadByte(Now+0x01)
        Place  = ReadShort(Now+0x00)
    end
    CostumeSwap()
end

function CostumeSwap()
    if World == 0x07 then --Agrabah
        WriteString(Obj0+0x1BD0,'W_EX020_Aladin\0')
    elseif World == 0x10 then --Port Royal
        WriteString(Obj0+0x1BD0,'W_EX020_Jack\0')
    elseif World == 0x02 then --Twilight Town
        WriteString(Obj0+0x1BD0,'W_EX020_Twilight\0')
    elseif World == 0x04 then --Hollow bastion
        WriteString(Obj0+0x1BD0,'W_EX020_Hollow\0')
    elseif World == 0x05 then --Beasts Castle
        WriteString(Obj0+0x1BD0,'W_EX020_Beast\0')
    elseif World == 0x06 then --olymp
        WriteString(Obj0+0x1BD0,'W_EX020_Herc\0')
    elseif World == 0x08 then --Mulan
        WriteString(Obj0+0x1BD0,'W_EX020_Mulan\0')
    elseif World == 0x09 then --100acer
        WriteString(Obj0+0x1BD0,'W_EX020_puh\0')
    elseif World == 0x0a then --Pride Lands
        WriteString(Obj0+0x1BD0,'W_EX020_Lion\0')
    elseif World == 0x0b then --Atlantica
        WriteString(Obj0+0x1BD0,'W_EX020_atlantica\0')
    elseif World == 0x0c then --Disney Castle
        WriteString(Obj0+0x1BD0,'W_EX020_Mickey\0')
    elseif World == 0x12 then --Final world
        WriteString(Obj0+0x1BD0,'W_EX020_Final\0')
    else --Revert costume changes
        WriteString(Obj0+0x1BD0,'W_EX010_20\0')
    end
end
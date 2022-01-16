sgs = {}

--[[
    @param text(Исходный текст)
    @param command(Начало комманды)
    @return String(Возращает старт)
    sgs.chatStart(text, command) 
]]--

function sgs.chatStart(text, command) 
    return string.StartWith( string.lower( text ), command)
end



--[[
    @param command(Команда которую обработать) 
    @return String(Возращает аргументы)
    sgs.chatGetArguments(command) 
]]--

function sgs.chatGetArguments(command) 
    return string.sub(command, #command + 1)
end



--[[ 
    @param Channel(Имя потока/канала)
    @param Table(Передать в поток таблицу с параметрами)
    @return nil
    sgs.broadcast(Channel, Table) 
    @description отправить конткретному клиенту
]]--

function sgs.send(Channel, Table, Player) 
    net.Start(Channel)
        net.WriteTable(Table) 
    net.Send(Player)
end



--[[ 
    @param Channel(Имя потока/канала)
    @param Table(Передать в поток таблицу с параметрами)
    @return nil
    sgs.broadcast(Channel, Table) 
    @description Отправить всем клиентам
]]--

function sgs.broadcast(Channel, Table) 
    net.Start(Channel)
        net.WriteTable(Table) 
    net.Broadcast()
end



--[[ 
    @param Player:usrfrom(От кого просчитавать дистанцию) 
    @param Number:distance(Дистанция)
    @return Table(Возращает таблицу игрокок)
    sgs.findUsersToDistance(usrfrom, distance)
]]--

function sgs.findUsersToDistance(usrfrom, distance) 
    local ret = {}
    for key, item in pairs(player.GetAll()) do
        if usrfrom:GetPos():Distance(item:GetPos()) <= distance then
            ret[#ret + 1] = item
        end 
    end
    return ret
end



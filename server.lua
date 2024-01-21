local QBCore = exports['qb-core']:GetCoreObject()

--removed by pamela for ps-housing
--[[QBCore.Functions.CreateCallback('qb-spawn:server:getOwnedHouses', function(_, cb, cid)
    if cid ~= nil then
        local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', {cid})
        if houses[1] ~= nil then
            cb(houses)
        else
            cb({})
        end
    else
        cb({})
    end
end)]]

--added by pamela for ps-housing
QBCore.Functions.CreateCallback('qb-spawn:server:getOwnedHouses', function(_, cb, cid)
    if cid ~= nil then
        local houses = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ?', {cid})
        if houses[1] ~= nil then
            cb(houses)
        else
            cb({})
        end
    else
        cb({})
    end
end)
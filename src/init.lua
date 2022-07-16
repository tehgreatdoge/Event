local Event = {}
Event.__index = Event

local Connection = require(script.Connection)

function Event.new()
	local newEvent = {}
	newEvent.connections = {}
	setmetatable(newEvent,Event)
	return(newEvent)
end

function Event:Connect(callback)
	local newConnection = Connection.new(callback,function(event) self:RemoveEvent(event) end)
	table.insert(self.connections,newConnection)
	return newConnection
end
function Event:RemoveEvent(event)	--Alternative methods need testing for better performance
	table.remove(self.connections,table.find(self.connections,event))
end
function Event:Fire()
	for k,v in pairs(self.connections) do
		task.spawn(v.callback)
	end
end

return Event

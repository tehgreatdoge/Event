local Connection = {}
Connection.__index = Connection

function Connection.new(callback,disconnectFunct)	--This code looks atrocious and probably isn't optimal.
	local newConnection = {}
	newConnection.callback = callback
	newConnection.disconnectFunction = disconnectFunct
	newConnection.disconnected = false
	setmetatable(newConnection,Connection)
	return newConnection
end

function Connection:Disconnect()
	if not self.disconnected then
		self.disconnectFunction(self)
		self.disconnected = true
	end
end

return Connection

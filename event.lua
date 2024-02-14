local EventListener = {}
EventListener.__index = EventListener

function EventListener.new()
    local self = setmetatable({}, EventListener)
    self.listeners = {}
    return self
end

function EventListener:Connect(func)
    assert(type(func) == "function", "Connect expects a function")
    table.insert(self.listeners, func)
end

function EventListener:Fire(...)
    for _, listener in ipairs(self.listeners) do
        listener(...)
    end
end

function EventListener:Disconnect(func)
    for i, listener in ipairs(self.listeners) do
        if listener == func then
            table.remove(self.listeners, i)
            break
        end
    end
end

return EventListener

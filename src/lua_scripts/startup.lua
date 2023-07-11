os.loadAPI("move.lua")

move.readXYZ()

local ws = assert(http.websocket("ws://92.10.11.91:8000/ws"))

while true do
    ws.send("get_inst")
    str = ws.receive()
    f = fs.open("job.lua", "w")
    f.write(str)
    f.close()
    os.run({}, "job.lua")
end
local ws = assert(http.websocket("ws://92.10.11.91:8000/ws"))

args = {...}

ws.send("get_"..args[1])
str = ws.receive()
f = fs.open(args[1]..".lua", "w")
f.write(str)
f.close()
x, y, z = 0, 0, 0
dir = 0

function writeXYZ()
    h = fs.open("XYZ", "w")
    h.writeLine(x)
    h.writeLine(y)
    h.writeLine(z)
    h.writeLine(dir)
    h.close()
end

function readXYZ()
    h = fs.open("XYZ", "r")
    x = tonumber(h.readLine())
    y = tonumber(h.readLine())
    z = tonumber(h.readLine())
    dir = tonumber(h.readLine())
    move.setXYZ(x, y, z)
    move.setDir(dir)
end
 
function fw(i)
    for j = 1, i do
        if not check() then
            while not turtle.forward() do
                turtle.dig()
            end
            if dir == 0 then
                z = z - 1
            elseif dir == 1 then
                x = x + 1
            elseif dir == 2 then
                z = z + 1
            else
                x = x - 1
            end
            writeXYZ()
        end
    end
end
 
function bk(i)
    tr(2)
    fw(i)
    tr(2)
end
 
function up(i)
    for j = 1, i do
        if not checkUp() then
            while not turtle.up() do
                turtle.digUp()
            end
            y  = y + 1
            writeXYZ()
        end
    end
end
 
function dn(i)
    for j = 1, i do
        if not checkDn() then
            while not turtle.down() do
                turtle.digDown()
            end
            y = y - 1
            writeXYZ()
            
        end
    end
end
 
function tr(i)
    for j = 1, i do
        turtle.turnRight()
        dir = dir + 1
        if dir > 3 then
            dir = 0
        end
        writeXYZ()
    end
end
 
function tl(i)
    for j = 1, i do
        turtle.turnLeft()
        dir = dir - 1
        if dir < 0 then
            dir = 3
        end
        writeXYZ()
    end
end

function getXYZ()
    out = {}
    out["x"] = x
    out["y"] = y
    out["z"] = z
    out["dir"] = dir
    return out
end
 
function setXYZ(x1, y1, z1)
    x = x1
    y = y1
    z = z1
    writeXYZ()
end
 
function setDir(dir1)
    dir = dir1
    writeXYZ()
end
 
function setXYZDir(x1, y1, z1, dir1)
    setXYZ(x1, x2, x3)
    setDir(dir1)
end
 
function gotoDir(dir1)
    while dir ~= dir1 do
        tr(1)
    end
end
 
function gotoY(y1)
    while y < y1 do
        up(1)
    end
end
 
function gotoXYZ(x1, y1, z1)

    xdif = x - x1
    if xdif < 0 then  
        xdif = xdif * -1
    end
    if x1 < x then
        gotoDir(3)
        fw(xdif)
    elseif x1 > x then
        gotoDir(1)
        fw(xdif)
    end

    zdif = z - z1
    if zdif < 0 then
        zdif = zdif * -1
    end
    if z1 < z then
        gotoDir(0)
        fw(zdif)
    elseif z1 > z then
        gotoDir(2)
        fw(zdif)
    end

    ydif = y - y1
    if ydif < 0 then
        ydif = ydif * -1
    end
    if y1 < y then
        dn(ydif)
    else
        up(ydif)
    end
end
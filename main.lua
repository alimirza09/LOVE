function love.load()
    snekDirection = "right"
    snek = {}
    snek.x = 100
    snek.y = 100
    score = 0
    turnpointX = 0
    turnpointY = 0
    directionChanged = false
    -- debug = io.open("debuggingYay.txt", "w")
end

function love.update(dt)
    function love.keypressed(key, scancode, isrepeat)
        if isrepeat == false then
            if scancode == "w" and snekDirection ~= "down" then
                snekDirection = "up"
                turnpointX = snek.x
                turnpointY = snek.y
                directionChanged = true
            elseif scancode == "s" and snekDirection ~= "up" then
                snekDirection = "down"
                turnpointX = snek.x
                turnpointY = snek.y
                directionChanged = true
            elseif scancode == "a" and snekDirection ~= "right" then
                snekDirection = "left"
                turnpointX = snek.x
                turnpointY = snek.y
                directionChanged = true
            elseif scancode == "d" and snekDirection ~= "left" then
                snekDirection = "right"
                turnpointX = snek.x
                turnpointY = snek.y
                directionChanged = true
            end
        end
    end

    if snekDirection == "right" then
        snek.x = snek.x + 100 * dt
    elseif snekDirection == "left" then
        snek.x = snek.x - 100 * dt
    elseif snekDirection == "up" then
        snek.y = snek.y - 100 * dt
    elseif snekDirection == "down" then
        snek.y = snek.y + 100 * dt
    end
end

function love.draw()
    love.graphics.setColor(0.07451, 0.960784, 0.019608)
    love.graphics.rectangle("fill", snek.x, snek.y, 20, 20)
    if snekDirection == "right" or snekDirection == "left" then
        if directionChanged then
            n = 0
            if n <= score + 3 then
                for i = 1, score + 3, 1 do
                    drawSnekBody("lateral", turnpointX, turnpointY, i)
                end
                n = n + 1
            else
                directionChanged = false
            end
            --    debug:write("first one " .. turnpointX .. "\n" .. turnpointY .. "\n")
            --    debug:write("first one snek.x " .. snek.x .. "\n" .. snek.y .. "\n")
        else
            for i = 1, score + 3, 1 do
                love.graphics.rectangle("fill", snek.x + 28 * i, snek.y, 20, 20)
            end
        end
    end
    if snekDirection == "up" or snekDirection == "down" then
        n = 0
        if directionChanged then
            if n <= score + 3 then
                for i = 1, score + 3, 1 do
                    drawSnekBody("vertical", turnpointX, turnpointY, i)
                end
                n = n + 1
            else
                directionChanged = false
            end
            --    debug:write("second one " .. turnpointX .. "\n" .. turnpointY .. "\n")
            --    debug:write("second one snek.x " .. snek.x .. "\n" .. snek.y .. "\n")
        else
            for i = 1, score + 3, 1 do
                love.graphics.rectangle("fill", snek.x, snek.y + 28 * i, 20, 20)
            end
        end
    end
end

function drawSnekBody(dimension, x, y, i, n)
    if dimension == "vertical" then
        if n == i + 1 then
            love.graphics.rectangle("fill", x + 28 * i, y, 20, 20)
        else
            love.graphics.rectangle("fill", x, y + 28 * i, 20, 20)
        end
    elseif dimension == "lateral" then
        love.graphics.rectangle("fill", x, y + 28 * i, 20, 20)
    end
end

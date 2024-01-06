function love.load()
    snekDirection = "right"
    snek = {}
    snek.x = 100
    snek.y = 100
    score = 0
    turnpointX = 0
    turnpointY = 0
end
function love.update(dt)
    function love.keypressed(scancode, isrepeat)
        if scancode == "w" and snekDirection ~= "down" then
            snekDirection = "up"
        elseif scancode == "s" and snekDirection ~= "up" then
            snekDirection = "down"
        elseif scancode == "a" and snekDirection ~= "right" then
            snekDirection = "left"
        elseif scancode == "d" and snekDirection ~= "left" then
            snekDirection = "right"
        end
    end
    if snekDirection == "right" then
        snek.x = snek.x + 4
    elseif snekDirection == "left" then
        snek.x = snek.x - 4
    elseif snekDirection == "up" then
        snek.y = snek.y - 4
    elseif snekDirection == "down" then
        snek.y = snek.y + 4
    end
    if snekBodyX == turnpointX and snekBodyY == turnpointY and directionChanged then
        directionChanged = false
        snekBodyX = snek.x
        snekBodyY = snek.y + 28
    else
        snekBodyX = snek.x
        snekBodyY = snek.y
    end
end
function love.draw()
    love.graphics.setColor(0.07451, 0.960784, 0.019608)
    love.graphics.rectangle("fill", snek.x, snek.y, 20, 20)
    if snekDirection == "right" or snekDirection == "left" then
        for i = 1,score + 3,1 do    
            love.graphics.rectangle("fill", snekBodyX + (28 * i), snekBodyY, 20, 20)
        end
    end
    if snekDirection == "up" or snekDirection == "down" then
        for i = 1, score + 3, 1 do
            love.graphics.rectangle("fill", snekBodyX, snekBodyY + (28 * i), 20, 20)
        end
    end
end

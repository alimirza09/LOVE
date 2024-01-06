function love.load()
    snekDirection = "right"
    snek = {}
    snek.x = 100
    snek.y = 100
    score = 0
    turnpointX = 0
    turnpointY = 0
    directionChanged = false
end
function love.update(dt)
    function love.keypressed(scancode, isrepeat)
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
    if snekDirection == "right" then
        snek.x = snek.x + 2
    elseif snekDirection == "left" then
        snek.x = snek.x - 2
    elseif snekDirection == "up" then
        snek.y = snek.y - 2
    elseif snekDirection == "down" then
        snek.y = snek.y + 2
    end
end
function love.draw()
    love.graphics.setColor(0.07451, 0.960784, 0.019608)
    love.graphics.rectangle("fill", snek.x, snek.y, 20, 20)
    if snekDirection == "right" or snekDirection == "left" then
        if directionChanged then
            for i = 1 , score + 3 , 1 do
                love.graphics.rectangle("fill" , turnpointX , turnpointY  + 28*i , 20 , 20)
            end
            directionChanged = false
        else
            for i = 1,score + 3,1 do    
                love.graphics.rectangle("fill", snek.x + (28 * i), snek.y, 20, 20)
            end
        end
    end
    if snekDirection == "up" or snekDirection == "down" then
        if directionChanged then
            for i = 1 , score + 3 , 1 do
                love.graphics.rectangle("fill" , turnpointX + 28*i , turnpointY , 20 , 20)
            end
            directionChanged = false
        else
            for i = 1, score + 3, 1 do
                love.graphics.rectangle("fill", snek.x, snek.y + (28 * i), 20, 20)
            end
        end
    end
end

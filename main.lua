function love.load()
    local bump = require "bump"
    snekHead = love.graphics.newImage("snake.png")
    snekBody = love.graphics.newImage("snekBodyNew.png")
    currentHeadPositionX = 100
    currentHeadPositionY = 100
    score = 0;
    numOfApples = 0;
end
function love.update(dt)
    if love.keyboard.isDown("w") then
        currentHeadPositionY = currentHeadPositionY - 10
    elseif love.keyboard.isDown("d") then
        currentHeadPositionX = currentHeadPositionX + 10
    elseif love.keyboard.isDown("a") then
        currentHeadPositionX = currentHeadPositionX - 10
    elseif love.keyboard.isDown("s") then
        currentHeadPositionY = currentHeadPositionY + 10
    end
    if numOfApples == 0 then
        appleCoordX = math.random(100, 950)
        appleCoordY = math.random(50, 700)
        numOfApples = numOfApples + 1
    end
end
function love.draw()
    love.graphics.draw()
    love.graphics.draw(snekBody, currentHeadPositionX + 2, currentHeadPositionY + 32)
    love.graphics.draw(snekHead, currentHeadPositionX, currentHeadPositionY)
end

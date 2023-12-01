function love.load()
    snekHead = love.graphics.newImage("snake.png")
    snekBody = love.graphics.newImage("snekBodyNew.png")
    currentHeadPositionX = 100
    currentHeadPositionY = 100
    score = 0;
    
end
function love.update(dt)
    if love.keyboard.isDown("w") then
        currentHeadPositionY = currentHeadPositionY - 10
    end

    if love.keyboard.isDown("d") then
        currentHeadPositionX = currentHeadPositionX + 10
    end
    if love.keyboard.isDown("a") then
        currentHeadPositionX = currentHeadPositionX - 10
    end
    if love.keyboard.isDown("s") then
        currentHeadPositionY = currentHeadPositionY + 10
    end

end
function love.draw()
    love.graphics.draw(snekBody , currentHeadPositionX + 2, currentHeadPositionY + 32)
    love.graphics.draw(snekHead, currentHeadPositionX, currentHeadPositionY)
end
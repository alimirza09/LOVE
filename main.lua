function love.load()
    snekHead = love.graphics.newImage("snake.png")
    snekBody = love.graphics.newImage("snekBodyNew.png")
    apple = love.graphics.newImage("apple.png")
    currentHeadPositionX = 100
    currentHeadPositionY = 100
    score = 0;
    numOfApples = 0;

end
function love.update(dt)
    if love.keyboard.isDown("w") then
        currentHeadPositionY = currentHeadPositionY - 10  * dt
    elseif love.keyboard.isDown("d") then
        currentHeadPositionX = currentHeadPositionX + 10 * dt
    elseif love.keyboard.isDown("a") then
        currentHeadPositionX = currentHeadPositionX - 10 * dt
    elseif love.keyboard.isDown("s") then
        currentHeadPositionY = currentHeadPositionY + 10 * dt
    elseif love.keyboard.isDown("e") then
        numOfApples = 0
    end
    if numOfApples == 0 then
        appleCoordX = math.random(100, 950)
        appleCoordY = math.random(50, 700)
        numOfApples = numOfApples + 1
        print(appleCoordX)
        print(appleCoordY)
    end
    if currentHeadPositionX - 10 == appleCoordX or currentHeadPositionX + 10 == appleCoordX or currentHeadPositionY -
        10 == appleCoordY or currentHeadPositionY + 10 == appleCoordY then
            score = score + 1
    end

end
function love.draw()
    love.graphics.draw(snekBody, currentHeadPositionX + 2, currentHeadPositionY + 32)
    love.graphics.draw(apple, appleCoordX, appleCoordY)
    love.graphics.draw(snekHead, currentHeadPositionX, currentHeadPositionY)
end
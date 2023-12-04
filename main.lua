function love.load()
    snekHeadImage = love.graphics.newImage("snake.png")
    snekBody = love.graphics.newImage("snekBodyNew.png")
    apple = love.graphics.newImage("apple.png")
    currentHeadPositionX = 100
    currentHeadPositionY = 100
    score = 0
    numOfApples = 0
    world = love.physics.newWorld(0 , 0 , true)
    snekHeadBody = love.physics.newBody(world , currentHeadPositionX , currentHeadPositionY , "dynamic")
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
end
function love.draw()
    love.graphics.draw(snekBody, currentHeadPositionX + 2, currentHeadPositionY + 32)
    love.graphics.draw(apple, appleCoordX, appleCoordY)
    love.graphics.draw(snekHeadImage, currentHeadPositionX, currentHeadPositionY)
end

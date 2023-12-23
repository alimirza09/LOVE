function love.load()
    snekDirection = "right"
    snek = {}
    snekHeadImg = love.graphics.newImage("snake.png")
    snekBodyImg = love.graphics.newImage("snekBodyNew.png")
    snek.x = 100
    snek.y = 100
    score = 0
end
function love.update(dt)
    if love.keyboard.isDown("w") and snekDirection ~= "down" then
        snekDirection = "up"
    elseif love.keyboard.isDown("s") and snekDirection ~= "up" then
        snekDirection = "down"
    elseif love.keyboard.isDown("a") and snekDirection ~= "right" then
        snekDirection = "left"
    elseif love.keyboard.isDown("d") and snekDirection ~= "left" then
        snekDirection = "right"
    
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
end
function love.draw()
    love.graphics.setColor(0.07451, 0.960784, 0.019608)
    love.graphics.rectangle("fill",snek.x,snek.y,20,20)
    for i = 1 , score + 3 , 1 do
        love.graphics.rectangle("fill", snek.x, snek.y, 20, 20)
    end
end
function love.load()
   snekDirection = "right"
   snek = {} 
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
    print(snekDirection)
end

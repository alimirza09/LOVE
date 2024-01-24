function love.load()
    currentPosition = 1
end

function love.update()

end

function love.keypressed(key)
    if key == 's' then
        if currentPosition > 1 then
            currentPosition = currentPosition - 1
        end
    elseif key == 'w' then
        if currentPosition < 2 then
            currentPosition = currentPosition + 1
        end
    end
end

function love.draw()
end

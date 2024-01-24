function love.load()
    gridXCount = 55
    gridYCount = 37
    score = 0
    cellSize = 20
    cueMusic("backgroundMusic.wav", true)
    reset()
end

function love.update(dt)
    timer = timer + dt

    if snakeAlive then
        if timer >= 0.15 then
            timer = 0

            if #directionQueue > 1 then
                table.remove(directionQueue, 1)
            end

            local nextXPosition = snakeSegments[1].x
            local nextYPosition = snakeSegments[1].y

            if directionQueue[1] == 'right' then
                nextXPosition = nextXPosition + 1
                if nextXPosition > gridXCount then
                    nextXPosition = 1
                end
            elseif directionQueue[1] == 'left' then
                nextXPosition = nextXPosition - 1
                if nextXPosition < 1 then
                    nextXPosition = gridXCount
                end
            elseif directionQueue[1] == 'down' then
                nextYPosition = nextYPosition + 1
                if nextYPosition > gridYCount then
                    nextYPosition = 1
                end
            elseif directionQueue[1] == 'up' then
                nextYPosition = nextYPosition - 1
                if nextYPosition < 1 then
                    nextYPosition = gridYCount
                end
            end

            local canMove = true

            for segmentIndex, segment in ipairs(snakeSegments) do
                if segmentIndex ~= #snakeSegments
                    and nextXPosition == segment.x
                    and nextYPosition == segment.y then
                    canMove = false
                end
            end

            if canMove then
                table.insert(snakeSegments, 1, {
                    x = nextXPosition, y = nextYPosition
                })

                if snakeSegments[1].x == foodPosition.x
                    and snakeSegments[1].y == foodPosition.y then
                    moveFood()
                    score = score + 1
                    cueMusic("AppleEat.wav", false)
                else
                    table.remove(snakeSegments)
                end
                if score == 10 then
                    cutscene = true
                end
            else
                snakeAlive = false
            end
        end
        if cutscene == true then

        end
    elseif timer >= 2 then
        reset()
    end
end

function love.keypressed(key)
    if key == 'd'
        and directionQueue[#directionQueue] ~= 'right'
        and directionQueue[#directionQueue] ~= 'left' then
        table.insert(directionQueue, 'right')
    elseif key == 'a'
        and directionQueue[#directionQueue] ~= 'left'
        and directionQueue[#directionQueue] ~= 'right' then
        table.insert(directionQueue, 'left')
    elseif key == 'w'
        and directionQueue[#directionQueue] ~= 'up'
        and directionQueue[#directionQueue] ~= 'down' then
        table.insert(directionQueue, 'up')
    elseif key == 's'
        and directionQueue[#directionQueue] ~= 'down'
        and directionQueue[#directionQueue] ~= 'up' then
        table.insert(directionQueue, 'down')
    end
end

function love.draw()
    local font = love.graphics.newFont("PublicPixel.ttf")
    love.graphics.setBackgroundColor(0.1607843137, 0.1568627451, 0.1607843137)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. score, font, 10, 10)

    for segmentIndex, segment in ipairs(snakeSegments) do
        if snakeAlive then
            love.graphics.setColor(0.07451, 0.960784, 0.019608)
        else
            love.graphics.setColor(.5, .5, .5)
        end
        drawCell(segment.x, segment.y)
    end

    love.graphics.setColor(1, .3, .3)
    drawCell(foodPosition.x, foodPosition.y)
end

function cueMusic(File, Loop)
    local MusicSource = love.audio.newSource(File, "static")
    MusicSource:setLooping(Loop)
    MusicSource:play()
end

function moveFood()
    local possibleFoodPositions = {}
    for foodX = 1, gridXCount do
        for foodY = 1, gridYCount do
            local possible = true

            for segmentIndex, segment in ipairs(snakeSegments) do
                if foodX == segment.x and foodY == segment.y then
                    possible = false
                end
            end

            if possible then
                table.insert(possibleFoodPositions, { x = foodX, y = foodY })
            end
        end
    end
    foodPosition = possibleFoodPositions[
    love.math.random(#possibleFoodPositions)
    ]
end

function reset()
    snakeSegments = {
        { x = 3, y = 1 },
        { x = 2, y = 1 },
        { x = 1, y = 1 },
    }
    directionQueue = { 'right' }
    snakeAlive = true
    timer = 0
    score = 0
    moveFood()
end

function drawCell(x, y)
    love.graphics.rectangle(
        'fill',
        (x - 1) * cellSize,
        (y - 1) * cellSize,
        cellSize - 1,
        cellSize - 1
    )
end

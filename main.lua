local player
local pipe
local background

function love.load()
    pipe = {
        x = 500,
        y = math.random(100, 400),
        sprite = love.graphics.newImage("assets/pipe.png"),
        speed = 200,
        spacing = 150
    }
    player = {
        y = 250,
        x = 100,
        velocity = 0,
        force = -275,
        sprite = love.graphics.newImage("assets/bird.png"),
        angle = 0,
        gravity = 400
    }
    background = love.graphics.newImage("assets/background.png")
end

function love.update(dt)
    if pipe.x <= -50 then
        pipe.x = 500
        pipe.y = math.random(100, 400)
    end

    player.velocity = player.velocity + player.gravity * dt
    pipe.x = pipe.x - pipe.speed * dt
    player.y = player.y + player.velocity * dt
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(pipe.sprite, pipe.x, pipe.y + pipe.spacing / 2)
    love.graphics.draw(pipe.sprite, pipe.x, pipe.y - 450 - pipe.spacing / 2)
    love.graphics.draw(player.sprite, player.x, player.y, player.angle, 0.1, 0.1, 25, 25)
end

function love.keypressed(key)
    if key == "space" then
        player.velocity = player.force
    end
end
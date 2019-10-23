
  local Map = require 'core/map'
  local Util = require 'core/util'
  local gamera = require 'core/gamera'
love.graphics.setDefaultFilter( 'nearest', 'nearest')
function love.load()
cam = gamera.new(0, 0, 2000, 2000)

  -- Create the player variables
  img = love.graphics.newImage('hero/sliced/idle-2.png')
img1 = love.graphics.newImage('hero/sliced/idle-2.png')
  x = 200
  y = 200
  x1 = 300
  y1 = 400
  x2 = 300
  y2 = 400
  x3 = 100
  y3 = 100
  w = 30
  h = 30
hp = 100
  -- Create the background map
  floor = love.graphics.newImage('assets-1/dungeon/floor/grass/grass_2.png')
  background = {
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
    {floor, floor, floor, floor, floor, floor},
  }

  wall = love.graphics.newImage('assets-1/dungeon/trees/mangrove_3.png')
  walls = {
    {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
    {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},




  }
map = Map:new(background)
  background = Map:new(background)
  collide = Map:new(walls)
end
function love.update(dt)

  function love.update(dt)
    if love.keyboard.isDown('up') then
      if collide:cc(x, y - 5, 64, 64) == false then
        y = y - 5
      end
    end
    if love.keyboard.isDown('down') then
      if collide:cc(x, y + 5, 64, 64) == false then
        y = y + 5
      end
    end
    if love.keyboard.isDown('right') then
      if collide:cc(x + 5, y, 64, 64) == false then
        x = x + 5
      end
    end
    if love.keyboard.isDown('left') then
      if collide:cc(x - 5, y , 64, 64) == false then
        x = x - 5
      end
    end
  end
  if x > 2400 then
    x = 2400
  end
if love.keyboard.isDown('right') then
x = x + 5
end
if love.keyboard.isDown('left') then
x = x - 5
end
if love.keyboard.isDown('down') then
y = y + 5
end
if love.keyboard.isDown('up') then
y = y - 5
end
if love.keyboard.isDown('right') then
x2 = x2 + 5
end
if love.keyboard.isDown('left') then
x2 = x2 - 5
end
if love.keyboard.isDown('down') then
y2 = y2 + 5
end
if love.keyboard.isDown('up') then
y2 = y2 - 5
end
if cc(x, y, w, h,   x1, y1, 30, 30 ) then
  -- if true, decrease HP:
  hp = hp - 1
end
if hp==0 then
x = 1000000000
y = 1000000000
end
if hp==0 then
x2 = 1000
y2 = 500
end

if x1 < 20 then
  direction = 'right'
end
if x1 > 400 then
  direction = 'left'
end

if direction == 'right' then
  x1 = x1 + 1
end
if direction == 'left' then
  x1 = x1 - 1
end
--if hp == 0 then

end





function love.draw()

cam:draw(function(l, t, w, h)
  map:draw()
    love.graphics.print(hp, 10, 10)
  if hp==0 then
  love.graphics.print('GAME OVER', x3, y3)
  end
  love.graphics.print('Hello, world!', 0, 0)
  --Draw everything here. For example:
  love.graphics.draw(img, x, y)
  love.graphics.draw(img1, x2, y2)
  background:draw()
  collide:draw()
  love.graphics.draw(img, x, y)

end)
end

function love.keypressed(key)
  if key == 'escape' then
    love.exitModule()
  end
end
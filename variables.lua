-- sizes are in px
-- speeds are in px/s
-- times are in s

wScr = love.graphics.getWidth()
hScr = love.graphics.getHeight()
DEBUG = false

bubbleRadius = 32 -- 20
bubbleColors =
	{
		{255,0,0},
		{0,255,0},
		{0,0,255},
		{255,255,0},
		{255,0,255},
		{0,255,255},
		{255,255,255}
	}
bubbleColorNbr = #bubbleColors
bubbleSequenceSize = 3
bubbleDropInitialSpeed = -250
bubbleDropInitSpeedNoise = 150
bubbleDeadDropAcc = 750 -- (px/s)/s

function getRandomColor()
	return math.random(bubbleColorNbr)
end

playerRadius = 50
playerCoolDown = 1
playerPupilSize = 5

bbulletRadius = bubbleRadius
bbulletSpeed = 1000


uiSize = 100
wWorld = wScr - uiSize
maxLevel = 3
ceilingDropTime = {2, 2, 0.02}
ceilingDropSize = {5, 10, 1}
bubbleInit_ProbaChild = {0.1, 0.2, 0.5}

function round(num) 
	if num >= 0 then return math.floor(num+.5) 
	else return math.ceil(num-.5) end
end

function drawDashedLine(x1, y1, x2, y2, lineSize, dashSize)
	_a = bafaltomAngle(x1, y1, x2, y2)
	_d = distance2Points(x1, y1, x2, y2)
	_lineX = lineSize*math.cos(_a)
	_lineY = lineSize*math.sin(_a)
	_dashX = dashSize*math.cos(_a)
	_dashY = dashSize*math.sin(_a)
	_curX, _curY = x1, y1
	while (_curY > 0 and distance2Points(x1, y1, _curX + _lineX, _curY + _lineY) < _d) do
		love.graphics.line(_curX, _curY, _curX + _lineX, _curY + _lineY)
		_curX = _curX + _lineX + _dashX
		_curY = _curY + _lineY + _dashY
	end
	-- draw next line
	love.graphics.line(_curX, _curY, x2, y2)
end



-- ASSERTIONS
assert (maxLevel == #ceilingDropTime)
assert (#bubbleInit_ProbaChild == #ceilingDropTime)
assert (#ceilingDropSize == #ceilingDropTime)

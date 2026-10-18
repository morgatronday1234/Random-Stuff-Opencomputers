local args = {...}

local basePath = "/mnt/702/"
local targetFramerate = 30 --30 FPS

local comp = require("component")
local term = require("term")
local io = require("io")
local fs = require("filesystem")
local computer = require("computer")

local mainGpu = comp.proxy("abf1b043-f9c9-4f70-86a3-72def0534e7f") mainGpu.bind("f7cf7c51-949c-4882-9e59-542745b40a5d")
local prgGpu = comp.proxy("19807016-2640-456a-986f-2d7934abe473") prgGpu.bind("af6a287f-9944-41a7-89b3-54e6cc0a8eb7") 
prgGpu.setResolution(10, 3) 


local mx, my = prgGpu.getResolution()
function setDebugText(text, fps)
 prgGpu.fill(1, 1, mx, my, " ")
 prgGpu.set(1, 1, text)
 prgGpu.set(1, 2, "::3")
 prgGpu.set(1, 3, tostring(fps).."t/f")
 comp.colorful_lamp.setLampColor(math.random(1, 32767))
end

function endCard()
 mainGpu.fill(1, 1,  40, 40, " ")
 mainGpu.set(20, 10, "Made by morg <3")
end


local maxFrame = 0
for _ in fs.list(basePath) do
 maxFrame = maxFrame +1
end


for frame= (function() if (args[1]) then return tonumber(args[1]) end return 1 end)(), maxFrame-1 do
 --term.clear()
 local line = 1
 
 local fpsStart = os.time()*(1000/60/60)
 for lineText in io.lines(basePath..tostring(frame)..".bmp.txt") do
  mainGpu.set(1, line, lineText)
  line = line +1
 end
 local fpsFinish = os.time()*(1000/60/60)
 
 --print(fpsStart, fpsFinish)
 setDebugText(("%s/%s"):format(frame, maxFrame-1), (fpsFinish-fpsStart))
 --os.sleep((targetFramerate/1000))
end
endCard()
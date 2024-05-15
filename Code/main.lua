-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

system.activate("multitouch")

function newKey(p)

	local object = {}
	
	local xOffset = 48
	
	object.sound = audio.loadSound(tostring(p)..".wav")
	
	function object:playSound()
		audio.play(object.sound)
		object.keyCover.isVisible = true
		
		function hideKeyCover()
			object.keyCover.isVisible = false
		end
		timer.performWithDelay(250, hideKeyCover)
	end
		
	function touchListener(e)
		if (e.phase == "began") then
			object:playSound()
		end
	end
	
	if (p == 1 or p == 3 or p == 5 or p == 6 or p == 8 or p == 10
	or p == 12 or p == 13 or p == 15 or p == 17) then
		object.key = display.newImage("White Key.png")
		object.keyTouchArea = display.newImage("White Key Touch Area.png")
		object.keyTouchArea.alpha = .01
		object.keyCover = display.newImage("White Key Cover.png")	
		object.keyCover.isVisible = false		
		if (p == 1) then
			object.key.x = 24
		elseif (p == 3) then
			object.key.x = 24 + xOffset
		elseif (p == 5) then
			object.key.x = 24 + xOffset * 2		
		elseif (p == 6) then
			object.key.x = 24 + xOffset * 3
		elseif (p == 8) then
			object.key.x = 24 + xOffset * 4
		elseif (p == 10) then
			object.key.x = 24 + xOffset * 5
		elseif (p == 12) then
			object.key.x = 24 + xOffset * 6
		elseif (p == 13) then
			object.key.x = 24 + xOffset * 7
		elseif (p == 15) then
			object.key.x = 24 + xOffset * 8
		elseif (p == 17) then
			object.key.x = 24 + xOffset * 9
		end		
	
		object.key.y = 220
		object.keyTouchArea.x = object.key.x
		object.keyTouchArea.y = 285
		
		object.keyCover.x = object.key.x
		object.keyCover.y = object.key.y		
		
		object.keyTouchArea:addEventListener("touch", touchListener)
	else
		object.key = display.newImage("Black Key.png")
		object.keyCover = display.newImage("Black Key Cover.png")		
		object.keyCover.isVisible = false		

		if (p == 2) then
			object.key.x = 45
		elseif (p == 4) then
			object.key.x = 45 + xOffset + 5
		elseif (p == 7) then
			object.key.x = 45 + xOffset * 3
		elseif (p == 9) then
			object.key.x = 45 + xOffset * 4 + 2.5
		elseif (p == 11) then
			object.key.x = 45 + xOffset * 5 + 5
		elseif (p == 14) then
			object.key.x = 45 + xOffset * 7
		elseif (p == 16) then
			object.key.x = 45 + xOffset * 8 + 5
		end		
		
		object.key.y = 185
		
		object.keyCover.x = object.key.x
		object.keyCover.y = object.key.y		
		
		object.key:addEventListener("touch", touchListener)
	end
	
	return object
end



local keyboard = {}

keyboard[1] = newKey(1)
keyboard[3] = newKey(3)
keyboard[5] = newKey(5)
keyboard[6] = newKey(6)
keyboard[8] = newKey(8)
keyboard[10] = newKey(10)
keyboard[12] = newKey(12)
keyboard[13] = newKey(13)
keyboard[15] = newKey(15)
keyboard[17] = newKey(17)
keyboard[2] = newKey(2)
keyboard[4] = newKey(4)
keyboard[7] = newKey(7)
keyboard[9] = newKey(9)
keyboard[11] = newKey(11)
keyboard[14] = newKey(14)
keyboard[16] = newKey(16)

local piannoFrame = display.newImage("Pianno Frame.png", true)
piannoFrame.x = display.contentWidth / 2
piannoFrame.y = display.contentHeight / 2 + 12

local piannoLogo = display.newImage("Pianno Logo.png")
piannoLogo.x = 75
piannoLogo.y = 28

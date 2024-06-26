local class = require("library/middleclass")
local Bar = require("classes/Bar")
local Button = require("classes/Button")

---@class Gui
local Gui = class("gui")

function Gui:initialize()
    
    self.quitButton =       Button:new("QuitButton")
    self.resetButton =      Button:new("RestartButton")
    self.holderBar =        Bar:new("HealthEnergyHolder")
    self.healthBarHurt =    Bar:new("HealthBarHurt2")
    self.healthBarHealthy = Bar:new("HealthBarHealthy1")
    self.energyEmpty =      Bar:new("EnergyEmpty2")
    self.energyFull =       Bar:new("EnergyFull1")

end

function Gui:draw()

    self.quitButton:draw()
    self.resetButton:draw()
    self.holderBar:draw()
    self.healthBarHurt:draw()
    self.healthBarHealthy:draw()
    self.energyEmpty:draw()
    self.energyFull:draw()
    
end

function Gui:update(dt, health, maxHealth, energy, maxEnergy)
    self.healthBarHealthy.scaleX = (health / maxHealth) * 0.37
    local tempEnergy = (energy / maxEnergy) * 0.37

    if tempEnergy >= 0 then
        self.energyFull.scaleX = (energy / maxEnergy) * 0.37
    else
        self.energyFull.scaleX = 0
    end

end

function Gui:mousepressed(x, y, button, istouch, presses, player)
    if x >= self.quitButton.hitBoxX[1] and x <= self.quitButton.hitBoxX[2] and y >= self.quitButton.hitBoxY[1] and y <= self.quitButton.hitBoxY[2] then
        self.quitButton:mousepressed(x, y, button, istouch, presses)
    elseif x >= self.resetButton.hitBoxX[1] and x <= self.resetButton.hitBoxX[2] and y >=self.resetButton.hitBoxY[1] and y <= self.resetButton.hitBoxY[2] then
        self.resetButton:mousepressed(x, y, button, istouch, presses, player)
    end

end

return Gui
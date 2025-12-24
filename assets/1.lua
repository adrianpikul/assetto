
local screenSize = vec2(ac.getSim().windowWidth, ac.getSim().windowHeight)
local windowSize = vec2(840, 500)
local windowPos = (screenSize - windowSize) / 2
local isVisible = true
local imageUrl =
"https://raw.githubusercontent.com/adrianpikul/assetto/refs/heads/master/assets/newa.jpg"
local buttonColor = rgbm(0, 0.6, 0, 1)
local buttonHoverColor = rgbm(0.05, 0.7, 0.05, 1)
local buttonActiveColor = rgbm(0, 0.45, 0, 1)

function script.drawUI()
    if not isVisible then return end

    ui.pushStyleColor(ui.StyleColor.WindowBg, rgbm(0, 0, 0, 1))
    ui.pushStyleColor(ui.StyleColor.TitleBg, rgbm(0, 0, 0, 1))
    ui.pushStyleColor(ui.StyleColor.TitleBgActive, rgbm(0, 0, 0, 1))
    ui.pushStyleColor(ui.StyleColor.TitleBgCollapsed, rgbm(0, 0, 0, 1))
    ui.beginTransparentWindow("SideForceDrive Drift", windowPos, windowSize, false, true)

    ui.image(imageUrl, vec2(windowSize.x - 40, 418))
    local buttonWidth = math.floor(windowSize.x * 0.35)
    local buttonHeight = 36
    local cursorStart = ui.cursorStartPos()
    local contentWidth = ui.windowSize().x - cursorStart.x * 2
    ui.setCursorX(cursorStart.x + (contentWidth - buttonWidth) / 2)
    ui.pushStyleColor(ui.StyleColor.Button, buttonColor)
    ui.pushStyleColor(ui.StyleColor.ButtonHovered, buttonHoverColor)
    ui.pushStyleColor(ui.StyleColor.ButtonActive, buttonActiveColor)
    if ui.button("Close this popup✅", vec2(buttonWidth, buttonHeight), ui.ButtonFlags.Active) then
        isVisible = false
    end
    ui.popStyleColor(3)
    ui.popStyleColor(4)

    ui.endTransparentWindow()
end

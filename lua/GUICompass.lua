class 'GUICompass' (GUIAnimatedScript)

local kLargePlayerArrowFileName = PrecacheAsset("ui/minimap_largeplayerarrow.dds")


function GUICompass:Initialize()
    GUIAnimatedScript.Initialize(self)
    
    self.compass = GUIManager:CreateGraphicItem()
    self.compass:SetSize(Vector(64, 64, 0)) //kPlayerIconSize
    self.compass:SetAnchor(GUIItem.Left, GUIItem.Top)
    self.compass:SetPosition(Vector(100, 150, 0))
    self.compass:SetTexture(kLargePlayerArrowFileName)
    self.compass:SetIsVisible(kCompassMode > 0)
    self.compass:SetLayer(6)
end

function GUICompass:Uninitialize()
    GUIAnimatedScript.Uninitialize(self)
    GUI.DestroyItem(self.compass)
end

function GUICompass:Update(deltaTime)
    GUIAnimatedScript.Update(self, deltaTime)

    local playerRotation = PlayerUI_GetMinimapPlayerDirection()
    local compassRotation = math.abs(math.pi - playerRotation)
    
    if kCompassMode == 1 then
        // player orientation
        self.compass:SetColor(Color(1, 0.8, 0, 1))
        self.compass:SetRotation(Vector(0, 0, playerRotation))
    elseif kCompassMode == 2 then
        // always north
        self.compass:SetColor(Color(1, 0, 0, 1))
        self.compass:SetRotation(Vector(0, 0, compassRotation))
    end  
end

// TODO
//function GUICompass:OnResolutionChanged(oldX, oldY, newX, newY)
//end
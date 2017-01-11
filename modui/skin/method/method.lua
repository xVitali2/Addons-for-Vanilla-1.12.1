


    --[[    this is a modified version of neal's !Beautycase
            https://github.com/renstrom/NeavUI/tree/master/Interface/AddOns/!Beautycase
        api
            modSkin(f, size or 0)
            modSkinSize(f, size)
            modSkinPadding(f, number or [uL1, uL2, uR1, uR2, bL1, bL2, bR1, bR2])
            modSkinDraw(f, drawlayer)
            modSkinTexture(f, texture or 'default')
            modSkinShadowTexture(f, texture)
            modSkinColor(f, r, g, b, a)
            modSkinShadowColor(f, r, g, b, a)
            modSkinHide(f)
            modSkinShow(f)
            modSkinned(f) - true if has a border, false if not
            local height, width, texture, r, g, b, alpha = modSkinInfo(f)    ]]

    local name = '|cffFF0000modSkin|r'
    local TEXTURE = [[Interface\AddOns\modui\skin\method\texture\texture]]
    local TEXTURE_S = [[Interface\AddOns\modui\skin\method\texture\textureShadow]]


    modSkinned = function(self)
        if self.modSkin then return true else return false end
    end


    modSkinInfo = function(self)
        if not self then print(name..' error:|r The frame does not exist!')
        elseif self.modSkin then
            local tex = self.modSkin[1]:GetTexture()
            local width = self.modSkin[1]:GetWidth() local height = self.modSkin[1]:GetHeight()
            local r, g, b, a = self.modSkin[1]:GetVertexColor()
            return width, height, tex, r, g, b, a
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end


    modSkinPadding = function(self, uL1, uL2, uR1, uR2, bL1, bL2, bR1, bR2)
        if not self then print(name..' error:|r This frame does not exist!') return end

        if not self:IsObjectType'Frame' then
            print(name..' error:|r The entered object \''..self:GetName()..'\' is not a frame!')
            return
        end

        if uL1 then
            if not uL2 and not uR1 and not uR2 and not bL1 and not bL2 and not bR1 and not bR2 then
                uL2, uR1, uR2, bL1, bL2, bR1, bR2 = uL1, uL1, uL1, uL1, uL1, uL1, uL1
            end
        end

        local space
        if modSkinInfo(self) >= 10 then space = 3 else space = modSkinInfo(self)/3.5 end

        if self.modSkin then
            self.modSkin[1]:SetPoint('TOPLEFT', self, -(uL1 or 0), uL2 or 0)
            self.modSkinShadow[1]:SetPoint('TOPLEFT', self, -(uL1 or 0)-space, (uL2 or 0)+space)

            self.modSkin[2]:SetPoint('TOPRIGHT', self, uR1 or 0, uR2 or 0)
            self.modSkinShadow[2]:SetPoint('TOPRIGHT', self, (uR1 or 0)+space, (uR2 or 0)+space)

            self.modSkin[3]:SetPoint('BOTTOMLEFT', self, -(bL1 or 0), -(bL2 or 0))
            self.modSkinShadow[3]:SetPoint('BOTTOMLEFT', self, -(bL1 or 0)-space, -(bL2 or 0)-space)

            self.modSkin[4]:SetPoint('BOTTOMRIGHT', self, bR1 or 0, -(bR2 or 0))
            self.modSkinShadow[4]:SetPoint('BOTTOMRIGHT', self, (bR1 or 0)+space, -(bR2 or 0)-space)
        end
    end


    modSkinColor = function(self, r, g, b, a)
        if not self then print(name..' error:|r This frame does not exist!')
        elseif self.modSkin then
            for i = 1, 8 do self.modSkin[i]:SetVertexColor(r, g, b, a or 1) end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end


    modSkinShadowColor = function(self, r, g, b, a)
        if not self then print(name..' error:|r This frame does not exist!')
        elseif self.modSkinShadow then
            for i = 1, 8 do self.modSkinShadow[i]:SetVertexColor(r, g, b, a or 1) end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end


    modSkinDraw = function(self, layer)
        if not self then print(name..' error:|r This frame does not exist!')
        elseif self.modSkin then
            for i = 1, 8 do self.modSkin[i]:SetDrawLayer(layer or 'OVERLAY') end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end


    modSkinTexture = function(self, texture)
        if not self then print(name..' error:|r This frame does not exist!')
        elseif self.modSkin then
            for i = 1, 8 do
                if texture == 'default' then self.modSkin[i]:SetTexture(TEXTURE)
                else self.modSkin[i]:SetTexture(texture)
                end
            end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end


    modSkinShadowTexture = function(self, texture)
        if (not self) then print(name..' error:|r This frame does not exist!')
        elseif self.modSkinShadow then
            for i = 1, 8 do self.modSkinShadow[i]:SetTexture(texture) end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end


    modSkinSize = function(self, size)
        if not self then print(name..' error:|r This frame does not exist!')
        elseif self.modSkinShadow then
            for i = 1, 8 do
                self.modSkin[i]:SetWidth(borderSize)
                self.modSkin[i]:SetHeight(borderSize)
                self.modSkinShadow[i]:SetWidth(borderSize)
                self.modSkinShadow[i]:SetHeight(borderSize)
            end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end


    modSkinHide = function(self)
        if not self then print(name..' error:|r This frame does not exist!')
        elseif self.modSkinShadow then
            for i = 1, 8 do
                self.modSkin[i]:Hide()
                self.modSkinShadow[i]:Hide()
            end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end

    modSkinShow = function(self)
        if not self then print(name..' error:|r This frame does not exist!')
        elseif self.modSkinShadow then
            for i = 1, 8 do
                self.modSkin[i]:Show()
                self.modSkinShadow[i]:Show()
            end
        else print(name..' error:|r Invalid frame \''..self:GetName()..'\'! This object has no '..name..' border')
        end
    end

    modSkin = function(self, borderSize)
        if not self then print(name..' error:|r This frame does not exist!') return end

        if not self:IsObjectType'Frame' then
            print(name..' error:|r The entered object \''..self:GetName()..'\' is not a frame!')
            return
        end

        if self.modSkin then return end

        local space
        if borderSize >= 10 then space = 3 else space = borderSize/3.5 end

        if not self.modSkin then
            self.modSkinShadow = {}
            for i = 1, 8 do
                self.modSkinShadow[i] = self:CreateTexture(nil, 'BORDER')
                self.modSkinShadow[i]:SetParent(self)
                self.modSkinShadow[i]:SetTexture(TEXTURE_S)
                self.modSkinShadow[i]:SetWidth(borderSize)
                self.modSkinShadow[i]:SetHeight(borderSize)
                self.modSkinShadow[i]:SetVertexColor(0, 0, 0, .7)
            end

            self.modSkin = {}
            for i = 1, 8 do
                self.modSkin[i] = self:CreateTexture(nil, 'OVERLAY', 7)
                self.modSkin[i]:SetParent(self)
                self.modSkin[i]:SetTexture(TEXTURE)
                self.modSkin[i]:SetDrawLayer(layer or 'OVERLAY', 7)
                self.modSkin[i]:SetWidth(borderSize)
                self.modSkin[i]:SetHeight(borderSize)
                self.modSkin[i]:SetVertexColor(R or 1, G or 1, B or 1)
            end

            self.modSkin[1]:SetTexCoord(0, 1/3, 0, 1/3)
            self.modSkin[1]:SetPoint('TOPLEFT', self, -(uL1 or 0), uL2 or 0)

            self.modSkin[2]:SetTexCoord(2/3, 1, 0, 1/3)
            self.modSkin[2]:SetPoint('TOPRIGHT', self, uR1 or 0, uR2 or 0)

            self.modSkin[3]:SetTexCoord(0, 1/3, 2/3, 1)
            self.modSkin[3]:SetPoint('BOTTOMLEFT', self, -(bL1 or 0), -(bL2 or 0))

            self.modSkin[4]:SetTexCoord(2/3, 1, 2/3, 1)
            self.modSkin[4]:SetPoint('BOTTOMRIGHT', self, bR1 or 0, -(bR2 or 0))

            self.modSkin[5]:SetTexCoord(1/3, 2/3, 0, 1/3)
            self.modSkin[5]:SetPoint('TOPLEFT', self.modSkin[1], 'TOPRIGHT')
            self.modSkin[5]:SetPoint('TOPRIGHT', self.modSkin[2], 'TOPLEFT')

            self.modSkin[6]:SetTexCoord(1/3, 2/3, 2/3, 1)
            self.modSkin[6]:SetPoint('BOTTOMLEFT', self.modSkin[3], 'BOTTOMRIGHT')
            self.modSkin[6]:SetPoint('BOTTOMRIGHT', self.modSkin[4], 'BOTTOMLEFT')

            self.modSkin[7]:SetTexCoord(0, 1/3, 1/3, 2/3)
            self.modSkin[7]:SetPoint('TOPLEFT', self.modSkin[1], 'BOTTOMLEFT')
            self.modSkin[7]:SetPoint('BOTTOMLEFT', self.modSkin[3], 'TOPLEFT')

            self.modSkin[8]:SetTexCoord(2/3, 1, 1/3, 2/3)
            self.modSkin[8]:SetPoint('TOPRIGHT', self.modSkin[2], 'BOTTOMRIGHT')
            self.modSkin[8]:SetPoint('BOTTOMRIGHT', self.modSkin[4], 'TOPRIGHT')

            self.modSkinShadow[1]:SetTexCoord(0, 1/3, 0, 1/3)
            self.modSkinShadow[1]:SetPoint('TOPLEFT', self, -(uL1 or 0)-space, (uL2 or 0)+space)

            self.modSkinShadow[2]:SetTexCoord(2/3, 1, 0, 1/3)
            self.modSkinShadow[2]:SetPoint('TOPRIGHT', self, (uR1 or 0)+space, (uR2 or 0)+space)

            self.modSkinShadow[3]:SetTexCoord(0, 1/3, 2/3, 1)
            self.modSkinShadow[3]:SetPoint('BOTTOMLEFT', self, -(bL1 or 0)-space, -(bL2 or 0)-space)

            self.modSkinShadow[4]:SetTexCoord(2/3, 1, 2/3, 1)
            self.modSkinShadow[4]:SetPoint('BOTTOMRIGHT', self, (bR1 or 0)+space, -(bR2 or 0)-space)

            self.modSkinShadow[5]:SetTexCoord(1/3, 2/3, 0, 1/3)
            self.modSkinShadow[5]:SetPoint('TOPLEFT', self.modSkinShadow[1], 'TOPRIGHT')
            self.modSkinShadow[5]:SetPoint('TOPRIGHT', self.modSkinShadow[2], 'TOPLEFT')

            self.modSkinShadow[6]:SetTexCoord(1/3, 2/3, 2/3, 1)
            self.modSkinShadow[6]:SetPoint('BOTTOMLEFT', self.modSkinShadow[3], 'BOTTOMRIGHT')
            self.modSkinShadow[6]:SetPoint('BOTTOMRIGHT', self.modSkinShadow[4], 'BOTTOMLEFT')

            self.modSkinShadow[7]:SetTexCoord(0, 1/3, 1/3, 2/3)
            self.modSkinShadow[7]:SetPoint('TOPLEFT', self.modSkinShadow[1], 'BOTTOMLEFT')
            self.modSkinShadow[7]:SetPoint('BOTTOMLEFT', self.modSkinShadow[3], 'TOPLEFT')

            self.modSkinShadow[8]:SetTexCoord(2/3, 1, 1/3, 2/3)
            self.modSkinShadow[8]:SetPoint('TOPRIGHT', self.modSkinShadow[2], 'BOTTOMRIGHT')
            self.modSkinShadow[8]:SetPoint('BOTTOMRIGHT', self.modSkinShadow[4], 'TOPRIGHT')
        end
    end

    --

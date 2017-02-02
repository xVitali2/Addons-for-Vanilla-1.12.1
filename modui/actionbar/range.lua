
    local orig = {}

    orig.ActionButton_UpdateUsable = ActionButton_UpdateUsable
    orig.ActionButton_OnUpdate     = ActionButton_OnUpdate

    function ActionButton_UpdateUsable()
       local id = ActionButton_GetPagedID(this)
       local usable, nomana = IsUsableAction(id)
       if  usable then
           local icon = _G[this:GetName()..'Icon']
           if  nomana then
               icon:SetVertexColor(.5, .5, 1)
           elseif IsActionInRange(id) == 0 then
               icon:SetVertexColor(.4, .4, .4)
           else
               icon:SetVertexColor(1, 1, 1)
           end
       else
           orig.ActionButton_UpdateUsable()
       end
    end

    function ActionButton_OnUpdate(elapsed)
       orig.ActionButton_OnUpdate(elapsed)
       ActionButton_UpdateUsable()
    end


    --

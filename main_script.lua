-- 直接把下面整段复制即可用（已含新增自瞄按钮）
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/DozeIsOkLol/UILibarySource/refs/heads/main/Orion'))()

OrionLib:MakeNotification({Name = '企鹅脚本', Content = '脚本启动成功', Image = 'rbxassetid://4483345998', Time = 10})
local Window = OrionLib:MakeWindow({Name = '企鹅脚本', HidePremium = false, SaveConfig = true, ConfigFolder = 'OrionUILib'})

-- ===== 标签1：UI元素 =====
local TestTab = Window:MakeTab({Name = 'UI元素', Icon = 'rbxassetid://4483345998', PremiumOnly = false})
local Section = TestTab:AddSection({Name = '元素展示'})
Section:AddLabel('本脚本UI由外网Orion UI Lib获取')
Section:AddButton({Name = '点击我', Callback = function() print('按钮被点击!') end})
Section:AddToggle({Name = '开关示例', Default = false, Callback = function(v) print('开关:',v) end})
Section:AddSlider({Name = '滑块示例', Min = 0, Max = 100, Default = 50, Color = Color3.fromRGB(255,255,255), Increment = 1, ValueName = '值', Callback = function(v) print('滑块:',v) end})
Section:AddDropdown({Name = '下拉菜单示例', Options = {'选项1','选项2','选项3'}, Default = '选项1', Callback = function(v) print('选中:',v) end})
Section:AddTextbox({Name = '文本框示例', Default = '在这里输入', TextDisappear = true, Callback = function(v) print('输入:',v) end})
Section:AddColorpicker({Name = '颜色示例', Default = Color3.fromRGB(255,0,0), Callback = function(v) print('颜色:',v) end})
Section:AddButton({Name = '销毁UI', Callback = function() OrionLib:Destroy() end})

-- ===== 标签2：脚本通用功能 =====
local ScriptTab = Window:MakeTab({Name = '脚本通用功能', Icon = 'rbxassetid://4483345998', PremiumOnly = false})
ScriptTab:AddLabel('本脚本主打不易检测，安全，通用')
ScriptTab:AddLabel('规则1: 如果你因为使用本脚本功能导致某个服务器或者账号被封与我们没有关系，不给赔偿。')
ScriptTab:AddLabel('规则2: 使用脚本不要当恶俗。')
ScriptTab:AddLabel('规则3: 本脚本只限于群内人使用。')
ScriptTab:AddLabel('规则4: 使用本脚本默认同意规则。')

ScriptTab:AddButton({Name = '快速互动', Callback = function()
    local processed = {} for _,p in pairs(workspace:GetDescendants()) do if p:IsA("ProximityPrompt") then p.HoldDuration = 0 processed[p]=true end end
    workspace.DescendantAdded:Connect(function(d) if d:IsA("ProximityPrompt") and not processed[d] then d.HoldDuration = 0 processed[d]=true end end)
    workspace.DescendantRemoving:Connect(function(d) if processed[d] then processed[d]=nil end end) print('快速互动已启动')
end})
ScriptTab:AddButton({Name = '快速互动2长按时间为0.25秒', Callback = function()
    local processed = {} for _,p in pairs(workspace:GetDescendants()) do if p:IsA("ProximityPrompt") then p.HoldDuration = 0.25 processed[p]=true end end
    workspace.DescendantAdded:Connect(function(d) if d:IsA("ProximityPrompt") and not processed[d] then d.HoldDuration = 0.25 processed[d]=true end end)
    workspace.DescendantRemoving:Connect(function(d) if processed[d] then processed[d]=nil end end) print('快速互动2已启动')
end})
ScriptTab:AddLabel('动画速度可以让你在最后黎明当伦敦传奇狙击手')
local function SetAnimSpd(s)
    wait = task.wait local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    while wait() do local hum = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController") if not hum then continue end
        for _,t in pairs(hum:GetPlayingAnimationTracks()) do t:AdjustSpeed(s) end end
end
for _,v in ipairs({1,5,10}) do ScriptTab:AddButton({Name = '动画倍数'..v, Callback = function() coroutine.wrap(SetAnimSpd)(v) end}) end

-- ===== 标签3：缝合脚本列表 =====
local StitchTab = Window:MakeTab({Name = '缝合脚本列表', Icon = 'rbxassetid://4483345998', PremiumOnly = false})
StitchTab:AddLabel('F 3 x可以选某个区域，让它拉长，从而让碰撞变大')
StitchTab:AddLabel('但是只适用于可选择的可见碰撞区，但是一次性。')
StitchTab:AddButton({Name = 'F 3 x', Callback = function() loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)() end})
StitchTab:AddButton({Name = '飞行', Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/QnBuB3iq"))() end})
StitchTab:AddButton({Name = '一个指令脚本无限产量', Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end})
StitchTab:AddButton({Name = '自瞄(不易检测)', Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))() end})

OrionLib:Init()

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/DozeIsOkLol/UILibarySource/refs/heads/main/Orion'))()

-- 启动通知
OrionLib:MakeNotification({
    Name = '企鹅脚本',
    Content = '脚本启动成功',
    Image = 'rbxassetid://4483345998',
    Time = 10,
})

-- 创建窗口
local Window = OrionLib:MakeWindow({
    Name = '企鹅脚本',
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = 'OrionUILib',
})

-- 创建第一个标签
local TestTab = Window:MakeTab({
    Name = 'UI元素',
    Icon = 'rbxassetid://4483345998',
    PremiumOnly = false,
})

local Section = TestTab:AddSection({
    Name = '元素展示',
})

-- 添加标签
Section:AddLabel('本脚本UI由外网Orion UI Lib获取')

-- 添加按钮
Section:AddButton({
    Name = '点击我',
    Callback = function()
        print('按钮被点击!')
    end,
})

-- 添加开关
Section:AddToggle({
    Name = '开关示例',
    Default = false,
    Callback = function(Value)
        print('开关现在是: ', Value)
    end,
})

-- 添加滑块
Section:AddSlider({
    Name = '滑块示例',
    Min = 0,
    Max = 100,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = '值',
    Callback = function(Value)
        print('滑块设置为:', Value)
    end,
})

-- 添加下拉菜单
Section:AddDropdown({
    Name = '下拉菜单示例',
    Options = { '选项1', '选项2', '选项3' },
    Default = '选项1',
    Callback = function(Value)
        print('已选择:', Value)
    end,
})

-- 添加文本框
Section:AddTextbox({
    Name = '文本框示例',
    Default = '在这里输入',
    TextDisappear = true,
    Callback = function(Value)
        print('文本框输入:', Value)
    end,
})

-- 添加颜色选择器
Section:AddColorpicker({
    Name = '颜色示例',
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        print('选择的颜色:', Value)
    end,
})

-- 添加销毁按钮
Section:AddButton({
    Name = '销毁UI',
    Callback = function()
        OrionLib:Destroy()
    end,
})

-- 创建第二个标签
local ScriptTab = Window:MakeTab({
    Name = '脚本通用功能',
    Icon = 'rbxassetid://4483345998',
    PremiumOnly = false,
})

-- 添加说明标签
ScriptTab:AddLabel('本脚本主打不易检测，安全，通用')

-- 添加规则标签
ScriptTab:AddLabel('规则1: 如果你因为使用本脚本功能导致某个服务器或者账号被封与我们没有关系，不给赔偿。')
ScriptTab:AddLabel('规则2: 使用脚本不要当恶俗。')
ScriptTab:AddLabel('规则3: 本脚本只限于群内人使用。')
ScriptTab:AddLabel('规则4: 使用本脚本默认同意规则。')

-- 在第二个标签中添加按钮1
ScriptTab:AddButton({
    Name = '快速互动',
    Callback = function()
        -- 保存已经处理过的 ProximityPrompt 对象
        local processedPrompts = {}

        -- 初始化：处理所有现有的 ProximityPrompt 对象
        for _, prompt in pairs(workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 0
                processedPrompts[prompt] = true
            end
        end

        -- 监听新增对象
        workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("ProximityPrompt") and not processedPrompts[descendant] then
                descendant.HoldDuration = 0
                processedPrompts[descendant] = true
            end
        end)

        -- 监听对象删除
        workspace.DescendantRemoving:Connect(function(descendant)
            if processedPrompts[descendant] then
                processedPrompts[descendant] = nil
            end
        end)

        print('快速互动功能已启动')
    end,
})

-- 在第二个标签中添加按钮2
ScriptTab:AddButton({
    Name = '快速互动2长按时间为0.25秒',
    Callback = function()
        -- 保存已经处理过的 ProximityPrompt 对象
        local processedPrompts = {}

        -- 初始化：处理所有现有的 ProximityPrompt 对象
        for _, prompt in pairs(workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 0.25
                processedPrompts[prompt] = true
            end
        end

        -- 监听新增对象
        workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("ProximityPrompt") and not processedPrompts[descendant] then
                descendant.HoldDuration = 0.25
                processedPrompts[descendant] = true
            end
        end)

        -- 监听对象删除
        workspace.DescendantRemoving:Connect(function(descendant)
            if processedPrompts[descendant] then
                processedPrompts[descendant] = nil
            end
        end)

        print('快速互动2功能已启动，长按时间为0.25秒')
    end,
})

-- 动画倍速函数
local function SetAnimationSpeed(speed)
    wait = task.wait
    local a = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:wait()
    while wait() do
        local b = a:FindFirstChildOfClass("Humanoid") or a:FindFirstChildOfClass("AnimationController")
        if not b or not a then
            continue
        end
        for c, d in next, b:GetPlayingAnimationTracks() do
            d:AdjustSpeed(speed)
        end
    end
end

-- 创建动画倍速按钮
local speeds = {1, 5, 10}  -- 定义倍速列表
for _, speed in ipairs(speeds) do
    ScriptTab:AddButton({
        Name = '动画倍数' .. speed,
        Callback = function()
            coroutine.wrap(SetAnimationSpeed)(speed)
            print('动画倍速已设置为' .. speed)
        end,
    })
end

-- 初始化UI
OrionLib:Init()

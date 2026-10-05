
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local remoteEvent = ReplicatedStorage:WaitForChild("MudarPatenteNovaEvent")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "SistemaPatenteGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 330, 0, 570)
frame.Position = UDim2.new(0.5, -165, 0.5, -285)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame

local titulo = Instance.new("TextLabel")
titulo.Size = UDim2.new(1, -80, 0, 40)
titulo.Position = UDim2.new(0, 10, 0, 5)
titulo.BackgroundTransparency = 1
titulo.Text = "Sistema de Patente"
titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
titulo.TextSize = 20
titulo.Font = Enum.Font.GothamBold
titulo.TextXAlignment = Enum.TextXAlignment.Left
titulo.Parent = frame

local minimizar = Instance.new("TextButton")
minimizar.Size = UDim2.new(0, 30, 0, 30)
minimizar.Position = UDim2.new(1, -70, 0, 10)
minimizar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizar.BorderSizePixel = 0
minimizar.Text = "-"
minimizar.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizar.TextSize = 20
minimizar.Font = Enum.Font.GothamBold
minimizar.ZIndex = 10
minimizar.Parent = frame

local fechar = Instance.new("TextButton")
fechar.Size = UDim2.new(0, 30, 0, 30)
fechar.Position = UDim2.new(1, -35, 0, 10)
fechar.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
fechar.BorderSizePixel = 0
fechar.Text = "X"
fechar.TextColor3 = Color3.fromRGB(255, 255, 255)
fechar.TextSize = 15
fechar.Font = Enum.Font.GothamBold
fechar.ZIndex = 10
fechar.Parent = frame

local conteudo = Instance.new("Frame")
conteudo.Name = "Conteudo"
conteudo.Size = UDim2.new(1, 0, 1, -45)
conteudo.Position = UDim2.new(0, 0, 0, 45)
conteudo.BackgroundTransparency = 1
conteudo.Parent = frame

local lista = Instance.new("ScrollingFrame")
lista.Size = UDim2.new(1, -20, 0, 190)
lista.Position = UDim2.new(0, 10, 0, 5)
lista.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
lista.BorderSizePixel = 0
lista.ScrollBarThickness = 6
lista.CanvasSize = UDim2.new(0, 0, 0, 0)
lista.Parent = conteudo

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.Parent = lista

local jogadorSelecionado = nil

local patenteBox = Instance.new("TextBox")
patenteBox.Size = UDim2.new(1, -20, 0, 40)
patenteBox.Position = UDim2.new(0, 10, 0, 205)
patenteBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
patenteBox.BorderSizePixel = 0
patenteBox.PlaceholderText = "Digite a patente..."
patenteBox.Text = ""
patenteBox.TextColor3 = Color3.fromRGB(255, 255, 255)
patenteBox.PlaceholderColor3 = Color3.fromRGB(170, 170, 170)
patenteBox.TextSize = 16
patenteBox.Font = Enum.Font.Gotham
patenteBox.ClearTextOnFocus = false
patenteBox.Parent = conteudo

local colocar = Instance.new("TextButton")
colocar.Size = UDim2.new(1, -20, 0, 40)
colocar.Position = UDim2.new(0, 10, 0, 250)
colocar.BackgroundColor3 = Color3.fromRGB(50, 140, 70)
colocar.BorderSizePixel = 0
colocar.Text = "Colocar"
colocar.TextColor3 = Color3.fromRGB(255, 255, 255)
colocar.TextSize = 16
colocar.Font = Enum.Font.GothamBold
colocar.Parent = conteudo

local todos = Instance.new("TextButton")
todos.Size = UDim2.new(1, -20, 0, 40)
todos.Position = UDim2.new(0, 10, 0, 295)
todos.BackgroundColor3 = Color3.fromRGB(70, 100, 170)
todos.BorderSizePixel = 0
todos.Text = "Colocar em todos"
todos.TextColor3 = Color3.fromRGB(255, 255, 255)
todos.TextSize = 16
todos.Font = Enum.Font.GothamBold
todos.Parent = conteudo

local autoTitulo = Instance.new("TextLabel")
autoTitulo.Size = UDim2.new(1, -20, 0, 25)
autoTitulo.Position = UDim2.new(0, 10, 0, 345)
autoTitulo.BackgroundTransparency = 1
autoTitulo.Text = "Sistema automático para todos"
autoTitulo.TextColor3 = Color3.fromRGB(255, 255, 255)
autoTitulo.TextSize = 17
autoTitulo.Font = Enum.Font.GothamBold
autoTitulo.TextXAlignment = Enum.TextXAlignment.Left
autoTitulo.Parent = conteudo

local palavraAuto = Instance.new("TextBox")
palavraAuto.Size = UDim2.new(1, -20, 0, 40)
palavraAuto.Position = UDim2.new(0, 10, 0, 375)
palavraAuto.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
palavraAuto.BorderSizePixel = 0
palavraAuto.PlaceholderText = "Palavra automática..."
palavraAuto.Text = ""
palavraAuto.TextColor3 = Color3.fromRGB(255, 255, 255)
palavraAuto.PlaceholderColor3 = Color3.fromRGB(170, 170, 170)
palavraAuto.TextSize = 16
palavraAuto.Font = Enum.Font.Gotham
palavraAuto.ClearTextOnFocus = false
palavraAuto.Parent = conteudo

local velocidadeLabel = Instance.new("TextLabel")
velocidadeLabel.Size = UDim2.new(0, 90, 0, 30)
velocidadeLabel.Position = UDim2.new(0, 10, 0, 425)
velocidadeLabel.BackgroundTransparency = 1
velocidadeLabel.Text = "Intervalo:"
velocidadeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
velocidadeLabel.TextSize = 14
velocidadeLabel.Font = Enum.Font.GothamBold
velocidadeLabel.TextXAlignment = Enum.TextXAlignment.Left
velocidadeLabel.Parent = conteudo

local velocidadeBox = Instance.new("TextBox")
velocidadeBox.Size = UDim2.new(0, 70, 0, 30)
velocidadeBox.Position = UDim2.new(0, 95, 0, 425)
velocidadeBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
velocidadeBox.BorderSizePixel = 0
velocidadeBox.Text = "1"
velocidadeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
velocidadeBox.TextSize = 14
velocidadeBox.Font = Enum.Font.Gotham
velocidadeBox.ClearTextOnFocus = false
velocidadeBox.Parent = conteudo

local velocidadeInfo = Instance.new("TextLabel")
velocidadeInfo.Size = UDim2.new(0, 140, 0, 30)
velocidadeInfo.Position = UDim2.new(0, 170, 0, 425)
velocidadeInfo.BackgroundTransparency = 1
velocidadeInfo.Text = "segundos"
velocidadeInfo.TextColor3 = Color3.fromRGB(180, 180, 180)
velocidadeInfo.TextSize = 13
velocidadeInfo.Font = Enum.Font.Gotham
velocidadeInfo.TextXAlignment = Enum.TextXAlignment.Left
velocidadeInfo.Parent = conteudo

local automatico = Instance.new("TextButton")
automatico.Size = UDim2.new(1, -20, 0, 40)
automatico.Position = UDim2.new(0, 10, 0, 465)
automatico.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
automatico.BorderSizePixel = 0
automatico.Text = "Ativar automático para todos"
automatico.TextColor3 = Color3.fromRGB(255, 255, 255)
automatico.TextSize = 16
automatico.Font = Enum.Font.GothamBold
automatico.Parent = conteudo

local automaticoAtivo = false
local minimizado = false
local arrastando = false
local inicioMouse
local inicioPos

local function atualizarLista()
	for _, objeto in ipairs(lista:GetChildren()) do
		if objeto:IsA("TextButton") then
			objeto:Destroy()
		end
	end

	for _, jogador in ipairs(Players:GetPlayers()) do
		local botao = Instance.new("TextButton")
		botao.Size = UDim2.new(1, -10, 0, 35)
		botao.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
		botao.BorderSizePixel = 0
		botao.Text = jogador.DisplayName .. "  @" .. jogador.Name
		botao.TextColor3 = Color3.fromRGB(255, 255, 255)
		botao.TextSize = 14
		botao.Font = Enum.Font.Gotham
		botao.Parent = lista

		botao.MouseButton1Click:Connect(function()
			jogadorSelecionado = jogador
			patenteBox.Text = palavraAuto.Text

			for _, outro in ipairs(lista:GetChildren()) do
				if outro:IsA("TextButton") then
					outro.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
				end
			end

			botao.BackgroundColor3 = Color3.fromRGB(50, 140, 70)
		end)
	end

	lista.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	lista.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end)

Players.PlayerAdded:Connect(atualizarLista)

Players.PlayerRemoving:Connect(function(jogador)
	if jogadorSelecionado == jogador then
		jogadorSelecionado = nil
	end

	atualizarLista()
end)

atualizarLista()

colocar.MouseButton1Click:Connect(function()
	if not jogadorSelecionado then
		return
	end

	local texto = patenteBox.Text

	if texto == "" then
		return
	end

	remoteEvent:FireServer(jogadorSelecionado.Name, texto)
end)

todos.MouseButton1Click:Connect(function()
	local texto = patenteBox.Text

	if texto == "" then
		return
	end

	for _, jogador in ipairs(Players:GetPlayers()) do
		remoteEvent:FireServer(jogador.Name, texto)
	end
end)

automatico.MouseButton1Click:Connect(function()
	if automaticoAtivo then
		automaticoAtivo = false
		automatico.Text = "Ativar automático para todos"
		automatico.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
		return
	end

	if palavraAuto.Text == "" then
		return
	end

	automaticoAtivo = true
	automatico.Text = "Desativar automático"
	automatico.BackgroundColor3 = Color3.fromRGB(50, 150, 70)

	task.spawn(function()
		while automaticoAtivo do
			local palavra = palavraAuto.Text

			if palavra ~= "" then
				patenteBox.Text = palavra

				for _, jogador in ipairs(Players:GetPlayers()) do
					if jogador.Parent == Players then
						remoteEvent:FireServer(jogador.Name, palavra)
					end
				end
			end

			local intervalo = tonumber(velocidadeBox.Text)

			if not intervalo or intervalo <= 0 then
				intervalo = 1
			end

			task.wait(intervalo)
		end
	end)
end)

palavraAuto:GetPropertyChangedSignal("Text"):Connect(function()
	if palavraAuto.Text ~= "" then
		patenteBox.Text = palavraAuto.Text
	end
end)

titulo.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		arrastando = true
		inicioMouse = input.Position
		inicioPos = frame.Position
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		arrastando = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if arrastando and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - inicioMouse

		frame.Position = UDim2.new(
			inicioPos.X.Scale,
			inicioPos.X.Offset + delta.X,
			inicioPos.Y.Scale,
			inicioPos.Y.Offset + delta.Y
		)
	end
end)

minimizar.MouseButton1Click:Connect(function()
	minimizado = not minimizado

	if minimizado then
		conteudo.Visible = false
		frame.Size = UDim2.new(0, 330, 0, 50)
		minimizar.Text = "+"
	else
		conteudo.Visible = true
		frame.Size = UDim2.new(0, 330, 0, 570)
		minimizar.Text = "-"
	end
end)

fechar.MouseButton1Click:Connect(function()
	automaticoAtivo = false
	gui:Destroy()
end)



getgenv().Size = Vector3.one * 500
getgenv().KillAura = true

local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local LocalPlayer = cloneref(Players.LocalPlayer)

local Include = OverlapParams.new()
Include.FilterType = Enum.RaycastFilterType.Include

while KillAura do
    local Character = LocalPlayer.Character
    
    if Character then
	    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
    	
    	if Humanoid then
            if Humanoid.Health > 0 then
		        local Tool = Character:FindFirstChildWhichIsA("Tool")
		        local TouchInterest = Tool and Tool:FindFirstChildWhichIsA("TouchTransmitter", true)
		
		        if TouchInterest then
		            local Characters = {}
		            
		            for _, Player in Players:GetPlayers() do
				    	if Player ~= LocalPlayer then
				        	table.insert(Characters, Player.Character)
				        end
				    end
				    
		            Include.FilterDescendantsInstances = Characters
		
		            for _, Instance in Workspace:GetPartBoundsInBox(TouchInterest.Parent.CFrame, TouchInterest.Parent.Size + Size, Include) do
		                local Character = Instance:FindFirstAncestorWhichIsA("Model")
		
						if Character then
			            	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
			            	
			            	if Humanoid then
				                if Humanoid.Health > 0 then
				                    if Tool:IsDescendantOf(Workspace) then
								        Tool:Activate()

										for Mode = 1, 0, -1 do
									        firetouchinterest(TouchInterest.Parent, Instance, Mode)
									    end
								    end
				                end
							end
						end
		            end
		        end
		    end
		end
	end
	
   	task.wait(1 / 20)
end

local Themes = {
	Names = {}
}

for _, theme in ipairs(script:GetChildren()) do
	local name = tostring(theme)
	table.insert(Themes.Names, name)
end

-- Prompt to generate the themes, best used with cursor: "@Themes Create new luau Themes for every JSON file ill provide. The Theme name should be the Name from the JSON, always create a new File in the Themes Directory where the other luau files are and always add the name of the Theme in the init.luau list"

setmetatable(Themes, {
	__index = function(self, key)
		local child = script:FindFirstChild(key)
		if child then
			local ThemeData = require(child)
			ThemeData.Name = key
			self[key] = ThemeData
			return ThemeData
		end
		return nil
	end
})

return Themes

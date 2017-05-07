script.on_event("delete-blueprints-hotkey", function(event)
	local player = game.players[event.player_index]
	local inventory = player.get_inventory(defines.inventory.player_main)
	local count = 0
	for i=1,#inventory do
		local stack = inventory[i]
		if stack.valid_for_read and stack.name == "blueprint" then
			stack.clear();
			count = count + 1
		end
	end
	if(count == 1) then
		player.print({"dbh-message.blueprints-deleted-singular"})
	else
		player.print({"dbh-message.blueprints-deleted-plural", count})
	end
end)
-- Gatherer database related routines
--

function Gatherer_sanitizeDatabase(db)
	-- type: (GathererDb) -> None
	for continent, continentData in db do
		for zone, zoneData in continentData do
			for gather, gatherNodes in zoneData do
				for nodeIndex, nodeInfo in gatherNodes do
					if not nodeInfo.icon then
						-- Due to l10n conflicts in old versions
						-- syncs could produce buggy nodes without icon field.
						-- Eliminate them.
						Gatherer_ChatNotify(
							'Detected empty icon:\n '..tostring(nodeInfo.icon),
							Gatherer_ENotificationType.debug
						)
						Gatherer_ChatNotify(
							'Decided to remove: '..table.concat({continent, zone, gather, nodeIndex}, ', '),
							Gatherer_ENotificationType.debug
						)
						db[continent][zone][gather][nodeIndex] = nil
					elseif type(nodeInfo.icon) == 'string' then
						-- convert to IconIndex
						db[continent][zone][gather][nodeIndex].icon = Gatherer_GetDB_IconIndex(nodeInfo.icon, nodeInfo.gtype)
					end
				end
			end
		end
	end
end
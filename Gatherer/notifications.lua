-- Inspired by python logging
--

GATHERER_NOTIFICATION_PREFIX = 'Gatherer: '


Gatherer_ENotificationType = {
	error = 10,
	warning = 20,
	info = 30, sending = 23, receiving = 27,
	debug = 40
}


GATHERER_NOTIFICATION_COLORS = {
	[Gatherer_ENotificationType.error] = {230, 0, 0},
	[Gatherer_ENotificationType.warning] = {230, 230, 0},
	[Gatherer_ENotificationType.info] = {60, 200, 230},
	[Gatherer_ENotificationType.sending] = {107, 140, 230},
	[Gatherer_ENotificationType.receiving] = {28, 230, 28},
	[Gatherer_ENotificationType.debug] = {255, 128, 64},
}


function Gatherer_ChatNotify(str, notificationType)
	notificationType = notificationType or Gatherer_ENotificationType.info

	-- by default print info messages and more serious
	local notificationLevel = Gatherer_ENotificationType.info
	if Gatherer_Settings.debug then
		notificationLevel = Gatherer_ENotificationType.debug
	end

	if notificationType > notificationLevel then
		return
	end

	local prefix = GATHERER_NOTIFICATION_PREFIX
	if notificationType == Gatherer_ENotificationType.sending then
		prefix = prefix..'> '
	end
	if notificationType == Gatherer_ENotificationType.receiving then
		prefix = prefix..'< '
	end

	-- usually DEFAULT_CHAT_FRAME is the default "General" chat window
	if ( DEFAULT_CHAT_FRAME ) then
		DEFAULT_CHAT_FRAME:AddMessage(
			prefix..str, unpack(
				Gatherer_rgbToFloatColor(GATHERER_NOTIFICATION_COLORS[notificationType])
			)
		);
	end
end


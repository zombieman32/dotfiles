local status_ok, stabline = pcall(require, "stabline")
if not status_ok then
	return
end

stabline.setup()

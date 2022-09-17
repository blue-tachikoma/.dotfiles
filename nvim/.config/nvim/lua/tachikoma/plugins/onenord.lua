local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
  return
end

onenord.setup()

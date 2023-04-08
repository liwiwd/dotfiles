if (get_window_property("_NET_WM_STATE") ~= "") then
	opacity = 0.95
	win_name = get_window_class()
	if (string.match(win_name, "navigator firefox")
		or string.match(win_name, "chromium")
		or string.match(win_name, "google-chrome")
		or string.match(win_name, "CLion")
		or string.match(win_name, "GoLand")
		or string.match(win_name, "IntelliJ IDEA")
	) then
		opacity = 0.99
	end
	if (string.match(win_name, "vlc")
		or string.match(win_name, "neovide")
	) then
		opacity = 0.8
	end
	set_window_opacity(opacity)
end

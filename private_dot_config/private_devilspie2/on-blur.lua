if (get_window_property("_NET_WM_STATE") ~= "") then
	opacity = 0.85
	win_name = get_window_class()
	if (string.match(win_name, "navigator firefox")
		or string.match(win_name, "chromium")
		or string.match(win_name, "google-chrome")
	) then
		opacity = 0.9
	end
	if (string.match(win_name, "vlc")
		or string.match(win_name, "neovide")
	) then
		opacity = 0.75
	end
	set_window_opacity(opacity)
end

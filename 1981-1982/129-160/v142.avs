import("11943 Bakhtin N8 01.720p_01-129.mov.avs")
v142 = v142.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0)
#return v142.extractY.autolevels(input_low=100, input_high=200).Prefetch(6)
return v142.Prefetch(6)


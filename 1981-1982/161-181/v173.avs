import("11943 Bakhtin N8 01.720p_01-161.mov.avs")
#v173 = v173.crop(0, 0, -600, 0)
v173 = v173.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0)
#v173 = v173.extractY
return v173.Prefetch(6)


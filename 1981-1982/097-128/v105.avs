import("11943 Bakhtin N8 01.720p_01-97.mov.avs")
v105 = v105.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 0, border_b = 50, filterRadius = 0, minRng=0)
#v105 = v105.crop(0, 0, -860, 0).stackHorizontal(v105)
#v105 = v105.Filter_0.extractY.autolevels(input_low=40, input_high=160)
return v105.Prefetch(6)


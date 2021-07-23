import("11943 Bakhtin N8 01.720p_01-33.mov.avs")
#v34 = v34.autolevels(debug=true, ignore_low=0.0003, ignore_high=0.0003, border_l = 300, border_r = 200, border_t = 150, border_b = 50, filterRadius = 9, minRng=0)
v34 = v34.autolevels(autolevel=false, input_low=16, input_high=130, gamma=1.5)
#v34 = v34.histogram("levels")
return v34.Prefetch(6)


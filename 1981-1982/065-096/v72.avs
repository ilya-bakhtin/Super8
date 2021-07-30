import("11943 Bakhtin N8 01.720p_01-65.mov.avs")
v72 = v72.autolevels(debug=false, gamma=1.5, ignore_low=0.0003, ignore_high=0.00003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0)
#v72 = v72.convertToYV12
#v72 = v72.trim(0, -1).autolevels(input_low=32, input_high=255).UnsharpMask(strength=300, radius=3, threshold=1) + v72.trim(1, 0).autolevels(input_low=8, input_high=200)
#v72 = v72.extractY
return v72.Prefetch(6)


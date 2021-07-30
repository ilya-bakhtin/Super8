import("11943 Bakhtin N8 01.720p_01-65.mov.avs")
#v68 = v68.autolevels(gamma=1.3, ignore_low=0.0003, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0, sceneChgThresh=20)
v68 = v68.autolevels(gamma=1.3, input_low=16, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0, sceneChgThresh=20)
return v68.Prefetch(6)


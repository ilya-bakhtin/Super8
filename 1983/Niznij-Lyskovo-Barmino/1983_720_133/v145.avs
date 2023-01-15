import("1983_720_133.avs")
v145 = v145.Filter(th_SAD = 1500, th_SADC=1500)
v145_m = v145.PrepareMask
v145 = v145.ConvertToRGB.ExInpaint(mask = v145_m)
return v145.Prefetch(6)


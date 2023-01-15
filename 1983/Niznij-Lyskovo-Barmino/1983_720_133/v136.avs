import("1983_720_133.avs")
v136 = v136.Filter(th_SAD = 1500, th_SADC=1500)
v136_m = v136.PrepareMask
v136 = v136.ConvertToRGB.ExInpaint(mask = v136_m)
return v136.Prefetch(6)


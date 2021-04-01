import("1983_720_133.avs")
v142 = v142.Filter(th_SAD = 1100, th_SADC=1100)
v142_m = v142.PrepareMask
v142 = v142.ConvertToRGB.ExInpaint(mask = v142_m)
return v142.Prefetch(6)

import("1983_720_133.avs")
v135 = v135.Filter(th_SAD = 1100, th_SADC=1100)
v135_m = v135.PrepareMask
v135 = v135.ConvertToRGB.ExInpaint(mask = v135_m)
return v135.Prefetch(6)


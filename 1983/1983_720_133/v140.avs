import("1983_720_133.avs")
v140 = v140.Filter(th_SAD = 1100, th_SADC=1100)
v140_m = v140.PrepareMask
v140 = v140.ConvertToRGB.ExInpaint(mask = v140_m)
return v140.Prefetch(6)


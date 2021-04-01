import("1983_720_133.avs")
v137 = v137.Filter(th_SAD = 1100, th_SADC=1100)
v137_m = v137.PrepareMask
v137 = v137.ConvertToRGB.ExInpaint(mask = v137_m)
return v137.Prefetch(6)


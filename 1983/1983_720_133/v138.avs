import("1983_720_133.avs")
v138 = v138.Filter(th_SAD = 1500, th_SADC=1500)
v138_m = v138.PrepareMask
v138 = v138.ConvertToRGB.ExInpaint(mask = v138_m)
return v138.Prefetch(6)


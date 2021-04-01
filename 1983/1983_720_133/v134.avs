import("1983_720_133.avs")
v134 = v134.Filter(th_SAD = 1100, th_SADC=1100)
v134_m = v134.PrepareMask
v134 = v134.ConvertToRGB.ExInpaint(mask = v134_m)
return v134.Prefetch(6)


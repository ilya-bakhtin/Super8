import("1983_720_133.avs")
v146 = v146.Filter(th_SAD = 1500, th_SADC=1500)
v146_m = v146.PrepareMask
v146 = v146.ConvertToRGB.ExInpaint(mask = v146_m)
return v146.Prefetch(6)


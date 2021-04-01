import("1983_720_133.avs")
v141 = v141.Filter(th_SAD = 1100, th_SADC=1100)
v141_m = v141.PrepareMask
v141 = v141.ConvertToRGB.ExInpaint(mask = v141_m)
return v141.Prefetch(6)


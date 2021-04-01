import("1983_720_133.avs")
v139 = v139.Filter(th_SAD = 1500, th_SADC=1500)
v139_m = v139.PrepareMask
v139 = v139.ConvertToRGB.ExInpaint(mask = v139_m)
return v139.Prefetch(6)


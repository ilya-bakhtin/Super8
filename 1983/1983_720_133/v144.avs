import("1983_720_133.avs")
v144 = v144.Filter(th_SAD = 1500, th_SADC=1500)
v144_m = v144.PrepareMask
v144 = v144.ConvertToRGB.ExInpaint(mask = v144_m)
return v144.Prefetch(6)


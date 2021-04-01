import("1983_720_133.avs")
v149 = v149.Filter(th_SAD = 1100, th_SADC=1100)
#v149_m = v149.PrepareMask(ignore_low=0.1)
#v149 = v149.ConvertToRGB.ExInpaint(mask = v149_m)
return v149.Prefetch(6)


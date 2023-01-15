import("1983_720_133.avs")
v133 = v133.Filter(th_SAD = 1100, th_SADC=1100)
v133_m = v133.PrepareMask
v133 = v133.ConvertToRGB.ExInpaint(mask = v133_m)
return v133.Prefetch(6)


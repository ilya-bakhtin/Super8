import("1983_720_133.avs")
v143 = v143.Filter(th_SAD = 1100, th_SADC=1100)
v143_m = v143.PrepareMask
v143 = v143.ConvertToRGB.ExInpaint(mask = v143_m)
return v143.Prefetch(6)


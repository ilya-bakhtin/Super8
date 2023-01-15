import("1983_720_133.avs")
v148 = v148.Filter(th_SAD = 1100, th_SADC=1100)
v148_m = v148.PrepareMask(off_y = 0, ignore_low=0.1, ignore_high=0.1, mask_tolerance=100)
v148 = v148.ConvertToRGB.ExInpaint(mask = v148_m)
return v148.Prefetch(6)


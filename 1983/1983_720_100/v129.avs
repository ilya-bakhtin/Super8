import("1983_720_100.avs")
v129 = v129.Filter(th_SAD = 1600, th_SADC=1600)
v129_m = v129.PrepareMask(mask_tolerance=50, ignore_low=0.3)#, frame_w=960, frame_h=720)
v129 = v129.ConvertToRGB.ExInpaint(mask = v129_m)
return v129.Prefetch(6)


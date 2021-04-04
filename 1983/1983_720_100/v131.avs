import("1983_720_100.avs")
v131 = v131.Filter(th_SAD = 1600, th_SADC=1600)
v131_m = v131.PrepareMask(mask_tolerance=50, ignore_low=0.3)#, frame_w=960, frame_h=720)
v131 = v131.ConvertToRGB.ExInpaint(mask = v131_m)
return v131.Prefetch(6)


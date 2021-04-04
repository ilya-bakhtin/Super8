import("1983_720_100.avs")
v132 = v132.Filter(th_SAD = 1600, th_SADC=1600)
v132_m = v132.PrepareMask(mask_tolerance=50, ignore_low=0.3)#, frame_w=960, frame_h=720)
v132 = v132.ConvertToRGB.ExInpaint(mask = v132_m)
return v132.Prefetch(6)


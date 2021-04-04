import("1983_720_100.avs")
v130 = v130.Filter(th_SAD = 1600, th_SADC=1600)
v130_m = v130.PrepareMask(mask_tolerance=20)#, frame_w=960, frame_h=720)
v130 = v130.ConvertToRGB.ExInpaint(mask = v130_m)
return v130.Prefetch(6)


import("1983_720_100.avs")
v128 = v128.Filter(th_SAD = 1600, th_SADC=1600)
v128_m = v128.PrepareMask(ignore_low=0.15, mask_tolerance=50)#, frame_w=960, frame_h=720)
v128 = v128.ConvertToRGB.ExInpaint(mask = v128_m)
#v128 = v128.interleave(v128_m)
return v128.Prefetch(6)


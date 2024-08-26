import("..\1987-alexej-armada.avs")
v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v13 = v13.trim(129, -1).loop(v13.frameCount).crop(0, 0, 0, add_height - v13.height).stackVertical(v13)
v13 = v13.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v13 = v13.colorYUV(off_u = -4, off_v = +4)
v13 = v13.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v13 = v13.crop(0, add_height, 0, 0)
#return v13.hist_levels.prefetch
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate

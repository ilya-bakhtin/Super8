import("..\1987-alexej-armada.avs")
v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v15 = v15.trim(18, -1).loop(v15.frameCount).crop(0, 0, 0, add_height - v15.height).stackVertical(v15)
v15 = v15.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v15 = v15.colorYUV(off_u = -2, off_v = +2)
v15 = v15.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v15 = v15.crop(0, add_height, 0, 0)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

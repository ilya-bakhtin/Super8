import("..\1987-alexej-armada.avs")
v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 240
v12 = v12.trim(159, -1).loop(v12.frameCount).crop(0, 0, 0, add_height - v12.height).stackVertical(v12)
v12 = v12.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v12 = v12.colorYUV(off_u = -4, off_v = +4)
v12 = v12.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v12 = v12.crop(0, add_height, 0, 0)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

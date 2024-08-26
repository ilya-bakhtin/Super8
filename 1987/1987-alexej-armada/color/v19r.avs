import("..\1987-alexej-armada.avs")
v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 400
v19 = v19.trim(1, -1).loop(v19.frameCount).crop(0, 0, 0, add_height - v19.height).stackVertical(v19)
v19 = v19.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v19 = v19.colorYUV(off_u = -2, off_v = +2)
v19 = v19.crop(0, add_height, 0, 0)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate

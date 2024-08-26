import("..\1987-alexej-armada.avs")
v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
b_ex = undefined
v2 = v2.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

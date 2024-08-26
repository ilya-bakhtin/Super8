import("..\1987-alexej-armada.avs")
v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
b_ex = undefined
v22 = v22.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate

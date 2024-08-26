import("..\1989-Sevas.avs")
v104 = LSMASHVideoSource(dst_dir + "v104f.mp4").ConvertToYV24()
b_ex = undefined
v104 = v104.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v104 = v104.adjustSize
v104 = v104.assumeFPS(18)
v104 = v104.add_blank_audio
return v104.prefetch
#adjustframerate

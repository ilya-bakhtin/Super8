import("..\1989-Sevas.avs")
v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
b_ex = undefined
v10 = v10.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate

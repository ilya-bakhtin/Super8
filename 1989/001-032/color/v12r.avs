import("..\1989-sevas.avs")
v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
b_ex = undefined
v12 = v12.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-400, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

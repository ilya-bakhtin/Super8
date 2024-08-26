import("..\1989-Sevas.avs")
v109 = LSMASHVideoSource(dst_dir + "v109f.mp4").ConvertToYV24()
b_ex = undefined
v109 = v109.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
v109 = v109.add_blank_audio
return v109.prefetch
#adjustframerate

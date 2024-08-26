import("..\1989-Sevas.avs")
v105 = LSMASHVideoSource(dst_dir + "v105f.mp4").ConvertToYV24()
b_ex = undefined
v105 = v105.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
v105 = v105.add_blank_audio
return v105.prefetch
#adjustframerate

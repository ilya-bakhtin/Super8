import("..\1989-Sevas.avs")
v110 = LSMASHVideoSource(dst_dir + "v110f.mp4").ConvertToYV24()
b_ex = undefined
v110 = v110.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
v110 = v110.add_blank_audio
return v110.prefetch
#adjustframerate

import("..\1989-Sevas.avs")
v89 = LSMASHVideoSource(dst_dir + "v89f.mp4").ConvertToYV24()
b_ex = undefined
v89 = v89.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v89 = v89.colorYUV(off_u = -2, off_v = +2)
v89 = v89.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v89 = v89.adjustSize
v89 = v89.assumeFPS(18)
v89 = v89.add_blank_audio
return v89.prefetch
#adjustframerate

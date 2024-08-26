import("..\1989-Sevas.avs")
v107 = LSMASHVideoSource(dst_dir + "v107f.mp4").ConvertToYV24()
v107 = v107.trim(0, v107.frameCount - 2)
b_ex = undefined
v107 = v107.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex
v107 = v107.colorYUV(off_u = +2, off_v = -2)
v107 = v107.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
v107 = v107.add_blank_audio
return v107.prefetch
#adjustframerate

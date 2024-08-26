import("..\1989-Sevas.avs")
v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
b_ex = undefined
v86 = v86.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v86 = v86.colorYUV(off_u = -2, off_v = +2)
v86 = v86.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate

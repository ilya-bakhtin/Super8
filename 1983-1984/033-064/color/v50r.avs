import("..\1983-1984.avs")
v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
v50 = v50.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v50 = v50.colorYUV(off_u = -4, off_v = +0)
v50 = v50.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

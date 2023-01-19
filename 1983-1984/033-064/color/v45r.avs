import("..\1983-1984.avs")
v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
v45 = v45.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v45 = v45.colorYUV(off_u = -10, off_v = +4)
v45 = v45.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate

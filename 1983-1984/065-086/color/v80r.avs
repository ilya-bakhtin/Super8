import("..\1983-1984.avs")
v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
v80 = v80.AdjustColor(ou = +12, ov = -6, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v80 = v80.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate

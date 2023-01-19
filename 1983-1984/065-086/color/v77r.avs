import("..\1983-1984.avs")
v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
v77 = v77.AdjustColor(ou = +10, ov = -6, x=400, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v77 = v77.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate

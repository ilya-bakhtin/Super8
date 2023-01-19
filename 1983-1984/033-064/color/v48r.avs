import("..\1983-1984.avs")
v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48 = v48.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v48 = v48.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate

import("..\1983-Moskva-Tallinn.avs")
v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
v41 = v41.colorYUV(off_y = -16)
v41 = v41.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
v41 = v41.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

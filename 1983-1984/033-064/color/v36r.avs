import("..\1983-1984.avs")
v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
v36 = v36.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v36 = v36.colorYUV(off_u = -4, off_v = +0)
v36 = v36.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate

import("..\1983-1984.avs")
v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
v40 = v40.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v40 = v40.colorYUV(off_u = -8, off_v = +4)
v40 = v40.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

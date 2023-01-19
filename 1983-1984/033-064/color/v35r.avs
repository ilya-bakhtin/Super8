import("..\1983-1984.avs")
v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
v35 = v35.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v35 = v35.colorYUV(off_u = -4, off_v = +0)
v35 = v35.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate

import("..\1983-1984.avs")
v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
v84 = v84.AdjustColor(ou = +8, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate

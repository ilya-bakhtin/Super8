import("..\1983-1984.avs")
v73 = LSMASHVideoSource(dst_dir + "v73f.mp4").ConvertToYV24()
v73 = v73.AdjustColor(ou = +2, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
v73 = v73.add_blank_audio
return v73.prefetch
#adjustframerate

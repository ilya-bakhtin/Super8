import("..\1983-1984.avs")
v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
v82 = v82.AdjustColor(ou = +6, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate

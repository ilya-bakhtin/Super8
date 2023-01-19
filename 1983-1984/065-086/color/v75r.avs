import("..\1983-1984.avs")
v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
v75 = v75.AdjustColor(ou = +2, ov = -2, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

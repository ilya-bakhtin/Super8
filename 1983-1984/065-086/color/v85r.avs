import("..\1983-1984.avs")
v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
v85 = v85.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate

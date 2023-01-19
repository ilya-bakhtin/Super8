import("..\1983-1984.avs")
v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
v33 = v33.AdjustColor(ou = -2, ov = +2, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

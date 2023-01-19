import("..\1983-1984.avs")
v81 = LSMASHVideoSource(dst_dir + "v81f.mp4").ConvertToYV24()
v81 = v81.AdjustColor(ou = +6, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
v81 = v81.add_blank_audio
return v81.prefetch
#adjustframerate

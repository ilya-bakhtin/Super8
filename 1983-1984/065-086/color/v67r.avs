import("..\1983-1984.avs")
v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
v67 = v67.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

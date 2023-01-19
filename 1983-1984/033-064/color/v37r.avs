import("..\1983-1984.avs")
v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
v37 = v37.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

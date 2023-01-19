import("..\1983-1984.avs")
v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
v70 = v70.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate

import("..\1983-1984.avs")
v71 = LSMASHVideoSource(dst_dir + "v71f.mp4").ConvertToYV24()
v71 = v71.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
v71 = v71.add_blank_audio
return v71.prefetch
#adjustframerate

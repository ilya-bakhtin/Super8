import("..\1983-1984.avs")
v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
v74 = v74.AdjustColor(ou = +2, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

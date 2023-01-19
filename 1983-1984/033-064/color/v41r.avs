import("..\1983-1984.avs")
v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
v41 = v41.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

import("..\1983-1984.avs")
v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
v66 = v66.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate

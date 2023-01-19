import("..\1983-1984.avs")
v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
v69 = v69.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

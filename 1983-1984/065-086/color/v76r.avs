import("..\1983-1984.avs")
v76 = LSMASHVideoSource(dst_dir + "v76f.mp4").ConvertToYV24()
v76 = v76.AdjustColor(ou = +2, ov = -2, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
v76 = v76.add_blank_audio
return v76.prefetch
#adjustframerate

import("..\1983-1984.avs")
v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
v44 = v44.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v44 = v44.colorYUV(off_u = -8, off_v = +4)
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate

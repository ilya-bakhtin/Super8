import("..\1983-1984.avs")
v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
v39 = v39.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v39 = v39.colorYUV(off_u = -4, off_v = +0)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate

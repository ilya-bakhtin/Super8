import("..\1983-1984.avs")
v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
v43 = v43.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v43 = v43.colorYUV(off_u = -8, off_v = +4)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

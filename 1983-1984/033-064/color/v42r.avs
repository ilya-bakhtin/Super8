import("..\1983-1984.avs")
v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
v42 = v42.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v42 = v42.colorYUV(off_u = -8, off_v = +4)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

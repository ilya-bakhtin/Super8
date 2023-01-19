import("..\1983-1984.avs")
v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
v47 = v47.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v47 = v47.colorYUV(off_u = -6, off_v = +0)
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate

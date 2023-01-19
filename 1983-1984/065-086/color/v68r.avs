import("..\1983-1984.avs")
v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
v68 = v68.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v68 = v68.colorYUV(off_u = -4, off_v = +0)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate

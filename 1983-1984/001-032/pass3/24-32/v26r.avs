import("..\..\1983-1984.avs")
v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
v26 = v26.AdjustColor(ou=-4, ov=+4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v26 = v26.colorYUV(off_u=-2, off_v=0)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

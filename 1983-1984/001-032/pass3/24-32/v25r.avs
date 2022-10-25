import("..\..\1983-1984.avs")
v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
v25 = v25.AdjustColor(ou=-4, ov=+4, x=100, y=10, w=-10, h=-400, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v25 = v25.colorYUV(off_u=-6, off_v=0)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

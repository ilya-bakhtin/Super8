import("..\..\1983-1984.avs")
v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
v28 = v28.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, gam_mac=true)
v28 = v28.colorYUV(off_u=-6, off_v=-4)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate

import("..\..\1983-1984.avs")
v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
v29 = v29.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v29 = v29.colorYUV(off_u=-4, off_v=-0)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

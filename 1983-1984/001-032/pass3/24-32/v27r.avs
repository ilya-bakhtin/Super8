import("..\..\1983-1984.avs")
v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
v27 = v27.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v27 = v27.colorYUV(off_u=-4, off_v=-2)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

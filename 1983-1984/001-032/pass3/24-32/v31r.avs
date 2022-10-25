import("..\..\1983-1984.avs")
v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
v31 = v31.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v31 = v31.colorYUV(off_u=-4, off_v=-2)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate

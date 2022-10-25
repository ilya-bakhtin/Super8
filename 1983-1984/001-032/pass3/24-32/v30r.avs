import("..\..\1983-1984.avs")
v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
v30 = v30.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, gam_mac=true)
v30 = v30.colorYUV(off_u=-4, off_v=-4)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate

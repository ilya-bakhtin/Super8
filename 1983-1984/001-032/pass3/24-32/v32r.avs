import("..\..\1983-1984.avs")
v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
#v32 = v32.colorYUV(off_y=6)
#v32 = v32.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v32 = v32.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.0001, lock_chan=0, sat=1.7, gam_mac=true)
v32 = v32.colorYUV(off_u=-4, off_v=+2)
v32 = v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
#return v32.histogram("levels").prefetch
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

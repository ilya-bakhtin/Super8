import("..\1983-1984.avs")
v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
v79 = v79.AdjustColor(ou = +10, ov = -6, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v79 = v79.colorYUV(off_u = -4, off_v = +0)
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate

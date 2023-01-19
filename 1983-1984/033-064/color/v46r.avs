import("..\1983-1984.avs")
v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
v46 = v46.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v46 = v46.colorYUV(off_u = -6, off_v = +0)
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate

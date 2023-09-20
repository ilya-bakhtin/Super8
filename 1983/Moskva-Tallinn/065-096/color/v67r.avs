import("..\1983-Moskva-Tallinn.avs")
v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
v67 = v67.AdjustColor(ou = +24, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true)
v67 = v67.colorYUV(off_u = +4, off_v = -4)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

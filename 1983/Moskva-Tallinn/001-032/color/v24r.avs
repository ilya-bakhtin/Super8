import("..\1983-Moskva-Tallinn.avs")
v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
v24 = v24.trim(0, 6) +\
      v24.colorYUV(off_y = -10).trim(7, 0)
v24 = v24.AdjustColor(ou = +14, ov = -10, x=200, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.4, lock_chan=1, sat=1.7, gam_mac=true)
v24 = v24.colorYUV(off_u = +4, off_v = -4)
v24 = v24.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.9)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate

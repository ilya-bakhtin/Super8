import("..\1983-Moskva-Tallinn.avs")
v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
v29 = v29.colorYUV(off_y = -8).trim(0, 3) +\
      v29.colorYUV(off_y = -16).trim(4, 57) +\
      v29.colorYUV(off_y = -20).trim(58, 94) +\
      v29.colorYUV(off_y = -16).trim(95, 0)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v29 = v29.AdjustColor(ou = +12, ov = -8, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v29 = v29.colorYUV(off_u = +4, off_v = -4)
v29 = v29.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

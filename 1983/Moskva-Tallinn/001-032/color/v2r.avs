import("..\1983-Moskva-Tallinn.avs")
v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
#v2_0 = v2.AdjustColor(ou = +15, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true, scale = 2,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v2 = v2.AdjustColor(ou = +15, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true, scale = 2, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v2 = v2_0.interleave(v2)
v2 = v2.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

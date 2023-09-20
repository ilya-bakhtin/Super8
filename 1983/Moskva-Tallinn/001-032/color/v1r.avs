import("..\1983-Moskva-Tallinn.avs")
v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
#b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
#v1_0 = v1.AdjustColor(ou = +12, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true,\
#                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v1 = v1.AdjustColor(ou = +12, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v1 = v1_0.interleave(v1)
v1 = v1.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate

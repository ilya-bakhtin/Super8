import("..\1983-Moskva-Tallinn.avs")
v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
v75 = v75.colorYUV(off_y = -16)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v75 = v75.AdjustColor(ou = +20, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v75 = v75.animate(32, 37, "gamma_f_dr", 1.3, 0.5).trim(0, 41) +\
      v75.animate(42, 44, "gamma_f_dr", 0.8, 1.0).trim(42, 0)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

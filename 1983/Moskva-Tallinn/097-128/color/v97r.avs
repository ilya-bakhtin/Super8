import("..\1983-Moskva-Tallinn.avs")
v97 = LSMASHVideoSource(dst_dir + "v97f.mp4").ConvertToYV24()
v97 = v97.colorYUV(off_y = -12)
b_ex = "z x 1.5 * > z y 1.5 * > & x y + 2. / z ?"
v97h = v97.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-200, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v97 = v97.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v97 = v97.trim(0, 46) + v97h.trim(47, 50) + v97.trim(51, 0)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
v97 = v97.add_blank_audio
return v97.prefetch
#adjustframerate

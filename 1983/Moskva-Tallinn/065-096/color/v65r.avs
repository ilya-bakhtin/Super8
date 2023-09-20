import("..\1983-Moskva-Tallinn.avs")
v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
g_ex = "y x 1.1 * > y z 1.1 * > & x z + 2. / y ?"
v65 = v65.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v65 = v65.colorYUV(off_u = +4, off_v = -4)
v65 = v65.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate

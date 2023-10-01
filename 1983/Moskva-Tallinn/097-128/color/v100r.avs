import("..\1983-Moskva-Tallinn.avs")
v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
v100 = v100.colorYUV(off_y = -16)
b_ex = "z x 1.3 * > z y 1.3 * > & x y + 2. / z ?"
v100 = v100.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate

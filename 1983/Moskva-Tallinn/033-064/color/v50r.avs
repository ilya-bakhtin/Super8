import("..\1983-Moskva-Tallinn.avs")
v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
v50 = v50.animate(70, 90, "offset_y", 0, -12)
v50 = v50.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v50 = v50.colorYUV(off_u = 2, off_v = +0)
v50 = v50.animate(0, 6, "gamma_f", 1, 2.3)
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

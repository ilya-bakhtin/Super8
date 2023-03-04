import("..\1983-Moskva-Tallinn.avs")
v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
v15 = v15.colorYUV(off_y = -10)
v15 = v15.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v15 = v15.colorYUV(off_u = +4, off_v = 2)
v15 = v15.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

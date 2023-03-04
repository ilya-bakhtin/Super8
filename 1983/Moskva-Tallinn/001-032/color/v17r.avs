import("..\1983-Moskva-Tallinn.avs")
v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
v17 = v17.colorYUV(off_y = -20)
v17 = v17.AdjustColor(ou = +14, ov = -10, x=200, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v17 = v17.colorYUV(off_u = +4, off_v = -4)
v17 = v17.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
#v17 = v17.rotate(angle=-5)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate

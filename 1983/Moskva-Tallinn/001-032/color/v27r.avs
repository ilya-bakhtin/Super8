import("..\1983-Moskva-Tallinn.avs")
v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
v27 = v27.AdjustColor(ou = +14, ov = -4, x=200, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.4, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v27 = v27.colorYUV(off_u = +6, off_v = -6)
v27 = v27.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

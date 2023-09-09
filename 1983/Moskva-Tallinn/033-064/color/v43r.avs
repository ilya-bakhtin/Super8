import("..\1983-Moskva-Tallinn.avs")
v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
v43 = v43.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v43 = v43.colorYUV(off_u = +6, off_v = -6)
v43 = v43.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.7)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

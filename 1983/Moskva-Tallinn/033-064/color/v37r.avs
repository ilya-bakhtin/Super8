import("..\1983-Moskva-Tallinn.avs")
v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
v37 = v37.AdjustColor(ou = +24, ov = -16, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v37 = v37.colorYUV(off_u = -4, off_v = +6)
v37 = v37.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.9)
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

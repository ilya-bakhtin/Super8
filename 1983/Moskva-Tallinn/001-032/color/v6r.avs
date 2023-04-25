import("..\1983-Moskva-Tallinn.avs")
v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
v6 = v6.colorYUV(off_y = -16)
v6 = v6.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v6 = v6.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate

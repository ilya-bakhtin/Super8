import("..\1983-Moskva-Tallinn.avs")
v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
v53 = v53.AdjustColor(ou = +16, ov = -10, x=600, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=0.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v53 = v53.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate

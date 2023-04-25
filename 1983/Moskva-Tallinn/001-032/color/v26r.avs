import("..\1983-Moskva-Tallinn.avs")
v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
#v26 = v26.trim(0, 48) +\
#      v26.colorYUV(off_y = -10).trim(49, 65) +\
#      v26.trim(66, 0)
#return v26.hist_levels
v26 = v26.AdjustColor(ou = +14, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

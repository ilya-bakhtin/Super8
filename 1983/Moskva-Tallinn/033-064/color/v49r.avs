import("..\1983-Moskva-Tallinn.avs")
v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
v49 = v49.colorYUV(off_y = -20)
v49 = v49.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate

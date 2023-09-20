import("..\1983-Moskva-Tallinn.avs")
v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
v20 = v20.colorYUV(off_y = -16)
v20 = v20.AdjustColor(ou = +14, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v20 = v20.colorYUV(off_u = +4, off_v = -4)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate

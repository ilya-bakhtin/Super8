import("..\1983-Moskva-Tallinn.avs")
v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
v23 = v23.colorYUV(off_y = -10).trim(0, 5) +\
      v23.colorYUV(off_y = -20).trim(6, 0)
v23 = v23.AdjustColor(ou = +14, ov = -10, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v23 = v23.colorYUV(off_u = +6, off_v = -4)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate

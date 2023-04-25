import("..\1983-Moskva-Tallinn.avs")
v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
v32 = v32.AdjustColor(ou = +12, ov = -8, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

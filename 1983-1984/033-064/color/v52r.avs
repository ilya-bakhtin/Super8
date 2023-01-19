import("..\1983-1984.avs")
v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
v52 = v52.AdjustColor(ou = +18, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate

import("..\1983-Moskva-Tallinn.avs")
v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
v74 = v74.colorYUV(off_y = -24)
b_ex = undefined
v74 = v74.AdjustColor(ou = +20, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v74 = v74.colorYUV(off_u = +8, off_v = -6)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

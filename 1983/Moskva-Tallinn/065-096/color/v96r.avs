import("..\1983-Moskva-Tallinn.avs")
v96 = LSMASHVideoSource(dst_dir + "v96f.mp4").ConvertToYV24()
v96 = v96.colorYUV(off_y = -20)
b_ex = undefined
v96 = v96.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v96 = v96.colorYUV(off_u = +8, off_v = -8)
v96 = v96.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
v96 = v96.add_blank_audio
return v96.prefetch
#adjustframerate

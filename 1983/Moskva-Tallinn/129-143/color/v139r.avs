import("..\1983-Moskva-Tallinn.avs")
v139 = LSMASHVideoSource(dst_dir + "v139f.mp4").ConvertToYV24()
b_ex = undefined
v139 = v139.AdjustColor(ou = +12, ov = -4, x=200, y=200, w=-100, h=-100, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v139 = v139.colorYUV(off_u = +12, off_v = -12)
v139 = v139.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v139 = v139.adjustSize
v139 = v139.assumeFPS(18)
v139 = v139.add_blank_audio
return v139.prefetch
#adjustframerate

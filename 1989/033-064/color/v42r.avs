import("..\1989-sevas.avs")
v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
b_ex = undefined
v42 = v42.AdjustColor(ou = +22, ov = -14, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v42 = v42.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

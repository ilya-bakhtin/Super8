import("..\1989-sevas.avs")
v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
b_ex = undefined
v25 = v25.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v25_1 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, autolevel=false, input_low=16, input_high=235, output_low=0, output_high=240)
v25 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, autolevel=false, input_low=16, input_high=235, output_low=0)#, output_high=235)
v25 = v25_1.trim(0, 87) + v25.trim(88, 0)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

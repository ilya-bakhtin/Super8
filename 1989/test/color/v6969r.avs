import("..\..\..\common.avs")
import("..\..\..\s8_functions.avs")
v6969 = LSMASHVideoSource(dst_dir + "v6969f.mp4").ConvertToYV24()
b_ex = undefined
v6969 = v6969.AdjustColor(ou = +10, ov = -4, x=100, y=100, w=-100, h=-100, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)#,\
#                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v6969 = v6969.colorYUV(off_u = +8, off_v = -8)
v6969_1 = v6969.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, autolevel=false, input_low=16, input_high=235, output_low=0, output_high=240)
v6969 = v6969.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, autolevel=false, input_low=16, input_high=235, output_low=0)#, output_high=235)
v6969 = v6969_1.trim(0, 87) + v6969.trim(88, 0)
#v6969 = v6969.convertToYV12(interlaced = false).deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
#return v6969.hist_levels.prefetch
v6969 = v6969.adjustSize
v6969 = v6969.assumeFPS(18)
v6969 = v6969.add_blank_audio
return v6969.prefetch
#adjustframerate

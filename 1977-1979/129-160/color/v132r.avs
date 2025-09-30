import("..\1977-1979.avs")
v132 = LSMASHVideoSource(dst_dir + "v132f.mp4").ConvertToYV24()
b_ex = undefined
v132o = v132
#return v132.histogram.prefetch
v132 = v132.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)#,\
#return v132.crop(500, 200, -400, -200).histogram.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.7 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 132. - 132. / * 132. * 132. +"
ex_v = "z" #ex_uv + "z 132. - 132. / * 132. * 132. +"
v132i = v132
v132 = expr(v132.extractY, v132.extractU, v132.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v132 = v132.autolevels(filterRadius=9, border_l = 10, border_r = 10, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v132 = v132.autolevels(autolevel = false, input_low = 0, output_low = 4, input_high = 255, output_high = 240)
v132a = v132i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v132 = v132.colorYUV(off_u = -2, off_v = -2)
#return v132.histogram.prefetch
#return v132i.interleave(v132).hist_levels.prefetch
v132 = v132.adjustSize
v132 = v132.assumeFPS(18)
v132 = v132.add_blank_audio
return v132.prefetch
#adjustframerate

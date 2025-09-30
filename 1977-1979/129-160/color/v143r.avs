import("..\1977-1979.avs")
v143 = LSMASHVideoSource(dst_dir + "v143f.mp4").ConvertToYV24()
b_ex = undefined
v143o = v143
v143 = v143.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 142,142, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 142. - 142. / * 142. * 142. +"
ex_v = "z" #ex_uv + "z 142. - 142. / * 142. * 142. +"
v143i = v143
v143 = expr(v143.extractY, v143.extractU, v143.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v143 = v143.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v143a = v143i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v143i.interleave(v143).hist_levels.prefetch
v143 = v143.adjustSize
v143 = v143.assumeFPS(18)
v143 = v143.add_blank_audio
return v143.prefetch
#adjustframerate

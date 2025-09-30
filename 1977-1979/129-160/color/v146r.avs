import("..\1977-1979.avs")
v146 = LSMASHVideoSource(dst_dir + "v146f.mp4").ConvertToYV24()
b_ex = undefined
v146o = v146
v146 = v146.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 145,145, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 145. - 145. / * 145. * 145. +"
ex_v = "z" #ex_uv + "z 145. - 145. / * 145. * 145. +"
v146i = v146
v146 = expr(v146.extractY, v146.extractU, v146.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v146 = v146.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v146a = v146i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v146 = v146.colorYUV(off_u = -2, off_v = -2)
#return v146i.interleave(v146).hist_levels.prefetch
v146 = v146.adjustSize
v146 = v146.assumeFPS(18)
v146 = v146.add_blank_audio
return v146.prefetch
#adjustframerate

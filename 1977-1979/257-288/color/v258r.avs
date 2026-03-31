import("..\1977-1979.avs")
v258 = LSMASHVideoSource(dst_dir + "v258f.mp4").ConvertToYV24()
b_ex = undefined
v258o = v258
v258 = v258.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.2 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v258i = v258
v258 = v258.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v258 = expr(v258.extractY, v258.extractU, v258.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v258 = v258.autolevels(filterRadius=9, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=1.)
v258a = v258i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
v258 = v258.colorYUV(off_u = +2, off_v = -2)
#return v258i.interleave(v258).hist_levels.prefetch
v258 = v258.adjustSize
v258 = v258.assumeFPS(18)
v258 = v258.add_blank_audio
return v258.prefetch
#adjustframerate

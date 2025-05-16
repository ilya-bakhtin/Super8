import("..\1981-1982-Kemerovo.avs")
v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
b_ex = undefined
#return v40.histogram.prefetch
v40o = v40
v40 = v40.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v40i = v40
v40 = expr(v40.extractY, v40.extractU, v40.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v40 = v40.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v40a = v40i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v40 = v40.colorYUV(off_u = -2, off_v = -2)
#return v40o.interleave(v40).hist_levels
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

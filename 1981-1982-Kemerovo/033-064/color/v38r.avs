import("..\1981-1982-Kemerovo.avs")
v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
b_ex = undefined
#return v38.histogram.prefetch
v38o = v38
v38 = v38.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v38.hist_levels.prefetch
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v38i = v38
v38 = expr(v38.extractY, v38.extractU, v38.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v38 = v38.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v38a = v38i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v38 = v38.colorYUV(off_u = -2, off_v = -2)
#return v38o.interleave(v38).hist_levels
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate

import("..\1981-1982-Kemerovo.avs")
v95 = LSMASHVideoSource(dst_dir + "v95f.mp4").ConvertToYV24()
b_ex = undefined
v95o = v95
v95 = v95.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v95i = v95
v95 = expr(v95.extractY, v95.extractU, v95.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v95 = v95.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v95a = v95i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v95 = v95.colorYUV(off_u = -2, off_v = -2)
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
v95 = v95.add_blank_audio
return v95.prefetch
#adjustframerate

import("..\1977-1979.avs")
v212 = LSMASHVideoSource(dst_dir + "v212f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v212o = v212
v212 = v212.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v212i = v212
v212 = expr(v212.extractY, v212.extractU, v212.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v212 = v212.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v212a = v212i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v212 = v212.colorYUV(off_u = -0, off_v = +4)
#return v212i.interleave(v212).hist_levels.prefetch
v212 = v212.adjustSize
v212 = v212.assumeFPS(18)
v212 = v212.add_blank_audio
return v212.prefetch
#adjustframerate

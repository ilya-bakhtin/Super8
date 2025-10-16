import("..\1977-1979.avs")
v213 = LSMASHVideoSource(dst_dir + "v213f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v213o = v213
v213 = v213.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v213i = v213
v213 = expr(v213.extractY, v213.extractU, v213.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v213 = v213.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v213a = v213i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v213 = v213.colorYUV(off_u = -0, off_v = -2)
#return v213i.interleave(v213).hist_levels.prefetch
v213 = v213.adjustSize
v213 = v213.assumeFPS(18)
v213 = v213.add_blank_audio
return v213.prefetch
#adjustframerate

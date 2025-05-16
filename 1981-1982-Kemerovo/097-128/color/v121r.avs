import("..\1981-1982-Kemerovo.avs")
v121 = LSMASHVideoSource(dst_dir + "v121f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 200
v121 = v121.trim(81, -1).loop(v121.frameCount).crop(v121.width - add_width, 0, 0, 0).stackHorizontal(v121)
v121o = v121
v121 = v121.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v121i = v121
v121 = expr(v121.extractY, v121.extractU, v121.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v121 = v121.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v121a = v121i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v121 = v121.crop(add_width, 0, 0, 0)
v121i = v121i.crop(add_width, 0, 0, 0)
v121 = v121.adjustSize
v121 = v121.assumeFPS(18)
v121 = v121.add_blank_audio
return v121.prefetch
#adjustframerate

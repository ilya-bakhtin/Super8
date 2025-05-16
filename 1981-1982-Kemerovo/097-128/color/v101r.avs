import("..\1981-1982-Kemerovo.avs")
v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 100
v101 = v101.trim(87, -1).loop(v101.frameCount).crop(v101.width - add_width, 0, 0, 0).stackHorizontal(v101)
v101o = v101
v101 = v101.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v101i = v101
v101 = expr(v101.extractY, v101.extractU, v101.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v101 = v101.autolevels(filterRadius=0, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v101a = v101i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v101 = v101.crop(add_width, 0, 0, 0)
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate

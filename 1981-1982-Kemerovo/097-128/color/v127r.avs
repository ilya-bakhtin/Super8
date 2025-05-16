import("..\1981-1982-Kemerovo.avs")
v127 = LSMASHVideoSource(dst_dir + "v127f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 200
v127 = v127.trim(105, -1).loop(v127.frameCount).crop(0, 0, -(v127.width - add_width), 0).stackHorizontal(v127)
v127o = v127
v127 = v127.AdjustColor(ou = -0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v127i = v127
v127 = expr(v127.extractY, v127.extractU, v127.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v127 = v127.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v127a = v127i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v127 = v127.crop(add_width, 0, 0, 0)
v127i = v127i.crop(add_width, 0, 0, 0)
#v127 = v127.colorYUV(off_u = +1, off_v = -1)
v127 = v127.adjustSize
v127 = v127.assumeFPS(18)
v127 = v127.add_blank_audio
return v127.prefetch
#adjustframerate

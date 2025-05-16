import("..\1981-1982-Kemerovo.avs")
v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
v11 = v11.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false)
b_ex = undefined
#return v11.histogram
add_height = 600
v11 = v11.trim(24, -1).loop(v11.frameCount).crop(0, v11.height - add_height, 0, 0).stackVertical(v11)
v11 = v11.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v11i = v11
v11 = expr(v11.extractY, v11.extractU, v11.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.0003, gamma=1.5)
v11a = v11i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v11 = v11.crop(0, add_height, 0, 0)
v11 = v11.colorYUV(off_u = +4, off_v = -4)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate

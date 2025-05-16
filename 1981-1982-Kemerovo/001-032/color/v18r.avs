import("..\1981-1982-Kemerovo.avs")
v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
v18o = v18
b_ex = undefined
v18 = v18.autolevels(input_low = 12, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
#return v18.histogram.prefetch
add_height = 400
v18 = v18.trim(188, -1).loop(v18.frameCount).crop(0, v18.height - add_height, 0, 0).stackVertical(v18)
v18 = v18.AdjustColor(ou = +2, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v18i = v18
v18 = expr(v18.extractY, v18.extractU, v18.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v18 = v18.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0009, gamma=1.3)
v18a = v18i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v18 = v18.crop(0, add_height, 0, 0)
v18a = v18a.crop(0, add_height, 0, 0)
v18 = v18.colorYUV(off_u = -2, off_v = +2)
#return v18o.interleave(v18).hist_levels
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate

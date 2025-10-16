import("..\1977-1979.avs")
v224 = LSMASHVideoSource(dst_dir + "v224f.mp4").ConvertToYV24()
#v224 = v224.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v224 = v224.trim(105, -1).loop(v224.frameCount).crop(0, 0, -(v224.width - add_width), 0).stackHorizontal(v224)
#return v224.histogram.prefetch
v224o = v224
#v224 = v224.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
v224 = v224.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v224.hist_levels.prefetch
#v224 = v224.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v224 = expr(v224.extractY, v224.extractU, v224.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v224i = v224
v224 = expr(v224.extractY, v224.extractU, v224.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v224 = v224.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v224a = v224i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v224 = v224.crop(add_width, 0, 0, 0)
#v224i = v224i.crop(add_width, 0, 0, 0)
#v224a = v224a.crop(add_width, 0, 0, 0)
#v224 = v224.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v224 = v224.colorYUV(off_u = -0, off_v = -2)
#v224 = v224i
#return v224i.interleave(v224).hist_levels.prefetch
v224 = v224.adjustSize
v224 = v224.assumeFPS(18)
v224 = v224.add_blank_audio
return v224.prefetch
#adjustframerate

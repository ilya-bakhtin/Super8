import("..\1981-1982-Kemerovo.avs")
v170 = LSMASHVideoSource(dst_dir + "v170f.mp4").ConvertToYV24()
v170 = v170.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v170 = v170.trim(105, -1).loop(v170.frameCount).crop(0, 0, -(v170.width - add_width), 0).stackHorizontal(v170)
#return v170.histogram.prefetch
v170o = v170
v170 = v170.AdjustColor(ou = -4, ov = -0, x=500, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v170.hist_levels.prefetch
#v170 = v170.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v170 = expr(v170.extractY, v170.extractU, v170.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v170i = v170
v170 = expr(v170.extractY, v170.extractU, v170.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v170 = v170.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v170a = v170i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v170 = v170.crop(add_width, 0, 0, 0)
#v170i = v170i.crop(add_width, 0, 0, 0)
#v170a = v170a.crop(add_width, 0, 0, 0)
#v170 = v170.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v170 = v170.colorYUV(off_u = +2, off_v = -0)
#v170 = v170i
#return v170i.interleave(v170).hist_levels.prefetch
v170 = v170.adjustSize
v170 = v170.assumeFPS(18)
v170 = v170.add_blank_audio
return v170.prefetch
#adjustframerate

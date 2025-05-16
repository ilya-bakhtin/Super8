import("..\1981-1982-Kemerovo.avs")
v160 = LSMASHVideoSource(dst_dir + "v160f.mp4").ConvertToYV24()
#v160 = v160.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v160 = v160.trim(105, -1).loop(v160.frameCount).crop(0, 0, -(v160.width - add_width), 0).stackHorizontal(v160)
#return v160.histogram.prefetch
v160o = v160
v160 = v160.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v160.hist_levels.prefetch
#v160 = v160.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v160 = expr(v160.extractY, v160.extractU, v160.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v160i = v160
v160 = expr(v160.extractY, v160.extractU, v160.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v160 = v160.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v160a = v160i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v160 = v160.crop(add_width, 0, 0, 0)
#v160i = v160i.crop(add_width, 0, 0, 0)
#v160a = v160a.crop(add_width, 0, 0, 0)
#v160 = v160.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v160 = v160.colorYUV(off_u = -2, off_v = -2)
#v160 = v160i
#return v160i.interleave(v160).hist_levels.prefetch
v160 = v160.adjustSize
v160 = v160.assumeFPS(18)
v160 = v160.add_blank_audio
return v160.prefetch
#adjustframerate

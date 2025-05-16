import("..\1981-1982-Kemerovo.avs")
v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
v64 = v64.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v64 = v64.trim(188, -1).loop(v64.frameCount).crop(0, v64.height - add_height, 0, 0).stackVertical(v64)
#return v64.histogram.prefetch
v64o = v64
v64 = v64.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v64.hist_levels.prefetch
#v64 = v64.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v64 = expr(v64.extractY, v64.extractU, v64.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v64i = v64
v64 = expr(v64.extractY, v64.extractU, v64.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v64 = v64.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v64a = v64i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v64 = v64.crop(0, add_height, 0, 0)
#v64a = v64a.crop(0, add_height, 0, 0)
#v64 = v64.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v64 = v64.colorYUV(off_u = -10, off_v = +0)
#return v64o.interleave(v64).hist_levels
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate

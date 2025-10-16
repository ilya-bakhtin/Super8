import("..\1977-1979.avs")
v209 = LSMASHVideoSource(dst_dir + "v209f.mp4").ConvertToYV24()
b_ex = undefined
#b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
#b_ex = "z x - x 2. / > z y - y 2. / > & x y + 2. / z ?"
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
#if (b > r && b > g && (b - r) > r / 2. && (b - g) > g / 2.
v209o = v209
v209 = v209.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)#,\
#                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 135, 135, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#v209 = v209.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 128. * 128. + gy^ V 0.01 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 128. * 128. + gz^ V 0.01 > gz z ?"
v209i = v209
v209 = expr(v209.extractY, v209.extractU, v209.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v209 = v209.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v209a = v209i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v209 = v209.colorYUV(off_u = -2, off_v = +2)
#return v209i.interleave(v209).hist_levels.prefetch
v209 = v209.adjustSize
v209 = v209.assumeFPS(18)
v209 = v209.add_blank_audio
return v209.prefetch
#adjustframerate

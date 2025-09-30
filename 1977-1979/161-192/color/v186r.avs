import("..\1977-1979.avs")
v186 = LSMASHVideoSource(dst_dir + "v186f.mp4").ConvertToYV24()
v186 = v186.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v186o = v186
#return v186.histogram.prefetch
v186 = v186.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.0004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.5 / G0^ 2.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v186i = v186
v186 = expr(v186.extractY, v186.extractU, v186.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v186 = v186.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v186a = v186i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v186 = v186.colorYUV(off_u = -4, off_v = -4)
#return v186i.interleave(v186).hist_levels.prefetch
v186 = v186.adjustSize
v186 = v186.assumeFPS(18)
v186 = v186.add_blank_audio
return v186.prefetch
#adjustframerate

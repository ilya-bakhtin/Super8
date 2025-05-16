import("..\1981-1982-Kemerovo.avs")
v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
v1 = v1.autolevels(input_low = 0, output_low = 4, input_high = 251, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
v1 = v1.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
b_ex = undefined
v1 = v1.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
v1 = v1.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate

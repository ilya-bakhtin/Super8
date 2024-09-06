SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

v0 = LSMASHVideoSource("E:\media\video\Super8\Sources\1987\10657 Bakhtin 01 S8.720p.mov").assumefps(18)
#return v0

v1 = LSMASHVideoSource("F:\media\video\Super8\Sources\1987\01.Res2K43.Aspect43In43.Speed18Fps.mov").assumefps(18)
v2 = LSMASHVideoSource("F:\media\video\Super8\Sources\1987\02.Res2K43.Aspect43In43.Speed18Fps.mov").assumefps(18)
v1 = v1.trim(0, 5552) + v2.trim(4, 0)

last = v1
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 4560, 4657, 4778, 4800, 4848, 4926, 5054, 5090, 5200, 5210, 5264, 5268, 5453, 5535, 5550, 5847, 6045, 6362, 6383, 6407, 6457,
# 6618, 6658, 6674, 6754, 6806, 6859, 7224, 7310, 7493, 7508, 7554, 7659, 7731, 7769

global src = last
#return last.autolevels(minRng=0, filterRadius=0, border_l = 200, border_t = 100, border_r = 200, border_b = 100, ignore_low = 0.03).colorYUV(autowhite=true, autogain=true)
#return full

left = 56
top = 94
right = -104
bot = -100
lo = left
ro = right
to = top
bo = bot

v1 = full.trim(4560, 4656)
v1 = v1.crop(left + 20, top - 0, right + 20, bot - 0)
v1 = v1.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 230, autolevel = false)

v0o = v0
v0 = v0.trim(4509, -50)
v0 = v0.crop(160, 4, -160, -4)
v0 = v0.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v0.trim(3, 0)
v0 = v0.autolevels(input_low = 0, output_low = 0, input_high = 220, output_high = 255, autolevel = false)
v0 = v0.colorYUV(off_u = 4, off_v = -4)
#v0 = v0.spline64Resize(v1.width, v1.height, -30, -4, v0.width + 62, v0.height + 14)
#return v0.subtract(v1)
#return (v0 + v1.trim(50, 0)).hist_levels
/*
v2 = full.trim(4657, 4777)
v2 = v2.crop(left + 60, top - 0, right + 60, bot - 0)
v2 = v2.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 230, autolevel = false)
v2 = v2.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v2.trim(3, 0)

v3 = full.trim(4778, 4799)
v3 = v3.crop(left + 60, top - 0, right + 60, bot - 0)

v4 = full.trim(4800, 4847)
v4 = v4.crop(left + 50, top - 0, right + 50, bot - 0)
v4 = v4.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 230, autolevel = false)
v4 = v4.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v4.trim(3, 0)

v6 = full.trim(4848, 4925)
v6 = v6.crop(left + 50, top + 10, right + 50, bot + 10)
v6 = v6.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v6.trim(3, 0)

v6 = full.trim(4926, 5053)
v6 = v6.crop(left + 50, top + 10, right + 50, bot + 10)
v6 = v6.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v6.trim(3, 0)

v7 = full.trim(5054, 5089)
v7 = v7.crop(left + 40, top + 10, right + 40, bot + 10)
#v7 = v7.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#     v7.trim(3, 0)

v7_0 = v0o.trim(5003, -6)
v7_0 = v7_0.crop(160, 4, -160, -4)
v7_0 = v7_0.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v7_0.trim(3, 0)
v7_0 = v7_0.autolevels(input_low = 0, output_low = 0, input_high = 180, output_high = 255, autolevel = false)
v7_0 = v7_0.colorYUV(off_u = 4, off_v = -4)
#v7_0 = v7_0.spline64Resize(v7.width, v7.height, -30, -4, v7_0.width + 62, v7_0.height + 14)
#return (v7_0 + v7.trim(6, 0)).hist_levels

v8 = full.trim(5090, 5199)
v8 = v8.crop(left + 40, top + 20, right + 40, bot + 20)
v8 = v8.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v8.trim(3, 0)
v8 = v8.autolevels(input_low = 0, output_low = 2, input_high = 255, output_high = 235, autolevel = false)

v9 = full.trim(5200, 5209)
v9 = v9.crop(left + 40, top + 0, right + 40, bot + 0)
v9 = v9.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v9.trim(3, 0)

v10 = full.trim(5210, 5263)
v10 = v10.crop(left + 40, top + 0, right + 40, bot + 0)
v10 = v10.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v10.trim(3, 0)

v11 = full.trim(5264, 5267)
v11 = v11.crop(left + 40, top + 0, right + 40, bot + 0)
v11 = v11.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v11.trim(3, 0)

v12 = full.trim(5268, 5452)
v12 = v12.crop(left + 40, top + 0, right + 40, bot + 0)
v12 = v12.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v12 = v12.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v12.trim(3, 0)

v13 = full.trim(5453, 5534)
v13 = v13.crop(left + 40, top + 0, right + 40, bot + 0)
v13 = v13.colorYUV(off_Y = -8)
v13 = v13.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v13.trim(3, 0)

v14 = full.trim(5535, 5549)
v14 = v14.crop(left + 40, top + 20, right + 40, bot + 20)
v14 = v14.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v14.trim(3, 0)
v14 = v14.correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)
*/
v15 = full.trim(5550, 5846)
v15 = v15.crop(left + 40, top - 10, right + 40, bot - 10).trim(0, 1) +\
      v15.crop(left + 40, top + 20, right + 40, bot + 20).trim(2, 0)
/*
v16 = full.trim(5847, 6044)
v16 = v16.crop(left + 40, top + 20, right + 40, bot + 20)
v16 = v16.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v16.trim(3, 0)

v17 = full.trim(6045, 6361)
v17 = v17.crop(left + 40, top + 10, right + 40, bot + 10)
v17 = v17.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v17.trim(3, 0)

v18 = full.trim(6362, 6382)
v18 = v18.crop(left + 40, top + 10, right + 40, bot + 10)
v18 = v18.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v18.trim(3, 0)

v19 = full.trim(6383, 6406)
v19 = v19.crop(left + 40, top + 20, right + 40, bot + 20)
v19 = v19.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v19.trim(3, 0)

v20 = full.trim(6407, 6456)
v20 = v20.crop(left + 40, top + 20, right + 40, bot + 20)
v20 = v20.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v20.trim(3, 0)

v21 = full.trim(6457, 6617)
v21 = v21.crop(left + 40, top + 20, right + 40, bot + 20)
v21 = v21.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v21.trim(3, 0)

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v22 = full.trim(6618, 6657)
v22 = v22.crop(left + 40, top + 20, right + 40, bot + 20)
v22 = v22.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v22.trim(3, 0)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v23 = full.trim(6658, 6673)
v23 = v23.crop(left + 40, top + 20, right + 40, bot + 20)
v23 = v23.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v23.trim(3, 0)

left = lo
top = to
right = ro
bot = bo

v24 = full.trim(6674, 6753)
v24 = v24.crop(left + 40, top + 20, right + 40, bot + 20)
v24 = v24.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v24.trim(3, 0)

v25 = full.trim(6754, 6805)
v25 = v25.crop(left + 40, top + 20, right + 40, bot + 20)
v25 = v25.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v25.trim(3, 0)

v26 = full.trim(6806, 6858)
v26 = v26.crop(left + 40, top + 20, right + 40, bot + 20)
v26 = v26.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v26.trim(3, 0)

v27 = full.trim(6859, 7223)
v27 = v27.crop(left + 40, top + 20, right + 40, bot + 20).trim(0, 334) +\
      v27.crop(left + 40, top + 40, right + 40, bot + 40).trim(335, 361) +\
      v27.crop(left + 60, top + 70, right + 60, bot + 70).trim(362, 0)
v27 = v27.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v27.trim(3, 0)

v28 = full.trim(7224, 7309)
v28 = v28.crop(left + 40, top + 40, right + 40, bot + 40)

v29 = full.trim(7310, 7492)
v29 = v29.crop(left + 40, top + 40, right + 40, bot + 40)
v29 = v29.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v29.trim(3, 0)
v29 = v29.trim(0, 119) +\
      v29.trim(120, 0).correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)

v30 = full.trim(7493, 7507)
v30 = v30.crop(left + 40, top + 40, right + 40, bot + 40)
v30 = v30.correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)

v31 = full.trim(7508, 7553)
v31 = v31.crop(left + 40, top + 40, right + 40, bot + 40)
v31 = v31.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v31.trim(3, 0)
v31 = v31.trim(0, 8).correct_left_side(width = 200).correct_left_side(width = 100) +\
      v31.trim(9, 0)
*/
v32 = full.trim(7554, 7658)
v32 = v32.crop(left + 40, top + 20, right + 40, bot + 20).trim(0, 67) +\
      v32.crop(left + 40, top - 20, right + 40, bot - 20).trim(68, -1) +\
      v32.crop(left + 40, top - 94, right + 40, bot - 94).trim(69, -1) +\
      v32.crop(left + 40, top + 20, right + 40, bot + 20).trim(70, 80) +\
      v32.crop(left + 40, top - 20, right + 40, bot - 20).trim(81, -1) +\
      v32.crop(left + 40, top + 20, right + 40, bot + 20).trim(82, 0)
v32 = v32.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v32.trim(3, 0)
/*
v33 = full.trim(7659, 7730)
v33 = v33.crop(left + 40, top + 20, right + 40, bot + 20)
v33 = v33.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v33.trim(3, 0)

v34 = full.trim(7731, 7768)
v34 = v34.crop(left + 40, top + 20, right + 40, bot + 20)
v34 = v34.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v34.trim(3, 18) +\
      v34.trim(18, 21).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(1, 2) +\
      v34.trim(21, 0)
#return v34.hist_levels
# 6618, 6658, 6674, 6754, 6806, 6859, 7224, 7310, 7493, 7508, 7554, 7659, 7731, 7769
*/
#global filter16 = true

import("common.avs")

/*

#******

# 1

v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
b_ex = undefined
v1 = v1.AdjustColor(ou = +0, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v1 = v1.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate

v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
b_ex = undefined
v2 = v2.AdjustColor(ou = -3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v2 = v2.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
b_ex = undefined
v3 = v3.AdjustColor(ou = -3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate

v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
b_ex = undefined
v4 = v4.AdjustColor(ou = -3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate

v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").ConvertToYV24()
b_ex = undefined
v5 = v5.AdjustColor(ou = -3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v5 = v5.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
v5 = v5.add_blank_audio
return v5.prefetch
#adjustframerate

v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
b_ex = undefined
v6 = v6.AdjustColor(ou = -6, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v6 = v6.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate

v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").ConvertToYV24()
b_ex = undefined
v7 = v7.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
v7 = v7.add_blank_audio
return v7.prefetch
#adjustframerate

v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
b_ex = undefined
v8 = v8.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v8 = v8.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate

v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
v9 = v9.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v9 = v9.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate

v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
b_ex = undefined
v10 = v10.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v10 = v10.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate

v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
b_ex = undefined
v11 = v11.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate

v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
b_ex = undefined
v12 = v12.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v12 = v12.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
v13 = v13.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v13 = v13.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v13 = v13.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate

v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").ConvertToYV24()
b_ex = undefined
v14 = v14.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v14 = v14.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v14 = v14.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
v14 = v14.add_blank_audio
return v14.prefetch
#adjustframerate

v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
b_ex = undefined
v15 = v15.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v15 = v15.colorYUV(off_u = +2, off_v = -2)
v15 = v15.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
#v15 = v15.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
b_ex = undefined
v16 = v16.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=0, sat=2.0, gam_mac=true, b_expr=b_ex)
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
#v16 = v16.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v16 = v16.colorYUV(off_u = +2, off_v = -2)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate

v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
v17 = v17.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v17 = v17.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v17 = v17.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v17 = v17.colorYUV(off_u = +2, off_v = -2)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate

v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
b_ex = undefined
v18 = v18.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v18 = v18.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v18 = v18.colorYUV(off_u = +2, off_v = -2)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate

v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
b_ex = undefined
v19 = v19.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v19 = v19.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate

v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
b_ex = undefined
v20 = v20.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate

v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").ConvertToYV24()
b_ex = undefined
v21 = v21.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v21 = v21.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
v21 = v21.add_blank_audio
return v21.prefetch
#adjustframerate

v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
b_ex = undefined
v22 = v22.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2, gam_mac=true, b_expr=b_ex)
v22 = v22.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.03, gamma=1.1)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate

v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
b_ex = undefined
v23 = v23.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2, gam_mac=true, b_expr=b_ex)
v23 = v23.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate

v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
b_ex = undefined
v24 = v24.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2, gam_mac=true, b_expr=b_ex)
v24 = v24.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate

v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
b_ex = undefined
v25 = v25.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2, gam_mac=true, b_expr=b_ex)
v25 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
b_ex = undefined
v26 = v26.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2, gam_mac=true, b_expr=b_ex)
v26 = v26.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
b_ex = undefined
v27 = v27.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v27 = v27.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
b_ex = undefined
v28 = v28.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v28 = v28.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate

v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
b_ex = undefined
v29 = v29.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)
v29 = v29.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v29 = v29.colorYUV(off_u = +6, off_v = -8)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
b_ex = undefined
v30 = v30.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v30 = v30.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v30 = v30.colorYUV(off_u = +4, off_v = -4)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate

v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
b_ex = undefined
v31 = v31.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v31 = v31.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate

v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
b_ex = undefined
v32 = v32.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
b_ex = undefined
v33 = v33.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v33 = v33.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.3)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
#v34 = v34.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v34 = v34.trim(1, -1).loop(v34.frameCount).crop(0, 0, 0, add_height - v34.height).stackVertical(v34)
#return v34.histogram.prefetch
v34 = v34.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v34 = v34.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
#v34 = v34.crop(0, add_height, 0, 0)
#v34 = v34.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v34 = v34.colorYUV(off_u = +2, off_v = -2)
#return v34.hist_levels.prefetch
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate

#******
*/
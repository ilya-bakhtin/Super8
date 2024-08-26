SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

LSMASHVideoSource("F:Media\video\Super8\Sources\1987\01.Res2K43.Aspect43In43.Speed18Fps.mov") +\
LSMASHVideoSource("F:Media\video\Super8\Sources\1987\02.Res2K43.Aspect43In43.Speed18Fps.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 17739, 17877, 17942, 18099, 18303, 18429, 18542, 18605, 18699, 18827, 19001, 19213, 19600, 19804, 20020, 20191, 20392, 20593, 20708, 20821,
# 20937, 21104, 21291, 21333

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

/*
v1 = full.trim(17739, 17876)
v1 = v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(0, -1) +\
     v1.crop(left + 60, top - 20, right + 60, bot - 20).trim(1, 11) +\
     v1.crop(left + 60, top - 30, right + 60, bot - 30).trim(12, 13) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(14, 15) +\
     v1.crop(left + 60, top - 80, right + 60, bot - 80).trim(16, 16) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(17, 17) +\
     v1.crop(left + 60, top - 30, right + 60, bot - 30).trim(18, 18) +\
     v1.crop(left + 60, top - 20, right + 60, bot - 20).trim(19, 23) +\
     v1.crop(left + 60, top - 30, right + 60, bot - 30).trim(24, 27) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(28, 28) +\
     v1.crop(left + 60, top - 30, right + 60, bot - 30).trim(29, 35) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(36, 40) +\
     v1.crop(left + 60, top - 20, right + 60, bot - 20).trim(41, 46) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(47, 49) +\
     v1.crop(left + 60, top - 20, right + 60, bot - 20).trim(50, 56) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(57, 66) +\
     v1.crop(left + 60, top - 50, right + 60, bot - 50).trim(67, 67) +\
     v1.crop(left + 60, top - 60, right + 60, bot - 60).trim(68, 69) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(70, 82) +\
     v1.crop(left + 60, top - 50, right + 60, bot - 50).trim(83, 98) +\
     v1.crop(left + 60, top - 40, right + 60, bot - 40).trim(99, 100) +\
     v1.crop(left + 60, top - 30, right + 60, bot - 30).trim(101, 101) +\
     v1.crop(left + 60, top - 00, right + 60, bot - 00).trim(102, 110) +\
     v1.crop(left + 60, top + 10, right + 60, bot + 10).trim(111, 112) +\
     v1.crop(left + 60, top + 20, right + 60, bot + 20).trim(113, 116) +\
     v1.crop(left + 60, top + 10, right + 60, bot + 10).trim(117, 0)

v1 = v1.correct_left_side(width = 400).correct_left_side(width = 200).trim(0, 30) +\
     v1.trim(31, 0)

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v2 = full.trim(17877, 17941)
v2 = v2.crop(left + 60, top - 0, right + 60, bot - 0)
v2 = v2.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v2.trim(3, 0)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v3 = full.trim(17942, 18098)
v3 = v3.crop(left + 60, top - 0, right + 60, bot - 0)
v3 = v3.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v3.trim(3, 0)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v4 = full.trim(18099, 18302)
v4 = v4.crop(left + 50, top - 0, right + 50, bot - 0)
v4 = v4.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v4.trim(3, 0)

left = lo
top = to
right = ro
bot = bo

v5 = full.trim(18303, 18428)
v5 = v5.crop(left + 50, top + 10, right + 50, bot + 10)
v5 = v5.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v5.trim(3, 0)

v6 = full.trim(18429, 18541)
v6 = v6.crop(left + 50, top + 10, right + 50, bot + 10)
v6 = v6.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v6.trim(3, 0)

v7 = full.trim(18542, 18604)
v7 = v7.crop(left + 40, top + 10, right + 40, bot + 10)
v7 = v7.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v7.trim(3, 0)

v8 = full.trim(18605, 18698)
v8 = v8.crop(left + 40, top + 20, right + 40, bot + 20)
v8 = v8.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v8.trim(3, 0)

v9 = full.trim(18699, 18826)
v9 = v9.crop(left + 40, top + 0, right + 40, bot + 0)
v9 = v9.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v9.trim(3, 0)

v10 = full.trim(18827, 19000)
v10 = v10.crop(left + 40, top + 0, right + 40, bot + 0)
v10 = v10.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v10.trim(3, 0)

v11 = full.trim(19001, 19212)
v11 = v11.crop(left + 40, top + 0, right + 40, bot + 0)
v11 = v11.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v11.trim(3, 0)

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v12 = full.trim(19213, 19599)
v12 = v12.crop(left + 40, top + 0, right + 40, bot + 0)
v12 = v12.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v12.trim(3, 0)

left = lo
top = to
right = ro
bot = bo

v13 = full.trim(19600, 19803)
v13 = v13.crop(left + 40, top + 0, right + 40, bot + 0)
v13 = v13.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v13.trim(3, 0)
v13 = v13.trim(0, 160) +\
      v13.correct_left_side(width = 800).correct_left_side(width = 400).correct_left_side(width = 200).trim(161, 0)
#return v13

v14 = full.trim(19804, 20019)
v14 = v14.crop(left + 40, top + 20, right + 40, bot + 20)

v15 = full.trim(20020, 20190)
v15 = v15.crop(left + 40, top + 20, right + 40, bot + 20)
v15 = v15.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v15.trim(3, 0)

v16 = full.trim(20191, 20391)
v16 = v16.crop(left + 40, top + 20, right + 40, bot + 20)
v16 = v16.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v16.trim(3, 0)

v17 = full.trim(20392, 20592)
v17 = v17.crop(left + 40, top + 0, right + 40, bot + 0)
v17 = v17.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v17.trim(3, 0)

v18 = full.trim(20593, 20707)
v18 = v18.crop(left + 40, top + 0, right + 40, bot + 0)
v18 = v18.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v18.trim(3, 0)

v19 = full.trim(20708, 20820)
v19 = v19.crop(left + 40, top + 0, right + 40, bot + 0)
v19 = v19.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v19.trim(3, 0)

v20 = full.trim(20821, 20936)
v20 = v20.crop(left + 40, top + 0, right + 40, bot + 0)
v20 = v20.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v20.trim(3, 0)

v21 = full.trim(20937, 21103)
v21_164 = v21.trim(164, -1).crop(0, 1140, 0, 0).stackVertical(v21.trim(164, -1).crop(0, 100, -0, 1240 - v21.height).addBorders(0, 0, 0, 0))
v21 = v21.trim(0, 163) + v21_164 + v21.trim(165, 0)
v21 = v21.crop(left + 40, top + 0, right + 40, bot + 0).trim(0, 138) +\
      v21.crop(left + 40, top - 20, right + 40, bot - 20).trim(139, 162) +\
      v21.crop(left + 40, top - 60, right + 40, bot - 60).trim(163, -1) +\
      v21.crop(left + 40, top - 20, right + 40, bot - 20).trim(164, 0)
v21 = v21.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v21.trim(3, 0)

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v22 = full.trim(21104, 21290)
v22 = v22.crop(left + 40, top + 0, right + 40, bot + 0).trim(0, 112) +\
      v22.crop(left + 40, top + 30, right + 40, bot + 30).trim(113, -1) +\
      v22.crop(left + 40, top + 50, right + 40, bot + 50).trim(114, -1) +\
      v22.crop(left + 40, top + 40, right + 40, bot + 40).trim(115, 116) +\
      v22.crop(left + 40, top + 30, right + 40, bot + 30).trim(117, -1) +\
      v22.crop(left + 40, top + 10, right + 40, bot + 10).trim(118, 0)

v22 = v22.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v22.trim(3, 0)
v22 = v22.trim(0, 154) +\
      v22.correct_left_side(width = 400).correct_left_side(width = 200).trim(155, 0)

left = lo
top = to
right = ro
bot = bo
*/
left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v23 = full.trim(21291, 21333)
v23 = v23.crop(left + 40, top - 10, right + 40, bot - 10)

v23 = v23.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v23.trim(3, 0)
#return v23.adjustBorders.autolevels(filterRadius=0).hist_levels.prefetch
/*
v23 = v23.trim(0, 154) +\
      v23.correct_left_side(width = 400).correct_left_side(width = 200).trim(155, 0)
#v23_angle = 0.
#v23 = v23.rotate(-v23_angle)
*/
#va = BlankClip(v23, audio_rate = 48000, channels = 2).killVideo
v23 = v23#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

#global filter16 = true

import("..\common.avs")

/*

#******

# 1

v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
b_ex = undefined
v1 = v1.AdjustColor(ou = +6, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v1 = v1.colorYUV(off_u = -2, off_v = +2)
v1 = v1.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate

v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
b_ex = undefined
v2 = v2.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
b_ex = undefined
v3 = v3.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v3 = v3.colorYUV(off_u = -2, off_v = +2)
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.1)
v3 = v3.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate

v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
b_ex = undefined
v4 = v4.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate

v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").ConvertToYV24()
b_ex = undefined
v5 = v5.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
v5 = v5.add_blank_audio
return v5.prefetch
#adjustframerate

v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
b_ex = undefined
v6 = v6.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate

v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").ConvertToYV24()
b_ex = undefined
v7 = v7.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v7 = v7.colorYUV(off_u = -2, off_v = +2)
v7 = v7.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.1)
v7 = v7.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
v7 = v7.add_blank_audio
return v7.prefetch
#adjustframerate

v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
b_ex = undefined
v8 = v8.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v8 = v8.colorYUV(off_u = -2, off_v = +2)
v8 = v8.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.1)
v8 = v8.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate

v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
b_ex = undefined
v9 = v9.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v9 = v9.colorYUV(off_u = -2, off_v = +2)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate

v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
b_ex = undefined
v10 = v10.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v10 = v10.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate

v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
b_ex = undefined
v11 = v11.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v11 = v11.colorYUV(off_u = -4, off_v = +4)
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate

v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 240
v12 = v12.trim(159, -1).loop(v12.frameCount).crop(0, 0, 0, add_height - v12.height).stackVertical(v12)
v12 = v12.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v12 = v12.colorYUV(off_u = -4, off_v = +4)
v12 = v12.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v12 = v12.crop(0, add_height, 0, 0)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v13 = v13.trim(129, -1).loop(v13.frameCount).crop(0, 0, 0, add_height - v13.height).stackVertical(v13)
v13 = v13.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v13 = v13.colorYUV(off_u = -4, off_v = +4)
v13 = v13.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v13 = v13.crop(0, add_height, 0, 0)
#return v13.hist_levels.prefetch
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate

v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").ConvertToYV24()
b_ex = undefined
v14 = v14.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v14 = v14.colorYUV(off_u = -2, off_v = +2)
v14 = v14.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
v14 = v14.add_blank_audio
return v14.prefetch
#adjustframerate

v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v15 = v15.trim(18, -1).loop(v15.frameCount).crop(0, 0, 0, add_height - v15.height).stackVertical(v15)
v15 = v15.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v15 = v15.colorYUV(off_u = -2, off_v = +2)
v15 = v15.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v15 = v15.crop(0, add_height, 0, 0)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
b_ex = undefined
v16 = v16.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v16 = v16.colorYUV(off_u = -4, off_v = +4)
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate

v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v17 = v17.trim(120, -1).loop(v17.frameCount).crop(0, 0, 0, add_height - v17.height).stackVertical(v17)
v17 = v17.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v17 = v17.colorYUV(off_u = -4, off_v = +4)
v17 = v17.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.2)
v17 = v17.crop(0, add_height, 0, 0)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate

v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
b_ex = undefined
v18 = v18.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v18 = v18.colorYUV(off_u = -4, off_v = +4)
v18 = v18.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.1)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate

v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 400
v19 = v19.trim(1, -1).loop(v19.frameCount).crop(0, 0, 0, add_height - v19.height).stackVertical(v19)
v19 = v19.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v19 = v19.colorYUV(off_u = -2, off_v = +2)
v19 = v19.crop(0, add_height, 0, 0)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate

v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
b_ex = undefined
v20 = v20.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate

v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").ConvertToYV24()
b_ex = undefined
v21 = v21.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
v21 = v21.add_blank_audio
return v21.prefetch
#adjustframerate

v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
b_ex = undefined
v22 = v22.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate

v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
#v23 = v23.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v23 = v23.trim(1, -1).loop(v23.frameCount).crop(0, 0, 0, add_height - v23.height).stackVertical(v23)
#return v23.histogram.prefetch
v23 = v23.AdjustColor(ou = +14, ov = -14, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v23 = v23.colorYUV(off_u = -4, off_v = +4)
#v23 = v23.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003)
#v23 = v23.crop(0, add_height, 0, 0)
#v23 = v23.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#return v23.hist_levels.prefetch
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate

#******
*/
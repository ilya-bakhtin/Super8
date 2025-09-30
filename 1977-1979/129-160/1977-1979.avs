SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

v0 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\11214 Bakhtin 02 S8.720p.mov")
v0 = v0.assumefps(18)
#return v0

v1 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\1 cast.Res2K43.Aspect43In43.Speed18Fps.mov")
v1 = v1.assumefps(18)
v2 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\2 cast.Res2K43.Aspect43In43.Speed18Fps.mov")
v2 = v2.assumefps(18)
v1 = v1.trim(0, v1.frameCount - 2) + v2.trim(108, 0)

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

# 69,   139,   174,  213,  237,  300,  320,  366,  387,  425,  455,  476,  616,  669,  969,  984, 1227, 1335, 1377, 1464, #20 
#skip (2478, 2482)
# 1678, 1790, 1936, 2011, 2090, 2133, 2157, 2223, 2276, 2295, 2312, 2368, 2430, 2478, 2483, 2540, 2607, 2635, 2703, 2748, #40
#skip (3387, 3398)
# 2777, 2846, 2861, 2938, 2952, 2964, 3025, 3109, 3163, 3200, 3240, 3272, 3296, 3313, 3322, 3349, 3387, 3399, 3543, 3561, #60
# 3570, 3853, 3870, 3878, 3889, 4215, 4227, 4240, 4245, 4364, 4379, 4401, 4525, 4604, 4611, 4714, 4774, 4807, 4838, 4873, #80
# 4889, 4901, 4909, 4916, 4920, 4924, 4931, 4951, 4961, 4968, 4971, 4989, 5023, 5032, 5075, 5092, 5116, 5136, 5148, 5153, #100
# 5160, 5248, 5368, 5399, 5411, 5445, 5468, 5477, 5500, 5539, 5573, 5589, 5691, 5722, 5770, 5785, 5825, 5851, 5860, 5911, #120
# 5937, 5961, 5987, 6049, 6200, 6305, 6369, 6396, 6429, 6484, 6544, 6577, 6613, 6680, 6798, 6892, 7033, 7120, 7330, 7391, #140
# 7522, 7566, 7589, 7614, 7673, 7722, 7771, 7793, 7829, 7976, 8033, 8047, 8155, 8270, 8280, 8312, 8349, 8377, 8395, 8435, #160
# 8443, 8452, 8478, 8502, 8516, 8531, 8564, 8582, 8614, 8619, 8625, 8640, 8653, 8720, 8746, 8792, 8798, 8834, 8887, 8936, #180

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


function deScratchMask(clip c, string "mask_file", int "x", int "dw_l", int "dh_t", bool "do_crop")
{
    x = default(x, 340)
    mask_file = default(mask_file, "..\mask1.png")
    dw_l = default(dw_l, 0)
    dh_t = default(dh_t, 0)
    do_crop = default(do_crop, true)

    mask = imageSource(mask_file, end = c.frameCount - 1, fps = 18).convertToYV24
    mask = mask.levels(16, 1, 235, 0, 255, coring=false)
    mask = mask.crop(dw_l, dh_t, 0, 0)

    b = c.crop(x, 0, mask.width, mask.height).extractY.convertToYV24
    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    if (do_crop)
    {
          b_r = b.crop(730, 0, 0, 0)
          b = b.crop(0, 0, 730, 0)
    }
    b = b.turnLeft
    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    b = b.turnRight
    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    b = b.turnLeft
    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    b = b.turnRight
    b = b.colorYUV(off_y = -4)
    if (do_crop)
    {
          b = b.stackHorizontal(b_r)
    }
    c = c.deScratchBlock(in_mask = mask, in_block = b, x = x, w = mask.width, h = mask.height, blurlen = 6, maxangle = 45., slope = false)

    return c
}

function deScratchMask2(clip c, string "mask_file", int "x", int "maxwidth", int "blurlen")
{
    x = default(x, 1390)
    mask_file = default(mask_file, "..\mask7.png")
    maxwidth = default(maxwidth, 15)
    blurlen = default(blurlen, 6)

    mask = imageSource(mask_file, end = c.frameCount - 1, fps = 18).convertToYV24
    mask = mask.levels(16, 1, 235, 0, 255, coring=false)

    b = c.crop(x, c.height - mask.height, mask.width, mask.height).extractY.convertToYV24

    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    b = b.turnRight
    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    b = b.turnLeft
    b = b.colorYUV(off_y = -2)
    c = c.deScratchBlock(in_mask = mask, in_block = b, x = x, w = mask.width, y = c.height - mask.height, h = mask.height, blurlen = 6, maxangle = 45., slope = false)

    return c
}

function solid_mask(clip c, int "x", int "r", int "fx", float "fy")
{
    x = default(x, c.width / 2)
    r = default(r, 40)
    fx = default(fx, 1)
    fy = default(fy, 0)

    x_s = Format("{}", x)
    r_s = Format("{}", r)
    fx_s = Format("{}", fx)
    fy_s = Format("{}", fy)

#    exp = "sx x - dup x^ sy fy * - dup * fx * sy sy * + r r * < 255 0 ?"
#                      1          1 
    exp = x_s + " mx^ " + r_s + " rr^ sx mx - sy " + fy_s + " * - dup * " + fx_s + " * sy sy * + rr rr * < 255 0 ?"
    return c.trim(0, -1).extractY.expr(exp).convertToYV24
}

/*
v129 = full.trim(6484, 6543)
v129 = v129.crop(left + 70, top + 10, right + 70, bot + 10)
v129 = v129.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v129.trim(2, 0)
v129 = v129.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
#return v129.histogram.prefetch
#return v129.colorYUV(gain_y = 80).hist_levels.prefetch

v130 = full.trim(6544, 6576)
v130 = v130.crop(left + 70, top + 10, right + 70, bot + 10)
v130 = v130.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v130.trim(2, 0)
v130 = v130.trim(0, 2).colorYUV(gain_y = -20) +\
       v130.trim(3, 0)
v130 = v130.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
#return v130.histogram.prefetch
#return v130.colorYUV(gain_y = 80).hist_levels.prefetch

v131 = full.trim(6577, 6612)
v131 = v131.crop(left + 70, top + 10, right + 70, bot + 10)
v131 = v131.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v131.trim(2, 0)
v131 = v131.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
#return v131.histogram.prefetch
#return v131.colorYUV(gain_y = 80).hist_levels.prefetch

v132 = full.trim(6613, 6679)
v132 = v132.crop(left + 70, top - 20, right + 70, bot - 20)
#v132.trim(0, -1).autolevels(ignore_high = 0.0003).colorYUV(off_y = -40, gain_y = -40) +
v132 = \
       v132.trim(1, -1).colorYUV(gain_y = -88) +\
       v132.trim(2, -1).colorYUV(gain_y = -70) +\
       v132.trim(3, -1).colorYUV(gain_y = -48) +\
       v132.trim(4, -1).colorYUV(gain_y = -36) +\
       v132.trim(5, -1).colorYUV(gain_y = -32) +\
       v132.trim(6, -1).colorYUV(gain_y = -24) +\
       v132.trim(7, -1).colorYUV(gain_y = -18) +\
       v132.trim(8, -1).colorYUV(gain_y = -8) +\
       v132.trim(9, 10).colorYUV(gain_y = -6) +\
       v132.trim(11, -1).colorYUV(gain_y = -4) +\
       v132.trim(12, 0)
v132 = v132.assumeFPS(24)
#return v132.histogram.prefetch
#return v132.colorYUV(gain_y = 80).hist_levels.prefetch

v133 = full.trim(6680, 6797)
v0o = v0
v0 = v0.trim(6797, -1)
v0 = v0.crop(160, 4, -160, -4)
v0 = v0.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 255, autolevel = false)
v0 = v0.colorYUV(off_u = 4, off_v = -4)
v133 = v133.trim(0, 91).crop(left + 70, top - 20, right + 70, bot - 20) +\
       v133.trim(92, 94).crop(left + 70, top - 30, right + 70, bot - 30) +\
       v133.trim(95, -1).crop(left + 70, top - 60, right + 70, bot - 60) +\
       v133.trim(96, 97).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v133.trim(98, 113).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v133.trim(114, -1).crop(left + 70, top - 90, right + 70, bot - 90) +\
       v133.trim(115, 0).crop(left + 70, top - 40, right + 70, bot - 40)
v133 = v133.trim(0, 96) +\
       v133.trim(97, -1).spline64Resize(v133.width, v133.height, 0, -80, v133.width, v133.height) +\
       v133.trim(98, 0)
v0 = v0.spline64resize(v133.width, v133.height, -30, -10, v0.width + 70, v0.height + 20)
v133 = v133.trim(0, 96) + v0 + v133.trim(97, 0)
v133 = v133.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v133.trim(2, 0)
v133 = v133.assumeFPS(16)
v0 = v0o
#return v133.histogram.prefetch
#return v133.colorYUV(gain_y = 80).hist_levels.prefetch

v134 = full.trim(6798, 6891)
v134 = v134.trim(0, 2).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v134.trim(3, -1).crop(left + 70, top - 50, right + 70, bot - 50) +\
       v134.trim(4, -1).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v134.trim(5, 10).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v134.trim(11, -1).crop(left + 70, top - 60, right + 70, bot - 60) +\
       v134.trim(12, 13).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v134.trim(14, 15).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v134.trim(16, -1).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v134.trim(17, -1).crop(left + 70, top - 50, right + 70, bot - 50) +\
       v134.trim(18, 23).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v134.trim(24, 25).crop(left + 70, top - 70, right + 70, bot - 70) +\
       v134.trim(26, 66).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v134.trim(67, 69).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v134.trim(70, -1).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v134.trim(71, 0).crop(left + 70, top - 40, right + 70, bot - 40)
v134 = v134.trim(0, 3) +\
       v134.trim(4, -1).spline64Resize(v134.width, v134.height, 0, -60, v134.width, v134.height) +\
       v134.trim(5, 13) +\
       v134.trim(14, 15).spline64Resize(v134.width, v134.height, 0, -30, v134.width, v134.height) +\
       v134.trim(16, 66) +\
       v134.trim(67, -1).spline64Resize(v134.width, v134.height, 0, -50, v134.width, v134.height) +\
       v134.trim(68, -1).spline64Resize(v134.width, v134.height, 0, -98, v134.width, v134.height) +\
       v134.trim(69, -1).spline64Resize(v134.width, v134.height, 0, -60, v134.width, v134.height) +\
       v134.trim(70, 0)
v134 = v134.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v134 = v134.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v134.trim(2, 0)
v134 = v134.assumeFPS(18)
#return v134.histogram.prefetch
#return v134.colorYUV(gain_y = 80).hist_levels.prefetch

v135 = full.trim(6892, 7032)
v135 = v135.trim(0, -1).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v135.trim(1, -1).crop(left + 70, top - 70, right + 70, bot - 70) +\
       v135.trim(2, -1).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v135.trim(3, -1).crop(left + 70, top - 50, right + 70, bot - 50) +\
       v135.trim(4, -1).crop(left + 70, top - 70, right + 70, bot - 70) +\
       v135.trim(5, -1).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v135.trim(6, -1).crop(left + 70, top - 70, right + 70, bot - 70) +\
       v135.trim(7, -1).crop(left + 70, top - 84, right + 70, bot - 84) +\
       v135.trim(8, 12).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v135.trim(13, -1).crop(left + 70, top - 80, right + 70, bot - 80) +\
       v135.trim(14, -1).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v135.trim(15, -1).crop(left + 70, top - 60, right + 70, bot - 60) +\
       v135.trim(16, -1).crop(left + 70, top - 50, right + 70, bot - 50) +\
       v135.trim(17, 21).crop(left + 70, top - 40, right + 70, bot - 40) +\
       v135.trim(22, -1).crop(left + 70, top - 90, right + 70, bot - 90) +\
       v135.trim(23, -1).crop(left + 70, top - 60, right + 70, bot - 60) +\
       v135.trim(24, -1).crop(left + 70, top - 10, right + 70, bot - 10) +\
       v135.trim(25, 53).crop(left + 70, top - 0, right + 70, bot - 0) +\
       v135.trim(54, -1).crop(left + 70, top - 10, right + 70, bot - 10) +\
       v135.trim(55, -1).crop(left + 70, top - 20, right + 70, bot - 20) +\
       v135.trim(56, 70).crop(left + 70, top - 0, right + 70, bot - 0) +\
       v135.trim(71, -1).crop(left + 70, top + 10, right + 70, bot + 10) +\
       v135.trim(72, -1).crop(left + 70, top + 20, right + 70, bot + 20) +\
       v135.trim(73, -1).crop(left + 70, top + 10, right + 70, bot + 10) +\
       v135.trim(74, -1).crop(left + 70, top + 30, right + 70, bot + 30) +\
       v135.trim(75, -1).crop(left + 70, top - 0, right + 70, bot - 0) +\
       v135.trim(76, -1).crop(left + 70, top - 70, right + 70, bot - 70) +\
       v135.trim(77, 78).crop(left + 70, top - 94, right + 70, bot - 94) +\
       v135.trim(79, 80).crop(left + 70, top - 60, right + 70, bot - 60) +\
       v135.trim(81, -1).crop(left + 70, top - 20, right + 70, bot - 20) +\
       v135.trim(82, 83).crop(left + 70, top - 0, right + 70, bot - 0) +\
       v135.trim(84, 87).crop(left + 70, top - 20, right + 70, bot - 20) +\
       v135.trim(88, 89).crop(left + 70, top - 0, right + 70, bot - 0) +\
       v135.trim(90, 119).crop(left + 70, top - 20, right + 70, bot - 20) +\
       v135.trim(120, 129).crop(left + 70, top + 10, right + 70, bot + 10) +\
       v135.trim(130, -1).crop(left + 70, top + 10, right + 70, bot + 10) +\
       v135.trim(131, -1).crop(left + 70, top + 30, right + 70, bot + 30) +\
       v135.trim(132, -1).crop(left + 70, top + 20, right + 70, bot + 20) +\
       v135.trim(133, 0).crop(left + 70, top - 0, right + 70, bot - 0)
v135 = v135.trim(0, 1) +\
       v135.trim(2, -1).spline64Resize(v135.width, v135.height, 0, -40, v135.width, v135.height) +\
       v135.trim(3, 4) +\
       v135.trim(5, -1).spline64Resize(v135.width, v135.height, 0, -50, v135.width, v135.height) +\
       v135.trim(6, 7) +\
       v135.trim(8, 11).spline64Resize(v135.width, v135.height, 0, -30, v135.width, v135.height) +\
       v135.trim(12, 76) +\
       v135.trim(77, -1).spline64Resize(v135.width, v135.height, 0, -10, v135.width, v135.height) +\
       v135.trim(78, -1).spline64Resize(v135.width, v135.height, 0, -30, v135.width, v135.height) +\
       v135.trim(79, 0)
#v135 = v135.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v135.trim(2, 0)
v135 = v135.trim(0, -1).colorYUV(gain_y = -50) +\
       v135.trim(1, -1).colorYUV(gain_y = -20) +\
       v135.trim(2, -1).colorYUV(gain_y = -20) +\
       v135.trim(3, -1).colorYUV(gain_y = -10) +\
       v135.trim(4, 0)
v135 = v135.trim(0, v135.frameCount - 3) +\
       v135.trim(v135.frameCount - 2, 0).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false)
v135 = v135.assumeFPS(12)
#return v135.histogram.prefetch
#return v135.colorYUV(gain_y = 80).hist_levels.prefetch

v136 = full.trim(7033, 7119)
v136 = v136.crop(left + 60, top + 10, right + 60, bot + 10)
#v136 = v136.trim(0, 4).deflickOverlapped(step = 100, radius = 4, toward_darkest = true, right2left = false) +\
#       v136.trim(5, 0)
v136 = v136.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v136.trim(5, 0)
v136 = v136.assumeFPS(12)
#return v136.histogram.prefetch
#return v136.colorYUV(gain_y = 80).hist_levels.prefetch

v137 = full.trim(7120, 7329)
v137 = v137.crop(left + 60, top + 10, right + 60, bot + 10)
v137 = v137.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v137.trim(2, 0)
#v137 = v137.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v137.trim(5, 0)
v137 = v137.assumeFPS(16)
#return v137.histogram.prefetch
#return v137.colorYUV(gain_y = 80).hist_levels.prefetch

v138 = full.trim(7330, 7390)
v138 = v138.crop(left + 60, top + 10, right + 60, bot + 10)
v138 = v138.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v138.trim(2, 0)
#v138 = v138.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v138.trim(5, 0)
v138 = v138.assumeFPS(16)
#return v138.histogram.prefetch
#return v138.colorYUV(gain_y = 80).hist_levels.prefetch

v139 = full.trim(7391, 7521)
v139 = v139.crop(left + 60, top + 10, right + 60, bot + 10)
v139 = v139.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v139 = v139.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v139.trim(2, 0)
#v139 = v139.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v139.trim(5, 0)
v139 = v139.assumeFPS(16)
#return v139.histogram.prefetch
#return v139.colorYUV(gain_y = 80).hist_levels.prefetch

v140 = full.trim(7522, 7565)
v140 = v140.crop(left + 60, top + 10, right + 60, bot + 10)
#v140 = v140.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v140 = v140.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v140.trim(2, 0)
#v140 = v140.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v140.trim(5, 0)
#v140 = v140.assumeFPS(16)
#return v140.histogram.prefetch
#return v140.colorYUV(gain_y = 80).hist_levels.prefetch

v141 = full.trim(7566, 7588)
v141 = v141.crop(left + 60, top + 10, right + 60, bot + 10)
#v141 = v141.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v141 = v141.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v141.trim(2, 0)
#v141 = v141.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v141.trim(5, 0)
#v141 = v141.assumeFPS(16)
#return v141.histogram.prefetch
#return v141.colorYUV(gain_y = 80).hist_levels.prefetch

v142 = full.trim(7589, 7613)
v142 = v142.crop(left + 60, top + 10, right + 60, bot + 10)
#v142 = v142.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v142 = v142.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v142.trim(2, 0)
#v142 = v142.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v142.trim(5, 0)
#v142 = v142.assumeFPS(16)
#return v142.histogram.prefetch
#return v142.colorYUV(gain_y = 80).hist_levels.prefetch

v143 = full.trim(7614, 7672)
v143 = v143.crop(left + 60, top + 10, right + 60, bot + 10)
#v143 = v143.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v143 = v143.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v143.trim(2, 0)
v143 = v143.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v143.trim(4, 0)
#v143 = v143.assumeFPS(16)
#return v143.histogram.prefetch
#return v143.colorYUV(gain_y = 80).hist_levels.prefetch

v144 = full.trim(7673, 7721)
v144 = v144.crop(left + 60, top + 10, right + 60, bot + 10)
#v144 = v144.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v144 = v144.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v144.trim(2, 0)
#v144 = v144.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v144.trim(4, 0)
#v144 = v144.assumeFPS(16)
#return v144.histogram.prefetch
#return v144.colorYUV(gain_y = 80).hist_levels.prefetch

v145 = full.trim(7722, 7770)
v145 = v145.crop(left + 60, top + 10, right + 60, bot + 10)
#v145 = v145.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v145 = v145.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v145.trim(2, 0)
#v145 = v145.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v145.trim(4, 0)
#v145 = v145.assumeFPS(16)
#return v145.histogram.prefetch
#return v145.colorYUV(gain_y = 80).hist_levels.prefetch

v146 = full.trim(7771, 7792)
v146 = v146.crop(left + 60, top + 10, right + 60, bot + 10)
#v146 = v146.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v146 = v146.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v146.trim(2, 0)
#v146 = v146.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v146.trim(4, 0)
#v146 = v146.assumeFPS(16)
#return v146.histogram.prefetch
#return v146.colorYUV(gain_y = 80).hist_levels.prefetch

v147 = full.trim(7793, 7828)
v147 = v147.crop(left + 60, top + 10, right + 60, bot + 10)
#v147 = v147.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v147 = v147.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v147.trim(2, 0)
v147 = v147.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v147.trim(4, 0)
#v147 = v147.assumeFPS(16)
#return v147.histogram.prefetch
#return v147.colorYUV(gain_y = 80).hist_levels.prefetch

v148 = full.trim(7829, 7975)
v148 = v148.crop(left + 60, top + 10, right + 60, bot + 10)
#v148 = v148.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v148 = v148.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v148.trim(2, 0)
v148 = v148.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v148.trim(4, 0)
#v148 = v148.assumeFPS(16)
#return v148.histogram.prefetch
#return v148.colorYUV(gain_y = 80).hist_levels.prefetch

v149 = full.trim(7976, 8032)
v149 = v149.crop(left + 60, top + 10, right + 60, bot + 10)
#v149 = v149.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v149 = v149.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v149.trim(2, 0)
v149 = v149.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v149.trim(4, 0)
#v149 = v149.assumeFPS(16)
#return v149.histogram.prefetch
#return v149.colorYUV(gain_y = 80).hist_levels.prefetch

v150 = full.trim(8033, 8046)
v150 = v150.crop(left + 60, top + 10, right + 60, bot + 10)
#v150 = v150.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v150 = v150.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v150.trim(2, 0)
#v150 = v150.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v150.trim(4, 0)
#v150 = v150.assumeFPS(16)
#return v150.histogram.prefetch
#return v150.colorYUV(gain_y = 80).hist_levels.prefetch

v151 = full.trim(8048, 8154)
v151 = v151.crop(left + 60, top + 10, right + 60, bot + 10)
#v151 = v151.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v151 = v151.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v151.trim(2, 0)
v151 = v151.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v151.trim(3, 0)
#v151 = v151.assumeFPS(16)
#return v151.histogram.prefetch
#return v151.colorYUV(gain_y = 80).hist_levels.prefetch

v152 = full.trim(8155, 8269)
v152 = v152.crop(left + 60, top + 10, right + 60, bot + 10)
#v152 = v152.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v152 = v152.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v152.trim(2, 0)
v152 = v152.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v152.trim(3, 0)
#v152 = v152.assumeFPS(16)
#return v152.histogram.prefetch
#return v152.colorYUV(gain_y = 80).hist_levels.prefetch

v153 = full.trim(8270, 8279)
v153 = v153.crop(left + 60, top + 10, right + 60, bot + 10)
#v153 = v153.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v153 = v153.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v153.trim(2, 0)
v153 = v153.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v153.trim(3, 0)
#v153 = v153.assumeFPS(16)
#return v153.histogram.prefetch
#return v153.colorYUV(gain_y = 80).hist_levels.prefetch

v154 = full.trim(8280, 8311)
v154 = v154.crop(left + 60, top + 10, right + 60, bot + 10)
#v154 = v154.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v154 = v154.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v154.trim(2, 0)
#v154 = v154.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v154.trim(3, 0)
#v154 = v154.assumeFPS(16)
#return v154.histogram.prefetch
#return v154.colorYUV(gain_y = 80).hist_levels.prefetch

v155 = full.trim(8312, 8348)
v155 = v155.crop(left + 60, top + 10, right + 60, bot + 10)
#v155 = v155.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v155 = v155.trim(0, -1).colorYUV(gain_Y = -40) +\
#       v155.trim(1, 0)
#v155 = v155.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v155.trim(2, 0)
#v155 = v155.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v155.trim(3, 0)
#v155 = v155.assumeFPS(16)
#return v155.histogram.prefetch
#return v155.colorYUV(gain_y = 80).hist_levels.prefetch

v156 = full.trim(8349, 8376)
v156 = v156.crop(left + 60, top + 10, right + 60, bot + 10)
#v156 = v156.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v156 = v156.trim(0, -1).colorYUV(gain_Y = -40) +\
#       v156.trim(1, 0)
v156 = v156.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v156.trim(2, 0)
#v156 = v156.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v156.trim(3, 0)
#v156 = v156.assumeFPS(16)
#return v156.histogram.prefetch
#return v156.colorYUV(gain_y = 80).hist_levels.prefetch

v157 = full.trim(8377, 8394)
v157 = v157.crop(left + 60, top + 10, right + 60, bot + 10)
#v157 = v157.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v157 = v157.trim(0, -1).colorYUV(gain_Y = -40) +\
#       v157.trim(1, 0)
v157 = v157.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v157.trim(2, 0)
#v157 = v157.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v157.trim(3, 0)
#v157 = v157.assumeFPS(16)
#return v157.histogram.prefetch
#return v157.colorYUV(gain_y = 80).hist_levels.prefetch

v158 = full.trim(8395, 8434)
v158 = v158.crop(left + 60, top + 10, right + 60, bot + 10)
#v158 = v158.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v158 = v158.trim(0, -1).colorYUV(gain_Y = -40) +\
#       v158.trim(1, 0)
#v158 = v158.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v158.trim(2, 0)
#v158 = v158.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v158.trim(3, 0)
#v158 = v158.assumeFPS(16)
#return v158.histogram.prefetch
#return v158.colorYUV(gain_y = 80).hist_levels.prefetch
*/
v159 = full.trim(8435, 8442)
v159 = v159.crop(left + 60, top + 10, right + 60, bot + 10)
#v159 = v159.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v159 = v159.trim(0, -1).colorYUV(gain_Y = -40) +\
#       v159.trim(1, 0)
#v159 = v159.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v159.trim(2, 0)
v159 = v159.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v159.trim(3, 0)
#v159 = v159.assumeFPS(16)
#return v159.histogram.prefetch
#return v159.colorYUV(gain_y = 80).hist_levels.prefetch

v160 = full.trim(8443, 8451)
v160 = v160.crop(left + 60, top + 10, right + 60, bot + 10)
#v160 = v160.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v160 = v160.trim(0, -1).colorYUV(off_Y = -10, gain_Y = +10) +\
#       v160.trim(1, 0).colorYUV(gain_Y = +20)
v160 = v160.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v160.trim(2, 0)
#v160 = v160.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v160.trim(3, 0)
#v160 = v160.assumeFPS(16)
#return v160.histogram.prefetch
#return v160.colorYUV(gain_y = 80).hist_levels.prefetch
/*
# 8443, 8452, 8478, 8502, 8516, 8531, 8564, 8582, 8614, 8619, 8625, 8640, 8653, 8720, 8746, 8792, 8798, 8834, 8887, 8936, #180
v161 = full.trim(8452, 8477)
v161 = v161.crop(left + 60, top + 10, right + 60, bot + 10)
#v161 = v161.autolevels(input_low = 14, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v161 = v161.trim(0, -1).colorYUV(gain_Y = -40) +\
#       v161.trim(1, 0)
v161 = v161.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v161.trim(2, 0)
#v161 = v161.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v161.trim(3, 0)
#v161 = v161.assumeFPS(16)
#return v161.histogram.prefetch
#return v161.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 129

v129 = LSMASHVideoSource(dst_dir + "v129f.mp4").ConvertToYV24()
b_ex = undefined
v129o = v129
v129 = v129.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 129. - 129. / * 129. * 129. +"
ex_v = "z" #ex_uv + "z 129. - 129. / * 129. * 129. +"
v129i = v129
v129 = expr(v129.extractY, v129.extractU, v129.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v129 = v129.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v129a = v129i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v129i.interleave(v129).hist_levels.prefetch
v129 = v129.adjustSize
v129 = v129.assumeFPS(18)
v129 = v129.add_blank_audio
return v129.prefetch
#adjustframerate

v130 = LSMASHVideoSource(dst_dir + "v130f.mp4").ConvertToYV24()
b_ex = undefined
v130o = v130
v130 = v130.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 130. - 130. / * 130. * 130. +"
ex_v = "z" #ex_uv + "z 130. - 130. / * 130. * 130. +"
v130i = v130
v130 = expr(v130.extractY, v130.extractU, v130.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v130 = v130.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v130a = v130i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v130i.interleave(v130).hist_levels.prefetch
v130 = v130.adjustSize
v130 = v130.assumeFPS(18)
v130 = v130.add_blank_audio
return v130.prefetch
#adjustframerate

v131 = LSMASHVideoSource(dst_dir + "v131f.mp4").ConvertToYV24()
b_ex = undefined
v131o = v131
v131 = v131.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 131. - 131. / * 131. * 131. +"
ex_v = "z" #ex_uv + "z 131. - 131. / * 131. * 131. +"
v131i = v131
v131 = expr(v131.extractY, v131.extractU, v131.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v131 = v131.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v131a = v131i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v131i.interleave(v131).hist_levels.prefetch
v131 = v131.adjustSize
v131 = v131.assumeFPS(18)
v131 = v131.add_blank_audio
return v131.prefetch
#adjustframerate

v132 = LSMASHVideoSource(dst_dir + "v132f.mp4").ConvertToYV24()
b_ex = undefined
v132o = v132
#return v132.histogram.prefetch
v132 = v132.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)#,\
#return v132.crop(500, 200, -400, -200).histogram.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.7 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 132. - 132. / * 132. * 132. +"
ex_v = "z" #ex_uv + "z 132. - 132. / * 132. * 132. +"
v132i = v132
v132 = expr(v132.extractY, v132.extractU, v132.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v132 = v132.autolevels(filterRadius=9, border_l = 10, border_r = 10, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v132 = v132.autolevels(autolevel = false, input_low = 0, output_low = 4, input_high = 255, output_high = 240)
v132a = v132i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v132 = v132.colorYUV(off_u = -2, off_v = -2)
#return v132.histogram.prefetch
#return v132i.interleave(v132).hist_levels.prefetch
v132 = v132.adjustSize
v132 = v132.assumeFPS(18)
v132 = v132.add_blank_audio
return v132.prefetch
#adjustframerate

v133 = LSMASHVideoSource(dst_dir + "v133f.mp4").ConvertToYV24()
b_ex = undefined
v133o = v133
#return v133.histogram.prefetch
v133 = v133.AdjustColor(ou = +8, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)#,\
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 133. - 133. / * 133. * 133. +"
ex_v = "z" #ex_uv + "z 133. - 133. / * 133. * 133. +"
v133i = v133
v133 = expr(v133.extractY, v133.extractU, v133.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v133 = v133.autolevels(filterRadius=9, minRng=0, ignore_low=0.009, ignore_high=0.0003, gamma=1.)
v133a = v133i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v133 = v133.colorYUV(off_u = -2, off_v = -2)
#return v133.hist_levels.prefetch
#return v133i.interleave(v133).hist_levels.prefetch
v133 = v133.adjustSize
v133 = v133.assumeFPS(18)
v133 = v133.add_blank_audio
return v133.prefetch
#adjustframerate

v134 = LSMASHVideoSource(dst_dir + "v134f.mp4").ConvertToYV24()
#v134 = v134.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v134o = v134
#return v134.histogram.prefetch
v134 = v134.AdjustColor(ou = +12, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)#,\
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 134. - 134. / * 134. * 134. +"
ex_v = "z" #ex_uv + "z 134. - 134. / * 134. * 134. +"
v134i = v134
v134 = expr(v134.extractY, v134.extractU, v134.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v134 = v134.autolevels(filterRadius=9, minRng=0, ignore_low=0.009, ignore_high=0.0003, gamma=1.)
v134a = v134i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v134 = v134.colorYUV(off_u = -2, off_v = -2)
#return v134i.interleave(v134).hist_levels.prefetch
v134 = v134.adjustSize
v134 = v134.assumeFPS(18)
v134 = v134.add_blank_audio
return v134.prefetch
#adjustframerate

v135 = LSMASHVideoSource(dst_dir + "v135f.mp4").ConvertToYV24()
b_ex = undefined
v135o = v135
v135 = v135.AdjustColor(ou = +4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 135. - 135. / * 135. * 135. +"
ex_v = "z" #ex_uv + "z 135. - 135. / * 135. * 135. +"
v135i = v135
v135 = expr(v135.extractY, v135.extractU, v135.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v135 = v135.autolevels(filterRadius=9, minRng=0, ignore_low=0.009, ignore_high=0.0003, gamma=1.)
v135a = v135i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v135 = v135.colorYUV(off_u = -2, off_v = -2)
#return v135i.interleave(v135).hist_levels.prefetch
v135 = v135.adjustSize
v135 = v135.assumeFPS(18)
v135 = v135.add_blank_audio
return v135.prefetch
#adjustframerate

v136 = LSMASHVideoSource(dst_dir + "v136f.mp4").ConvertToYV24()
b_ex = undefined
v136o = v136
v136 = v136.AdjustColor(ou = +4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 136. - 136. / * 136. * 136. +"
ex_v = "z" #ex_uv + "z 136. - 136. / * 136. * 136. +"
v136i = v136
v136 = expr(v136.extractY, v136.extractU, v136.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v136 = v136.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v136a = v136i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v136 = v136.colorYUV(off_u = -2, off_v = -2)
#return v136i.interleave(v136).hist_levels.prefetch
v136 = v136.adjustSize
v136 = v136.assumeFPS(18)
v136 = v136.add_blank_audio
return v136.prefetch
#adjustframerate

v137 = LSMASHVideoSource(dst_dir + "v137f.mp4").ConvertToYV24()
b_ex = undefined
#return v137.histogram.prefetch
v137o = v137
v137 = v137.AdjustColor(ou = +4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 137. - 137. / * 137. * 137. +"
ex_v = "z" #ex_uv + "z 137. - 137. / * 137. * 137. +"
v137i = v137
v137 = expr(v137.extractY, v137.extractU, v137.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v137 = v137.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v137a = v137i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v137 = v137.colorYUV(off_u = -2, off_v = -2)
#return v137i.interleave(v137).hist_levels.prefetch
v137 = v137.adjustSize
v137 = v137.assumeFPS(18)
v137 = v137.add_blank_audio
return v137.prefetch
#adjustframerate

v138 = LSMASHVideoSource(dst_dir + "v138f.mp4").ConvertToYV24()
b_ex = undefined
v138o = v138
v138 = v138.AdjustColor(ou = +4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 138. - 138. / * 138. * 138. +"
ex_v = "z" #ex_uv + "z 138. - 138. / * 138. * 138. +"
v138i = v138
v138 = expr(v138.extractY, v138.extractU, v138.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v138 = v138.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v138a = v138i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v138 = v138.colorYUV(off_u = -2, off_v = -2)
#return v138i.interleave(v138).hist_levels.prefetch
v138 = v138.adjustSize
v138 = v138.assumeFPS(18)
v138 = v138.add_blank_audio
return v138.prefetch
#adjustframerate

v139 = LSMASHVideoSource(dst_dir + "v139f.mp4").ConvertToYV24()
b_ex = undefined
v139o = v139
v139 = v139.AdjustColor(ou = +10, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 139. - 139. / * 139. * 139. +"
ex_v = "z" #ex_uv + "z 139. - 139. / * 139. * 139. +"
v139i = v139
v139 = expr(v139.extractY, v139.extractU, v139.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v139 = v139.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v139a = v139i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v139i.interleave(v139).hist_levels.prefetch
v139 = v139.adjustSize
v139 = v139.assumeFPS(18)
v139 = v139.add_blank_audio
return v139.prefetch
#adjustframerate

v140 = LSMASHVideoSource(dst_dir + "v140f.mp4").ConvertToYV24()
b_ex = undefined
v140o = v140
v140 = v140.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 140,140, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 140. - 140. / * 140. * 140. +"
ex_v = "z" #ex_uv + "z 140. - 140. / * 140. * 140. +"
v140i = v140
v140 = expr(v140.extractY, v140.extractU, v140.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v140 = v140.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v140a = v140i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v140i.interleave(v140).hist_levels.prefetch
v140 = v140.adjustSize
v140 = v140.assumeFPS(18)
v140 = v140.add_blank_audio
return v140.prefetch
#adjustframerate

v141 = LSMASHVideoSource(dst_dir + "v141f.mp4").ConvertToYV24()
b_ex = undefined
v141o = v141
v141 = v141.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 141,141, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 141. - 141. / * 141. * 141. +"
ex_v = "z" #ex_uv + "z 141. - 141. / * 141. * 141. +"
v141i = v141
v141 = expr(v141.extractY, v141.extractU, v141.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v141 = v141.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v141a = v141i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v141i.interleave(v141).hist_levels.prefetch
v141 = v141.adjustSize
v141 = v141.assumeFPS(18)
v141 = v141.add_blank_audio
return v141.prefetch
#adjustframerate

v142 = LSMASHVideoSource(dst_dir + "v142f.mp4").ConvertToYV24()
b_ex = undefined
v142o = v142
v142 = v142.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 141,141, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 141. - 141. / * 141. * 141. +"
ex_v = "z" #ex_uv + "z 141. - 141. / * 141. * 141. +"
v142i = v142
v142 = expr(v142.extractY, v142.extractU, v142.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v142 = v142.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v142a = v142i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v142i.interleave(v142).hist_levels.prefetch
v142 = v142.adjustSize
v142 = v142.assumeFPS(18)
v142 = v142.add_blank_audio
return v142.prefetch
#adjustframerate

v143 = LSMASHVideoSource(dst_dir + "v143f.mp4").ConvertToYV24()
b_ex = undefined
v143o = v143
v143 = v143.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 142,142, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 142. - 142. / * 142. * 142. +"
ex_v = "z" #ex_uv + "z 142. - 142. / * 142. * 142. +"
v143i = v143
v143 = expr(v143.extractY, v143.extractU, v143.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v143 = v143.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v143a = v143i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v143i.interleave(v143).hist_levels.prefetch
v143 = v143.adjustSize
v143 = v143.assumeFPS(18)
v143 = v143.add_blank_audio
return v143.prefetch
#adjustframerate

v144 = LSMASHVideoSource(dst_dir + "v144f.mp4").ConvertToYV24()
b_ex = undefined
v144o = v144
v144 = v144.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 143. - 143. / * 143. * 143. +"
ex_v = "z" #ex_uv + "z 143. - 143. / * 143. * 143. +"
v144i = v144
v144 = expr(v144.extractY, v144.extractU, v144.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v144 = v144.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v144a = v144i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v144 = v144.colorYUV(off_u = -2, off_v = -2)
#return v144i.interleave(v144).hist_levels.prefetch
v144 = v144.adjustSize
v144 = v144.assumeFPS(18)
v144 = v144.add_blank_audio
return v144.prefetch
#adjustframerate

v145 = LSMASHVideoSource(dst_dir + "v145f.mp4").ConvertToYV24()
b_ex = undefined
v145o = v145
v145 = v145.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 144. - 144. / * 144. * 144. +"
ex_v = "z" #ex_uv + "z 144. - 144. / * 144. * 144. +"
v145i = v145
v145 = expr(v145.extractY, v145.extractU, v145.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v145 = v145.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v145a = v145i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v145 = v145.colorYUV(off_u = -2, off_v = -0)
#return v145i.interleave(v145).hist_levels.prefetch
v145 = v145.adjustSize
v145 = v145.assumeFPS(18)
v145 = v145.add_blank_audio
return v145.prefetch
#adjustframerate

v146 = LSMASHVideoSource(dst_dir + "v146f.mp4").ConvertToYV24()
b_ex = undefined
v146o = v146
v146 = v146.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 145,145, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 145. - 145. / * 145. * 145. +"
ex_v = "z" #ex_uv + "z 145. - 145. / * 145. * 145. +"
v146i = v146
v146 = expr(v146.extractY, v146.extractU, v146.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v146 = v146.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v146a = v146i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v146 = v146.colorYUV(off_u = -2, off_v = -2)
#return v146i.interleave(v146).hist_levels.prefetch
v146 = v146.adjustSize
v146 = v146.assumeFPS(18)
v146 = v146.add_blank_audio
return v146.prefetch
#adjustframerate

v147 = LSMASHVideoSource(dst_dir + "v147f.mp4").ConvertToYV24()
b_ex = undefined
v147o = v147
v147 = v147.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 146. - 146. / * 146. * 146. +"
ex_v = "z" #ex_uv + "z 146. - 146. / * 146. * 146. +"
v147i = v147
v147 = expr(v147.extractY, v147.extractU, v147.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v147 = v147.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v147a = v147i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v147i.interleave(v147).hist_levels.prefetch
v147 = v147.adjustSize
v147 = v147.assumeFPS(18)
v147 = v147.add_blank_audio
return v147.prefetch
#adjustframerate

v148 = LSMASHVideoSource(dst_dir + "v148f.mp4").ConvertToYV24()
b_ex = undefined
v148o = v148
v148 = v148.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 147. - 147. / * 147. * 147. +"
ex_v = "z" #ex_uv + "z 147. - 147. / * 147. * 147. +"
v148i = v148
v148 = expr(v148.extractY, v148.extractU, v148.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v148 = v148.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v148a = v148i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v148 = v148.colorYUV(off_u = -2, off_v = -2)
#return v148i.interleave(v148).hist_levels.prefetch
v148 = v148.adjustSize
v148 = v148.assumeFPS(18)
v148 = v148.add_blank_audio
return v148.prefetch
#adjustframerate

v149 = LSMASHVideoSource(dst_dir + "v149f.mp4").ConvertToYV24()
b_ex = undefined
v149o = v149
v149 = v149.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 148. - 148. / * 148. * 148. +"
ex_v = "z" #ex_uv + "z 148. - 148. / * 148. * 148. +"
v149i = v149
v149 = expr(v149.extractY, v149.extractU, v149.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v149 = v149.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v149a = v149i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v149 = v149.colorYUV(off_u = +2, off_v = -0)
#return v149i.interleave(v149).hist_levels.prefetch
v149 = v149.adjustSize
v149 = v149.assumeFPS(18)
v149 = v149.add_blank_audio
return v149.prefetch
#adjustframerate

v150 = LSMASHVideoSource(dst_dir + "v150f.mp4").ConvertToYV24()
b_ex = undefined
v150o = v150
v150 = v150.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 149. - 149. / * 149. * 149. +"
ex_v = "z" #ex_uv + "z 149. - 149. / * 149. * 149. +"
v150i = v150
v150 = expr(v150.extractY, v150.extractU, v150.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v150 = v150.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v150a = v150i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v150 = v150.colorYUV(off_u = +2, off_v = -0)
#return v150i.interleave(v150).hist_levels.prefetch
v150 = v150.adjustSize
v150 = v150.assumeFPS(18)
v150 = v150.add_blank_audio
return v150.prefetch
#adjustframerate

v151 = LSMASHVideoSource(dst_dir + "v151f.mp4").ConvertToYV24()
b_ex = undefined
v151o = v151
v151 = v151.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 150. - 150. / * 150. * 150. +"
ex_v = "z" #ex_uv + "z 150. - 150. / * 150. * 150. +"
v151i = v151
v151 = expr(v151.extractY, v151.extractU, v151.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v151 = v151.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v151a = v151i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v151 = v151.colorYUV(off_u = +2, off_v = -0)
#return v151i.interleave(v151).hist_levels.prefetch
v151 = v151.adjustSize
v151 = v151.assumeFPS(18)
v151 = v151.add_blank_audio
return v151.prefetch
#adjustframerate

v152 = LSMASHVideoSource(dst_dir + "v152f.mp4").ConvertToYV24()
b_ex = undefined
v152o = v152
v152 = v152.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 151. - 151. / * 151. * 151. +"
ex_v = "z" #ex_uv + "z 151. - 151. / * 151. * 151. +"
v152i = v152
v152 = expr(v152.extractY, v152.extractU, v152.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v152 = v152.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v152a = v152i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v152i.interleave(v152).hist_levels.prefetch
v152 = v152.adjustSize
v152 = v152.assumeFPS(18)
v152 = v152.add_blank_audio
return v152.prefetch
#adjustframerate

v153 = LSMASHVideoSource(dst_dir + "v153f.mp4").ConvertToYV24()
b_ex = undefined
v153o = v153
v153 = v153.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 152. - 152. / * 152. * 152. +"
ex_v = "z" #ex_uv + "z 152. - 152. / * 152. * 152. +"
v153i = v153
v153 = expr(v153.extractY, v153.extractU, v153.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v153 = v153.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v153a = v153i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v153i.interleave(v153).hist_levels.prefetch
v153 = v153.adjustSize
v153 = v153.assumeFPS(18)
v153 = v153.add_blank_audio
return v153.prefetch
#adjustframerate

v154 = LSMASHVideoSource(dst_dir + "v154f.mp4").ConvertToYV24()
b_ex = undefined
v154o = v154
v154 = v154.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 153. - 153. / * 153. * 153. +"
ex_v = "z" #ex_uv + "z 153. - 153. / * 153. * 153. +"
v154i = v154
v154 = expr(v154.extractY, v154.extractU, v154.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v154 = v154.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v154a = v154i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v154i.interleave(v154).hist_levels.prefetch
v154 = v154.adjustSize
v154 = v154.assumeFPS(18)
v154 = v154.add_blank_audio
return v154.prefetch
#adjustframerate

v155 = LSMASHVideoSource(dst_dir + "v155f.mp4").ConvertToYV24()
b_ex = undefined
v155o = v155
v155 = v155.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 154. - 154. / * 154. * 154. +"
ex_v = "z" #ex_uv + "z 154. - 154. / * 154. * 154. +"
v155i = v155
v155 = expr(v155.extractY, v155.extractU, v155.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v155 = v155.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v155a = v155i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v155i.interleave(v155).hist_levels.prefetch
v155 = v155.adjustSize
v155 = v155.assumeFPS(18)
v155 = v155.add_blank_audio
return v155.prefetch
#adjustframerate

v156 = LSMASHVideoSource(dst_dir + "v156f.mp4").ConvertToYV24()
b_ex = undefined
v156o = v156
v156 = v156.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 155. - 155. / * 155. * 155. +"
ex_v = "z" #ex_uv + "z 155. - 155. / * 155. * 155. +"
v156i = v156
v156 = expr(v156.extractY, v156.extractU, v156.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v156 = v156.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v156a = v156i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v156i.interleave(v156).hist_levels.prefetch
v156 = v156.adjustSize
v156 = v156.assumeFPS(18)
v156 = v156.add_blank_audio
return v156.prefetch
#adjustframerate

v157 = LSMASHVideoSource(dst_dir + "v157f.mp4").ConvertToYV24()
b_ex = undefined
v157o = v157
v157 = v157.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 156. - 156. / * 156. * 156. +"
ex_v = "z" #ex_uv + "z 156. - 156. / * 156. * 156. +"
v157i = v157
v157 = expr(v157.extractY, v157.extractU, v157.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v157 = v157.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v157a = v157i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v157i.interleave(v157).hist_levels.prefetch
v157 = v157.adjustSize
v157 = v157.assumeFPS(18)
v157 = v157.add_blank_audio
return v157.prefetch
#adjustframerate

v158 = LSMASHVideoSource(dst_dir + "v158f.mp4").ConvertToYV24()
b_ex = undefined
v158o = v158
v158 = v158.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 157. - 157. / * 157. * 157. +"
ex_v = "z" #ex_uv + "z 157. - 157. / * 157. * 157. +"
v158i = v158
v158 = expr(v158.extractY, v158.extractU, v158.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v158 = v158.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v158a = v158i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v158i.interleave(v158).hist_levels.prefetch
v158 = v158.adjustSize
v158 = v158.assumeFPS(18)
v158 = v158.add_blank_audio
return v158.prefetch
#adjustframerate

v159 = LSMASHVideoSource(dst_dir + "v159f.mp4").ConvertToYV24()
b_ex = undefined
v159o = v159
v159 = v159.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 158. - 158. / * 158. * 158. +"
ex_v = "z" #ex_uv + "z 158. - 158. / * 158. * 158. +"
v159i = v159
v159 = expr(v159.extractY, v159.extractU, v159.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v159 = v159.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v159a = v159i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v159i.interleave(v159).hist_levels.prefetch
v159 = v159.adjustSize
v159 = v159.assumeFPS(18)
v159 = v159.add_blank_audio
return v159.prefetch
#adjustframerate

v160 = LSMASHVideoSource(dst_dir + "v160f.mp4").ConvertToYV24()
b_ex = undefined
v160o = v160
v160 = v160.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 159. - 159. / * 159. * 159. +"
ex_v = "z" #ex_uv + "z 159. - 159. / * 159. * 159. +"
v160i = v160
v160 = expr(v160.extractY, v160.extractU, v160.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v160 = v160.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v160a = v160i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v160i.interleave(v160).hist_levels.prefetch
v160 = v160.adjustSize
v160 = v160.assumeFPS(18)
v160 = v160.add_blank_audio
return v160.prefetch
#adjustframerate

v161 = LSMASHVideoSource(dst_dir + "v161f.mp4").ConvertToYV24()
#v161 = v161.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v161 = v161.trim(105, -1).loop(v161.frameCount).crop(0, 0, -(v161.width - add_width), 0).stackHorizontal(v161)
#return v161.histogram.prefetch
v161o = v161
#v161 = v161.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
v161 = v161.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v161.hist_levels.prefetch
#v161 = v161.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v161 = expr(v161.extractY, v161.extractU, v161.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v161i = v161
v161 = expr(v161.extractY, v161.extractU, v161.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v161 = v161.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v161a = v161i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v161 = v161.crop(add_width, 0, 0, 0)
#v161i = v161i.crop(add_width, 0, 0, 0)
#v161a = v161a.crop(add_width, 0, 0, 0)
#v161 = v161.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v161 = v161.colorYUV(off_u = +2, off_v = -0)
#v161 = v161i
#return v161i.interleave(v161).hist_levels.prefetch
v161 = v161.adjustSize
v161 = v161.assumeFPS(18)
v161 = v161.add_blank_audio
return v161.prefetch
#adjustframerate

#******
*/
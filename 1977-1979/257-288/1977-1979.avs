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
#return v0.trim(10535, 10555)

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

# 69,   139,   174,  213,  237,  300,  320,  366,  387,  425,  455,  476,  616,  669,  969,  984, 1227, 1335, 1377, 1464, # 20 
#skip (2478, 2482)
# 1678, 1790, 1936, 2011, 2090, 2133, 2157, 2223, 2276, 2295, 2312, 2368, 2430, 2478, 2483, 2540, 2607, 2635, 2703, 2748, # 40
#skip (3387, 3398)
# 2777, 2846, 2861, 2938, 2952, 2964, 3025, 3109, 3163, 3200, 3240, 3272, 3296, 3313, 3322, 3349, 3387, 3399, 3543, 3561, # 60
# 3570, 3853, 3870, 3878, 3889, 4215, 4227, 4240, 4245, 4364, 4379, 4401, 4525, 4604, 4611, 4714, 4774, 4807, 4838, 4873, # 80
# 4889, 4901, 4909, 4916, 4920, 4924, 4931, 4951, 4961, 4968, 4971, 4989, 5023, 5032, 5075, 5092, 5116, 5136, 5148, 5153, # 100
# 5160, 5248, 5368, 5399, 5411, 5445, 5468, 5477, 5500, 5539, 5573, 5589, 5691, 5722, 5770, 5785, 5825, 5851, 5860, 5911, # 120
# 5937, 5961, 5987, 6049, 6200, 6305, 6369, 6396, 6429, 6484, 6544, 6577, 6613, 6680, 6798, 6892, 7033, 7120, 7330, 7391, # 140
# 7522, 7566, 7589, 7614, 7673, 7722, 7771, 7793, 7829, 7976, 8033, 8047, 8155, 8270, 8280, 8312, 8349, 8377, 8395, 8435, # 160
# 8443, 8452, 8478, 8502, 8516, 8531, 8564, 8582, 8614, 8619, 8625, 8640, 8653, 8720, 8746, 8792, 8798, 8834, 8887, 8936, # 180
# 8944, 8973, 8977, 9014, 9055, 9076, 9155, 9187, 9244, 9252, 9307, 9316, 9362, 9420, 9427, 9447, 9467, 9472, 9561, 9599, # 200
# 9700, 9715, 9830, 9846, 9902, 9995, 10089, 10112, 10160, 10166, 10199, 10239, 10271, 10304, 10334, 10340, 10372, 10388, # 218
# 10401, 10439, 10445, 10450, 10456, 10463, 10484, 10493, 10514, 10535, 10539, 10641, 10680, 10720, 10762, 10859, 10884,  # 235
#skip (11318, 11326)
# 10893, 10935, 10951, 10975, 11009, 11014, 11179, 11209, 11318, 11327, 11358, 11460, 11500, 11581, 11720, 11812, 11874,  # 252 
# 11971, 12071, 12162, 12291, 12405, 12431, 12499, 12529, 12545, 12675, 12700, 12753, 12946, 13067, 13184, 13396, 13455,  # 269
# 13504, 13562, 13586, 13616, 13655, 13683, 13765, 13977, 14035, 14114, 14194, 14286, 14351, 14445, 14521, 14589, 14655,  # 286
# 14745, 14830, 14936, 15036, 15304, 15469, 15520, 15577, 15623, 15712, 15725, 15864, 15908, 15922, 15934, 15955, 16053,  # 303

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
v257 = full.trim(12500, 12528)
v257 = v257.crop(left + 60, top - 30, right + 60, bot - 30)
v257 = v257.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false)
v257 = v257.trim(0, 2).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v257.trim(3, 0)
#return v257.histogram.prefetch
#return v257.colorYUV(gain_y = 80).hist_levels.prefetch

v258 = full.trim(12529, 12543)
v258 = v258.crop(left + 60, top - 30, right + 60, bot - 30)
#return v258.histogram.prefetch
#return v258.colorYUV(gain_y = 80).hist_levels.prefetch

v259 = full.trim(12545, 12674)
v259 = v259.crop(left + 60, top - 30, right + 60, bot - 30)
v259 = v259.trim(0, 12).deflickOverlappedBck(step = 180, toward_darkest = true, right2left = false) +\
       v259.trim(13, 0)
#return v259.histogram.prefetch
#return v259.colorYUV(gain_y = 80).hist_levels.prefetch

v260 = full.trim(12675, 12699)
v260 = v260.crop(left + 60, top - 30, right + 60, bot - 30)
v260 = v260.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v260.trim(3, 0)
#return v260.histogram.prefetch
#return v260.colorYUV(gain_y = 80).hist_levels.prefetch

v261 = full.trim(12700, 12752)
v261 = v261.crop(left + 60, top - 30, right + 60, bot - 30)
v261 = v261.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v261.trim(3, 0)
#return v261.histogram.prefetch
#return v261.colorYUV(gain_y = 80).hist_levels.prefetch

v262 = full.trim(12753, 12945)
v262 = v262.crop(left + 60, top - 30, right + 60, bot - 30)
v262 = v262.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v262.trim(3, 190) +\
       v262.trim(191, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v262.histogram.prefetch
#return v262.colorYUV(gain_y = 80).hist_levels.prefetch

v263 = full.trim(12956, 13065)
v263 = v263.crop(left + 60, top - 30, right + 60, bot - 30)
#return v263.histogram.prefetch
#return v263.colorYUV(gain_y = 80).hist_levels.prefetch

v264 = full.trim(13068, 13183)
v264 = v264.crop(left + 60, top - 30, right + 60, bot - 30)
v264 = v264.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v264.trim(4, 41) +\
       v264.trim(42, 54).deflickOverlappedInc(step = 100, toward_darkest = true, right2left = false) +\
       v264.trim(55, 0)
#return v264.histogram.prefetch
#return v264.colorYUV(gain_y = 80).hist_levels.prefetch

v265 = full.trim(13184, 13395)
v265 = v265.crop(left + 60, top - 30, right + 60, bot - 30)
v265 = v265.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v265.trim(3, 0)
#return v265.histogram.prefetch
#return v265.colorYUV(gain_y = 80).hist_levels.prefetch

v266 = full.trim(13398, 13454)
v266 = v266.crop(left + 60, top - 30, right + 60, bot - 30)
#return v266.histogram.prefetch
#return v266.colorYUV(gain_y = 80).hist_levels.prefetch

v267 = full.trim(13455, 13503)
v267 = v267.crop(left + 60, top - 30, right + 60, bot - 30)
v267 = v267.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v267 = v267.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v267.trim(3, 46) +\
       v267.trim(47, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v267.histogram.prefetch
#return v267.colorYUV(gain_y = 80).hist_levels.prefetch

v268 = full.trim(13507, 13561)
v268 = v268.crop(left + 60, top - 0, right + 60, bot - 0)
v268 = v268.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v268 = v268.trim(0, 9).deflickOverlappedBck(step = 220, toward_darkest = true, right2left = false) +\
       v268.trim(10, 0)
#return v268.histogram.prefetch
#return v268.colorYUV(gain_y = 80).hist_levels.prefetch

v269 = full.trim(13562, 13585)
v269 = v269.crop(left + 60, top - 0, right + 60, bot - 0)
v269 = v269.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v269.trim(4, 21) +\
       v269.trim(22, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v269.histogram.prefetch
#return v269.colorYUV(gain_y = 80).hist_levels.prefetch

v270 = full.trim(13586, 13615)
v270 = v270.crop(left + 60, top - 0, right + 60, bot - 0)
v270 = v270.trim(0, 8).deflickOverlappedBck(step = 160, toward_darkest = true, right2left = false) +\
       v270.trim(9, 0)
#return v270.histogram.prefetch
#return v270.colorYUV(gain_y = 80).hist_levels.prefetch

v270 = full.trim(13586, 13615)
v270 = v270.crop(left + 60, top - 0, right + 60, bot - 0)
v270 = v270.trim(0, 8).deflickOverlappedBck(step = 160, toward_darkest = true, right2left = false) +\
       v270.trim(9, 0)
#return v270.histogram.prefetch
#return v270.colorYUV(gain_y = 80).hist_levels.prefetch

v271 = full.trim(13616, 13654)
v271 = v271.crop(left + 60, top - 0, right + 60, bot - 0)
v271 = v271.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v271.trim(3, 0)
#return v271.histogram.prefetch
#return v271.colorYUV(gain_y = 80).hist_levels.prefetch

v272 = full.trim(13655, 13682)
v272 = v272.crop(left + 60, top - 0, right + 60, bot - 0)
v272 = v272.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v272.trim(4, 0)
#return v272.histogram.prefetch
#return v272.colorYUV(gain_y = 80).hist_levels.prefetch

v273 = full.trim(13683, 13764)
v273 = v273.crop(left + 60, top - 0, right + 60, bot - 0)
v273 = v273.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v273.trim(4, 79) +\
       v273.trim(80, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v273.histogram.prefetch
#return v273.colorYUV(gain_y = 80).hist_levels.prefetch

v274 = full.trim(13766, 13976)
v274 = v274.crop(left + 60, top - 0, right + 60, bot - 0)
v274 = v274.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v274.trim(3, 205) +\
       v274.trim(206, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v274.histogram.prefetch
#return v274.colorYUV(gain_y = 80).hist_levels.prefetch

v275 = full.trim(13982, 14034)
v275 = v275.crop(left + 60, top - 0, right + 60, bot - 0)
v275 = v275.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v275.histogram.prefetch
#return v275.colorYUV(gain_y = 80).hist_levels.prefetch

v276 = full.trim(14035, 14113)
v276 = v276.crop(left + 60, top - 0, right + 60, bot - 0)
v276 = v276.trim(0, 8).deflickOverlappedBck(step = 220, toward_darkest = true, right2left = false) +\
       v276.trim(9, 75) +\
       v276.trim(76, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v276.histogram.prefetch
#return v276.colorYUV(gain_y = 80).hist_levels.prefetch

v277 = full.trim(14115, 14193)
v277 = v277.crop(left + 60, top - 0, right + 60, bot - 0)
v277 = v277.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v277.trim(3, 76) +\
       v277.trim(77, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v277.histogram.prefetch
#return v277.colorYUV(gain_y = 80).hist_levels.prefetch

v278 = full.trim(14195, 14285)
v278 = v278.crop(left + 60, top - 0, right + 60, bot - 0)
v278 = v278.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v278.trim(2, 0)
#return v278.histogram.prefetch
#return v278.colorYUV(gain_y = 80).hist_levels.prefetch

v279 = full.trim(14289, 14350)
v279 = v279.crop(left + 60, top - 0, right + 60, bot - 0)
v279 = v279.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v279.trim(3, 59) +\
       v279.trim(60, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v279.histogram.prefetch
#return v279.colorYUV(gain_y = 80).hist_levels.prefetch

v280 = full.trim(14352, 14444)
v280 = v280.crop(left + 60, top - 0, right + 60, bot - 0)
v280 = v280.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v280.trim(5, 88) +\
       v280.trim(89, -1).colorYUV(off_y = -8, gain_y = 8) +\
       v280.trim(90, 91).colorYUV(off_y = -16, gain_y = 16) +\
       v280.trim(92, 0).colorYUV(off_y = -140, gain_y = 180)
#return v280.histogram.prefetch
#return v280.colorYUV(gain_y = 80).hist_levels.prefetch

v281 = full.trim(14447, 14520)
v281 = v281.crop(left + 60, top - 0, right + 60, bot - 0)
v281 = v281.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v281.trim(3, 71) +\
       v281.trim(72, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v281.histogram.prefetch
#return v281.colorYUV(gain_y = 80).hist_levels.prefetch

v282 = full.trim(14523, 14588)
v282 = v282.crop(left + 60, top - 0, right + 60, bot - 0)
v282 = v282.trim(0, 1).deflickOverlapped(step = 160, radius = 1, toward_darkest = true, right2left = false) +\
       v282.trim(2, 0)
#return v282.histogram.prefetch
#return v282.colorYUV(gain_y = 80).hist_levels.prefetch

v283 = full.trim(14589, 14654)
v283 = v283.crop(left + 60, top - 0, right + 60, bot - 0)
v283 = v283.trim(0, -1).colorYUV(off_y = -16, gain_y = 140) +\
       v283.trim(1, -1) +\
       v283.trim(2, -1).colorYUV(off_y = -16, gain_y = 140) +\
       v283.trim(3, 0)
#return v283.histogram.prefetch
#return v283.colorYUV(gain_y = 80).hist_levels.prefetch

v284 = full.trim(14657, 14744)
v284 = v284.crop(left + 60, top - 0, right + 60, bot - 0)
v284 = v284.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v284 = v284.trim(0, -1).autolevels(gamma = 0.1, minRng = 0).colorYUV(off_y = 20, gain_y = -100) +\
       v284.trim(1, -1).autolevels(gamma = 0.1).colorYUV(off_y = 20, gain_y = -100) +\
       v284.trim(2, 13).deflickOverlappedBck(step = 160, toward_darkest = true, right2left = false) +\
       v284.trim(14, 85) +\
       v284.trim(86, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v284.histogram.prefetch
#return v284.colorYUV(gain_y = 80).hist_levels.prefetch

v285 = full.trim(14745, 14829)
v285 = v285.crop(left + 60, top - 0, right + 60, bot - 0)
v285 = v285.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v285 = v285.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v285.trim(4, 82) +\
       v285.trim(83, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v285.histogram.prefetch
#return v285.colorYUV(gain_y = 80).hist_levels.prefetch

v286 = full.trim(14831, 14935)
v286 = v286.crop(left + 60, top - 0, right + 60, bot - 0)
v286 = v286.trim(0, 1).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v286.trim(2, 102) +\
       v286.trim(103, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v286.histogram.prefetch
#return v286.colorYUV(gain_y = 80).hist_levels.prefetch

v287 = full.trim(14937, 15035)
v287 = v287.crop(left + 60, top - 0, right + 60, bot - 0)
v287 = v287.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v287.trim(3, 96) +\
       v287.trim(97, 0).extractY.convertToYV24.deflickOverlappedFwd(step = 50, toward_darkest = true, right2left = false)
#return v287.histogram.prefetch
#return v287.colorYUV(gain_y = 80).hist_levels.prefetch
*/
# 14745, 14830, 14936, 15036, 15304, 15469, 15520, 15577, 15623, 15712, 15725, 15864, 15908, 15922, 15934, 15955, 16053,  # 303
v288 = full.trim(15037, 15303)
v288 = v288.crop(left + 60, top - 0, right + 60, bot - 0)
#v288 = v288.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v288 = v288.trim(0, -1).autolevels(gamma = 0.8).colorYUV(off_y = 14, gain_y = -60) +\
       v288.trim(1, 0)
#v288 = v288.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v288.trim(2, 0)
#v288 = v288.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
#       v288.trim(3, 96) +\
#       v288.trim(97, 0).extractY.convertToYV24.deflickOverlappedFwd(step = 50, toward_darkest = true, right2left = false)
#return v288.histogram.prefetch
#return v288.colorYUV(gain_y = 80).hist_levels.prefetch

#global filter16 = true

import("..\common.avs")

/*

#******

# 257

v257 = LSMASHVideoSource(dst_dir + "v257f.mp4").ConvertToYV24()
b_ex = undefined
v257o = v257
v257 = v257.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#ex_u = ex_uv + "y 128. - 128. / * 128. * 128. +"
#ex_v = ex_uv + "z 128. - 128. / * 128. * 128. +"
v257i = v257
v257 = v257.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v257 = expr(v257.extractY, v257.extractU, v257.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v257 = v257.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v257a = v257i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v257i.interleave(v257).hist_levels.prefetch
v257 = v257.adjustSize
v257 = v257.assumeFPS(18)
v257 = v257.add_blank_audio
return v257.prefetch
#adjustframerate

v258 = LSMASHVideoSource(dst_dir + "v258f.mp4").ConvertToYV24()
b_ex = undefined
v258o = v258
v258 = v258.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.2 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v258i = v258
v258 = v258.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v258 = expr(v258.extractY, v258.extractU, v258.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v258 = v258.autolevels(filterRadius=9, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=1.)
v258a = v258i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
v258 = v258.colorYUV(off_u = +2, off_v = -2)
#return v258i.interleave(v258).hist_levels.prefetch
v258 = v258.adjustSize
v258 = v258.assumeFPS(18)
v258 = v258.add_blank_audio
return v258.prefetch
#adjustframerate

v259 = LSMASHVideoSource(dst_dir + "v259f.mp4").ConvertToYV24()
b_ex = undefined
v259o = v259
v259 = v259.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v259i = v259
v259 = expr(v259.extractY, v259.extractU, v259.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v259 = v259.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v259a = v259i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v259i.interleave(v259).hist_levels.prefetch
v259 = v259.adjustSize
v259 = v259.assumeFPS(18)
v259 = v259.add_blank_audio
return v259.prefetch
#adjustframerate

v260 = LSMASHVideoSource(dst_dir + "v260f.mp4").ConvertToYV24()
b_ex = undefined
v260o = v260
v260 = v260.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v260i = v260
v260 = expr(v260.extractY, v260.extractU, v260.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v260 = v260.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v260a = v260i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v260i.interleave(v260).hist_levels.prefetch
v260 = v260.adjustSize
v260 = v260.assumeFPS(18)
v260 = v260.add_blank_audio
return v260.prefetch
#adjustframerate

v261 = LSMASHVideoSource(dst_dir + "v261f.mp4").ConvertToYV24()
b_ex = undefined
v261o = v261
v261 = v261.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v261i = v261
v261 = expr(v261.extractY, v261.extractU, v261.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v261 = v261.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v261a = v261i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v261i.interleave(v261).hist_levels.prefetch
v261 = v261.adjustSize
v261 = v261.assumeFPS(18)
v261 = v261.add_blank_audio
return v261.prefetch
#adjustframerate

v262 = LSMASHVideoSource(dst_dir + "v262f.mp4").ConvertToYV24()
b_ex = undefined
v262o = v262
v262 = v262.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v262i = v262
v262 = expr(v262.extractY, v262.extractU, v262.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v262 = v262.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v262a = v262i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v262i.interleave(v262).hist_levels.prefetch
v262 = v262.adjustSize
v262 = v262.assumeFPS(18)
v262 = v262.add_blank_audio
return v262.prefetch
#adjustframerate

v263 = LSMASHVideoSource(dst_dir + "v263f.mp4").ConvertToYV24()
b_ex = undefined
v263o = v263
v263 = v263.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v263i = v263
v263 = expr(v263.extractY, v263.extractU, v263.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v263 = v263.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v263a = v263i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v263i.interleave(v263).hist_levels.prefetch
v263 = v263.adjustSize
v263 = v263.assumeFPS(18)
v263 = v263.add_blank_audio
return v263.prefetch
#adjustframerate

v264 = LSMASHVideoSource(dst_dir + "v264f.mp4").ConvertToYV24()
b_ex = undefined
v264o = v264
v264 = v264.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v264i = v264
v264 = expr(v264.extractY, v264.extractU, v264.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v264 = v264.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v264a = v264i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v264i.interleave(v264).hist_levels.prefetch
v264 = v264.adjustSize
v264 = v264.assumeFPS(18)
v264 = v264.add_blank_audio
return v264.prefetch
#adjustframerate

v265 = LSMASHVideoSource(dst_dir + "v265f.mp4").ConvertToYV24()
b_ex = undefined
v265o = v265
v265 = v265.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v265i = v265
v265 = expr(v265.extractY, v265.extractU, v265.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v265 = v265.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v265a = v265i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v265i.interleave(v265).hist_levels.prefetch
v265 = v265.adjustSize
v265 = v265.assumeFPS(18)
v265 = v265.add_blank_audio
return v265.prefetch
#adjustframerate

v266 = LSMASHVideoSource(dst_dir + "v266f.mp4").ConvertToYV24()
b_ex = undefined
v266o = v266
v266 = v266.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v266i = v266
v266 = expr(v266.extractY, v266.extractU, v266.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v266 = v266.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v266a = v266i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v266i.interleave(v266).hist_levels.prefetch
v266 = v266.adjustSize
v266 = v266.assumeFPS(18)
v266 = v266.add_blank_audio
return v266.prefetch
#adjustframerate

v267 = LSMASHVideoSource(dst_dir + "v267f.mp4").ConvertToYV24()
b_ex = undefined
v267o = v267
v267 = v267.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v267i = v267
v267 = expr(v267.extractY, v267.extractU, v267.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v267 = v267.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v267a = v267i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v267i.interleave(v267).hist_levels.prefetch
v267 = v267.adjustSize
v267 = v267.assumeFPS(18)
v267 = v267.add_blank_audio
return v267.prefetch
#adjustframerate

v268 = LSMASHVideoSource(dst_dir + "v268f.mp4").ConvertToYV24()
b_ex = undefined
v268o = v268
v268 = v268.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v268i = v268
v268 = expr(v268.extractY, v268.extractU, v268.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v268 = v268.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v268a = v268i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v268i.interleave(v268).hist_levels.prefetch
v268 = v268.adjustSize
v268 = v268.assumeFPS(18)
v268 = v268.add_blank_audio
return v268.prefetch
#adjustframerate

v269 = LSMASHVideoSource(dst_dir + "v269f.mp4").ConvertToYV24()
b_ex = undefined
v269o = v269
v269 = v269.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v269i = v269
v269 = expr(v269.extractY, v269.extractU, v269.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v269 = v269.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v269a = v269i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v269i.interleave(v269).hist_levels.prefetch
v269 = v269.adjustSize
v269 = v269.assumeFPS(18)
v269 = v269.add_blank_audio
return v269.prefetch
#adjustframerate

v270 = LSMASHVideoSource(dst_dir + "v270f.mp4").ConvertToYV24()
b_ex = undefined
v270o = v270
v270 = v270.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v270i = v270
v270 = expr(v270.extractY, v270.extractU, v270.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v270 = v270.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v270a = v270i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v270i.interleave(v270).hist_levels.prefetch
v270 = v270.adjustSize
v270 = v270.assumeFPS(18)
v270 = v270.add_blank_audio
return v270.prefetch
#adjustframerate

v271 = LSMASHVideoSource(dst_dir + "v271f.mp4").ConvertToYV24()
b_ex = undefined
v271o = v271
v271 = v271.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v271i = v271
v271 = expr(v271.extractY, v271.extractU, v271.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v271 = v271.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v271a = v271i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v271i.interleave(v271).hist_levels.prefetch
v271 = v271.adjustSize
v271 = v271.assumeFPS(18)
v271 = v271.add_blank_audio
return v271.prefetch
#adjustframerate

v272 = LSMASHVideoSource(dst_dir + "v272f.mp4").ConvertToYV24()
b_ex = undefined
v272o = v272
v272 = v272.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v272i = v272
v272 = expr(v272.extractY, v272.extractU, v272.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v272 = v272.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v272a = v272i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v272i.interleave(v272).hist_levels.prefetch
v272 = v272.adjustSize
v272 = v272.assumeFPS(18)
v272 = v272.add_blank_audio
return v272.prefetch
#adjustframerate

v273 = LSMASHVideoSource(dst_dir + "v273f.mp4").ConvertToYV24()
b_ex = undefined
v273o = v273
v273 = v273.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v273i = v273
v273 = expr(v273.extractY, v273.extractU, v273.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v273 = v273.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v273a = v273i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v273i.interleave(v273).hist_levels.prefetch
v273 = v273.adjustSize
v273 = v273.assumeFPS(18)
v273 = v273.add_blank_audio
return v273.prefetch
#adjustframerate

v274 = LSMASHVideoSource(dst_dir + "v274f.mp4").ConvertToYV24()
b_ex = undefined
v274o = v274
v274 = v274.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v274i = v274
v274 = expr(v274.extractY, v274.extractU, v274.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v274 = v274.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v274a = v274i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v274i.interleave(v274).hist_levels.prefetch
v274 = v274.adjustSize
v274 = v274.assumeFPS(18)
v274 = v274.add_blank_audio
return v274.prefetch
#adjustframerate

v275 = LSMASHVideoSource(dst_dir + "v275f.mp4").ConvertToYV24()
b_ex = undefined
v275o = v275
v275 = v275.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v275i = v275
v275 = expr(v275.extractY, v275.extractU, v275.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v275 = v275.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v275a = v275i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v275i.interleave(v275).hist_levels.prefetch
v275 = v275.adjustSize
v275 = v275.assumeFPS(18)
v275 = v275.add_blank_audio
return v275.prefetch
#adjustframerate

v276 = LSMASHVideoSource(dst_dir + "v276f.mp4").ConvertToYV24()
b_ex = undefined
v276o = v276
v276 = v276.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v276i = v276
v276 = expr(v276.extractY, v276.extractU, v276.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v276 = v276.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v276a = v276i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v276i.interleave(v276).hist_levels.prefetch
v276 = v276.adjustSize
v276 = v276.assumeFPS(18)
v276 = v276.add_blank_audio
return v276.prefetch
#adjustframerate

v277 = LSMASHVideoSource(dst_dir + "v277f.mp4").ConvertToYV24()
b_ex = undefined
v277o = v277
v277 = v277.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v277i = v277
v277 = expr(v277.extractY, v277.extractU, v277.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v277 = v277.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v277a = v277i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v277i.interleave(v277).hist_levels.prefetch
v277 = v277.adjustSize
v277 = v277.assumeFPS(18)
v277 = v277.add_blank_audio
return v277.prefetch
#adjustframerate

v278 = LSMASHVideoSource(dst_dir + "v278f.mp4").ConvertToYV24()
b_ex = undefined
v278o = v278
v278 = v278.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v278i = v278
v278 = expr(v278.extractY, v278.extractU, v278.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v278 = v278.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v278a = v278i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v278i.interleave(v278).hist_levels.prefetch
v278 = v278.adjustSize
v278 = v278.assumeFPS(18)
v278 = v278.add_blank_audio
return v278.prefetch
#adjustframerate

v279 = LSMASHVideoSource(dst_dir + "v279f.mp4").ConvertToYV24()
b_ex = undefined
v279o = v279
v279 = v279.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v279i = v279
v279 = expr(v279.extractY, v279.extractU, v279.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v279 = v279.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v279a = v279i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v279i.interleave(v279).hist_levels.prefetch
v279 = v279.adjustSize
v279 = v279.assumeFPS(18)
v279 = v279.add_blank_audio
return v279.prefetch
#adjustframerate

v280 = LSMASHVideoSource(dst_dir + "v280f.mp4").ConvertToYV24()
b_ex = undefined
v280o = v280
v280 = v280.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v280i = v280
v280 = expr(v280.extractY, v280.extractU, v280.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v280 = v280.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v280a = v280i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v280i.interleave(v280).hist_levels.prefetch
v280 = v280.adjustSize
v280 = v280.assumeFPS(18)
v280 = v280.add_blank_audio
return v280.prefetch
#adjustframerate

v281 = LSMASHVideoSource(dst_dir + "v281f.mp4").ConvertToYV24()
b_ex = undefined
v281o = v281
v281 = v281.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v281i = v281
v281 = expr(v281.extractY, v281.extractU, v281.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v281 = v281.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v281a = v281i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v281i.interleave(v281).hist_levels.prefetch
v281 = v281.adjustSize
v281 = v281.assumeFPS(18)
v281 = v281.add_blank_audio
return v281.prefetch
#adjustframerate

v282 = LSMASHVideoSource(dst_dir + "v282f.mp4").ConvertToYV24()
b_ex = undefined
v282o = v282
v282 = v282.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v282i = v282
v282 = expr(v282.extractY, v282.extractU, v282.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v282 = v282.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v282a = v282i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v282i.interleave(v282).hist_levels.prefetch
v282 = v282.adjustSize
v282 = v282.assumeFPS(18)
v282 = v282.add_blank_audio
return v282.prefetch
#adjustframerate

v283 = LSMASHVideoSource(dst_dir + "v283f.mp4").ConvertToYV24()
b_ex = undefined
v283o = v283
v283 = v283.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v283i = v283
v283 = expr(v283.extractY, v283.extractU, v283.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v283 = v283.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v283a = v283i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v283i.interleave(v283).hist_levels.prefetch
v283 = v283.adjustSize
v283 = v283.assumeFPS(18)
v283 = v283.add_blank_audio
return v283.prefetch
#adjustframerate

v284 = LSMASHVideoSource(dst_dir + "v284f.mp4").ConvertToYV24()
b_ex = undefined
v284o = v284
v284 = v284.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v284i = v284
v284 = expr(v284.extractY, v284.extractU, v284.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v284 = v284.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v284a = v284i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v284i.interleave(v284).hist_levels.prefetch
v284 = v284.adjustSize
v284 = v284.assumeFPS(18)
v284 = v284.add_blank_audio
return v284.prefetch
#adjustframerate

v285 = LSMASHVideoSource(dst_dir + "v285f.mp4").ConvertToYV24()
b_ex = undefined
v285o = v285
v285 = v285.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v285i = v285
v285 = expr(v285.extractY, v285.extractU, v285.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v285 = v285.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v285a = v285i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v285i.interleave(v285).hist_levels.prefetch
v285 = v285.adjustSize
v285 = v285.assumeFPS(18)
v285 = v285.add_blank_audio
return v285.prefetch
#adjustframerate

v286 = LSMASHVideoSource(dst_dir + "v286f.mp4").ConvertToYV24()
b_ex = undefined
v286o = v286
v286 = v286.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v286i = v286
v286 = expr(v286.extractY, v286.extractU, v286.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v286 = v286.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v286a = v286i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v286i.interleave(v286).hist_levels.prefetch
v286 = v286.adjustSize
v286 = v286.assumeFPS(18)
v286 = v286.add_blank_audio
return v286.prefetch
#adjustframerate

v287 = LSMASHVideoSource(dst_dir + "v287f.mp4").ConvertToYV24()
b_ex = undefined
v287o = v287
v287 = v287.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v287i = v287
v287 = expr(v287.extractY, v287.extractU, v287.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v287 = v287.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v287a = v287i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v287i.interleave(v287).hist_levels.prefetch
v287 = v287.adjustSize
v287 = v287.assumeFPS(18)
v287 = v287.add_blank_audio
return v287.prefetch
#adjustframerate

v288 = LSMASHVideoSource(dst_dir + "v288f.mp4").ConvertToYV24()
#v288 = v288.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v288 = v288.trim(105, -1).loop(v288.frameCount).crop(0, 0, -(v288.width - add_width), 0).stackHorizontal(v288)
#return v288.histogram.prefetch
v288o = v288
v288 = v288.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
#v288 = v288.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v288.hist_levels.prefetch
#v288 = v288.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v288 = expr(v288.extractY, v288.extractU, v288.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v288i = v288
#v288 = v288.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v288 = expr(v288.extractY, v288.extractU, v288.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v288 = v288.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v288a = v288i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#v288 = v288.crop(add_width, 0, 0, 0)
#v288i = v288i.crop(add_width, 0, 0, 0)
#v288a = v288a.crop(add_width, 0, 0, 0)
#v288 = v288.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v288 = v288.colorYUV(off_u = +2, off_v = -2)
#v288 = v288i
#return v288i.interleave(v288).hist_levels.prefetch
v288 = v288.adjustSize
v288 = v288.assumeFPS(18)
v288 = v288.add_blank_audio
return v288.prefetch
#adjustframerate

#******
*/
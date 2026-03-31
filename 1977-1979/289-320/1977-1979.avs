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
#skip (15922, 15933) (15934, 15954)
# 14745, 14830, 14936, 15036, 15304, 15469, 15520, 15577, 15623, 15712, 15725, 15818, 15864, 15908, 15922, 15934, 15955,  # 303
#skip (16630, 16645)
# 16053, 16226, 16268, 16475, 16500, 16555, 16630, 16646, 16721, 16886, 16957, 17057, 17149, 17187, 17232, 17289, 17385,  # 320
# 17434, 17436, 17478, 17496, 17547, 17719, 17803, 17860, 17920, 17928, 17931, 18017, 18031, 18061, 18134, 18203, 18341,  # 337
# 18396, 18447,

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
v289 = full.trim(15304, 15468)
v289 = v289.crop(left + 60, top - 0, right + 60, bot - 0)
v289 = v289.trim(0, 156) +\
       v289.trim(157, 0).convertToYV24.deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)

v290 = full.trim(15469, 15519)
v290 = v290.crop(left + 60, top - 0, right + 60, bot - 0)
#return v290.histogram.assumeFPS(12).prefetch

v291 = full.trim(15520, 15576)
v291 = v291.crop(left + 60, top - 0, right + 60, bot - 0)
#return v291.histogram.assumeFPS(12).prefetch

v292 = full.trim(15577, 15622)
v292 = v292.crop(left + 60, top - 0, right + 60, bot - 0)
v292 = v292.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v292.trim(2, 0)
#return v292.histogram.assumeFPS(12).prefetch

v293 = full.trim(15623, 15711)
v293 = v293.crop(left + 60, top - 40, right + 60, bot - 40)
v293 = v293.trim(0, -1).colorYUV(off_y = 0, gain_y = -30) +\
       v293.trim(1, 0)
#return v293.histogram.assumeFPS(12).prefetch

v294 = full.trim(15712, 15724)
v294 = v294.crop(left + 60, top - 40, right + 60, bot - 40)
v294 = v294.extractY.convertToYV24
v294 = v294.trim(0, -1).colorYUV(gain_y = 60) +\
       v294.trim(1, -1) +\
       v294.trim(2, -1).autolevels(gamma = 0.3).colorYUV(off_y = 14, gain_y = -60) +\
       v294.trim(3, -1).autolevels(gamma = 0.3).colorYUV(off_y = 14, gain_y = -60) +\
       v294.trim(4, -1).autolevels(gamma = 0.5).colorYUV(off_y = 14, gain_y = -60) +\
       v294.trim(5, -1).autolevels(gamma = 0.9).colorYUV(off_y = 14, gain_y = -60) +\
       v294.trim(6, -1).autolevels(gamma = 0.9).colorYUV(off_y = 14, gain_y = -60) +\
       v294.trim(7, -1).autolevels(gamma = 0.9).colorYUV(off_y = 14, gain_y = -60) +\
       v294.trim(8, -1).autolevels(gamma = 0.9).colorYUV(off_y = 14, gain_y = -60) +\
       v294.trim(9, 0)
#return v294.histogram.assumeFPS(12).prefetch

v295 = full.trim(15725, 15817)
v295 = v295.crop(left + 60, top - 20, right + 60, bot - 20)
v295 = v295.extractY.convertToYV24
v295 = v295.trim(0, -1).autolevels(gamma = 0.2).colorYUV(off_y = 20, gain_y = -40) +\
       v295.trim(1, -1).autolevels(gamma = 0.2).colorYUV(off_y = 20, gain_y = -40) +\
       v295.trim(2, -1).autolevels(gamma = 0.3).colorYUV(off_y = 20, gain_y = -40) +\
       v295.trim(3, -1).autolevels(gamma = 2.3).colorYUV(off_y = 16, gain_y = -60) +\
       v295.trim(4, -1).autolevels(gamma = 1.3).colorYUV(off_y = 16, gain_y = -60) +\
       v295.trim(5, -1).autolevels(gamma = 0.5).colorYUV(off_y = 16, gain_y = -50) +\
       v295.trim(6, -1).autolevels(gamma = 0.7).colorYUV(off_y = 16, gain_y = -55) +\
       v295.trim(7, -1).autolevels(gamma = 1.3).colorYUV(off_y = 16, gain_y = -60) +\
       v295.trim(8, -1).autolevels(gamma = 1.3).colorYUV(off_y = 16, gain_y = -60) +\
       v295.trim(9, -1).autolevels(gamma = 0.8).colorYUV(off_y = 20, gain_y = -60) +\
       v295.trim(10, -1).autolevels(gamma = 0.7).colorYUV(off_y = 20, gain_y = -60) +\
       v295.trim(11, -1).autolevels(gamma = 0.9).colorYUV(off_y = 20, gain_y = -65) +\
       v295.trim(12, -1) +\
       v295.trim(13, 0)
#return v295.histogram.assumeFPS(12).prefetch

v296 = full.trim(15818, 15863) # 45
v296 = v296.crop(left + 60, top - 20, right + 60, bot - 20)
#return v296.histogram.assumeFPS(12).prefetch

v297 = full.trim(15865, 15907) # 42
v297 = v297.crop(left + 60, top - 20, right + 60, bot - 20)
v297 = v297.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v297.trim(2, 0)
#return v297.histogram.assumeFPS(12).prefetch

v298 = full.trim(15910, 15921) # 11
v298 = v298.crop(left + 60, top - 20, right + 60, bot - 20)
#return v298.histogram.assumeFPS(12).prefetch

v299 = full.trim(15922, 15923) + full.trim(15956, 16052)
v299 = v299.crop(left + 60, top + 20, right + 60, bot + 20)
v299 = v299.extractY.convertToYV24
v299 = v299.trim(0, -1).autolevels(gamma = 2.3).colorYUV(off_y = 16, gain_y = -40) +\
       v299.trim(1, -1).autolevels(gamma = 2.1).colorYUV(off_y = 12, gain_y = -40) +\
       v299.trim(2, 0).autolevels(gamma = 1.5).colorYUV(off_y = 16, gain_y = -60)
#return v299.histogram.assumeFPS(12).prefetch

v300 = full.trim(16053, 16225)
v300 = v300.crop(left + 60, top + 20, right + 60, bot + 20)
v300 = v300.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v300.trim(5, 0)
#return v300.histogram.assumeFPS(12).prefetch

v301 = full.trim(16226, 16267)
v301 = v301.crop(left + 60, top + 20, right + 60, bot + 20)
v301 = v301.trim(0, 1).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v301.trim(2, 0)
#return v301.histogram.assumeFPS(12).prefetch

v302 = full.trim(16268, 16474)
v302 = v302.crop(left + 60, top + 20, right + 60, bot + 20)
v302 = v302.extractY.convertToYV24
v302 = v302.trim(0, -1).autolevels(gamma = 0.5).colorYUV(off_y = 20, gain_y = -90) +\
       v302.trim(1, -1).autolevels(gamma = 1.0).colorYUV(off_y = 20, gain_y = -100) +\
       v302.trim(2, -1).autolevels(gamma = 0.5).colorYUV(off_y = 20, gain_y = -100) +\
       v302.trim(3, -1).autolevels(gamma = 0.1).colorYUV(off_y = 20, gain_y = -40) +\
       v302.trim(4, 204) +\
       v302.trim(205, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v302.histogram.assumeFPS(12).prefetch

v303 = full.trim(16475, 16499)
v303 = v303.crop(left + 60, top + 20, right + 60, bot + 20)
v303 = v303.extractY.convertToYV24
v303 = v303.trim(0, -1).autolevels(gamma = 2.0).colorYUV(off_y = -20, gain_y = +30) +\
       v303.trim(1, -1).autolevels(gamma = 1.9).colorYUV(off_y = 11, gain_y = -40) +\
       v303.trim(2, -1).autolevels(gamma = 1.8).colorYUV(off_y = 11, gain_y = -40) +\
       v303.trim(3, -1).autolevels(gamma = 1.7).colorYUV(off_y = 11, gain_y = -50) +\
       v303.trim(4, -1).autolevels(gamma = 1.5).colorYUV(off_y = 11, gain_y = -50) +\
       v303.trim(5, -1).autolevels(gamma = 1.4).colorYUV(off_y = 11, gain_y = -50) +\
       v303.trim(6, -1).autolevels(gamma = 1.3).colorYUV(off_y = 11, gain_y = -50) +\
       v303.trim(7, -1).autolevels(gamma = 1.2).colorYUV(off_y = 11, gain_y = -50) +\
       v303.trim(8, 0)
#return v303.histogram.assumeFPS(12).prefetch

v304 = full.trim(16500, 16554)
v304 = v304.crop(left + 60, top + 20, right + 60, bot + 20)
v304 = v304.trim(0, 9).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v304.trim(10, 0)
#return v304.histogram.assumeFPS(12).prefetch

v305 = full.trim(16555, 16629)
v305 = v305.crop(left + 60, top + 20, right + 60, bot + 20)
v305 = v305.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v305.trim(4, 0)
v305o = v0.trim(16608, 16621)
v305o = v305o.crop(160, 4, -160, -4)
v305o = v305o.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 220, autolevel = false)
v305o = v305o.spline64resize(v305.width, v305.height, -20, -20, v305o.width + 70, v305o.height + 20)
v305 = v305 + v305o
#return v305.histogram.assumeFPS(12).prefetch
#return v305.colorYUV(gain_y = 80).hist_levels.prefetch

v306 = full.trim(16647, 16720) # 73
v306 = v306.crop(left + 60, top + 20, right + 60, bot + 20)
v306 = v306.trim(0, 7).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v306.trim(8, 0)
v306o = v0.trim(16622, 16624)
v306o = v306o.crop(160, 4, -160, -4)
v306o = v306o.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 220, autolevel = false)
v306o = v306o.spline64resize(v306.width, v306.height, -20, -20, v306o.width + 70, v306o.height + 20)
v306 = v306o + v306
#return v306.histogram.assumeFPS(12).prefetch

v307 = full.trim(16721, 16885)
v307 = v307.crop(left + 60, top + 20, right + 60, bot + 20)
#return v307.histogram.assumeFPS(12).prefetch

v308 = full.trim(16886, 16956)
v308 = v308.crop(left + 60, top + 20, right + 60, bot + 20)
v308 = v308.trim(0, 68) +\
       v308.trim(69, 0).convertToYV24.deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v308.histogram.assumeFPS(12).prefetch

v309 = full.trim(16957, 17056)
v309 = v309.crop(left + 60, top + 20, right + 60, bot + 20)
v309 = v309.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v309.trim(5, 97) +\
       v309.trim(98, 0).deflickOverlappedFwd(step = 100, toward_darkest = true, right2left = false)
#return v309.histogram.assumeFPS(12).prefetch

v310 = full.trim(17058, 17148)
v310 = v310.crop(left + 60, top + 20, right + 60, bot + 20)
#return v310.histogram.assumeFPS(12).prefetch

v311 = full.trim(17149, 17186)
v311 = v311.crop(left + 60, top + 20, right + 60, bot + 20)
v311 = v311.trim(0, 1).deflickOverlapped(step = 400, radius = 1, toward_darkest = true, right2left = false) +\
       v311.trim(2, 35) +\
       v311.trim(36, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v311.histogram.assumeFPS(12).prefetch

v312 = full.trim(17188, 17231)
v312 = v312.crop(left + 60, top + 20, right + 60, bot + 20)
v312 = v312.extractY.convertToYV24
v312 = v312.trim(0, 2) +\
       v312.trim(3, -1).autolevels(gamma = 1.3).colorYUV(off_y = 16, gain_y = -60) +\
       v312.trim(4, -1).autolevels(gamma = 1.1).colorYUV(off_y = 16, gain_y = -60) +\
       v312.trim(5, -1).autolevels(gamma = 0.5).colorYUV(off_y = 16, gain_y = -60) +\
       v312.trim(6, -1) +\
       v312.trim(7, -1).autolevels(gamma = 1.5).colorYUV(off_y = 16, gain_y = -60) +\
       v312.trim(8, -1).autolevels(gamma = 1.3).colorYUV(off_y = 16, gain_y = -60) +\
       v312.trim(9, 0)
#return v312.histogram.assumeFPS(12).prefetch

v313 = full.trim(17232, 17288)
v313 = v313.crop(left + 60, top + 20, right + 60, bot + 20)
v313 = v313.extractY.convertToYV24
v313 = v313.trim(0, -1).autolevels(gamma = 0.5).colorYUV(off_y = 16, gain_y = -60) +\
       v313.trim(1, -1).autolevels(gamma = 0.7).colorYUV(off_y = 16, gain_y = -60) +\
       v313.trim(2, 25) +\
       v313.trim(26, -1).autolevels(gamma = 0.5).colorYUV(off_y = 16, gain_y = -50) +\
       v313.trim(27, -1).autolevels(gamma = 0.5).colorYUV(off_y = 16, gain_y = -50) +\
       v313.trim(28, 0)
#return v313.histogram.assumeFPS(12).prefetch

v314 = full.trim(17289, 17384)
v314 = v314.crop(left + 60, top + 20, right + 60, bot + 20)
v314 = v314.extractY.convertToYV24
v314 = v314.trim(0, -1).autolevels(input_low = 0, output_low = 0, input_high = 215, output_high = 255, autolevel = false) +\
       v314.trim(1, -1) +\
       v314.trim(2, -1).autolevels(input_low = 0, output_low = 0, input_high = 235, output_high = 255, autolevel = false) +\
       v314.trim(3, -1) +\
       v314.trim(4, 5).autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false) +\
       v314.trim(6, 0).autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v314.histogram.assumeFPS(12).prefetch

v315 = full.trim(17386, 17433)
v315 = v315.crop(left + 60, top + 20, right + 60, bot + 20)
v315 = v315.trim(0, 5).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v315.trim(6, 0)
#return v315.histogram.assumeFPS(12).prefetch

v316 = full.trim(17434, 17435)
v316 = v316.crop(left + 60, top + 20, right + 60, bot + 20)
#return v316.histogram.assumeFPS(12).prefetch

v317 = full.trim(17436, 17477)
v317 = v317.crop(left + 60, top + 20, right + 60, bot + 20)
v317 = v317.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v317.histogram.assumeFPS(12).prefetch

v318 = full.trim(17478, 17495)
v318 = v318.crop(left + 60, top + 20, right + 60, bot + 20)
v318 = v318.trim(0, 7).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v318.trim(8, 0)
#return v318.histogram.assumeFPS(12).prefetch

v319 = full.trim(17496, 17546)
v319 = v319.crop(left + 60, top + 20, right + 60, bot + 20)
v319 = v319.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v319.trim(2, 0)
#return v319.histogram.assumeFPS(12).prefetch
*/
v320 = full.trim(17547, 17718)
v320 = v320.crop(left + 60, top + 20, right + 60, bot + 20)
#return v320.histogram.assumeFPS(12).prefetch
/*
v321 = full.trim(17719, 17802)
v321 = v321.crop(left + 60, top + 20, right + 60, bot + 20)
#return v321.histogram.assumeFPS(12).prefetch

# 17478, 17496, 17547, 17719, 17803, 17860, 17920, 17928, 17931, 18017, 18031, 18061, 18134, 18203, 18341, 18396, 18447,  # 337
v322 = full.trim(17803, 17859)
v322 = v322.crop(left + 60, top + 20, right + 60, bot + 20)
#v322 = v322.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v322 = v322.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v322.trim(2, 0)
#v322 = v322.trim(0, 7).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v322.trim(8, 0)
#v322 = v322.trim(0, 68) +\
#       v322.trim(69, 0).convertToYV24.deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v322.histogram.assumeFPS(12).prefetch
#return v322.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 289

v289 = LSMASHVideoSource(dst_dir + "v289f.mp4").ConvertToYV24()
b_ex = undefined
v289o = v289
v289 = v289.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v289i = v289
v289 = expr(v289.extractY, v289.extractU, v289.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v289 = v289.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v289a = v289i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v289i.interleave(v289).hist_levels.prefetch
v289 = v289.adjustSize
v289 = v289.assumeFPS(18)
v289 = v289.add_blank_audio
return v289.prefetch
#adjustframerate

v290 = LSMASHVideoSource(dst_dir + "v290f.mp4").ConvertToYV24()
b_ex = undefined
v290o = v290
v290 = v290.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v290i = v290
v290 = expr(v290.extractY, v290.extractU, v290.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v290 = v290.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v290a = v290i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v290i.interleave(v290).hist_levels.prefetch
v290 = v290.adjustSize
v290 = v290.assumeFPS(18)
v290 = v290.add_blank_audio
return v290.prefetch
#adjustframerate

v291 = LSMASHVideoSource(dst_dir + "v291f.mp4").ConvertToYV24()
b_ex = undefined
v291o = v291
v291 = v291.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v291i = v291
v291 = expr(v291.extractY, v291.extractU, v291.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v291 = v291.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v291a = v291i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v291i.interleave(v291).hist_levels.prefetch
v291 = v291.adjustSize
v291 = v291.assumeFPS(18)
v291 = v291.add_blank_audio
return v291.prefetch
#adjustframerate

v292 = LSMASHVideoSource(dst_dir + "v292f.mp4").ConvertToYV24()
b_ex = undefined
v292o = v292
v292 = v292.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v292i = v292
v292 = expr(v292.extractY, v292.extractU, v292.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v292 = v292.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v292a = v292i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v292i.interleave(v292).hist_levels.prefetch
v292 = v292.adjustSize
v292 = v292.assumeFPS(18)
v292 = v292.add_blank_audio
return v292.prefetch
#adjustframerate

v293 = LSMASHVideoSource(dst_dir + "v293f.mp4").ConvertToYV24()
b_ex = undefined
v293o = v293
v293 = v293.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v293i = v293
v293 = expr(v293.extractY, v293.extractU, v293.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v293 = v293.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v293a = v293i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v293i.interleave(v293).hist_levels.prefetch
v293 = v293.adjustSize
v293 = v293.assumeFPS(18)
v293 = v293.add_blank_audio
return v293.prefetch
#adjustframerate

v294 = LSMASHVideoSource(dst_dir + "v294f.mp4").ConvertToYV24()
b_ex = undefined
v294o = v294
v294 = v294.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v294i = v294
v294 = expr(v294.extractY, v294.extractU, v294.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v294 = v294.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v294a = v294i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v294i.interleave(v294).hist_levels.prefetch
v294 = v294.adjustSize
v294 = v294.assumeFPS(18)
v294 = v294.add_blank_audio
return v294.prefetch
#adjustframerate

v295 = LSMASHVideoSource(dst_dir + "v295f.mp4").ConvertToYV24()
b_ex = undefined
v295o = v295
v295 = v295.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v295i = v295
v295 = expr(v295.extractY, v295.extractU, v295.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v295 = v295.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v295a = v295i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v295i.interleave(v295).hist_levels.prefetch
v295 = v295.adjustSize
v295 = v295.assumeFPS(18)
v295 = v295.add_blank_audio
return v295.prefetch
#adjustframerate

v296 = LSMASHVideoSource(dst_dir + "v296f.mp4").ConvertToYV24()
b_ex = undefined
v296o = v296
v296 = v296.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v296i = v296
v296 = expr(v296.extractY, v296.extractU, v296.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v296 = v296.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v296a = v296i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v296i.interleave(v296).hist_levels.prefetch
v296 = v296.adjustSize
v296 = v296.assumeFPS(18)
v296 = v296.add_blank_audio
return v296.prefetch
#adjustframerate

v297 = LSMASHVideoSource(dst_dir + "v297f.mp4").ConvertToYV24()
b_ex = undefined
v297o = v297
v297 = v297.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v297i = v297
v297 = expr(v297.extractY, v297.extractU, v297.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v297 = v297.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v297a = v297i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v297i.interleave(v297).hist_levels.prefetch
v297 = v297.adjustSize
v297 = v297.assumeFPS(18)
v297 = v297.add_blank_audio
return v297.prefetch
#adjustframerate

v298 = LSMASHVideoSource(dst_dir + "v298f.mp4").ConvertToYV24()
b_ex = undefined
v298o = v298
v298 = v298.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v298i = v298
v298 = expr(v298.extractY, v298.extractU, v298.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v298 = v298.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v298a = v298i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v298i.interleave(v298).hist_levels.prefetch
v298 = v298.adjustSize
v298 = v298.assumeFPS(18)
v298 = v298.add_blank_audio
return v298.prefetch
#adjustframerate

v299 = LSMASHVideoSource(dst_dir + "v299f.mp4").ConvertToYV24()
b_ex = undefined
v299o = v299
v299 = v299.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v299i = v299
v299 = expr(v299.extractY, v299.extractU, v299.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v299 = v299.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v299a = v299i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v299i.interleave(v299).hist_levels.prefetch
v299 = v299.adjustSize
v299 = v299.assumeFPS(18)
v299 = v299.add_blank_audio
return v299.prefetch
#adjustframerate

v300 = LSMASHVideoSource(dst_dir + "v300f.mp4").ConvertToYV24()
b_ex = undefined
v300o = v300
v300 = v300.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v300i = v300
v300 = expr(v300.extractY, v300.extractU, v300.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v300 = v300.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v300a = v300i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v300i.interleave(v300).hist_levels.prefetch
v300 = v300.adjustSize
v300 = v300.assumeFPS(18)
v300 = v300.add_blank_audio
return v300.prefetch
#adjustframerate

v301 = LSMASHVideoSource(dst_dir + "v301f.mp4").ConvertToYV24()
b_ex = undefined
v301o = v301
v301 = v301.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v301i = v301
v301 = expr(v301.extractY, v301.extractU, v301.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v301 = v301.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v301a = v301i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v301i.interleave(v301).hist_levels.prefetch
v301 = v301.adjustSize
v301 = v301.assumeFPS(18)
v301 = v301.add_blank_audio
return v301.prefetch
#adjustframerate

v302 = LSMASHVideoSource(dst_dir + "v302f.mp4").ConvertToYV24()
b_ex = undefined
v302o = v302
v302 = v302.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v302i = v302
v302 = expr(v302.extractY, v302.extractU, v302.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v302 = v302.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v302a = v302i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v302i.interleave(v302).hist_levels.prefetch
v302 = v302.adjustSize
v302 = v302.assumeFPS(18)
v302 = v302.add_blank_audio
return v302.prefetch
#adjustframerate

v303 = LSMASHVideoSource(dst_dir + "v303f.mp4").ConvertToYV24()
b_ex = undefined
v303o = v303
v303 = v303.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v303i = v303
v303 = expr(v303.extractY, v303.extractU, v303.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v303 = v303.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v303a = v303i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v303i.interleave(v303).hist_levels.prefetch
v303 = v303.adjustSize
v303 = v303.assumeFPS(18)
v303 = v303.add_blank_audio
return v303.prefetch
#adjustframerate

v304 = LSMASHVideoSource(dst_dir + "v304f.mp4").ConvertToYV24()
b_ex = undefined
v304o = v304
v304 = v304.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v304i = v304
v304 = expr(v304.extractY, v304.extractU, v304.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v304 = v304.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v304a = v304i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v304i.interleave(v304).hist_levels.prefetch
v304 = v304.adjustSize
v304 = v304.assumeFPS(18)
v304 = v304.add_blank_audio
return v304.prefetch
#adjustframerate

v305 = LSMASHVideoSource(dst_dir + "v305f.mp4").ConvertToYV24()
b_ex = undefined
v305o = v305
v305 = v305.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v305i = v305
v305 = expr(v305.extractY, v305.extractU, v305.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v305 = v305.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v305a = v305i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v305i.interleave(v305).hist_levels.prefetch
v305 = v305.adjustSize
v305 = v305.assumeFPS(18)
v305 = v305.add_blank_audio
return v305.prefetch
#adjustframerate

v306 = LSMASHVideoSource(dst_dir + "v306f.mp4").ConvertToYV24()
b_ex = undefined
v306o = v306
v306 = v306.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v306i = v306
v306 = expr(v306.extractY, v306.extractU, v306.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v306 = v306.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v306a = v306i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v306i.interleave(v306).hist_levels.prefetch
v306 = v306.adjustSize
v306 = v306.assumeFPS(18)
v306 = v306.add_blank_audio
return v306.prefetch
#adjustframerate

v307 = LSMASHVideoSource(dst_dir + "v307f.mp4").ConvertToYV24()
b_ex = undefined
v307o = v307
v307 = v307.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v307i = v307
v307 = expr(v307.extractY, v307.extractU, v307.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v307 = v307.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v307a = v307i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v307i.interleave(v307).hist_levels.prefetch
v307 = v307.adjustSize
v307 = v307.assumeFPS(18)
v307 = v307.add_blank_audio
return v307.prefetch
#adjustframerate

v308 = LSMASHVideoSource(dst_dir + "v308f.mp4").ConvertToYV24()
b_ex = undefined
v308o = v308
v308 = v308.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v308i = v308
v308 = expr(v308.extractY, v308.extractU, v308.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v308 = v308.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v308a = v308i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v308i.interleave(v308).hist_levels.prefetch
v308 = v308.adjustSize
v308 = v308.assumeFPS(18)
v308 = v308.add_blank_audio
return v308.prefetch
#adjustframerate

v309 = LSMASHVideoSource(dst_dir + "v309f.mp4").ConvertToYV24()
b_ex = undefined
v309o = v309
v309 = v309.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v309i = v309
v309 = expr(v309.extractY, v309.extractU, v309.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v309 = v309.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v309a = v309i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v309i.interleave(v309).hist_levels.prefetch
v309 = v309.adjustSize
v309 = v309.assumeFPS(18)
v309 = v309.add_blank_audio
return v309.prefetch
#adjustframerate

v310 = LSMASHVideoSource(dst_dir + "v310f.mp4").ConvertToYV24()
b_ex = undefined
v310o = v310
v310 = v310.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v310i = v310
v310 = expr(v310.extractY, v310.extractU, v310.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v310 = v310.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v310a = v310i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v310i.interleave(v310).hist_levels.prefetch
v310 = v310.adjustSize
v310 = v310.assumeFPS(18)
v310 = v310.add_blank_audio
return v310.prefetch
#adjustframerate

v311 = LSMASHVideoSource(dst_dir + "v311f.mp4").ConvertToYV24()
b_ex = undefined
v311o = v311
v311 = v311.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v311i = v311
v311 = expr(v311.extractY, v311.extractU, v311.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v311 = v311.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v311a = v311i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v311i.interleave(v311).hist_levels.prefetch
v311 = v311.adjustSize
v311 = v311.assumeFPS(18)
v311 = v311.add_blank_audio
return v311.prefetch
#adjustframerate

v312 = LSMASHVideoSource(dst_dir + "v312f.mp4").ConvertToYV24()
b_ex = undefined
v312o = v312
v312 = v312.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v312i = v312
v312 = expr(v312.extractY, v312.extractU, v312.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v312 = v312.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v312a = v312i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v312i.interleave(v312).hist_levels.prefetch
v312 = v312.adjustSize
v312 = v312.assumeFPS(18)
v312 = v312.add_blank_audio
return v312.prefetch
#adjustframerate

v313 = LSMASHVideoSource(dst_dir + "v313f.mp4").ConvertToYV24()
b_ex = undefined
v313o = v313
v313 = v313.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v313i = v313
v313 = expr(v313.extractY, v313.extractU, v313.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v313 = v313.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v313a = v313i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v313i.interleave(v313).hist_levels.prefetch
v313 = v313.adjustSize
v313 = v313.assumeFPS(18)
v313 = v313.add_blank_audio
return v313.prefetch
#adjustframerate

v314 = LSMASHVideoSource(dst_dir + "v314f.mp4").ConvertToYV24()
b_ex = undefined
v314o = v314
v314 = v314.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v314i = v314
v314 = expr(v314.extractY, v314.extractU, v314.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v314 = v314.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v314a = v314i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v314i.interleave(v314).hist_levels.prefetch
v314 = v314.adjustSize
v314 = v314.assumeFPS(18)
v314 = v314.add_blank_audio
return v314.prefetch
#adjustframerate

v315 = LSMASHVideoSource(dst_dir + "v315f.mp4").ConvertToYV24()
b_ex = undefined
v315o = v315
v315 = v315.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v315i = v315
v315 = expr(v315.extractY, v315.extractU, v315.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v315 = v315.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v315a = v315i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v315i.interleave(v315).hist_levels.prefetch
v315 = v315.adjustSize
v315 = v315.assumeFPS(18)
v315 = v315.add_blank_audio
return v315.prefetch
#adjustframerate

v316 = LSMASHVideoSource(dst_dir + "v316f.mp4").ConvertToYV24()
b_ex = undefined
v316o = v316
v316 = v316.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v316i = v316
v316 = expr(v316.extractY, v316.extractU, v316.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v316 = v316.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v316a = v316i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v316i.interleave(v316).hist_levels.prefetch
v316 = v316.adjustSize
v316 = v316.assumeFPS(18)
v316 = v316.add_blank_audio
return v316.prefetch
#adjustframerate

v317 = LSMASHVideoSource(dst_dir + "v317f.mp4").ConvertToYV24()
b_ex = undefined
v317o = v317
v317 = v317.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v317i = v317
v317 = expr(v317.extractY, v317.extractU, v317.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v317 = v317.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v317a = v317i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v317i.interleave(v317).hist_levels.prefetch
v317 = v317.adjustSize
v317 = v317.assumeFPS(18)
v317 = v317.add_blank_audio
return v317.prefetch
#adjustframerate

v318 = LSMASHVideoSource(dst_dir + "v318f.mp4").ConvertToYV24()
b_ex = undefined
v318o = v318
v318 = v318.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v318i = v318
v318 = expr(v318.extractY, v318.extractU, v318.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v318 = v318.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v318a = v318i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v318i.interleave(v318).hist_levels.prefetch
v318 = v318.adjustSize
v318 = v318.assumeFPS(18)
v318 = v318.add_blank_audio
return v318.prefetch
#adjustframerate

v319 = LSMASHVideoSource(dst_dir + "v319f.mp4").ConvertToYV24()
b_ex = undefined
v319o = v319
v319 = v319.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v319i = v319
v319 = expr(v319.extractY, v319.extractU, v319.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v319 = v319.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v319a = v319i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v319i.interleave(v319).hist_levels.prefetch
v319 = v319.adjustSize
v319 = v319.assumeFPS(18)
v319 = v319.add_blank_audio
return v319.prefetch
#adjustframerate

v320 = LSMASHVideoSource(dst_dir + "v320f.mp4").ConvertToYV24()
#v320 = v320.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v320 = v320.trim(105, -1).loop(v320.frameCount).crop(0, 0, -(v320.width - add_width), 0).stackHorizontal(v320)
#return v320.histogram.prefetch
v320o = v320
v320 = v320.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
#v320 = v320.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v320.hist_levels.prefetch
#v320 = v320.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v320 = expr(v320.extractY, v320.extractU, v320.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v320i = v320
#v320 = v320.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v320 = expr(v320.extractY, v320.extractU, v320.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v320 = v320.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v320a = v320i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#v320 = v320.crop(add_width, 0, 0, 0)
#v320i = v320i.crop(add_width, 0, 0, 0)
#v320a = v320a.crop(add_width, 0, 0, 0)
#v320 = v320.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v320 = v320.colorYUV(off_u = +2, off_v = -2)
#v320 = v320i
#return v320i.interleave(v320).hist_levels.prefetch
v320 = v320.adjustSize
v320 = v320.assumeFPS(18)
v320 = v320.add_blank_audio
return v320.prefetch
#adjustframerate

#******

*/
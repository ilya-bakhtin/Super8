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
#skip/merge (18615, 18658)
# 18396, 18447, 18474, 18529, 18564, 18575, 18602, 18615, 18659, 18714, 18863, 19066, 19125, 19243, 19334, 19351, 19479,  # 354
# 19596, 19629, 19730, 19822, 19954, 20033, 20070, 20164, 20196, 20340, 20472, 20650, 20817, 20996, 21088, 21192, 21347,  # 371
# 21370, 21429, 21457, 21534, 21584, 21620, 21678, 21786, 21903, 21997, 22042, 22097, 22140, 22217, 22311, 22350, 22469,  # 388
# 22562, 22700, 22789, 22860, 22985, 23052, 23121, 23258, 23398, 23559, 23569, 23698, 23702, 23769, 23890, 23971, 24067,  # 405

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
v353 = full.trim(19954, 20032)
v353 = v353.crop(left + 60, top + 20, right + 60, bot + 20)
v353 = v353.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v353.trim(2, 0)
v353 = v353.trim(0, 75) +\
       v353.trim(76, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v353.histogram.assumeFPS(18).prefetch
#return v353.colorYUV(gain_y = 80).hist_levels.prefetch

v354 = full.trim(20034, 20069)
v354 = v354.crop(left + 60, top + 20, right + 60, bot + 20)
v354 = v354.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v354.trim(5, 0)
#return v354.histogram.assumeFPS(18).prefetch
#return v354.colorYUV(gain_y = 80).hist_levels.prefetch

v355 = full.trim(20070, 20163)
v355 = v355.crop(left + 60, top + 20, right + 60, bot + 20)
v355 = v355.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v355.trim(3, 0)
#return v355.histogram.assumeFPS(18).prefetch
#return v355.colorYUV(gain_y = 80).hist_levels.prefetch

v356 = full.trim(20164, 20195)
v356 = v356.crop(left + 60, top + 20, right + 60, bot + 20)
v356 = v356.trim(0, 2).deflickOverlapped(step = 200, radius = 2, toward_darkest = true, right2left = false) +\
       v356.trim(3, 0)
#return v356.histogram.assumeFPS(18).prefetch
#return v356.colorYUV(gain_y = 80).hist_levels.prefetch

v357 = full.trim(20196, 20339)
v357 = v357.crop(left + 60, top + 20, right + 60, bot + 20)
v357 = v357.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v357.trim(2, 0)
#return v357.histogram.assumeFPS(18).prefetch
#return v357.colorYUV(gain_y = 80).hist_levels.prefetch

v358 = full.trim(20340, 20471)
v358 = v358.crop(left + 60, top + 20, right + 60, bot + 20)
v358 = v358.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v358.trim(3, 0)
#v358 = v358.autogamma(filterRadius = 0)
v358 = v358.trim(0, 61).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 0.6) +\
       v358.trim(62, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 0.61) +\
       v358.trim(63, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 0.64) +\
       v358.trim(64, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 0.78) +\
       v358.trim(65, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.2). \
                         autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 248) +\
       v358.trim(66, 67).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.8). \
                         autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 248) +\
       v358.trim(68, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.2). \
                         autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 248) +\
       v358.trim(69, 70).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.0). \
                         autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 248) +\
       v358.trim(71, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.2) +\
       v358.trim(72, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.4) +\
       v358.trim(73, -1).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.4) +\
       v358.trim(74, 0).autolevels(ignore_low = 0.0001, ignore_high = 0.0001, filterRadius=0, gamma = 1.2)
v358 = v358.extractY.convertToYV24
#return v358.histogram.assumeFPS(18).prefetch
#return v358.colorYUV(gain_y = 80).hist_levels.prefetch

v359 = full.trim(20472, 20649)
v359 = v359.crop(left + 60, top + 20, right + 60, bot + 20)
v359 = v359.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v359.trim(3, 0)
#return v359.histogram.assumeFPS(18).prefetch
#return v359.colorYUV(gain_y = 80).hist_levels.prefetch

v360 = full.trim(20650, 20816)
v360 = v360.crop(left + 60, top + 20, right + 60, bot + 20)
v360 = v360.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v360.trim(3, 0)
#return v360.histogram.assumeFPS(18).prefetch
#return v360.colorYUV(gain_y = 80).hist_levels.prefetch

v361 = full.trim(20817, 20995)
v361 = v361.crop(left + 60, top + 20, right + 60, bot + 20).trim(0, 61) +\
       v361.crop(left + 60, top + 80, right + 60, bot + 80).trim(62, -1) +\
       v361.crop(left + 60, top + 20, right + 60, bot + 20).trim(63, 0)
v361 = v361.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v361.trim(3, 0)
#return v361.histogram.assumeFPS(18).prefetch
#return v361.colorYUV(gain_y = 80).hist_levels.prefetch

v362 = full.trim(20996, 21087)
v362 = v362.crop(left + 60, top + 20, right + 60, bot + 20)
v362 = v362.trim(0, 5).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v362.trim(6, 0)
#return v362.histogram.assumeFPS(18).prefetch
#return v362.colorYUV(gain_y = 80).hist_levels.prefetch

v363 = full.trim(21088, 21191)
v363 = v363.crop(left + 60, top + 20, right + 60, bot + 20)
v363 = v363.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v363.trim(2, 0)
#return v363.histogram.assumeFPS(18).prefetch
#return v363.colorYUV(gain_y = 80).hist_levels.prefetch

v364 = full.trim(21192, 21346)
v364 = v364.crop(left + 60, top + 20, right + 60, bot + 20).trim(0, 1) +\
       v364.crop(left + 60, top + 0, right + 60, bot + 0).trim(2, -1) +\
       v364.crop(left + 60, top - 40, right + 60, bot - 40).trim(3, -1) +\
       v364.crop(left + 60, top - 60, right + 60, bot - 60).trim(4, -1) +\
       v364.crop(left + 60, top + 20, right + 60, bot + 20).trim(5, 0)
v364 = v364.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v364.trim(3, 0)
v364 = v364.trim(0, 3) +\
       v364.trim(3, 5).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v364.trim(5, 0)
#return v364.histogram.assumeFPS(18).prefetch
#return v364.colorYUV(gain_y = 80).hist_levels.prefetch

v365 = full.trim(21347, 21369)
v365 = v365.crop(left + 60, top + 20, right + 60, bot + 20)
v365 = v365.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v365.trim(4, 0)
#return v365.histogram.assumeFPS(18).prefetch
#return v365.colorYUV(gain_y = 80).hist_levels.prefetch

v366 = full.trim(21370, 21428)
v366 = v366.crop(left + 60, top + 20, right + 60, bot + 20)
v366 = v366.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
      v366.trim(3, 0)
#return v366.histogram.assumeFPS(18).prefetch
#return v366.colorYUV(gain_y = 80).hist_levels.prefetch

v367 = full.trim(21429, 21456)
v367 = v367.crop(left + 60, top + 20, right + 60, bot + 20)
v367 = v367.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
      v367.trim(3, 0)
#return v367.histogram.assumeFPS(18).prefetch
#return v367.colorYUV(gain_y = 80).hist_levels.prefetch

v368 = full.trim(21457, 21533)
v368 = v368.crop(left + 60, top + 0, right + 60, bot + 0).trim(0, 3) +\
       v368.crop(left + 60, top - 70, right + 60, bot - 70).trim(4, -1) +\
       v368.crop(left + 60, top - 50, right + 60, bot - 50).trim(5, -1) +\
       v368.crop(left + 60, top + 20, right + 60, bot + 20).trim(6, 0)
v368 = v368.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
     v368.trim(3, 0)
v368 = v368.trim(0, 3) +\
       v368.trim(3, 5).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v368.trim(5, 0)
v368 = v368.trim(0, 74) +\
       v368.trim(75, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v368.histogram.assumeFPS(18).prefetch
#return v368.colorYUV(gain_y = 80).hist_levels.prefetch

v369 = full.trim(21534, 21583)
v369 = v369.crop(left + 60, top + 0, right + 60, bot + 0)
v369 = v369.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v369.trim(3, 0)
#return v369.histogram.assumeFPS(18).prefetch
#return v369.colorYUV(gain_y = 80).hist_levels.prefetch

v370 = full.trim(21584, 21619)
v370 = v370.crop(left + 60, top + 0, right + 60, bot + 0)
v370 = v370.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v370.trim(2, 0)
v370 = v370.trim(0, 33) +\
       v370.trim(34, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v370.histogram.assumeFPS(18).prefetch
#return v370.colorYUV(gain_y = 80).hist_levels.prefetch

v371 = full.trim(21620, 21677)
v371 = v371.crop(left + 60, top + 0, right + 60, bot + 0)
v371 = v371.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v371.trim(2, 0)
#return v371.histogram.assumeFPS(18).prefetch
#return v371.colorYUV(gain_y = 80).hist_levels.prefetch

v372 = full.trim(21678, 21785)
v372 = v372.crop(left + 60, top + 0, right + 60, bot + 0)
#return v372.histogram.assumeFPS(18).prefetch
#return v372.colorYUV(gain_y = 80).hist_levels.prefetch

v373 = full.trim(21786, 21902)
v373 = v373.crop(left + 60, top + 0, right + 60, bot + 0)
v373 = v373.trim(0, 6).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v373.trim(7, 0)
v373 = v373.trim(0, 22) +\
       v373.trim(22, 25).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v373.trim(25, 46) +\
       v373.trim(46, 50).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 3) +\
       v373.trim(50, 71) +\
       v373.trim(71, 74).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v373.trim(74, 95) +\
       v373.trim(95, 99).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 3) +\
       v373.trim(99, 0)
#return v373.histogram.assumeFPS(18).prefetch
#return v373.colorYUV(gain_y = 80).hist_levels.prefetch

v374 = full.trim(21903, 21996)
v374 = v374.crop(left + 60, top + 0, right + 60, bot + 0)
v374 = v374.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v374.trim(4, 0)
v374 = v374.trim(0, 3) +\
       v374.trim(3, 7).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 3) +\
       v374.trim(7, 54) +\
       v374.trim(54, 56).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v374.trim(56, 91) +\
       v374.trim(92, 0).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false)
#return v374.histogram.assumeFPS(18).prefetch
#return v374.colorYUV(gain_y = 80).hist_levels.prefetch

v375 = full.trim(21997, 22041)
v375 = v375.crop(left + 60, top + 0, right + 60, bot + 0)
v375 = v375.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v375.trim(2, 0)
v375 = v375.trim(0, 8) +\
       v375.trim(8, 10).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v375.trim(10, 11) +\
       v375.trim(11, 14).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v375.trim(14, 33) +\
       v375.trim(33, 36).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v375.trim(36, 37).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false) +\
       v375.trim(37, 40).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v375.trim(40, 0)
#return v375.histogram.assumeFPS(18).prefetch
#return v375.colorYUV(gain_y = 80).hist_levels.prefetch

v376 = full.trim(22042, 22096)
v376 = v376.crop(left + 60, top + 0, right + 60, bot + 0)
v376 = v376.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v376.trim(5, 0)
v376 = v376.trim(0, 18) +\
       v376.trim(18, 21).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v376.trim(21, 41) +\
       v376.trim(41, 43).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v376.trim(43, 44) +\
       v376.trim(44, 47).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v376.trim(47, 0)
#return v376.histogram.assumeFPS(18).prefetch
#return v376.colorYUV(gain_y = 80).hist_levels.prefetch

v377 = full.trim(22097, 22139)
v377 = v377.crop(left + 60, top + 0, right + 60, bot + 0)
v377 = v377.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v377.trim(3, 0)
v377 = v377.trim(0, 16) +\
       v377.trim(16, 18).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v377.trim(18, 0)
#return v377.histogram.assumeFPS(18).prefetch
#return v377.colorYUV(gain_y = 80).hist_levels.prefetch

v378 = full.trim(22140, 22216)
v378 = v378.crop(left + 60, top + 0, right + 60, bot + 0)
v378 = v378.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v378.trim(4, 0)
v378 = v378.trim(0, 27) +\
       v378.trim(27, 29).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v378.trim(29, 54) +\
       v378.trim(54, 57).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v378.trim(57, 0)
#return v378.histogram.assumeFPS(18).prefetch
#return v378.colorYUV(gain_y = 80).hist_levels.prefetch
*/
v379 = full.trim(22217, 22310)
v379 = v379.crop(left + 60, top + 0, right + 60, bot + 0)
v379 = v379.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v379.trim(3, 0)
v379 = v379.trim(0, 4) +\
       v379.trim(4, 7).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v379.trim(7, 29) +\
       v379.trim(29, 31).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v379.trim(31, 32) +\
       v379.trim(32, 35).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v379.trim(35, 60) +\
       v379.trim(60, 63).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v379.trim(63, 88) +\
       v379.trim(88, 91).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v379.trim(91, 0)
#return v379.histogram.assumeFPS(18).prefetch
#return v379.colorYUV(gain_y = 80).hist_levels.prefetch
/*
v380 = full.trim(22311, 22349)
v380 = v380.crop(left + 60, top + 0, right + 60, bot + 0)
v380 = v380.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v380.trim(3, 0)
v380 = v380.trim(0, 23) +\
       v380.trim(23, 25).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, -1) +\
       v380.trim(25, 0)
#return v380.histogram.assumeFPS(18).prefetch
#return v380.colorYUV(gain_y = 80).hist_levels.prefetch

v381 = full.trim(22350, 22468)
v381 = v381.crop(left + 60, top + 0, right + 60, bot + 0)
v381 = v381.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v381.trim(4, 0)
v381 = v381.trim(0, 12) +\
       v381.trim(12, 15).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v381.trim(15, 41) +\
       v381.trim(41, 44).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v381.trim(44, 70) +\
       v381.trim(70, 73).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v381.trim(73, 100) +\
       v381.trim(100, 103).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v381.trim(103, 116) +\
       v381.trim(117, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v381.histogram.assumeFPS(18).prefetch
#return v381.colorYUV(gain_y = 80).hist_levels.prefetch

v382 = full.trim(22469, 22561)
v382 = v382.crop(left + 60, top + 0, right + 60, bot + 0)
v382 = v382.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v382.trim(3, 0)
v382 = v382.trim(0, 10) +\
       v382.trim(10, 13).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v382.trim(13, 40) +\
       v382.trim(40, 43).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v382.trim(43, 70) +\
       v382.trim(70, 73).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v382.trim(73, 90) +\
       v382.trim(91, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v382.histogram.assumeFPS(18).prefetch
#return v382.colorYUV(gain_y = 80).hist_levels.prefetch

v383 = full.trim(22562, 22699)
v383 = v383.crop(left + 60, top + 0, right + 60, bot + 0).trim(0, -1) +\
       v383.crop(left + 60, top - 60, right + 60, bot - 60).trim(1, -1) +\
       v383.crop(left + 60, top + 0, right + 60, bot + 0).trim(2, 0)
v383 = v383.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v383.trim(5, 0)
v383 = v383.trim(0, 7) +\
       v383.trim(7, 10).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v383.trim(10, 38) +\
       v383.trim(38, 41).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v383.trim(41, 68) +\
       v383.trim(68, 71).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v383.trim(71, 99) +\
       v383.trim(99, 102).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v383.trim(102, 130) +\
       v383.trim(130, 134).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 3) +\
       v383.trim(134, 0)
#return v383.histogram.assumeFPS(18).prefetch
#return v383.colorYUV(gain_y = 80).hist_levels.prefetch

# 22562, 22700, 22789, 22860, 22985, 23052, 23121, 23258, 23398, 23559, 23569, 23698, 23702, 23769, 23890, 23971, 24067,  # 405
v384 = full.trim(22700, 22788)
v384 = v384.crop(left + 60, top + 0, right + 60, bot + 0)
#v384 = v384.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v384 = v384.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
#       v384.trim(2, 0)
v384 = v384.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v384.trim(3, 0)
#v384 = v384.trim(0, 33) +\
#       v384.trim(34, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
v384 = v384.trim(0, 24) +\
       v384.trim(24, 27).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v384.trim(27, 56) +\
       v384.trim(56, 59).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false).trim(1, 2) +\
       v384.trim(59, 84) +\
       v384.trim(85, 0).deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v384.histogram.assumeFPS(18).prefetch
#return v384.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 353

v353 = LSMASHVideoSource(dst_dir + "v353f.mp4").ConvertToYV24()
b_ex = undefined
v353o = v353
v353 = v353.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v353i = v353
v353 = expr(v353.extractY, v353.extractU, v353.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v353 = v353.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v353a = v353i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v353i.interleave(v353).hist_levels.prefetch
v353 = v353.adjustSize
v353 = v353.assumeFPS(18)
v353 = v353.add_blank_audio
return v353.prefetch
#adjustframerate

v354 = LSMASHVideoSource(dst_dir + "v354f.mp4").ConvertToYV24()
b_ex = undefined
v354o = v354
v354 = v354.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v354i = v354
v354 = expr(v354.extractY, v354.extractU, v354.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v354 = v354.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v354a = v354i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v354i.interleave(v354).hist_levels.prefetch
v354 = v354.adjustSize
v354 = v354.assumeFPS(18)
v354 = v354.add_blank_audio
return v354.prefetch
#adjustframerate

v355 = LSMASHVideoSource(dst_dir + "v355f.mp4").ConvertToYV24()
b_ex = undefined
v355o = v355
v355 = v355.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v355i = v355
v355 = expr(v355.extractY, v355.extractU, v355.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v355 = v355.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v355a = v355i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v355i.interleave(v355).hist_levels.prefetch
v355 = v355.adjustSize
v355 = v355.assumeFPS(18)
v355 = v355.add_blank_audio
return v355.prefetch
#adjustframerate

v356 = LSMASHVideoSource(dst_dir + "v356f.mp4").ConvertToYV24()
b_ex = undefined
v356o = v356
v356 = v356.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v356i = v356
v356 = expr(v356.extractY, v356.extractU, v356.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v356 = v356.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v356a = v356i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v356i.interleave(v356).hist_levels.prefetch
v356 = v356.adjustSize
v356 = v356.assumeFPS(18)
v356 = v356.add_blank_audio
return v356.prefetch
#adjustframerate

v357 = LSMASHVideoSource(dst_dir + "v357f.mp4").ConvertToYV24()
b_ex = undefined
v357o = v357
v357 = v357.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v357i = v357
v357 = expr(v357.extractY, v357.extractU, v357.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v357 = v357.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v357a = v357i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v357i.interleave(v357).hist_levels.prefetch
v357 = v357.adjustSize
v357 = v357.assumeFPS(18)
v357 = v357.add_blank_audio
return v357.prefetch
#adjustframerate

v358 = LSMASHVideoSource(dst_dir + "v358f.mp4").ConvertToYV24()
b_ex = undefined
#return v358.histogram.prefetch
v358o = v358
v358 = v358.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v358i = v358
v358 = expr(v358.extractY, v358.extractU, v358.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v358 = v358.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v358a = v358i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v358i.interleave(v358).hist_levels.prefetch
v358 = v358.adjustSize
v358 = v358.assumeFPS(18)
v358 = v358.add_blank_audio
return v358.prefetch
#adjustframerate

v359 = LSMASHVideoSource(dst_dir + "v359f.mp4").ConvertToYV24()
b_ex = undefined
v359o = v359
v359 = v359.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v359i = v359
v359 = expr(v359.extractY, v359.extractU, v359.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v359 = v359.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v359a = v359i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v359i.interleave(v359).hist_levels.prefetch
v359 = v359.adjustSize
v359 = v359.assumeFPS(18)
v359 = v359.add_blank_audio
return v359.prefetch
#adjustframerate

v360 = LSMASHVideoSource(dst_dir + "v360f.mp4").ConvertToYV24()
b_ex = undefined
v360o = v360
v360 = v360.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v360i = v360
v360 = expr(v360.extractY, v360.extractU, v360.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v360 = v360.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v360a = v360i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v360i.interleave(v360).hist_levels.prefetch
v360 = v360.adjustSize
v360 = v360.assumeFPS(18)
v360 = v360.add_blank_audio
return v360.prefetch
#adjustframerate

v361 = LSMASHVideoSource(dst_dir + "v361f.mp4").ConvertToYV24()
b_ex = undefined
v361o = v361
v361 = v361.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v361i = v361
v361 = expr(v361.extractY, v361.extractU, v361.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v361 = v361.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v361a = v361i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v361i.interleave(v361).hist_levels.prefetch
v361 = v361.adjustSize
v361 = v361.assumeFPS(18)
v361 = v361.add_blank_audio
return v361.prefetch
#adjustframerate

v362 = LSMASHVideoSource(dst_dir + "v362f.mp4").ConvertToYV24()
b_ex = undefined
v362o = v362
v362 = v362.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v362i = v362
v362 = expr(v362.extractY, v362.extractU, v362.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v362 = v362.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v362a = v362i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v362i.interleave(v362).hist_levels.prefetch
v362 = v362.adjustSize
v362 = v362.assumeFPS(18)
v362 = v362.add_blank_audio
return v362.prefetch
#adjustframerate

v363 = LSMASHVideoSource(dst_dir + "v363f.mp4").ConvertToYV24()
b_ex = undefined
v363o = v363
v363 = v363.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v363i = v363
v363 = expr(v363.extractY, v363.extractU, v363.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v363 = v363.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v363a = v363i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v363i.interleave(v363).hist_levels.prefetch
v363 = v363.adjustSize
v363 = v363.assumeFPS(18)
v363 = v363.add_blank_audio
return v363.prefetch
#adjustframerate

v364 = LSMASHVideoSource(dst_dir + "v364f.mp4").ConvertToYV24()
b_ex = undefined
v364o = v364
v364 = v364.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v364i = v364
v364 = expr(v364.extractY, v364.extractU, v364.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v364 = v364.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v364a = v364i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v364i.interleave(v364).hist_levels.prefetch
v364 = v364.adjustSize
v364 = v364.assumeFPS(18)
v364 = v364.add_blank_audio
return v364.prefetch
#adjustframerate

v365 = LSMASHVideoSource(dst_dir + "v365f.mp4").ConvertToYV24()
b_ex = undefined
v365o = v365
v365 = v365.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v365i = v365
v365 = expr(v365.extractY, v365.extractU, v365.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v365 = v365.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v365a = v365i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v365i.interleave(v365).hist_levels.prefetch
v365 = v365.adjustSize
v365 = v365.assumeFPS(18)
v365 = v365.add_blank_audio
return v365.prefetch
#adjustframerate

v366 = LSMASHVideoSource(dst_dir + "v366f.mp4").ConvertToYV24()
b_ex = undefined
v366o = v366
v366 = v366.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v366i = v366
v366 = expr(v366.extractY, v366.extractU, v366.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v366 = v366.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v366a = v366i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v366i.interleave(v366).hist_levels.prefetch
v366 = v366.adjustSize
v366 = v366.assumeFPS(18)
v366 = v366.add_blank_audio
return v366.prefetch
#adjustframerate

v367 = LSMASHVideoSource(dst_dir + "v367f.mp4").ConvertToYV24()
b_ex = undefined
v367o = v367
v367 = v367.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v367i = v367
v367 = expr(v367.extractY, v367.extractU, v367.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v367 = v367.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v367a = v367i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v367i.interleave(v367).hist_levels.prefetch
v367 = v367.adjustSize
v367 = v367.assumeFPS(18)
v367 = v367.add_blank_audio
return v367.prefetch
#adjustframerate

v368 = LSMASHVideoSource(dst_dir + "v368f.mp4").ConvertToYV24()
b_ex = undefined
v368o = v368
v368 = v368.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v368i = v368
v368 = expr(v368.extractY, v368.extractU, v368.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v368 = v368.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v368a = v368i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v368i.interleave(v368).hist_levels.prefetch
v368 = v368.adjustSize
v368 = v368.assumeFPS(18)
v368 = v368.add_blank_audio
return v368.prefetch
#adjustframerate

v369 = LSMASHVideoSource(dst_dir + "v369f.mp4").ConvertToYV24()
b_ex = undefined
v369o = v369
v369 = v369.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v369i = v369
v369 = expr(v369.extractY, v369.extractU, v369.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v369 = v369.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v369a = v369i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v369i.interleave(v369).hist_levels.prefetch
v369 = v369.adjustSize
v369 = v369.assumeFPS(18)
v369 = v369.add_blank_audio
return v369.prefetch
#adjustframerate

v370 = LSMASHVideoSource(dst_dir + "v370f.mp4").ConvertToYV24()
b_ex = undefined
v370o = v370
v370 = v370.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v370i = v370
v370 = expr(v370.extractY, v370.extractU, v370.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v370 = v370.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v370a = v370i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v370i.interleave(v370).hist_levels.prefetch
v370 = v370.adjustSize
v370 = v370.assumeFPS(18)
v370 = v370.add_blank_audio
return v370.prefetch
#adjustframerate

v371 = LSMASHVideoSource(dst_dir + "v371f.mp4").ConvertToYV24()
b_ex = undefined
v371o = v371
v371 = v371.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v371i = v371
v371 = expr(v371.extractY, v371.extractU, v371.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v371 = v371.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v371a = v371i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v371i.interleave(v371).hist_levels.prefetch
v371 = v371.adjustSize
v371 = v371.assumeFPS(18)
v371 = v371.add_blank_audio
return v371.prefetch
#adjustframerate

v372 = LSMASHVideoSource(dst_dir + "v372f.mp4").ConvertToYV24()
b_ex = undefined
v372o = v372
v372 = v372.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v372i = v372
v372 = expr(v372.extractY, v372.extractU, v372.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v372 = v372.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v372a = v372i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v372i.interleave(v372).hist_levels.prefetch
v372 = v372.adjustSize
v372 = v372.assumeFPS(18)
v372 = v372.add_blank_audio
return v372.prefetch
#adjustframerate

v373 = LSMASHVideoSource(dst_dir + "v373f.mp4").ConvertToYV24()
b_ex = undefined
v373o = v373
v373 = v373.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v373i = v373
v373 = expr(v373.extractY, v373.extractU, v373.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v373 = v373.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v373a = v373i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v373i.interleave(v373).hist_levels.prefetch
v373 = v373.adjustSize
v373 = v373.assumeFPS(18)
v373 = v373.add_blank_audio
return v373.prefetch
#adjustframerate

v374 = LSMASHVideoSource(dst_dir + "v374f.mp4").ConvertToYV24()
b_ex = undefined
v374o = v374
v374 = v374.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v374i = v374
v374 = expr(v374.extractY, v374.extractU, v374.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v374 = v374.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v374a = v374i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v374i.interleave(v374).hist_levels.prefetch
v374 = v374.adjustSize
v374 = v374.assumeFPS(18)
v374 = v374.add_blank_audio
return v374.prefetch
#adjustframerate

v375 = LSMASHVideoSource(dst_dir + "v375f.mp4").ConvertToYV24()
b_ex = undefined
v375o = v375
v375 = v375.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v375i = v375
v375 = expr(v375.extractY, v375.extractU, v375.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v375 = v375.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v375a = v375i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v375i.interleave(v375).hist_levels.prefetch
v375 = v375.adjustSize
v375 = v375.assumeFPS(18)
v375 = v375.add_blank_audio
return v375.prefetch
#adjustframerate

v376 = LSMASHVideoSource(dst_dir + "v376f.mp4").ConvertToYV24()
b_ex = undefined
v376o = v376
v376 = v376.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v376i = v376
v376 = expr(v376.extractY, v376.extractU, v376.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v376 = v376.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v376a = v376i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v376i.interleave(v376).hist_levels.prefetch
v376 = v376.adjustSize
v376 = v376.assumeFPS(18)
v376 = v376.add_blank_audio
return v376.prefetch
#adjustframerate

v377 = LSMASHVideoSource(dst_dir + "v377f.mp4").ConvertToYV24()
b_ex = undefined
v377o = v377
v377 = v377.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v377i = v377
v377 = expr(v377.extractY, v377.extractU, v377.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v377 = v377.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v377a = v377i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v377i.interleave(v377).hist_levels.prefetch
v377 = v377.adjustSize
v377 = v377.assumeFPS(18)
v377 = v377.add_blank_audio
return v377.prefetch
#adjustframerate

v378 = LSMASHVideoSource(dst_dir + "v378f.mp4").ConvertToYV24()
b_ex = undefined
v378o = v378
v378 = v378.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v378i = v378
v378 = expr(v378.extractY, v378.extractU, v378.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v378 = v378.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v378a = v378i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v378i.interleave(v378).hist_levels.prefetch
v378 = v378.adjustSize
v378 = v378.assumeFPS(18)
v378 = v378.add_blank_audio
return v378.prefetch
#adjustframerate

v379 = LSMASHVideoSource(dst_dir + "v379f.mp4").ConvertToYV24()
b_ex = undefined
v379o = v379
v379 = v379.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v379i = v379
v379 = expr(v379.extractY, v379.extractU, v379.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v379 = v379.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v379a = v379i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v379i.interleave(v379).hist_levels.prefetch
v379 = v379.adjustSize
v379 = v379.assumeFPS(18)
v379 = v379.add_blank_audio
return v379.prefetch
#adjustframerate

v380 = LSMASHVideoSource(dst_dir + "v380f.mp4").ConvertToYV24()
b_ex = undefined
v380o = v380
v380 = v380.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v380i = v380
v380 = expr(v380.extractY, v380.extractU, v380.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v380 = v380.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v380a = v380i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v380i.interleave(v380).hist_levels.prefetch
v380 = v380.adjustSize
v380 = v380.assumeFPS(18)
v380 = v380.add_blank_audio
return v380.prefetch
#adjustframerate

v381 = LSMASHVideoSource(dst_dir + "v381f.mp4").ConvertToYV24()
b_ex = undefined
v381o = v381
v381 = v381.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v381i = v381
v381 = expr(v381.extractY, v381.extractU, v381.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v381 = v381.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v381a = v381i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v381i.interleave(v381).hist_levels.prefetch
v381 = v381.adjustSize
v381 = v381.assumeFPS(18)
v381 = v381.add_blank_audio
return v381.prefetch
#adjustframerate

v382 = LSMASHVideoSource(dst_dir + "v382f.mp4").ConvertToYV24()
b_ex = undefined
v382o = v382
v382 = v382.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v382i = v382
v382 = expr(v382.extractY, v382.extractU, v382.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v382 = v382.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v382a = v382i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v382i.interleave(v382).hist_levels.prefetch
v382 = v382.adjustSize
v382 = v382.assumeFPS(18)
v382 = v382.add_blank_audio
return v382.prefetch
#adjustframerate

v383 = LSMASHVideoSource(dst_dir + "v383f.mp4").ConvertToYV24()
b_ex = undefined
v383o = v383
v383 = v383.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v383i = v383
v383 = expr(v383.extractY, v383.extractU, v383.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v383 = v383.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v383a = v383i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v383i.interleave(v383).hist_levels.prefetch
v383 = v383.adjustSize
v383 = v383.assumeFPS(18)
v383 = v383.add_blank_audio
return v383.prefetch
#adjustframerate

v384 = LSMASHVideoSource(dst_dir + "v384f.mp4").ConvertToYV24()
#v384 = v384.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v384 = v384.trim(105, -1).loop(v384.frameCount).crop(0, 0, -(v384.width - add_width), 0).stackHorizontal(v384)
#return v384.histogram.prefetch
v384o = v384
v384 = v384.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
#v384 = v384.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v384.hist_levels.prefetch
#v384 = v384.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v384 = expr(v384.extractY, v384.extractU, v384.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v384i = v384
#v384 = v384.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v384 = expr(v384.extractY, v384.extractU, v384.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v384 = v384.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v384a = v384i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#v384 = v384.crop(add_width, 0, 0, 0)
#v384i = v384i.crop(add_width, 0, 0, 0)
#v384a = v384a.crop(add_width, 0, 0, 0)
#v384 = v384.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v384 = v384.colorYUV(off_u = +2, off_v = -2)
#v384 = v384i
#return v384i.interleave(v384).hist_levels.prefetch
v384 = v384.adjustSize
v384 = v384.assumeFPS(18)
v384 = v384.add_blank_audio
return v384.prefetch
#adjustframerate

#******

*/
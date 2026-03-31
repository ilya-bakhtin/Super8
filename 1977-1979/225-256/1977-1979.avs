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
# 11971, 12071, 12162, 12291, 12405, 12431, 12499, 12529, 12545, 12675, 12700, 12753, 12946, 13067, 13184, 13396, 13455,  # 267

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
v225 = full.trim(10493, 10513)
v225 = v225.crop(left + 60, top + 10, right + 60, bot + 10)
v225 = v225.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v225.histogram.prefetch
#return v225.colorYUV(gain_y = 80).hist_levels.prefetch

v226 = full.trim(10514, 10534)
v226 = v226.crop(left + 60, top + 10, right + 60, bot + 10)
v226 = v226.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v226 = v226.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v226.trim(3, 0)
#return v226.histogram.prefetch
#return v226.colorYUV(gain_y = 80).hist_levels.prefetch

v227 = full.trim(10535, 10538)
v227 = v227.crop(left + 60, top + 10, right + 60, bot + 10)
v227 = v227.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v227 = v227.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v227.trim(2, 0)
#return v227.histogram.prefetch
#return v227.colorYUV(gain_y = 80).hist_levels.prefetch

v228 = full.trim(10539, 10640)
v228 = v228.crop(left + 60, top + 10, right + 60, bot + 10)
v228 = v228.trim(0, 9).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v228.trim(10, 0)
#return v228.histogram.prefetch
#return v228.colorYUV(gain_y = 80).hist_levels.prefetch

v229 = full.trim(10641, 10679)
v229 = v229.crop(left + 60, top + 10, right + 60, bot + 10)
v229 = v229.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v229.histogram.prefetch
#return v229.colorYUV(gain_y = 80).hist_levels.prefetch

v230 = full.trim(10680, 10719)
v230 = v230.crop(left + 60, top + 10, right + 60, bot + 10)
v230 = v230.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v230 = v230.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v230.trim(2, 0)
#return v230.histogram.prefetch
#return v230.colorYUV(gain_y = 80).hist_levels.prefetch

v231 = full.trim(10720, 10761)
v231 = v231.crop(left + 60, top + 10, right + 60, bot + 10)
v231 = v231.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v231 = v231.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v231.trim(2, 0)
#return v231.histogram.prefetch
#return v231.colorYUV(gain_y = 80).hist_levels.prefetch

v232 = full.trim(10762, 10858)
v232 = v232.trim(0, -1).crop(left + 60, top + 40, right + 60, bot + 40) +\
       v232.trim(1, 0).crop(left + 60, top + 10, right + 60, bot + 10)
v232 = v232.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v232 = v232.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v232.trim(2, 0)
#return v232.histogram.prefetch
#return v232.colorYUV(gain_y = 80).hist_levels.prefetch

v233 = full.trim(10859, 10883)
v233 = v233.crop(left + 60, top + 10, right + 60, bot + 10)
v233 = v233.trim(0, 5).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v233.trim(6, 0)
#return v233.histogram.prefetch
#return v233.colorYUV(gain_y = 80).hist_levels.prefetch

v234 = full.trim(10884, 10892)
v234 = v234.crop(left + 60, top + 10, right + 60, bot + 10)
v234 = v234.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v234.trim(2, 0)
#return v234.histogram.prefetch
#return v234.colorYUV(gain_y = 80).hist_levels.prefetch

v235 = full.trim(10893, 10934)
v235 = v235.crop(left + 60, top + 10, right + 60, bot + 10)
#return v235.histogram.prefetch
#return v235.colorYUV(gain_y = 80).hist_levels.prefetch

v236 = full.trim(10935, 10950)
v236 = v236.crop(left + 60, top + 10, right + 60, bot + 10)
v236 = v236.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v236.trim(2, 0)
#return v236.histogram.prefetch
#return v236.colorYUV(gain_y = 80).hist_levels.prefetch

v237 = full.trim(10951, 10974)
v237 = v237.crop(left + 60, top - 30, right + 60, bot - 30)
v237 = v237.trim(0, -1).autolevels(gamma = 1.4).colorYUV(off_Y = 8, gain_Y = -32) +\
       v237.trim(1, 0).autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v237.histogram.prefetch
#return v237.colorYUV(gain_y = 80).hist_levels.prefetch

v238 = full.trim(10975, 11008)
v238 = v238.crop(left + 60, top - 30, right + 60, bot - 30)
v238 = v238.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v238.trim(2, 0)
#return v238.histogram.prefetch
#return v238.colorYUV(gain_y = 80).hist_levels.prefetch

v239 = full.trim(11009, 11013)
v239 = v239.crop(left + 60, top - 30, right + 60, bot - 30)
v239 = v239.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v239 = v239.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v239.trim(2, 0)
#return v239.histogram.prefetch
#return v239.colorYUV(gain_y = 80).hist_levels.prefetch

v240 = full.trim(11014, 11178)
v240 = v240.crop(left + 60, top - 30, right + 60, bot - 30)
v240 = v240.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v240 = v240.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v240.trim(4, 0)
#return v240.histogram.prefetch
#return v240.colorYUV(gain_y = 80).hist_levels.prefetch

v241 = full.trim(11180, 11208)
v241 = v241.crop(left + 60, top - 30, right + 60, bot - 30)
v241 = v241.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v241.trim(2, 0)
#return v241.histogram.prefetch
#return v241.colorYUV(gain_y = 80).hist_levels.prefetch

v242 = full.trim(11209, 11317)
v242 = v242.crop(left + 60, top - 30, right + 60, bot - 30).trim(0, 67) +\
       v242.crop(left + 60, top + 205, right + 60, bot + 100).stackVertical(v242.crop(left + 90, 110, right + 90, 105).colorYUV(gain_y = -32)).trim(68, -1) +\
       v242.crop(left + 60, top - 30, right + 60, bot - 30).trim(69, 0)
v242 = v242.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v242.trim(2, 0)
#return v242.histogram.prefetch
#return v242.colorYUV(gain_y = 80).hist_levels.prefetch

v243 = full.trim(11328, 11357)
v243 = v243.crop(left + 60, top - 30, right + 60, bot - 30)
v243 = v243.trim(0, 13).deflickOverlappedBck(step = 140, toward_darkest = true, right2left = false) +\
       v243.trim(14, 0)
#return v243.histogram.prefetch
#return v243.colorYUV(gain_y = 80).hist_levels.prefetch

v244 = full.trim(11359, 11459)
v244 = v244.crop(left + 60, top - 30, right + 60, bot - 30)
v244 = v244.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v244.trim(2, 0)
#return v244.histogram.prefetch
#return v244.colorYUV(gain_y = 80).hist_levels.prefetch

v245 = full.trim(11460, 11499)
v245 = v245.animate(37, 39, "crop", left + 60, top - 30, right + 60, bot - 30, left + 60, top + 30, right + 60, bot + 30)
v245 = v245.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v245.trim(2, 0)
#return v245.histogram.prefetch
#return v245.colorYUV(gain_y = 80).hist_levels.prefetch

v246 = full.trim(11501, 11580)
v246 = v246.animate(77, 79, "crop", left + 60, top - 30, right + 60, bot - 30, left + 60, top + 30, right + 60, bot + 30)
#return v246.histogram.prefetch
#return v246.colorYUV(gain_y = 80).hist_levels.prefetch

v247 = full.trim(11582, 11719)
v247 = v247.crop(left + 60, top - 30, right + 60, bot - 30)
v247 = v247.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 240, autolevel = false)
v247 = v247.trim(0, -1).colorYUV(gain_y = 64) +\
       v247.trim(1, 0)
#return v247.histogram.prefetch
#return v247.colorYUV(gain_y = 80).hist_levels.prefetch

v248 = full.trim(11720, 11811)
v248 = v248.crop(left + 60, top - 30, right + 60, bot - 30)
v248 = v248.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 247, autolevel = false)
v248 = v248.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v248.trim(2, 0)
#return v248.histogram.prefetch
#return v248.colorYUV(gain_y = 80).hist_levels.prefetch

v249 = full.trim(11812, 11873)
v249 = v249.crop(left + 60, top - 30, right + 60, bot - 30)
v249 = v249.trim(0, 1).deflickOverlapped(step = 140, radius = 1, toward_darkest = true, right2left = false) +\
       v249.trim(2, 0)
#return v249.histogram.prefetch
#return v249.colorYUV(gain_y = 80).hist_levels.prefetch

v250 = full.trim(11874, 11970)
v250 = v250.crop(left + 60, top - 30, right + 60, bot - 30)
v250 = v250.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v250.histogram.prefetch
#return v250.colorYUV(gain_y = 80).hist_levels.prefetch

v251 = full.trim(11972, 12070)
v251 = v251.crop(left + 60, top - 30, right + 60, bot - 30)
v251 = v251.trim(0, 9).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v251.trim(10, 0)
#return v251.histogram.prefetch
#return v251.colorYUV(gain_y = 80).hist_levels.prefetch

v252 = full.trim(12071, 12161)
v252 = v252.crop(left + 60, top - 30, right + 60, bot - 30)
v252 = v252.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v252.trim(2, 0)
#return v252.histogram.prefetch
#return v252.colorYUV(gain_y = 80).hist_levels.prefetch

v253 = full.trim(12162, 12290)
v253 = v253.crop(left + 60, top - 30, right + 60, bot - 30)
v253 = v253.trim(0, 6).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v253.trim(7, 0)
#return v253.histogram.prefetch
#return v253.colorYUV(gain_y = 80).hist_levels.prefetch

v254 = full.trim(12294, 12404)
v254 = v254.crop(left + 60, top - 30, right + 60, bot - 30)
#return v254.histogram.prefetch
#return v254.colorYUV(gain_y = 80).hist_levels.prefetch

v255 = full.trim(12405, 12426)
v255 = v255.crop(left + 60, top - 30, right + 60, bot - 30)
v255 = v255.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v255 = v255.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v255.trim(2, 0)
#v255 = v255.trim(0, 6).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
#       v255.trim(7, 0)
v255o = v0.trim(12448, 12456)
v255o = v255o.crop(160, 4, -160, -4)
#v255o = v255o.autolevels(input_low = 0, output_low = 0, input_high = 247, output_high = 255, autolevel = false)
v255o = v255o.colorYUV(off_u = 6, off_v = -0, gain_y = 240)
v255o = v255o.spline64resize(v255.width, v255.height, -30, -10, v255o.width + 70, v255o.height + 20)
v255 = v255 + v255o
#return v255.histogram.prefetch
#return v255.colorYUV(gain_y = 80).hist_levels.prefetch

# 11971, 12071, 12162, 12291, 12405, 12431, 12499, 12529, 12545, 12675, 12700, 12753, 12946, 13067, 13184, 13396, 13455,  # 267
v256 = full.trim(12432, 12498)
v256 = v256.crop(left + 60, top - 30, right + 60, bot - 30)
v256 = v256.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v256 = v256.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v256.trim(2, 0)
v256 = v256.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v256.trim(4, 0)
v256o = v0.trim(12458, 12459)
v256o = v256o.crop(160, 4, -160, -4)
#v256o = v256o.autolevels(input_low = 0, output_low = 0, input_high = 247, output_high = 255, autolevel = false)
v256o = v256o.colorYUV(off_u = 6, off_v = -0, gain_y = 256)
v256o = v256o.spline64resize(v256.width, v256.height, -30, -10, v256o.width + 70, v256o.height + 20)
v256 = v256o + v256
#return v256.histogram.prefetch
#return v256.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 225

v225 = LSMASHVideoSource(dst_dir + "v225f.mp4").ConvertToYV24()
b_ex = undefined
v225o = v225
v225 = v225.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v225i = v225
v225 = expr(v225.extractY, v225.extractU, v225.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v225 = v225.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v225a = v225i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v225i.interleave(v225).hist_levels.prefetch
v225 = v225.adjustSize
v225 = v225.assumeFPS(18)
v225 = v225.add_blank_audio
return v225.prefetch
#adjustframerate

v226 = LSMASHVideoSource(dst_dir + "v226f.mp4").ConvertToYV24()
b_ex = undefined
v226o = v226
v226 = v226.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v226i = v226
v226 = expr(v226.extractY, v226.extractU, v226.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v226 = v226.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v226a = v226i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v226i.interleave(v226).hist_levels.prefetch
v226 = v226.adjustSize
v226 = v226.assumeFPS(18)
v226 = v226.add_blank_audio
return v226.prefetch
#adjustframerate

v227 = LSMASHVideoSource(dst_dir + "v227f.mp4").ConvertToYV24()
b_ex = undefined
v227o = v227
v227 = v227.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v227i = v227
v227 = expr(v227.extractY, v227.extractU, v227.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v227 = v227.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v227a = v227i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v227i.interleave(v227).hist_levels.prefetch
v227 = v227.adjustSize
v227 = v227.assumeFPS(18)
v227 = v227.add_blank_audio
return v227.prefetch
#adjustframerate

v228 = LSMASHVideoSource(dst_dir + "v228f.mp4").ConvertToYV24()
b_ex = undefined
v228o = v228
v228 = v228.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v228i = v228
v228 = expr(v228.extractY, v228.extractU, v228.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v228 = v228.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v228a = v228i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v228i.interleave(v228).hist_levels.prefetch
v228 = v228.adjustSize
v228 = v228.assumeFPS(18)
v228 = v228.add_blank_audio
return v228.prefetch
#adjustframerate

v229 = LSMASHVideoSource(dst_dir + "v229f.mp4").ConvertToYV24()
b_ex = undefined
v229o = v229
v229 = v229.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v229i = v229
v229 = expr(v229.extractY, v229.extractU, v229.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v229 = v229.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v229a = v229i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v229i.interleave(v229).hist_levels.prefetch
v229 = v229.adjustSize
v229 = v229.assumeFPS(18)
v229 = v229.add_blank_audio
return v229.prefetch
#adjustframerate

v230 = LSMASHVideoSource(dst_dir + "v230f.mp4").ConvertToYV24()
b_ex = undefined
v230o = v230
v230 = v230.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v230i = v230
v230 = expr(v230.extractY, v230.extractU, v230.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v230 = v230.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v230a = v230i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v230i.interleave(v230).hist_levels.prefetch
v230 = v230.adjustSize
v230 = v230.assumeFPS(18)
v230 = v230.add_blank_audio
return v230.prefetch
#adjustframerate

v231 = LSMASHVideoSource(dst_dir + "v231f.mp4").ConvertToYV24()
b_ex = undefined
v231o = v231
v231 = v231.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v231i = v231
v231 = expr(v231.extractY, v231.extractU, v231.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v231 = v231.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v231a = v231i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v231i.interleave(v231).hist_levels.prefetch
v231 = v231.adjustSize
v231 = v231.assumeFPS(18)
v231 = v231.add_blank_audio
return v231.prefetch
#adjustframerate

v232 = LSMASHVideoSource(dst_dir + "v232f.mp4").ConvertToYV24()
b_ex = undefined
v232o = v232
v232 = v232.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v232i = v232
v232 = expr(v232.extractY, v232.extractU, v232.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v232 = v232.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v232a = v232i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v232i.interleave(v232).hist_levels.prefetch
v232 = v232.adjustSize
v232 = v232.assumeFPS(18)
v232 = v232.add_blank_audio
return v232.prefetch
#adjustframerate

v233 = LSMASHVideoSource(dst_dir + "v233f.mp4").ConvertToYV24()
b_ex = undefined
v233o = v233
v233 = v233.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v233i = v233
v233 = expr(v233.extractY, v233.extractU, v233.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v233 = v233.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v233a = v233i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v233i.interleave(v233).hist_levels.prefetch
v233 = v233.adjustSize
v233 = v233.assumeFPS(18)
v233 = v233.add_blank_audio
return v233.prefetch
#adjustframerate

v234 = LSMASHVideoSource(dst_dir + "v234f.mp4").ConvertToYV24()
b_ex = undefined
v234o = v234
v234 = v234.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.7 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v234i = v234
v234 = expr(v234.extractY, v234.extractU, v234.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v234 = v234.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v234a = v234i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v234 = v234.colorYUV(off_u = +2, off_v = -2)
#return v234i.interleave(v234).hist_levels.prefetch
v234 = v234.adjustSize
v234 = v234.assumeFPS(18)
v234 = v234.add_blank_audio
return v234.prefetch
#adjustframerate

v235 = LSMASHVideoSource(dst_dir + "v235f.mp4").ConvertToYV24()
b_ex = undefined
v235o = v235
v235 = v235.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v235i = v235
v235 = expr(v235.extractY, v235.extractU, v235.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v235 = v235.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v235a = v235i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v235 = v235.colorYUV(off_u = +4, off_v = -4)
#return v235i.interleave(v235).hist_levels.prefetch
v235 = v235.adjustSize
v235 = v235.assumeFPS(18)
v235 = v235.add_blank_audio
return v235.prefetch
#adjustframerate

v236 = LSMASHVideoSource(dst_dir + "v236f.mp4").ConvertToYV24()
b_ex = undefined
v236o = v236
v236 = v236.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v236i = v236
v236 = expr(v236.extractY, v236.extractU, v236.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v236 = v236.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v236a = v236i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v236 = v236.colorYUV(off_u = +4, off_v = -4)
#return v236i.interleave(v236).hist_levels.prefetch
v236 = v236.adjustSize
v236 = v236.assumeFPS(18)
v236 = v236.add_blank_audio
return v236.prefetch
#adjustframerate

v237 = LSMASHVideoSource(dst_dir + "v237f.mp4").ConvertToYV24()
b_ex = undefined
v237o = v237
v237 = v237.AdjustColor(ou = +6, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v237i = v237
v237 = expr(v237.extractY, v237.extractU, v237.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v237 = v237.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v237a = v237i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v237i.interleave(v237).hist_levels.prefetch
v237 = v237.adjustSize
v237 = v237.assumeFPS(18)
v237 = v237.add_blank_audio
return v237.prefetch
#adjustframerate

v238 = LSMASHVideoSource(dst_dir + "v238f.mp4").ConvertToYV24()
b_ex = undefined
v238o = v238
v238 = v238.AdjustColor(ou = +6, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v238i = v238
v238 = expr(v238.extractY, v238.extractU, v238.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v238 = v238.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v238a = v238i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v238 = v238i
#return v238i.interleave(v238).hist_levels.prefetch
v238 = v238.adjustSize
v238 = v238.assumeFPS(18)
v238 = v238.add_blank_audio
return v238.prefetch
#adjustframerate

v239 = LSMASHVideoSource(dst_dir + "v239f.mp4").ConvertToYV24()
b_ex = undefined
v239o = v239
v239 = v239.AdjustColor(ou = +6, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v239i = v239
v239 = expr(v239.extractY, v239.extractU, v239.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v239 = v239.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v239a = v239i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v239i.interleave(v239).hist_levels.prefetch
v239 = v239.adjustSize
v239 = v239.assumeFPS(18)
v239 = v239.add_blank_audio
return v239.prefetch
#adjustframerate

v240 = LSMASHVideoSource(dst_dir + "v240f.mp4").ConvertToYV24()
b_ex = undefined
v240o = v240
v240 = v240.AdjustColor(ou = +6, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v240i = v240
v240 = expr(v240.extractY, v240.extractU, v240.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v240 = v240.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v240a = v240i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v240i.interleave(v240).hist_levels.prefetch
v240 = v240.adjustSize
v240 = v240.assumeFPS(18)
v240 = v240.add_blank_audio
return v240.prefetch
#adjustframerate

v241 = LSMASHVideoSource(dst_dir + "v241f.mp4").ConvertToYV24()
b_ex = undefined
v241o = v241
v241 = v241.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v241i = v241
v241 = expr(v241.extractY, v241.extractU, v241.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v241 = v241.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v241a = v241i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v241 = v241i
#return v241i.interleave(v241).hist_levels.prefetch
v241 = v241.adjustSize
v241 = v241.assumeFPS(18)
v241 = v241.add_blank_audio
return v241.prefetch
#adjustframerate

v242 = LSMASHVideoSource(dst_dir + "v242f.mp4").ConvertToYV24()
b_ex = undefined
v242o = v242
v242 = v242.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v242i = v242
v242 = expr(v242.extractY, v242.extractU, v242.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v242 = v242.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v242a = v242i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v242i.interleave(v242).hist_levels.prefetch
v242 = v242.adjustSize
v242 = v242.assumeFPS(18)
v242 = v242.add_blank_audio
return v242.prefetch
#adjustframerate

v243 = LSMASHVideoSource(dst_dir + "v243f.mp4").ConvertToYV24()
b_ex = undefined
v243o = v243
v243 = v243.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v243i = v243
v243 = expr(v243.extractY, v243.extractU, v243.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v243 = v243.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v243a = v243i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v243 = v243i
#return v243i.interleave(v243).hist_levels.prefetch
v243 = v243.adjustSize
v243 = v243.assumeFPS(18)
v243 = v243.add_blank_audio
return v243.prefetch
#adjustframerate

v244 = LSMASHVideoSource(dst_dir + "v244f.mp4").ConvertToYV24()
b_ex = undefined
v244o = v244
v244 = v244.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v244i = v244
v244 = expr(v244.extractY, v244.extractU, v244.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v244 = v244.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v244a = v244i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v244 = v244i
#return v244i.interleave(v244).hist_levels.prefetch
v244 = v244.adjustSize
v244 = v244.assumeFPS(18)
v244 = v244.add_blank_audio
return v244.prefetch
#adjustframerate

v245 = LSMASHVideoSource(dst_dir + "v245f.mp4").ConvertToYV24()
b_ex = undefined
v245o = v245
v245 = v245.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v245i = v245
v245 = expr(v245.extractY, v245.extractU, v245.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v245 = v245.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v245a = v245i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v245i.interleave(v245).hist_levels.prefetch
v245 = v245.adjustSize
v245 = v245.assumeFPS(18)
v245 = v245.add_blank_audio
return v245.prefetch
#adjustframerate

v246 = LSMASHVideoSource(dst_dir + "v246f.mp4").ConvertToYV24()
b_ex = undefined
v246o = v246
v246 = v246.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v246i = v246
v246 = expr(v246.extractY, v246.extractU, v246.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v246 = v246.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v246a = v246i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v246i.interleave(v246).hist_levels.prefetch
v246 = v246.adjustSize
v246 = v246.assumeFPS(18)
v246 = v246.add_blank_audio
return v246.prefetch
#adjustframerate

v247 = LSMASHVideoSource(dst_dir + "v247f.mp4").ConvertToYV24()
b_ex = undefined
v247o = v247
v247 = v247.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v247i = v247
v247 = expr(v247.extractY, v247.extractU, v247.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v247 = v247.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v247a = v247i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v247i.interleave(v247).hist_levels.prefetch
v247 = v247.adjustSize
v247 = v247.assumeFPS(18)
v247 = v247.add_blank_audio
return v247.prefetch
#adjustframerate

v248 = LSMASHVideoSource(dst_dir + "v248f.mp4").ConvertToYV24()
b_ex = undefined
v248o = v248
v248 = v248.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v248i = v248
v248 = expr(v248.extractY, v248.extractU, v248.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v248 = v248.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v248a = v248i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v248i.interleave(v248).hist_levels.prefetch
v248 = v248.adjustSize
v248 = v248.assumeFPS(18)
v248 = v248.add_blank_audio
return v248.prefetch
#adjustframerate

v249 = LSMASHVideoSource(dst_dir + "v249f.mp4").ConvertToYV24()
b_ex = undefined
v249o = v249
v249 = v249.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v249i = v249
v249 = expr(v249.extractY, v249.extractU, v249.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v249 = v249.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v249a = v249i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v249i.interleave(v249).hist_levels.prefetch
v249 = v249.adjustSize
v249 = v249.assumeFPS(18)
v249 = v249.add_blank_audio
return v249.prefetch
#adjustframerate

v250 = LSMASHVideoSource(dst_dir + "v250f.mp4").ConvertToYV24()
b_ex = undefined
v250o = v250
v250 = v250.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v250i = v250
v250 = expr(v250.extractY, v250.extractU, v250.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v250 = v250.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v250a = v250i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v250i.interleave(v250).hist_levels.prefetch
v250 = v250.adjustSize
v250 = v250.assumeFPS(18)
v250 = v250.add_blank_audio
return v250.prefetch
#adjustframerate

v251 = LSMASHVideoSource(dst_dir + "v251f.mp4").ConvertToYV24()
b_ex = undefined
v251o = v251
v251 = v251.AdjustColor(ou = +0, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v251i = v251
v251 = expr(v251.extractY, v251.extractU, v251.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v251 = v251.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v251a = v251i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v251i.interleave(v251).hist_levels.prefetch
v251 = v251.adjustSize
v251 = v251.assumeFPS(18)
v251 = v251.add_blank_audio
return v251.prefetch
#adjustframerate

v252 = LSMASHVideoSource(dst_dir + "v252f.mp4").ConvertToYV24()
b_ex = undefined
v252o = v252
v252 = v252.AdjustColor(ou = +0, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v252i = v252
v252 = expr(v252.extractY, v252.extractU, v252.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v252 = v252.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v252a = v252i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v252i.interleave(v252).hist_levels.prefetch
v252 = v252.adjustSize
v252 = v252.assumeFPS(18)
v252 = v252.add_blank_audio
return v252.prefetch
#adjustframerate

v253 = LSMASHVideoSource(dst_dir + "v253f.mp4").ConvertToYV24()
b_ex = undefined
v253o = v253
v253 = v253.AdjustColor(ou = +0, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v253i = v253
v253 = expr(v253.extractY, v253.extractU, v253.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v253 = v253.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v253a = v253i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v253i.interleave(v253).hist_levels.prefetch
v253 = v253.adjustSize
v253 = v253.assumeFPS(18)
v253 = v253.add_blank_audio
return v253.prefetch
#adjustframerate

v254 = LSMASHVideoSource(dst_dir + "v254f.mp4").ConvertToYV24()
b_ex = undefined
v254o = v254
v254 = v254.AdjustColor(ou = -6, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.0004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v254i = v254
#v254 = expr(v254.extractY, v254.extractU, v254.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v254 = v254.autolevels(filterRadius=9, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7)
v254a = v254i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v254 = v254i
#return v254i.interleave(v254).hist_levels.prefetch
v254 = v254.adjustSize
v254 = v254.assumeFPS(18)
v254 = v254.add_blank_audio
return v254.prefetch
#adjustframerate

v255 = LSMASHVideoSource(dst_dir + "v255f.mp4").ConvertToYV24()
b_ex = undefined
v255o = v255
v255 = v255.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v255i = v255
v255 = expr(v255.extractY, v255.extractU, v255.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v255 = v255.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v255a = v255i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v255i.interleave(v255).hist_levels.prefetch
v255 = v255.adjustSize
v255 = v255.assumeFPS(18)
v255 = v255.add_blank_audio
return v255.prefetch
#adjustframerate

v256 = LSMASHVideoSource(dst_dir + "v256f.mp4").ConvertToYV24()
#v256 = v256.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v256 = v256.trim(105, -1).loop(v256.frameCount).crop(0, 0, -(v256.width - add_width), 0).stackHorizontal(v256)
#return v256.histogram.prefetch
v256o = v256
#v256 = v256.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
v256 = v256.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v256.hist_levels.prefetch
#v256 = v256.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v256 = expr(v256.extractY, v256.extractU, v256.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v256i = v256
v256 = v256.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v256 = expr(v256.extractY, v256.extractU, v256.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v256 = v256.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v256a = v256i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v256 = v256.crop(add_width, 0, 0, 0)
#v256i = v256i.crop(add_width, 0, 0, 0)
#v256a = v256a.crop(add_width, 0, 0, 0)
#v256 = v256.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v256 = v256.colorYUV(off_u = +2, off_v = -2)
#v256 = v256i
#return v256i.interleave(v256).hist_levels.prefetch
v256 = v256.adjustSize
v256 = v256.assumeFPS(18)
v256 = v256.add_blank_audio
return v256.prefetch
#adjustframerate

#******
*/
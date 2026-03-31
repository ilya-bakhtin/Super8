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
v321 = full.trim(17719, 17802)
v321 = v321.crop(left + 60, top + 20, right + 60, bot + 20)
v321 = v321.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v321.trim(5, 81) +\
       v321.trim(82, 0).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false)
#return v321.histogram.assumeFPS(12).prefetch

v322 = full.trim(17803, 17859)
v322 = v322.crop(left + 60, top + 20, right + 60, bot + 20)
v322 = v322.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v322.trim(2, 0)
#return v322.histogram.assumeFPS(12).prefetch
*/
v323 = full.trim(17861, 17919)
v323 = v323.crop(left + 60, top + 20, right + 60, bot + 20)
#return v323.histogram.assumeFPS(12).prefetch
/*
v324 = full.trim(17921, 17927)
v324 = v324.crop(left + 60, top + 20, right + 60, bot + 20)
v324 = v324.trim(0, 1).deflickOverlapped(step = 100, height = 200, width = 800, radius = 1, toward_darkest = true, right2left = false) +\
       v324.trim(2, 0)
#return v324.histogram.assumeFPS(12).prefetch

v325 = full.trim(17928, 17930)
v325 = v325.crop(left + 60, top + 20, right + 60, bot + 20)
#return v325.histogram.assumeFPS(12).prefetch

v326 = full.trim(17931, 18016)
v326 = v326.crop(left + 60, top + 20, right + 60, bot + 20)
#return v326.histogram.assumeFPS(12).prefetch

v327 = full.trim(18018, 18030)
v327 = v327.crop(left + 60, top + 20, right + 60, bot + 20)
v327 = v327.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v327.trim(2, 0)
#return v327.histogram.assumeFPS(12).prefetch

v328 = full.trim(18034, 18060)
v328 = v328.crop(left + 60, top + 20, right + 60, bot + 20)
#return v328.histogram.assumeFPS(12).prefetch

v329 = full.trim(18061, 18133)
v329 = v329.crop(left + 60, top + 20, right + 60, bot + 20)
#return v329.histogram.assumeFPS(12).prefetch

v330 = full.trim(18134, 18202)
v330 = v330.crop(left + 60, top + 20, right + 60, bot + 20)
v330 = v330.trim(0, 2).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v330.trim(3, 66) +\
       v330.trim(67, 0).deflickOverlapped(step = 400, radius = 1, toward_darkest = true, right2left = false)
#return v330.histogram.assumeFPS(12).prefetch

v331 = full.trim(18206, 18340)
v331 = v331.crop(left + 60, top + 20, right + 60, bot + 20)
v331 = v331.trim(0, 2).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v331.trim(3, 0)
#return v331.histogram.assumeFPS(12).prefetch

v332 = full.trim(18342, 18395)
v332 = v332.crop(left + 60, top + 20, right + 60, bot + 20)
v332 = v332.trim(0, 51) +\
       v332.trim(52, 0).convertToYV24.deflickOverlappedFwd(step = 200, toward_darkest = true, right2left = false)
#return v332.histogram.assumeFPS(12).prefetch

v333 = full.trim(18397, 18446)
v333 = v333.crop(left + 60, top + 20, right + 60, bot + 20)
v333 = v333.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v333.trim(2, 0)
#return v333.histogram.assumeFPS(12).prefetch

v334 = full.trim(18449, 18473)
v334 = v334.crop(left + 60, top + 20, right + 60, bot + 20)
v334o = v0.trim(18425, 18426)
v334o = v334o.crop(160, 4, -160, -4)
v334o = v334o.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 220, autolevel = false)
v334o = v334o.spline64resize(v334.width, v334.height, -20, -20, v334o.width + 70, v334o.height + 20)
v334 = v334o + v334
#return v334.histogram.assumeFPS(12).prefetch

v335 = full.trim(18478, 18528)
v335 = v335.crop(left + 60, top + 20, right + 60, bot + 20)
#return v335.histogram.assumeFPS(12).prefetch

v336 = full.trim(18529, 18563)
v336 = v336.crop(left + 60, top + 20, right + 60, bot + 20)
#return v336.histogram.assumeFPS(12).prefetch

v337 = full.trim(18564, 18574)
v337 = v337.crop(left + 60, top + 20, right + 60, bot + 20)
#return v337.histogram.assumeFPS(12).prefetch

v338 = full.trim(18575, 18600)
v338 = v338.crop(left + 60, top + 20, right + 60, bot + 20)
#return v338.histogram.assumeFPS(12).prefetch

v339 = full.trim(18602, 18614) + full.trim(18650, 18658)
v339 = v339.crop(left + 60, top + 60, right + 60, bot + 60)
#return v339.histogram.assumeFPS(12).prefetch

v340 = full.trim(18659, 18713)
v340 = v340.crop(left + 60, top + 60, right + 60, bot + 60)
v340 = v340.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v340.trim(2, 0)
#return v340.histogram.assumeFPS(12).prefetch

v341 = full.trim(18714, 18862)
v341 = v341.crop(left + 60, top + 60, right + 60, bot + 60)
v341 = v341.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v341.trim(2, 0)
#return v341.histogram.assumeFPS(12).prefetch

v342 = full.trim(18863, 19065)
v342 = v342.crop(left + 60, top + 20, right + 60, bot + 20)
v342 = v342.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
return v342.histogram.assumeFPS(12).prefetch

v343 = full.trim(19066, 19124)
v343 = v343.crop(left + 60, top + 20, right + 60, bot + 20)
v343 = v343.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v343.trim(2, 0)
v343 = v343.trim(0, 56) +\
       v343.trim(57, 0).convertToYV24.deflickOverlappedFwd(step = 400, toward_darkest = true, right2left = false)
#return v343.histogram.assumeFPS(12).prefetch

v344 = full.trim(19125, 19242)
v344 = v344.crop(left + 60, top + 20, right + 60, bot + 20)
v344 = v344.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v344.trim(2, 0)
#return v344.histogram.assumeFPS(18).prefetch

v345 = full.trim(19243, 19333)
v345 = v345.crop(left + 60, top + 20, right + 60, bot + 20)
v345 = v345.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
       v345.trim(2, 0)
#return v345.histogram.assumeFPS(18).prefetch

v346 = full.trim(19334, 19350)
v346 = v346.crop(left + 60, top + 20, right + 60, bot + 20)
v346 = v346.trim(0, 1).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v346.trim(2, 0)
#return v346.histogram.assumeFPS(18).prefetch

v347 = full.trim(19351, 19478)
v347 = v347.crop(left + 60, top + 20, right + 60, bot + 20)
v347 = v347.trim(0, 1).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v347.trim(2, 0)
#return v347.histogram.assumeFPS(18).prefetch

v348 = full.trim(19479, 19595)
v348 = v348.crop(left + 60, top + 20, right + 60, bot + 20)
v348 = v348.trim(0, 1).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v348.trim(2, 0)
#return v348.histogram.assumeFPS(18).prefetch

v349 = full.trim(19596, 19628)
v349 = v349.crop(left + 60, top + 20, right + 60, bot + 20)
v349 = v349.trim(0, 2).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v349.trim(3, 0)
#return v349.histogram.assumeFPS(18).prefetch

v350 = full.trim(19629, 19729)
v350 = v350.crop(left + 60, top + 20, right + 60, bot + 20)
v350 = v350.trim(0, 1).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v350.trim(2, 0)
#return v350.histogram.assumeFPS(18).prefetch
*/
v351 = full.trim(19730, 19821)
v351 = v351.crop(left + 60, top + 20, right + 60, bot + 20)
v351 = v351.trim(0, 1).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v351.trim(2, 0)
#return v351.histogram.assumeFPS(18).prefetch
/*
# 19596, 19629, 19730, 19822, 19954, 20033, 20070, 20164, 20196, 20340, 20472, 20650, 20817, 20996, 21088, 21192, 21347,  # 371
v352 = full.trim(19822, 19953)
v352 = v352.crop(left + 60, top + 20, right + 60, bot + 20)
#v352 = v352.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v352 = v352.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
#       v352.trim(2, 0)
v352 = v352.trim(0, 1).deflickOverlappedBck(step = 400, toward_darkest = true, right2left = false) +\
       v352.trim(2, 0)
#v352 = v352.trim(0, 56) +\
#       v352.trim(57, 0).convertToYV24.deflickOverlappedFwd(step = 400, toward_darkest = true, right2left = false)
#return v352.histogram.assumeFPS(18).prefetch
#return v352.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 321

v321 = LSMASHVideoSource(dst_dir + "v321f.mp4").ConvertToYV24()
b_ex = undefined
v321o = v321
v321 = v321.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v321i = v321
v321 = expr(v321.extractY, v321.extractU, v321.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v321 = v321.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v321a = v321i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v321i.interleave(v321).hist_levels.prefetch
v321 = v321.adjustSize
v321 = v321.assumeFPS(18)
v321 = v321.add_blank_audio
return v321.prefetch
#adjustframerate

v322 = LSMASHVideoSource(dst_dir + "v322f.mp4").ConvertToYV24()
b_ex = undefined
v322o = v322
v322 = v322.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v322i = v322
v322 = expr(v322.extractY, v322.extractU, v322.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v322 = v322.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v322a = v322i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v322i.interleave(v322).hist_levels.prefetch
v322 = v322.adjustSize
v322 = v322.assumeFPS(18)
v322 = v322.add_blank_audio
return v322.prefetch
#adjustframerate

v323 = LSMASHVideoSource(dst_dir + "v323f.mp4").ConvertToYV24()
b_ex = undefined
v323o = v323
v323 = v323.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v323i = v323
v323 = expr(v323.extractY, v323.extractU, v323.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v323 = v323.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v323a = v323i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v323i.interleave(v323).hist_levels.prefetch
v323 = v323.adjustSize
v323 = v323.assumeFPS(18)
v323 = v323.add_blank_audio
return v323.prefetch
#adjustframerate

v324 = LSMASHVideoSource(dst_dir + "v324f.mp4").ConvertToYV24()
b_ex = undefined
v324o = v324
v324 = v324.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v324i = v324
v324 = expr(v324.extractY, v324.extractU, v324.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v324 = v324.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v324a = v324i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v324i.interleave(v324).hist_levels.prefetch
v324 = v324.adjustSize
v324 = v324.assumeFPS(18)
v324 = v324.add_blank_audio
return v324.prefetch
#adjustframerate

v325 = LSMASHVideoSource(dst_dir + "v325f.mp4").ConvertToYV24()
b_ex = undefined
v325o = v325
v325 = v325.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v325i = v325
v325 = expr(v325.extractY, v325.extractU, v325.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v325 = v325.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v325a = v325i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v325i.interleave(v325).hist_levels.prefetch
v325 = v325.adjustSize
v325 = v325.assumeFPS(18)
v325 = v325.add_blank_audio
return v325.prefetch
#adjustframerate

v326 = LSMASHVideoSource(dst_dir + "v326f.mp4").ConvertToYV24()
b_ex = undefined
v326o = v326
v326 = v326.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v326i = v326
v326 = expr(v326.extractY, v326.extractU, v326.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v326 = v326.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v326a = v326i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v326i.interleave(v326).hist_levels.prefetch
v326 = v326.adjustSize
v326 = v326.assumeFPS(18)
v326 = v326.add_blank_audio
return v326.prefetch
#adjustframerate

v327 = LSMASHVideoSource(dst_dir + "v327f.mp4").ConvertToYV24()
b_ex = undefined
v327o = v327
v327 = v327.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v327i = v327
v327 = expr(v327.extractY, v327.extractU, v327.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v327 = v327.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v327a = v327i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v327i.interleave(v327).hist_levels.prefetch
v327 = v327.adjustSize
v327 = v327.assumeFPS(18)
v327 = v327.add_blank_audio
return v327.prefetch
#adjustframerate

v328 = LSMASHVideoSource(dst_dir + "v328f.mp4").ConvertToYV24()
b_ex = undefined
v328o = v328
v328 = v328.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v328i = v328
v328 = expr(v328.extractY, v328.extractU, v328.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v328 = v328.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v328a = v328i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v328i.interleave(v328).hist_levels.prefetch
v328 = v328.adjustSize
v328 = v328.assumeFPS(18)
v328 = v328.add_blank_audio
return v328.prefetch
#adjustframerate

v329 = LSMASHVideoSource(dst_dir + "v329f.mp4").ConvertToYV24()
b_ex = undefined
v329o = v329
v329 = v329.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v329i = v329
v329 = expr(v329.extractY, v329.extractU, v329.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v329 = v329.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v329a = v329i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v329i.interleave(v329).hist_levels.prefetch
v329 = v329.adjustSize
v329 = v329.assumeFPS(18)
v329 = v329.add_blank_audio
return v329.prefetch
#adjustframerate

v330 = LSMASHVideoSource(dst_dir + "v330f.mp4").ConvertToYV24()
b_ex = undefined
v330o = v330
v330 = v330.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v330i = v330
v330 = expr(v330.extractY, v330.extractU, v330.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v330 = v330.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v330a = v330i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v330i.interleave(v330).hist_levels.prefetch
v330 = v330.adjustSize
v330 = v330.assumeFPS(18)
v330 = v330.add_blank_audio
return v330.prefetch
#adjustframerate

v331 = LSMASHVideoSource(dst_dir + "v331f.mp4").ConvertToYV24()
b_ex = undefined
v331o = v331
v331 = v331.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v331i = v331
v331 = expr(v331.extractY, v331.extractU, v331.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v331 = v331.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v331a = v331i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v331i.interleave(v331).hist_levels.prefetch
v331 = v331.adjustSize
v331 = v331.assumeFPS(18)
v331 = v331.add_blank_audio
return v331.prefetch
#adjustframerate

v332 = LSMASHVideoSource(dst_dir + "v332f.mp4").ConvertToYV24()
b_ex = undefined
v332o = v332
v332 = v332.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v332i = v332
v332 = expr(v332.extractY, v332.extractU, v332.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v332 = v332.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v332a = v332i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v332i.interleave(v332).hist_levels.prefetch
v332 = v332.adjustSize
v332 = v332.assumeFPS(18)
v332 = v332.add_blank_audio
return v332.prefetch
#adjustframerate

v333 = LSMASHVideoSource(dst_dir + "v333f.mp4").ConvertToYV24()
b_ex = undefined
v333o = v333
v333 = v333.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v333i = v333
v333 = expr(v333.extractY, v333.extractU, v333.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v333 = v333.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v333a = v333i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v333i.interleave(v333).hist_levels.prefetch
v333 = v333.adjustSize
v333 = v333.assumeFPS(18)
v333 = v333.add_blank_audio
return v333.prefetch
#adjustframerate

v334 = LSMASHVideoSource(dst_dir + "v334f.mp4").ConvertToYV24()
b_ex = undefined
v334o = v334
v334 = v334.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v334i = v334
v334 = expr(v334.extractY, v334.extractU, v334.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v334 = v334.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v334a = v334i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v334i.interleave(v334).hist_levels.prefetch
v334 = v334.adjustSize
v334 = v334.assumeFPS(18)
v334 = v334.add_blank_audio
return v334.prefetch
#adjustframerate

v335 = LSMASHVideoSource(dst_dir + "v335f.mp4").ConvertToYV24()
b_ex = undefined
v335o = v335
v335 = v335.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v335i = v335
v335 = expr(v335.extractY, v335.extractU, v335.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v335 = v335.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v335a = v335i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v335i.interleave(v335).hist_levels.prefetch
v335 = v335.adjustSize
v335 = v335.assumeFPS(18)
v335 = v335.add_blank_audio
return v335.prefetch
#adjustframerate

v336 = LSMASHVideoSource(dst_dir + "v336f.mp4").ConvertToYV24()
b_ex = undefined
v336o = v336
v336 = v336.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v336i = v336
v336 = expr(v336.extractY, v336.extractU, v336.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v336 = v336.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v336a = v336i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v336i.interleave(v336).hist_levels.prefetch
v336 = v336.adjustSize
v336 = v336.assumeFPS(18)
v336 = v336.add_blank_audio
return v336.prefetch
#adjustframerate

v337 = LSMASHVideoSource(dst_dir + "v337f.mp4").ConvertToYV24()
b_ex = undefined
v337o = v337
v337 = v337.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v337i = v337
v337 = expr(v337.extractY, v337.extractU, v337.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v337 = v337.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v337a = v337i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v337i.interleave(v337).hist_levels.prefetch
v337 = v337.adjustSize
v337 = v337.assumeFPS(18)
v337 = v337.add_blank_audio
return v337.prefetch
#adjustframerate

v338 = LSMASHVideoSource(dst_dir + "v338f.mp4").ConvertToYV24()
b_ex = undefined
v338o = v338
v338 = v338.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v338i = v338
v338 = expr(v338.extractY, v338.extractU, v338.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v338 = v338.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v338a = v338i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v338i.interleave(v338).hist_levels.prefetch
v338 = v338.adjustSize
v338 = v338.assumeFPS(18)
v338 = v338.add_blank_audio
return v338.prefetch
#adjustframerate

v339 = LSMASHVideoSource(dst_dir + "v339f.mp4").ConvertToYV24()
b_ex = undefined
v339o = v339
v339 = v339.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v339i = v339
v339 = expr(v339.extractY, v339.extractU, v339.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v339 = v339.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v339a = v339i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v339i.interleave(v339).hist_levels.prefetch
v339 = v339.adjustSize
v339 = v339.assumeFPS(18)
v339 = v339.add_blank_audio
return v339.prefetch
#adjustframerate

v340 = LSMASHVideoSource(dst_dir + "v340f.mp4").ConvertToYV24()
b_ex = undefined
v340o = v340
v340 = v340.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v340i = v340
v340 = expr(v340.extractY, v340.extractU, v340.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v340 = v340.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v340a = v340i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v340i.interleave(v340).hist_levels.prefetch
v340 = v340.adjustSize
v340 = v340.assumeFPS(18)
v340 = v340.add_blank_audio
return v340.prefetch
#adjustframerate

v341 = LSMASHVideoSource(dst_dir + "v341f.mp4").ConvertToYV24()
b_ex = undefined
v341o = v341
v341 = v341.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v341i = v341
v341 = expr(v341.extractY, v341.extractU, v341.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v341 = v341.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v341a = v341i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v341i.interleave(v341).hist_levels.prefetch
v341 = v341.adjustSize
v341 = v341.assumeFPS(18)
v341 = v341.add_blank_audio
return v341.prefetch
#adjustframerate

v342 = LSMASHVideoSource(dst_dir + "v342f.mp4").ConvertToYV24()
b_ex = undefined
v342o = v342
v342 = v342.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v342i = v342
v342 = expr(v342.extractY, v342.extractU, v342.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v342 = v342.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v342a = v342i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v342i.interleave(v342).hist_levels.prefetch
v342 = v342.adjustSize
v342 = v342.assumeFPS(18)
v342 = v342.add_blank_audio
return v342.prefetch
#adjustframerate

v343 = LSMASHVideoSource(dst_dir + "v343f.mp4").ConvertToYV24()
b_ex = undefined
v343o = v343
v343 = v343.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v343i = v343
v343 = expr(v343.extractY, v343.extractU, v343.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v343 = v343.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v343a = v343i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v343i.interleave(v343).hist_levels.prefetch
v343 = v343.adjustSize
v343 = v343.assumeFPS(18)
v343 = v343.add_blank_audio
return v343.prefetch
#adjustframerate

v344 = LSMASHVideoSource(dst_dir + "v344f.mp4").ConvertToYV24()
b_ex = undefined
v344o = v344
v344 = v344.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.2 P0^ 0.9 P1^ 1. 1.95 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v344i = v344
v344 = expr(v344.extractY, v344.extractU, v344.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v344 = v344.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v344a = v344i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v344i.interleave(v344).hist_levels.prefetch
v344 = v344.adjustSize
v344 = v344.assumeFPS(18)
v344 = v344.add_blank_audio
return v344.prefetch
#adjustframerate

v345 = LSMASHVideoSource(dst_dir + "v345f.mp4").ConvertToYV24()
b_ex = undefined
v345o = v345
v345 = v345.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v345i = v345
v345 = expr(v345.extractY, v345.extractU, v345.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v345 = v345.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v345a = v345i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v345i.interleave(v345).hist_levels.prefetch
v345 = v345.adjustSize
v345 = v345.assumeFPS(18)
v345 = v345.add_blank_audio
return v345.prefetch
#adjustframerate

v346 = LSMASHVideoSource(dst_dir + "v346f.mp4").ConvertToYV24()
b_ex = undefined
v346o = v346
v346 = v346.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v346i = v346
v346 = expr(v346.extractY, v346.extractU, v346.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v346 = v346.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v346a = v346i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v346i.interleave(v346).hist_levels.prefetch
v346 = v346.adjustSize
v346 = v346.assumeFPS(18)
v346 = v346.add_blank_audio
return v346.prefetch
#adjustframerate

v347 = LSMASHVideoSource(dst_dir + "v347f.mp4").ConvertToYV24()
b_ex = undefined
v347o = v347
v347 = v347.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v347i = v347
v347 = expr(v347.extractY, v347.extractU, v347.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v347 = v347.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v347a = v347i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v347i.interleave(v347).hist_levels.prefetch
v347 = v347.adjustSize
v347 = v347.assumeFPS(18)
v347 = v347.add_blank_audio
return v347.prefetch
#adjustframerate

v348 = LSMASHVideoSource(dst_dir + "v348f.mp4").ConvertToYV24()
b_ex = undefined
v348o = v348
v348 = v348.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v348i = v348
v348 = expr(v348.extractY, v348.extractU, v348.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v348 = v348.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v348a = v348i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v348i.interleave(v348).hist_levels.prefetch
v348 = v348.adjustSize
v348 = v348.assumeFPS(18)
v348 = v348.add_blank_audio
return v348.prefetch
#adjustframerate

v349 = LSMASHVideoSource(dst_dir + "v349f.mp4").ConvertToYV24()
b_ex = undefined
v349o = v349
v349 = v349.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v349i = v349
v349 = expr(v349.extractY, v349.extractU, v349.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v349 = v349.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v349a = v349i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v349i.interleave(v349).hist_levels.prefetch
v349 = v349.adjustSize
v349 = v349.assumeFPS(18)
v349 = v349.add_blank_audio
return v349.prefetch
#adjustframerate

v350 = LSMASHVideoSource(dst_dir + "v350f.mp4").ConvertToYV24()
b_ex = undefined
v350o = v350
v350 = v350.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v350i = v350
v350 = expr(v350.extractY, v350.extractU, v350.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v350 = v350.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v350a = v350i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v350i.interleave(v350).hist_levels.prefetch
v350 = v350.adjustSize
v350 = v350.assumeFPS(18)
v350 = v350.add_blank_audio
return v350.prefetch
#adjustframerate

v351 = LSMASHVideoSource(dst_dir + "v351f.mp4").ConvertToYV24()
b_ex = undefined
v351o = v351
v351 = v351.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.2 P0^ 0.9 P1^ 1. 1.95 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v351i = v351
v351 = expr(v351.extractY, v351.extractU, v351.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v351 = v351.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v351a = v351i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v351i.interleave(v351).hist_levels.prefetch
v351 = v351.adjustSize
v351 = v351.assumeFPS(18)
v351 = v351.add_blank_audio
return v351.prefetch
#adjustframerate

v352 = LSMASHVideoSource(dst_dir + "v352f.mp4").ConvertToYV24()
#v352 = v352.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v352 = v352.trim(105, -1).loop(v352.frameCount).crop(0, 0, -(v352.width - add_width), 0).stackHorizontal(v352)
#return v352.histogram.prefetch
v352o = v352
v352 = v352.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
#v352 = v352.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v352.hist_levels.prefetch
#v352 = v352.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.2 P0^ 0.9 P1^ 1. 1.95 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v352 = expr(v352.extractY, v352.extractU, v352.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v352i = v352
#v352 = v352.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v352 = expr(v352.extractY, v352.extractU, v352.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v352 = v352.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v352a = v352i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#v352 = v352.crop(add_width, 0, 0, 0)
#v352i = v352i.crop(add_width, 0, 0, 0)
#v352a = v352a.crop(add_width, 0, 0, 0)
#v352 = v352.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v352 = v352.colorYUV(off_u = +2, off_v = -2)
#v352 = v352i
#return v352i.interleave(v352).hist_levels.prefetch
v352 = v352.adjustSize
v352 = v352.assumeFPS(18)
v352 = v352.add_blank_audio
return v352.prefetch
#adjustframerate

#******

*/
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
# 8944, 8973, 8977, 9014, 9055, 9076, 9155, 9187, 9244, 9252, 9307, 9316, 9362, 9420, 9427, 9447, 9467, 9472, 9561, 9599, #200
# 9700, 9715, 9830, 9846, 9902, 9995, 10089, 10112, 10160, 10166, 10199, 10239, 10271, 10304, 10334, 10340, 10372, 10388, #218
# 10401, 10439, 10445, 10450, 10456, 10463, 10484, 10493, 10514, 10535, 10539, 10641, 10680, 10720, 10762, 10859, 10884,  #235

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
v193 = full.trim(9420, 9426)
v193 = v193.crop(left + 60, top + 10, right + 60, bot + 10)
v193 = v193.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v193.trim(2, 0)
#return v193.histogram.prefetch

v194 = full.trim(9427, 9446)
v194 = v194.crop(left + 60, top + 10, right + 60, bot + 10)
#v194 = v194.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
#v194 = v194.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v194.trim(2, 0)
v194 = v194.trim(0, -1) +\
       v194.trim(1, -1).colorYUV(gain_y = 24) +\
       v194.trim(2, -1).colorYUV(gain_y = 22) +\
       v194.trim(3, -1).colorYUV(gain_y = 20) +\
       v194.trim(4, -1).colorYUV(gain_y = 18) +\
       v194.trim(5, -1).colorYUV(gain_y = 16) +\
       v194.trim(6, -1).colorYUV(gain_y = 15) +\
       v194.trim(7, -1).colorYUV(gain_y = 14) +\
       v194.trim(8, -1).colorYUV(gain_y = 12) +\
       v194.trim(9, -1).colorYUV(gain_y = 10) +\
       v194.trim(10, -1).colorYUV(gain_y = 8) +\
       v194.trim(11, 0)
v194 = v194.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v194.trim(4, 0)
#return v194.histogram.prefetch

v195 = full.trim(9447, 9466)
v195 = v195.crop(left + 60, top + 10, right + 60, bot + 10).trim(0, 16) +\
       v195.crop(left + 60, top + 70, right + 60, bot + 70).trim(17, -1) +\
       v195.crop(left + 60, top + 10, right + 60, bot + 10).trim(18, 0)
v195 = v195.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v195.trim(2, 0)
#return v195.histogram.prefetch

v196 = full.trim(9467, 9471)
v196 = v196.crop(left + 60, top + 10, right + 60, bot + 10)
#return v196.histogram.prefetch

v197 = full.trim(9472, 9560)
v197 = v197.crop(left + 60, top + 10, right + 60, bot + 10)
v197 = v197.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v197.trim(2, 0)
#return v197.histogram.prefetch

v198 = full.trim(9561, 9598)
v198 = v198.crop(left + 60, top + 10, right + 60, bot + 10)
v198 = v198.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v198.trim(2, 0)
#return v198.histogram.prefetch

v199 = full.trim(9599, 9699)
v199 = v199.crop(left + 60, top + 10, right + 60, bot + 10)
v199 = v199.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v199.trim(2, 99) +\
       v199.trim(100, 0).autolevels(gamma = 0.7).colorYUV(off_y = 24, gain_y = -80)
#return v199.histogram.prefetch

v200 = full.trim(9700, 9714)
v200 = v200.crop(left + 60, top + 10, right + 60, bot + 10)
v200 = v200.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v200.trim(2, 0)
#return v200.histogram.prefetch

v201 = full.trim(9715, 9829)
v201 = v201.crop(left + 60, top + 10, right + 60, bot + 10)
v201 = v201.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v201.trim(2, 0)
#return v201.histogram.prefetch

v202 = full.trim(9830, 9845)
v202 = v202.crop(left + 60, top + 10, right + 60, bot + 10)
v202 = v202.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v202.trim(2, 0)
#return v202.histogram.prefetch

v203 = full.trim(9846, 9901)
v203 = v203.crop(left + 60, top + 10, right + 60, bot + 10)
v203 = v203.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v203.trim(2, 0)
#return v203.histogram.prefetch

v204 = full.trim(9902, 9994)
v204 = v204.crop(left + 60, top + 10, right + 60, bot + 10)
v204 = v204.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v204.trim(2, 0)
#return v204.histogram.prefetch

v205 = full.trim(9995, 10088)
v205 = v205.crop(left + 60, top + 10, right + 60, bot + 10)
v205 = v205.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v205.trim(2, 0)
#return v205.histogram.prefetch

v206 = full.trim(10089, 10111) #10159)
v206 = v206.trim(0, 3).crop(left + 60, top + 10, right + 60, bot + 10) +\
       v206.trim(4, -1).crop(left + 60, top - 20, right + 60, bot - 20) +\
       v206.trim(5, 0).crop(left + 60, top + 10, right + 60, bot + 10)
v206 = v206.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v206.trim(2, 20) +\
       v206.trim(21, 0).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false)
#return v206.histogram.prefetch

v207 = full.trim(10112, 10159)
v207 = v207.crop(left + 60, top + 10, right + 60, bot + 10)
v207 = v207.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v207.trim(2, 0)
#return v207.histogram.prefetch

v208 = full.trim(10160, 10165)
v208 = v208.crop(left + 60, top + 10, right + 60, bot + 10)
v208 = v208.trim(0, -1).colorYUV(off_y = -140, gain_y = 1200, off_u = -3, off_v = 2).tweak(sat = 6) +\
       v208.trim(1, -1) +\
       v208.trim(2, -1).colorYUV(off_y = -50, gain_y = 400, off_u = -3, off_v = 2).tweak(sat = 3) +\
       v208.trim(3, 0)
#return v208.histogram.prefetch

v209 = full.trim(10166, 10198)
v209 = v209.crop(left + 60, top + 10, right + 60, bot + 10)
v209 = v209.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#v209 = v209.trim(0, -1).autolevels(gamma = 0.5).colorYUV(off_y = 20, gain_y = -160) +\
#       v209.trim(1, 6).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
#       v209.trim(7, 0)
v209 = v209.trim(0, 7).deflickOverlapped(step = 120, radius = 9, toward_darkest = true, right2left = false) +\
       v209.trim(8, 0)
#return v209.histogram.prefetch

v210 = full.trim(10199, 10238)
v210 = v210.crop(left + 60, top + 10, right + 60, bot + 10)
v210 = v210.trim(0, 4).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v210.trim(5, 0)
#return v210.histogram.prefetch

v211 = full.trim(10239, 10270)
v211 = v211.crop(left + 60, top + 10, right + 60, bot + 10)
v211 = v211.trim(0, -1) +\
       v211.trim(1, -1).autolevels(gamma = 1.5).colorYUV(off_y = 10, gain_y = -40) +\
       v211.trim(2, -1).autolevels(gamma = 1.6).colorYUV(off_y = 10, gain_y = -40) +\
       v211.trim(3, -1).autolevels(gamma = 1.7).colorYUV(off_y = 10, gain_y = -40) +\
       v211.trim(4, 0).autolevels(gamma = 1.9).colorYUV(off_y = 10, gain_y = -40)
#return v211.histogram.prefetch

v212 = full.trim(10271, 10303)
v212 = v212.crop(left + 60, top + 10, right + 60, bot + 10)
v212 = v212.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v212.trim(4, 0)
#return v212.histogram.prefetch

v213 = full.trim(10304, 10332)
v213 = v213.crop(left + 60, top + 10, right + 60, bot + 10).trim(0, 26) +\
       v213.crop(left + 60, top - 10, right + 60, bot - 10).trim(27, -1) +\
       v213.crop(left + 60, top + 40, right + 60, bot + 40).trim(28, 0)
v213 = v213.trim(0, -1) +\
       v213.trim(1, -1).autolevels(gamma = 1.5).colorYUV(off_y = 10, gain_y = -40) +\
       v213.trim(2, 0).autolevels(gamma = 1.7).colorYUV(off_y = 10, gain_y = -40)
#return v213.histogram.prefetch

v214 = full.trim(10335, 10339)
v214 = v214.crop(left + 60, top + 10, right + 60, bot + 10)
#return v214.histogram.prefetch

v215 = full.trim(10340, 10371)
v215 = v215.crop(left + 60, top + 10, right + 60, bot + 10)
v215 = v215.autolevels(input_low = 0, output_low = 10, input_high = 255, output_high = 220, autolevel = false, gamma = 0.7).trim(0, -1) +\
       v215.autolevels(input_low = 12, output_low = 0, input_high = 251, output_high = 255, autolevel = false).trim(1, -1) +\
       v215.autolevels(input_low = 12, output_low = 0, input_high = 255, output_high = 234, autolevel = false).trim(2, 0)
#return v215.histogram.prefetch

v216 = full.trim(10372, 10387)
v216 = v216.crop(left + 60, top + 10, right + 60, bot + 10)
v216 = v216.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v216 = v216.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v216.trim(3, 0)
#return v216.histogram.prefetch

v217 = full.trim(10388, 10400)
v217 = v217.crop(left + 60, top + 10, right + 60, bot + 10)
v217 = v217.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v217.trim(5, 0)
#return v217.histogram.prefetch

v218 = full.trim(10401, 10438)
v218 = v218.crop(left + 60, top + 10, right + 60, bot + 10)
v218 = v218.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v218.trim(2, 0)
#return v218.histogram.prefetch

v219 = full.trim(10439, 10444)
v219 = v219.crop(left + 60, top + 10, right + 60, bot + 10)
v219 = v219.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v219.trim(3, 0)
#return v219.histogram.prefetch

v220 = full.trim(10445, 10449)
v220 = v220.crop(left + 60, top + 10, right + 60, bot + 10)
#v220 = v220.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v220 = v220.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v220.trim(3, 0)
#return v220.histogram.prefetch

v221 = full.trim(10450, 10455)
v221 = v221.crop(left + 60, top + 10, right + 60, bot + 10)
v221 = v221.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v221.trim(3, 0)
#return v221.histogram.prefetch

v222 = full.trim(10456, 10462)
v222 = v222.crop(left + 60, top + 10, right + 60, bot + 10)
v222 = v222.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v222.trim(3, 0)
#return v222.histogram.prefetch

v223 = full.trim(10463, 10483)
v223 = v223.crop(left + 60, top + 10, right + 60, bot + 10)
v223 = v223.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v223 = v223.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v223.trim(3, 0)
#return v223.histogram.prefetch

# 10401, 10439, 10445, 10450, 10456, 10463, 10484, 10493, 10514, 10535, 10539, 10641, 10680, 10720, 10762, 10859, 10884,  #235
v224 = full.trim(10484, 10492)
v224 = v224.crop(left + 60, top + 10, right + 60, bot + 10)
v224 = v224.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 230, autolevel = false)
#v224 = v224.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#       v224.trim(3, 0)
v224 = v224.trim(0, 4).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v224.trim(5, 0)
#return v224.histogram.prefetch
#return v224.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 193

v193 = LSMASHVideoSource(dst_dir + "v193f.mp4").ConvertToYV24()
b_ex = undefined
v193o = v193
v193 = v193.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v193i = v193
v193 = expr(v193.extractY, v193.extractU, v193.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v193 = v193.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v193a = v193i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v193 = v193.colorYUV(off_u = -10, off_v = -0)
#return v193i.interleave(v193).hist_levels.prefetch
v193 = v193.adjustSize
v193 = v193.assumeFPS(18)
v193 = v193.add_blank_audio
return v193.prefetch
#adjustframerate

v194 = LSMASHVideoSource(dst_dir + "v194f.mp4").ConvertToYV24()
b_ex = undefined
v194o = v194
v194 = v194.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v194i = v194
v194 = expr(v194.extractY, v194.extractU, v194.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v194 = v194.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v194a = v194i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v194 = v194.colorYUV(off_u = -10, off_v = -0)
#return v194i.interleave(v194).hist_levels.prefetch
v194 = v194.adjustSize
v194 = v194.assumeFPS(18)
v194 = v194.add_blank_audio
return v194.prefetch
#adjustframerate

v195 = LSMASHVideoSource(dst_dir + "v195f.mp4").ConvertToYV24()
b_ex = undefined
v195o = v195
v195 = v195.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v195i = v195
v195 = expr(v195.extractY, v195.extractU, v195.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v195 = v195.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v195a = v195i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v195 = v195.colorYUV(off_u = -10, off_v = -0)
#return v195i.interleave(v195).hist_levels.prefetch
v195 = v195.adjustSize
v195 = v195.assumeFPS(18)
v195 = v195.add_blank_audio
return v195.prefetch
#adjustframerate

v196 = LSMASHVideoSource(dst_dir + "v196f.mp4").ConvertToYV24()
b_ex = undefined
v196o = v196
v196 = v196.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v196i = v196
v196 = expr(v196.extractY, v196.extractU, v196.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v196 = v196.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v196a = v196i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v196 = v196.colorYUV(off_u = -10, off_v = -0)
#return v196i.interleave(v196).hist_levels.prefetch
v196 = v196.adjustSize
v196 = v196.assumeFPS(18)
v196 = v196.add_blank_audio
return v196.prefetch
#adjustframerate

v197 = LSMASHVideoSource(dst_dir + "v197f.mp4").ConvertToYV24()
b_ex = undefined
v197o = v197
v197 = v197.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v197i = v197
v197 = expr(v197.extractY, v197.extractU, v197.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v197 = v197.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v197a = v197i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v197 = v197.colorYUV(off_u = -10, off_v = -0)
#return v197i.interleave(v197).hist_levels.prefetch
v197 = v197.adjustSize
v197 = v197.assumeFPS(18)
v197 = v197.add_blank_audio
return v197.prefetch
#adjustframerate

v198 = LSMASHVideoSource(dst_dir + "v198f.mp4").ConvertToYV24()
b_ex = undefined
v198o = v198
v198 = v198.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v198i = v198
v198 = expr(v198.extractY, v198.extractU, v198.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v198 = v198.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v198a = v198i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v198 = v198.colorYUV(off_u = -10, off_v = -0)
#return v198i.interleave(v198).hist_levels.prefetch
v198 = v198.adjustSize
v198 = v198.assumeFPS(18)
v198 = v198.add_blank_audio
return v198.prefetch
#adjustframerate

v199 = LSMASHVideoSource(dst_dir + "v199f.mp4").ConvertToYV24()
b_ex = undefined
v199o = v199
v199 = v199.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v199i = v199
v199 = expr(v199.extractY, v199.extractU, v199.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v199 = v199.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v199a = v199i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v199 = v199.colorYUV(off_u = -10, off_v = -0)
#return v199i.interleave(v199).hist_levels.prefetch
v199 = v199.adjustSize
v199 = v199.assumeFPS(18)
v199 = v199.add_blank_audio
return v199.prefetch
#adjustframerate

v200 = LSMASHVideoSource(dst_dir + "v200f.mp4").ConvertToYV24()
b_ex = undefined
v200o = v200
v200 = v200.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v200i = v200
v200 = expr(v200.extractY, v200.extractU, v200.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v200 = v200.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v200a = v200i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v200i.interleave(v200).hist_levels.prefetch
v200 = v200.adjustSize
v200 = v200.assumeFPS(18)
v200 = v200.add_blank_audio
return v200.prefetch
#adjustframerate

v201 = LSMASHVideoSource(dst_dir + "v201f.mp4").ConvertToYV24()
b_ex = undefined
v201o = v201
v201 = v201.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v201i = v201
v201 = expr(v201.extractY, v201.extractU, v201.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v201 = v201.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v201a = v201i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v201i.interleave(v201).hist_levels.prefetch
v201 = v201.adjustSize
v201 = v201.assumeFPS(18)
v201 = v201.add_blank_audio
return v201.prefetch
#adjustframerate

v202 = LSMASHVideoSource(dst_dir + "v202f.mp4").ConvertToYV24()
b_ex = undefined
v202o = v202
v202 = v202.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v202i = v202
v202 = expr(v202.extractY, v202.extractU, v202.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v202 = v202.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v202a = v202i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v202i.interleave(v202).hist_levels.prefetch
v202 = v202.adjustSize
v202 = v202.assumeFPS(18)
v202 = v202.add_blank_audio
return v202.prefetch
#adjustframerate

v203 = LSMASHVideoSource(dst_dir + "v203f.mp4").ConvertToYV24()
b_ex = undefined
v203o = v203
v203 = v203.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v203i = v203
v203 = expr(v203.extractY, v203.extractU, v203.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v203 = v203.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v203a = v203i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v203i.interleave(v203).hist_levels.prefetch
v203 = v203.adjustSize
v203 = v203.assumeFPS(18)
v203 = v203.add_blank_audio
return v203.prefetch
#adjustframerate

v204 = LSMASHVideoSource(dst_dir + "v204f.mp4").ConvertToYV24()
b_ex = undefined
v204o = v204
v204 = v204.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v204i = v204
v204 = expr(v204.extractY, v204.extractU, v204.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v204 = v204.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v204a = v204i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v204i.interleave(v204).hist_levels.prefetch
v204 = v204.adjustSize
v204 = v204.assumeFPS(18)
v204 = v204.add_blank_audio
return v204.prefetch
#adjustframerate

v205 = LSMASHVideoSource(dst_dir + "v205f.mp4").ConvertToYV24()
b_ex = undefined
v205o = v205
v205 = v205.AdjustColor(ou = -2, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v205i = v205
v205 = expr(v205.extractY, v205.extractU, v205.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v205 = v205.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v205a = v205i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v205 = v205.colorYUV(off_u = -2, off_v = -2)
#return v205i.interleave(v205).hist_levels.prefetch
v205 = v205.adjustSize
v205 = v205.assumeFPS(18)
v205 = v205.add_blank_audio
return v205.prefetch
#adjustframerate

v206 = LSMASHVideoSource(dst_dir + "v206f.mp4").ConvertToYV24()
b_ex = undefined
v206o = v206
v206 = v206.AdjustColor(ou = +2, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v206i = v206
v206 = expr(v206.extractY, v206.extractU, v206.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v206 = v206.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v206a = v206i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v206 = v206.colorYUV(off_u = -8, off_v = -0)
#return v206i.interleave(v206).hist_levels.prefetch
v206 = v206.adjustSize
v206 = v206.assumeFPS(18)
v206 = v206.add_blank_audio
return v206.prefetch
#adjustframerate

v207 = LSMASHVideoSource(dst_dir + "v207f.mp4").ConvertToYV24()
b_ex = undefined
v207o = v207
v207 = v207.AdjustColor(ou = +2, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v207i = v207
v207 = expr(v207.extractY, v207.extractU, v207.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v207 = v207.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v207a = v207i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v207 = v207.colorYUV(off_u = -8, off_v = -0)
#return v207i.interleave(v207).hist_levels.prefetch
v207 = v207.adjustSize
v207 = v207.assumeFPS(18)
v207 = v207.add_blank_audio
return v207.prefetch
#adjustframerate

v208 = LSMASHVideoSource(dst_dir + "v208f.mp4").ConvertToYV24()
b_ex = undefined
v208o = v208
v208 = v208.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v208i = v208
v208 = expr(v208.extractY, v208.extractU, v208.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v208 = v208.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v208a = v208i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v208 = v208.colorYUV(off_u = -0, off_v = +4)
#return v208i.interleave(v208).hist_levels.prefetch
v208 = v208.adjustSize
v208 = v208.assumeFPS(18)
v208 = v208.add_blank_audio
return v208.prefetch
#adjustframerate

v209 = LSMASHVideoSource(dst_dir + "v209f.mp4").ConvertToYV24()
b_ex = undefined
#b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
#b_ex = "z x - x 2. / > z y - y 2. / > & x y + 2. / z ?"
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
#if (b > r && b > g && (b - r) > r / 2. && (b - g) > g / 2.
v209o = v209
v209 = v209.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)#,\
#                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 135, 135, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#v209 = v209.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 128. * 128. + gy^ V 0.01 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 128. * 128. + gz^ V 0.01 > gz z ?"
v209i = v209
v209 = expr(v209.extractY, v209.extractU, v209.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v209 = v209.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v209a = v209i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v209 = v209.colorYUV(off_u = -2, off_v = +2)
#return v209i.interleave(v209).hist_levels.prefetch
v209 = v209.adjustSize
v209 = v209.assumeFPS(18)
v209 = v209.add_blank_audio
return v209.prefetch
#adjustframerate

v210 = LSMASHVideoSource(dst_dir + "v210f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v210o = v210
v210 = v210.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 128. * 128. + gy^ V 0.01 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 128. * 128. + gz^ V 0.01 > gz z ?"
v210i = v210
v210 = expr(v210.extractY, v210.extractU, v210.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v210 = v210.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v210a = v210i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v210 = v210.colorYUV(off_u = -2, off_v = +2)
#return v210i.interleave(v210).hist_levels.prefetch
v210 = v210.adjustSize
v210 = v210.assumeFPS(18)
v210 = v210.add_blank_audio
return v210.prefetch
#adjustframerate

v211 = LSMASHVideoSource(dst_dir + "v211f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v211o = v211
v211 = v211.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
#v211 = v211.colorYUV(off_u = -2, off_v = +2)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 2. / 128. * 128. + gy^ V 0.01 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.01 > gz z ?"
v211i = v211
v211 = expr(v211.extractY, v211.extractU, v211.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v211 = v211.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v211a = v211i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v211 = v211.colorYUV(off_u = -2, off_v = +2)
#return v211i.interleave(v211).hist_levels.prefetch
v211 = v211.adjustSize
v211 = v211.assumeFPS(18)
v211 = v211.add_blank_audio
return v211.prefetch
#adjustframerate

v212 = LSMASHVideoSource(dst_dir + "v212f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v212o = v212
v212 = v212.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v212i = v212
v212 = expr(v212.extractY, v212.extractU, v212.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v212 = v212.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v212a = v212i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v212 = v212.colorYUV(off_u = -0, off_v = +4)
#return v212i.interleave(v212).hist_levels.prefetch
v212 = v212.adjustSize
v212 = v212.assumeFPS(18)
v212 = v212.add_blank_audio
return v212.prefetch
#adjustframerate

v213 = LSMASHVideoSource(dst_dir + "v213f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v213o = v213
v213 = v213.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v213i = v213
v213 = expr(v213.extractY, v213.extractU, v213.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v213 = v213.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v213a = v213i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v213 = v213.colorYUV(off_u = -0, off_v = -2)
#return v213i.interleave(v213).hist_levels.prefetch
v213 = v213.adjustSize
v213 = v213.assumeFPS(18)
v213 = v213.add_blank_audio
return v213.prefetch
#adjustframerate

v214 = LSMASHVideoSource(dst_dir + "v214f.mp4").ConvertToYV24()
b_ex = undefined
v214o = v214
v214 = v214.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v214i = v214
v214 = expr(v214.extractY, v214.extractU, v214.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v214 = v214.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v214a = v214i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v214i.interleave(v214).hist_levels.prefetch
v214 = v214.adjustSize
v214 = v214.assumeFPS(18)
v214 = v214.add_blank_audio
return v214.prefetch
#adjustframerate

v215 = LSMASHVideoSource(dst_dir + "v215f.mp4").ConvertToYV24()
b_ex = undefined
v215o = v215
v215 = v215.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v215i = v215
v215 = expr(v215.extractY, v215.extractU, v215.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v215 = v215.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v215a = v215i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v215i.interleave(v215).hist_levels.prefetch
v215 = v215.adjustSize
v215 = v215.assumeFPS(18)
v215 = v215.add_blank_audio
return v215.prefetch
#adjustframerate

v216 = LSMASHVideoSource(dst_dir + "v216f.mp4").ConvertToYV24()
b_ex = undefined
v216o = v216
v216 = v216.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v216i = v216
v216 = expr(v216.extractY, v216.extractU, v216.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v216 = v216.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v216a = v216i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v216i.interleave(v216).hist_levels.prefetch
v216 = v216.adjustSize
v216 = v216.assumeFPS(18)
v216 = v216.add_blank_audio
return v216.prefetch
#adjustframerate

v217 = LSMASHVideoSource(dst_dir + "v217f.mp4").ConvertToYV24()
b_ex = undefined
v217o = v217
v217 = v217.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v217i = v217
v217 = expr(v217.extractY, v217.extractU, v217.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v217 = v217.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v217a = v217i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v217i.interleave(v217).hist_levels.prefetch
v217 = v217.adjustSize
v217 = v217.assumeFPS(18)
v217 = v217.add_blank_audio
return v217.prefetch
#adjustframerate

v218 = LSMASHVideoSource(dst_dir + "v218f.mp4").ConvertToYV24()
b_ex = undefined
v218o = v218
v218 = v218.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v218i = v218
v218 = expr(v218.extractY, v218.extractU, v218.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v218 = v218.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v218a = v218i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v218i.interleave(v218).hist_levels.prefetch
v218 = v218.adjustSize
v218 = v218.assumeFPS(18)
v218 = v218.add_blank_audio
return v218.prefetch
#adjustframerate

v219 = LSMASHVideoSource(dst_dir + "v219f.mp4").ConvertToYV24()
b_ex = undefined
v219o = v219
v219 = v219.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v219i = v219
v219 = expr(v219.extractY, v219.extractU, v219.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v219 = v219.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v219a = v219i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v219i.interleave(v219).hist_levels.prefetch
v219 = v219.adjustSize
v219 = v219.assumeFPS(18)
v219 = v219.add_blank_audio
return v219.prefetch
#adjustframerate

v220 = LSMASHVideoSource(dst_dir + "v220f.mp4").ConvertToYV24()
b_ex = undefined
v220o = v220
v220 = v220.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v220i = v220
v220 = expr(v220.extractY, v220.extractU, v220.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v220 = v220.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v220a = v220i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v220i.interleave(v220).hist_levels.prefetch
v220 = v220.adjustSize
v220 = v220.assumeFPS(18)
v220 = v220.add_blank_audio
return v220.prefetch
#adjustframerate

v221 = LSMASHVideoSource(dst_dir + "v221f.mp4").ConvertToYV24()
b_ex = undefined
v221o = v221
v221 = v221.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v221i = v221
v221 = expr(v221.extractY, v221.extractU, v221.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v221 = v221.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v221a = v221i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v221i.interleave(v221).hist_levels.prefetch
v221 = v221.adjustSize
v221 = v221.assumeFPS(18)
v221 = v221.add_blank_audio
return v221.prefetch
#adjustframerate

v222 = LSMASHVideoSource(dst_dir + "v222f.mp4").ConvertToYV24()
b_ex = undefined
v222o = v222
v222 = v222.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v222i = v222
v222 = expr(v222.extractY, v222.extractU, v222.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v222 = v222.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v222a = v222i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v222i.interleave(v222).hist_levels.prefetch
v222 = v222.adjustSize
v222 = v222.assumeFPS(18)
v222 = v222.add_blank_audio
return v222.prefetch
#adjustframerate

v223 = LSMASHVideoSource(dst_dir + "v223f.mp4").ConvertToYV24()
b_ex = undefined
v223o = v223
v223 = v223.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v223i = v223
v223 = expr(v223.extractY, v223.extractU, v223.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v223 = v223.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v223a = v223i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v223i.interleave(v223).hist_levels.prefetch
v223 = v223.adjustSize
v223 = v223.assumeFPS(18)
v223 = v223.add_blank_audio
return v223.prefetch
#adjustframerate

v224 = LSMASHVideoSource(dst_dir + "v224f.mp4").ConvertToYV24()
#v224 = v224.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v224 = v224.trim(105, -1).loop(v224.frameCount).crop(0, 0, -(v224.width - add_width), 0).stackHorizontal(v224)
#return v224.histogram.prefetch
v224o = v224
#v224 = v224.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
v224 = v224.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v224.hist_levels.prefetch
#v224 = v224.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v224 = expr(v224.extractY, v224.extractU, v224.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v224i = v224
v224 = expr(v224.extractY, v224.extractU, v224.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v224 = v224.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v224a = v224i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v224 = v224.crop(add_width, 0, 0, 0)
#v224i = v224i.crop(add_width, 0, 0, 0)
#v224a = v224a.crop(add_width, 0, 0, 0)
#v224 = v224.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v224 = v224.colorYUV(off_u = -0, off_v = -2)
#v224 = v224i
#return v224i.interleave(v224).hist_levels.prefetch
v224 = v224.adjustSize
v224 = v224.assumeFPS(18)
v224 = v224.add_blank_audio
return v224.prefetch
#adjustframerate

#******
*/
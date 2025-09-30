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
# 8944, 8973, 8977, 9014, 9055, 9076, 9155, 9187, 9244, 9252, 9307, 9316, 9362, 9420, 9427, 9447, 9467, 9472, 9561, 9599, #200

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
v161 = full.trim(8452, 8477)
v161 = v161.crop(left + 60, top + 10, right + 60, bot + 10)
v161 = v161.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v161.trim(2, 0)
#return v161.histogram.prefetch
#return v161.colorYUV(gain_y = 80).hist_levels.prefetch

v162 = full.trim(8478, 8501)
v162 = v162.crop(left + 60, top + 10, right + 60, bot + 10)
v162 = v162.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
       v162.trim(1, 0)
#return v162.histogram.prefetch
#return v162.colorYUV(gain_y = 80).hist_levels.prefetch

v163 = full.trim(8502, 8515)
v163 = v163.crop(left + 60, top + 10, right + 60, bot + 10)
v163 = v163.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v163.trim(5, 0)
#return v163.histogram.prefetch
#return v163.colorYUV(gain_y = 80).hist_levels.prefetch

v164 = full.trim(8516, 8530)
v164 = v164.crop(left + 60, top + 10, right + 60, bot + 10)
v164 = v164.trim(0, 3) +\
       v164.trim(4, -1).colorYUV(gain_y = 10) +\
       v164.trim(5, 0)
v164 = v164.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v164.trim(5, 0)
#return v164.histogram.prefetch
#return v164.colorYUV(gain_y = 80).hist_levels.prefetch

v165 = full.trim(8531, 8563)
v165 = v165.crop(left + 60, top + 10, right + 60, bot + 10)
v165 = v165.trim(0, 3) +\
       v165.trim(4, -1).colorYUV(gain_y = 10) +\
       v165.trim(5, 0)
v165 = v165.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v165.trim(5, 0)
#return v165.histogram.prefetch
#return v165.colorYUV(gain_y = 80).hist_levels.prefetch

v166 = full.trim(8564, 8581)
v166 = v166.crop(left + 60, top + 10, right + 60, bot + 10)
v166 = v166.trim(0, 3) +\
       v166.trim(4, -1).colorYUV(gain_y = 10) +\
       v166.trim(5, 0)
v166 = v166.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v166.trim(5, 0)
#return v166.histogram.prefetch
#return v166.colorYUV(gain_y = 80).hist_levels.prefetch

v167 = full.trim(8582, 8613)
v167 = v167.crop(left + 60, top + 10, right + 60, bot + 10)
v167 = v167.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v167.trim(4, 0)
#return v167.histogram.prefetch
#return v167.colorYUV(gain_y = 80).hist_levels.prefetch

v168 = full.trim(8614, 8618)
v168 = v168.crop(left + 60, top + 10, right + 60, bot + 10)
v168 = v168.deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false)
#return v168.histogram.prefetch
#return v168.colorYUV(gain_y = 80).hist_levels.prefetch

v169 = full.trim(8619, 8624)
v169 = v169.crop(left + 60, top + 10, right + 60, bot + 10)
v169 = v169.trim(0, -1) +\
       v169.trim(1, -1).colorYUV(gain_y = 10) +\
       v169.trim(2, 0)
v169 = v169.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v169.trim(2, 0)
#return v169.histogram.prefetch
#return v169.colorYUV(gain_y = 80).hist_levels.prefetch

v170 = full.trim(8625, 8639)
v170 = v170.crop(left + 60, top + 10, right + 60, bot + 10)
v170 = v170.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v170.trim(5, 0)
#return v170.histogram.prefetch
#return v170.colorYUV(gain_y = 80).hist_levels.prefetch

v171 = full.trim(8640, 8652)
v171 = v171.crop(left + 60, top + 10, right + 60, bot + 10)
v171 = v171.trim(0, 3) +\
       v171.trim(4, -1).colorYUV(gain_y = 20) +\
       v171.trim(5, 0)
v171 = v171.trim(0, 4).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v171.trim(5, 0)
#return v171.histogram.prefetch
#return v171.colorYUV(gain_y = 80).hist_levels.prefetch

v172 = full.trim(8653, 8719)
v172 = v172.crop(left + 60, top + 10, right + 60, bot + 10)
v172 = v172.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v172.trim(2, 0)
#return v172.histogram.prefetch
#return v172.colorYUV(gain_y = 80).hist_levels.prefetch

v173 = full.trim(8720, 8745)
v173 = v173.crop(left + 60, top + 10, right + 60, bot + 10)
v173 = v173.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
#return v173.histogram.prefetch
#return v173.colorYUV(gain_y = 80).hist_levels.prefetch

v174 = full.trim(8746, 8791)
v174 = v174.crop(left + 60, top + 10, right + 60, bot + 10)
v174 = v174.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v174 = v174.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v174.trim(2, 0)
#return v174.histogram.prefetch
#return v174.colorYUV(gain_y = 80).hist_levels.prefetch

v175 = full.trim(8792, 8797)
v175 = v175.crop(left + 60, top + 10, right + 60, bot + 10)
v175 = v175.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v175.trim(2, 0)
#return v175.histogram.prefetch
#return v175.colorYUV(gain_y = 80).hist_levels.prefetch

v176 = full.trim(8798, 8833)
v176 = v176.crop(left + 60, top + 10, right + 60, bot + 10)
v176 = v176.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v176.trim(2, 0)
#return v176.histogram.prefetch
#return v176.colorYUV(gain_y = 80).hist_levels.prefetch

v177 = full.trim(8834, 8886)
v177 = v177.crop(left + 60, top + 10, right + 60, bot + 10)
v177 = v177.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v177.trim(2, 0)
#return v177.histogram.prefetch
#return v177.colorYUV(gain_y = 80).hist_levels.prefetch

v178 = full.trim(8887, 8935)
v178 = v178.crop(left + 60, top + 10, right + 60, bot + 10)
v178 = v178.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v178.trim(4, 0)
#return v178.histogram.prefetch
#return v178.colorYUV(gain_y = 80).hist_levels.prefetch

v179 = full.trim(8936, 8943)
v179 = v179.crop(left + 60, top + 10, right + 60, bot + 10)
v179 = v179.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v179.trim(4, 0)
#return v179.histogram.prefetch
#return v179.colorYUV(gain_y = 80).hist_levels.prefetch

v180 = full.trim(8944, 8972)
v180 = v180.crop(left + 60, top + 10, right + 60, bot + 10)
v180 = v180.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v180.trim(4, 0)
#return v180.histogram.prefetch
#return v180.colorYUV(gain_y = 80).hist_levels.prefetch

v181 = full.trim(8973, 8976)
v181 = v181.crop(left + 60, top + 10, right + 60, bot + 10)
v181 = v181.trim(0, 1) +\
       v181.trim(2, -1).colorYUV(gain_y = 10) +\
       v181.trim(3, 0)
v181 = v181.trim(0, 2).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v181.trim(3, 0)
#return v181.histogram.prefetch
#return v181.colorYUV(gain_y = 80).hist_levels.prefetch

v182 = full.trim(8977, 9013)
v182 = v182.crop(left + 60, top + 10, right + 60, bot + 10)
v182 = v182.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v182.trim(2, 0)
#return v182.histogram.prefetch
#return v182.colorYUV(gain_y = 80).hist_levels.prefetch

v183 = full.trim(9014, 9054)
v183 = v183.crop(left + 60, top + 10, right + 60, bot + 10)
v183 = v183.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v183.trim(4, 0)
#return v183.histogram.prefetch
#return v183.colorYUV(gain_y = 80).hist_levels.prefetch

v184 = full.trim(9055, 9075)
v184 = v184.crop(left + 60, top + 10, right + 60, bot + 10)
v184 = v184.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v184.trim(4, 0)
#return v184.histogram.prefetch
#return v184.colorYUV(gain_y = 80).hist_levels.prefetch

v185 = full.trim(9076, 9154)
v185 = v185.crop(left + 60, top + 10, right + 60, bot + 10)
v185 = v185.trim(0, 3).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
       v185.trim(4, 0)
#return v185.histogram.prefetch
#return v185.colorYUV(gain_y = 80).hist_levels.prefetch

v186 = full.trim(9155, 9186)
v186 = v186.crop(left + 60, top + 10, right + 60, bot + 10)
v186 = v186.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v186 = v186.trim(0, -1).colorYUV(gain_y = 80) +\
       v186.trim(2, -1).colorYUV(gain_y = 30) +\
       v186.trim(3, -1).colorYUV(gain_y = 10) +\
       v186.trim(4, 0)
#return v186.histogram.prefetch
#return v186.colorYUV(gain_y = 80).hist_levels.prefetch

v187 = full.trim(9187, 9243)
v187 = v187.crop(left + 60, top + 10, right + 60, bot + 10)
v187 = v187.trim(0, -1).autolevels(gamma = 0.5).colorYUV(off_y = 16, gain_y = -80) +\
       v187.trim(1, -1).colorYUV(gain_y = -66) +\
       v187.trim(2, -1).colorYUV(gain_y = -66) +\
       v187.trim(3, -1).colorYUV(gain_y = -46) +\
       v187.trim(4, -1).colorYUV(gain_y = -26) +\
       v187.trim(5, -1).colorYUV(gain_y = -16) +\
       v187.trim(6, -1).colorYUV(gain_y = -8) +\
       v187.trim(7, 0)
#return v187.histogram.prefetch
#return v187.colorYUV(gain_y = 80).hist_levels.prefetch

v188 = full.trim(9244, 9251)
v188 = v188.crop(left + 60, top + 10, right + 60, bot + 10)
#return v188.histogram.prefetch
#return v188.colorYUV(gain_y = 80).hist_levels.prefetch

v189 = full.trim(9252, 9306)
v189 = v189.crop(left + 60, top + 10, right + 60, bot + 10)
v189 = v189.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v189.trim(2, 0)
#return v189.histogram.prefetch
#return v189.colorYUV(gain_y = 80).hist_levels.prefetch

v190 = full.trim(9307, 9315)
v190 = v190.crop(left + 60, top + 10, right + 60, bot + 10)
v190 = v190.trim(0, -1) +\
       v190.trim(1, -1).colorYUV(gain_y = 12) +\
       v190.trim(2, -1).autolevels(gamma = 1.5).colorYUV(off_y = 8, gain_y = -24) +\
       v190.trim(3, 6).autolevels(gamma = 1.9).colorYUV(off_y = 8, gain_y = -24) +\
       v190.trim(7, 0).autolevels(gamma = 1.5).colorYUV(off_y = 8, gain_y = -24)
v190 = v190.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v190.trim(2, 0)
#return v190.histogram.prefetch
#return v190.colorYUV(gain_y = 80).hist_levels.prefetch

v191 = full.trim(9316, 9361)
v191 = v191.crop(left + 60, top + 10, right + 60, bot + 10)
v191 = v191.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v191.trim(2, 0)
#return v191.histogram.prefetch
#return v191.colorYUV(gain_y = 80).hist_levels.prefetch

# 8944, 8973, 8977, 9014, 9055, 9076, 9155, 9187, 9244, 9252, 9307, 9316, 9362, 9420, 9427, 9447, 9467, 9472, 9561, 9599, #200
v192 = full.trim(9362, 9419)
v192 = v192.crop(left + 60, top + 10, right + 60, bot + 10)
#v192 = v192.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v192 = v192.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v192.trim(2, 0)
#v192 = v192.trim(0, 7).deflickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
#       v192.trim(8, 0)
#return v192.histogram.prefetch
#return v192.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 161

v161 = LSMASHVideoSource(dst_dir + "v161f.mp4").ConvertToYV24()
b_ex = undefined
v161o = v161
v161 = v161.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v161i = v161
v161 = expr(v161.extractY, v161.extractU, v161.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v161 = v161.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v161a = v161i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v161i.interleave(v161).hist_levels.prefetch
v161 = v161.adjustSize
v161 = v161.assumeFPS(18)
v161 = v161.add_blank_audio
return v161.prefetch
#adjustframerate

v162 = LSMASHVideoSource(dst_dir + "v162f.mp4").ConvertToYV24()
b_ex = undefined
v162o = v162
v162 = v162.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v162i = v162
v162 = expr(v162.extractY, v162.extractU, v162.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v162 = v162.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v162a = v162i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v162 = v162.colorYUV(off_u = +2, off_v = -2)
#v162 = v162i
#return v162i.interleave(v162).hist_levels.prefetch
v162 = v162.adjustSize
v162 = v162.assumeFPS(18)
v162 = v162.add_blank_audio
return v162.prefetch
#adjustframerate

v163 = LSMASHVideoSource(dst_dir + "v163f.mp4").ConvertToYV24()
b_ex = undefined
v163o = v163
v163 = v163.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v163i = v163
v163 = expr(v163.extractY, v163.extractU, v163.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v163 = v163.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v163a = v163i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v163i.interleave(v163).hist_levels.prefetch
v163 = v163.adjustSize
v163 = v163.assumeFPS(18)
v163 = v163.add_blank_audio
return v163.prefetch
#adjustframerate

v164 = LSMASHVideoSource(dst_dir + "v164f.mp4").ConvertToYV24()
b_ex = undefined
v164o = v164
v164 = v164.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v164i = v164
v164 = expr(v164.extractY, v164.extractU, v164.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v164 = v164.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v164a = v164i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v164i.interleave(v164).hist_levels.prefetch
v164 = v164.adjustSize
v164 = v164.assumeFPS(18)
v164 = v164.add_blank_audio
return v164.prefetch
#adjustframerate

v165 = LSMASHVideoSource(dst_dir + "v165f.mp4").ConvertToYV24()
b_ex = undefined
v165o = v165
v165 = v165.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v165i = v165
v165 = expr(v165.extractY, v165.extractU, v165.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v165 = v165.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v165a = v165i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v165i.interleave(v165).hist_levels.prefetch
v165 = v165.adjustSize
v165 = v165.assumeFPS(18)
v165 = v165.add_blank_audio
return v165.prefetch
#adjustframerate

v166 = LSMASHVideoSource(dst_dir + "v166f.mp4").ConvertToYV24()
b_ex = undefined
v166o = v166
v166 = v166.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v166i = v166
v166 = expr(v166.extractY, v166.extractU, v166.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v166 = v166.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v166a = v166i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v166i.interleave(v166).hist_levels.prefetch
v166 = v166.adjustSize
v166 = v166.assumeFPS(18)
v166 = v166.add_blank_audio
return v166.prefetch
#adjustframerate

v167 = LSMASHVideoSource(dst_dir + "v167f.mp4").ConvertToYV24()
b_ex = undefined
v167o = v167
v167 = v167.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v167i = v167
v167 = expr(v167.extractY, v167.extractU, v167.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v167 = v167.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v167a = v167i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v167i.interleave(v167).hist_levels.prefetch
v167 = v167.adjustSize
v167 = v167.assumeFPS(18)
v167 = v167.add_blank_audio
return v167.prefetch
#adjustframerate

v168 = LSMASHVideoSource(dst_dir + "v168f.mp4").ConvertToYV24()
b_ex = undefined
v168o = v168
v168 = v168.AdjustColor(ou = +4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v168i = v168
v168 = expr(v168.extractY, v168.extractU, v168.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v168 = v168.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v168a = v168i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v168i.interleave(v168).hist_levels.prefetch
v168 = v168.adjustSize
v168 = v168.assumeFPS(18)
v168 = v168.add_blank_audio
return v168.prefetch
#adjustframerate

v169 = LSMASHVideoSource(dst_dir + "v169f.mp4").ConvertToYV24()
b_ex = undefined
v169o = v169
v169 = v169.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v169i = v169
v169 = expr(v169.extractY, v169.extractU, v169.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v169 = v169.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v169a = v169i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v169i.interleave(v169).hist_levels.prefetch
v169 = v169.adjustSize
v169 = v169.assumeFPS(18)
v169 = v169.add_blank_audio
return v169.prefetch
#adjustframerate

v170 = LSMASHVideoSource(dst_dir + "v170f.mp4").ConvertToYV24()
b_ex = undefined
v170o = v170
v170 = v170.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v170i = v170
v170 = expr(v170.extractY, v170.extractU, v170.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v170 = v170.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v170a = v170i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v170i.interleave(v170).hist_levels.prefetch
v170 = v170.adjustSize
v170 = v170.assumeFPS(18)
v170 = v170.add_blank_audio
return v170.prefetch
#adjustframerate

v171 = LSMASHVideoSource(dst_dir + "v171f.mp4").ConvertToYV24()
b_ex = undefined
v171o = v171
v171 = v171.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v171i = v171
v171 = expr(v171.extractY, v171.extractU, v171.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v171 = v171.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v171a = v171i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v171i.interleave(v171).hist_levels.prefetch
v171 = v171.adjustSize
v171 = v171.assumeFPS(18)
v171 = v171.add_blank_audio
return v171.prefetch
#adjustframerate

v172 = LSMASHVideoSource(dst_dir + "v172f.mp4").ConvertToYV24()
b_ex = undefined
v172o = v172
v172 = v172.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v172i = v172
v172 = expr(v172.extractY, v172.extractU, v172.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v172 = v172.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v172a = v172i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v172i.interleave(v172).hist_levels.prefetch
v172 = v172.adjustSize
v172 = v172.assumeFPS(18)
v172 = v172.add_blank_audio
return v172.prefetch
#adjustframerate

v173 = LSMASHVideoSource(dst_dir + "v173f.mp4").ConvertToYV24()
b_ex = undefined
v173o = v173
v173 = v173.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.7 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v173i = v173
v173 = expr(v173.extractY, v173.extractU, v173.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v173 = v173.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v173a = v173i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v173i.interleave(v173).hist_levels.prefetch
v173 = v173.adjustSize
v173 = v173.assumeFPS(18)
v173 = v173.add_blank_audio
return v173.prefetch
#adjustframerate

v174 = LSMASHVideoSource(dst_dir + "v174f.mp4").ConvertToYV24()
b_ex = undefined
v174o = v174
v174 = v174.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.7 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v174i = v174
v174 = expr(v174.extractY, v174.extractU, v174.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v174 = v174.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v174a = v174i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v174i.interleave(v174).hist_levels.prefetch
v174 = v174.adjustSize
v174 = v174.assumeFPS(18)
v174 = v174.add_blank_audio
return v174.prefetch
#adjustframerate

v175 = LSMASHVideoSource(dst_dir + "v175f.mp4").ConvertToYV24()
b_ex = undefined
v175o = v175
v175 = v175.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.7 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v175i = v175
v175 = expr(v175.extractY, v175.extractU, v175.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v175 = v175.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v175a = v175i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v175i.interleave(v175).hist_levels.prefetch
v175 = v175.adjustSize
v175 = v175.assumeFPS(18)
v175 = v175.add_blank_audio
return v175.prefetch
#adjustframerate

v176 = LSMASHVideoSource(dst_dir + "v176f.mp4").ConvertToYV24()
b_ex = undefined
v176o = v176
v176 = v176.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.7 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v176i = v176
v176 = expr(v176.extractY, v176.extractU, v176.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v176 = v176.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v176a = v176i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v176i.interleave(v176).hist_levels.prefetch
v176 = v176.adjustSize
v176 = v176.assumeFPS(18)
v176 = v176.add_blank_audio
return v176.prefetch
#adjustframerate

v177 = LSMASHVideoSource(dst_dir + "v177f.mp4").ConvertToYV24()
b_ex = undefined
v177o = v177
v177 = v177.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v177i = v177
v177 = expr(v177.extractY, v177.extractU, v177.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v177 = v177.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v177a = v177i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v177 = v177.colorYUV(off_u = -4, off_v = -4)
#return v177i.interleave(v177).hist_levels.prefetch
v177 = v177.adjustSize
v177 = v177.assumeFPS(18)
v177 = v177.add_blank_audio
return v177.prefetch
#adjustframerate

v178 = LSMASHVideoSource(dst_dir + "v178f.mp4").ConvertToYV24()
b_ex = undefined
v178o = v178
v178 = v178.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v178i = v178
v178 = expr(v178.extractY, v178.extractU, v178.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v178 = v178.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v178a = v178i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v178 = v178.colorYUV(off_u = -4, off_v = -4)
#return v178i.interleave(v178).hist_levels.prefetch
v178 = v178.adjustSize
v178 = v178.assumeFPS(18)
v178 = v178.add_blank_audio
return v178.prefetch
#adjustframerate

v179 = LSMASHVideoSource(dst_dir + "v179f.mp4").ConvertToYV24()
b_ex = undefined
v179o = v179
v179 = v179.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v179i = v179
v179 = expr(v179.extractY, v179.extractU, v179.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v179 = v179.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v179a = v179i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v179 = v179.colorYUV(off_u = -4, off_v = -4)
#return v179i.interleave(v179).hist_levels.prefetch
v179 = v179.adjustSize
v179 = v179.assumeFPS(18)
v179 = v179.add_blank_audio
return v179.prefetch
#adjustframerate

v180 = LSMASHVideoSource(dst_dir + "v180f.mp4").ConvertToYV24()
b_ex = undefined
v180o = v180
v180 = v180.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v180i = v180
v180 = expr(v180.extractY, v180.extractU, v180.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v180 = v180.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v180a = v180i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v180 = v180.colorYUV(off_u = -4, off_v = -2)
#return v180i.interleave(v180).hist_levels.prefetch
v180 = v180.adjustSize
v180 = v180.assumeFPS(18)
v180 = v180.add_blank_audio
return v180.prefetch
#adjustframerate

v181 = LSMASHVideoSource(dst_dir + "v181f.mp4").ConvertToYV24()
b_ex = undefined
v181o = v181
v181 = v181.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v181i = v181
v181 = expr(v181.extractY, v181.extractU, v181.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v181 = v181.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v181a = v181i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v181 = v181.colorYUV(off_u = -4, off_v = -2)
#return v181i.interleave(v181).hist_levels.prefetch
v181 = v181.adjustSize
v181 = v181.assumeFPS(18)
v181 = v181.add_blank_audio
return v181.prefetch
#adjustframerate

v182 = LSMASHVideoSource(dst_dir + "v182f.mp4").ConvertToYV24()
b_ex = undefined
v182o = v182
v182 = v182.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v182i = v182
v182 = expr(v182.extractY, v182.extractU, v182.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v182 = v182.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v182a = v182i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v182 = v182.colorYUV(off_u = -8, off_v = -2)
#return v182i.interleave(v182).hist_levels.prefetch
v182 = v182.adjustSize
v182 = v182.assumeFPS(18)
v182 = v182.add_blank_audio
return v182.prefetch
#adjustframerate

v183 = LSMASHVideoSource(dst_dir + "v183f.mp4").ConvertToYV24()
b_ex = undefined
v183o = v183
v183 = v183.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v183i = v183
v183 = expr(v183.extractY, v183.extractU, v183.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v183 = v183.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v183a = v183i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v183 = v183.colorYUV(off_u = -10, off_v = -4)
#return v183i.interleave(v183).hist_levels.prefetch
v183 = v183.adjustSize
v183 = v183.assumeFPS(18)
v183 = v183.add_blank_audio
return v183.prefetch
#adjustframerate

v184 = LSMASHVideoSource(dst_dir + "v184f.mp4").ConvertToYV24()
b_ex = undefined
v184o = v184
v184 = v184.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v184i = v184
v184 = expr(v184.extractY, v184.extractU, v184.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v184 = v184.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v184a = v184i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v184 = v184.colorYUV(off_u = -10, off_v = -4)
#return v184i.interleave(v184).hist_levels.prefetch
v184 = v184.adjustSize
v184 = v184.assumeFPS(18)
v184 = v184.add_blank_audio
return v184.prefetch
#adjustframerate

v185 = LSMASHVideoSource(dst_dir + "v185f.mp4").ConvertToYV24()
b_ex = undefined
v185o = v185
v185 = v185.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v185i = v185
v185 = expr(v185.extractY, v185.extractU, v185.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v185 = v185.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v185a = v185i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v185 = v185.colorYUV(off_u = -10, off_v = -4)
#return v185i.interleave(v185).hist_levels.prefetch
v185 = v185.adjustSize
v185 = v185.assumeFPS(18)
v185 = v185.add_blank_audio
return v185.prefetch
#adjustframerate

v186 = LSMASHVideoSource(dst_dir + "v186f.mp4").ConvertToYV24()
v186 = v186.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v186o = v186
#return v186.histogram.prefetch
v186 = v186.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.0004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.5 / G0^ 2.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v186i = v186
v186 = expr(v186.extractY, v186.extractU, v186.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v186 = v186.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v186a = v186i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v186 = v186.colorYUV(off_u = -4, off_v = -4)
#return v186i.interleave(v186).hist_levels.prefetch
v186 = v186.adjustSize
v186 = v186.assumeFPS(18)
v186 = v186.add_blank_audio
return v186.prefetch
#adjustframerate

v187 = LSMASHVideoSource(dst_dir + "v187f.mp4").ConvertToYV24()
b_ex = undefined
v187o = v187
v187 = v187.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v187i = v187
v187 = expr(v187.extractY, v187.extractU, v187.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v187 = v187.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v187a = v187i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v187 = v187.colorYUV(off_u = -6, off_v = -4)
#return v187i.interleave(v187).hist_levels.prefetch
v187 = v187.adjustSize
v187 = v187.assumeFPS(18)
v187 = v187.add_blank_audio
return v187.prefetch
#adjustframerate

v188 = LSMASHVideoSource(dst_dir + "v188f.mp4").ConvertToYV24()
b_ex = undefined
v188o = v188
v188 = v188.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.15 P0^ 0.9 P1^ 1. 2.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v188i = v188
v188 = expr(v188.extractY, v188.extractU, v188.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v188 = v188.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v188a = v188i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v188 = v188.colorYUV(off_u = -6, off_v = -2)
#return v188i.interleave(v188).hist_levels.prefetch
v188 = v188.adjustSize
v188 = v188.assumeFPS(18)
v188 = v188.add_blank_audio
return v188.prefetch
#adjustframerate

v189 = LSMASHVideoSource(dst_dir + "v189f.mp4").ConvertToYV24()
b_ex = undefined
v189o = v189
v189 = v189.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.15 P0^ 0.9 P1^ 1. 2.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v189i = v189
v189 = expr(v189.extractY, v189.extractU, v189.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v189 = v189.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v189a = v189i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v189 = v189.colorYUV(off_u = -6, off_v = -2)
#return v189i.interleave(v189).hist_levels.prefetch
v189 = v189.adjustSize
v189 = v189.assumeFPS(18)
v189 = v189.add_blank_audio
return v189.prefetch
#adjustframerate

v190 = LSMASHVideoSource(dst_dir + "v190f.mp4").ConvertToYV24()
b_ex = undefined
v190o = v190
v190 = v190.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.15 P0^ 0.9 P1^ 1. 2.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v190i = v190
v190 = expr(v190.extractY, v190.extractU, v190.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v190 = v190.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v190a = v190i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v190 = v190.colorYUV(off_u = -6, off_v = -2)
#return v190i.interleave(v190).hist_levels.prefetch
v190 = v190.adjustSize
v190 = v190.assumeFPS(18)
v190 = v190.add_blank_audio
return v190.prefetch
#adjustframerate

v191 = LSMASHVideoSource(dst_dir + "v191f.mp4").ConvertToYV24()
b_ex = undefined
v191o = v191
v191 = v191.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.15 P0^ 0.9 P1^ 1. 2.5 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v191i = v191
v191 = expr(v191.extractY, v191.extractU, v191.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v191 = v191.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v191a = v191i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v191 = v191.colorYUV(off_u = -8, off_v = -4)
#return v191i.interleave(v191).hist_levels.prefetch
v191 = v191.adjustSize
v191 = v191.assumeFPS(18)
v191 = v191.add_blank_audio
return v191.prefetch
#adjustframerate

v192 = LSMASHVideoSource(dst_dir + "v192f.mp4").ConvertToYV24()
#v192 = v192.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v192 = v192.trim(105, -1).loop(v192.frameCount).crop(0, 0, -(v192.width - add_width), 0).stackHorizontal(v192)
#return v192.histogram.prefetch
v192o = v192
#v192 = v192.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
v192 = v192.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)#,\
#                       bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                       redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 160,160, 160,160, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v192.hist_levels.prefetch
#v192 = v192.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v192 = expr(v192.extractY, v192.extractU, v192.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v192i = v192
v192 = expr(v192.extractY, v192.extractU, v192.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v192 = v192.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v192a = v192i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v192 = v192.crop(add_width, 0, 0, 0)
#v192i = v192i.crop(add_width, 0, 0, 0)
#v192a = v192a.crop(add_width, 0, 0, 0)
#v192 = v192.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v192 = v192.colorYUV(off_u = -10, off_v = -0)
#v192 = v192i
#return v192i.interleave(v192).hist_levels.prefetch
v192 = v192.adjustSize
v192 = v192.assumeFPS(18)
v192 = v192.add_blank_audio
return v192.prefetch
#adjustframerate

#******
*/
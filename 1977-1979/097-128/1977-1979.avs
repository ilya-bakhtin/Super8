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

function deScratchMask2(clip c, int "x", int "maxwidth", int "blurlen")
{
    x = default(x, 1390)
    maxwidth = default(maxwidth, 15)
    blurlen = default(blurlen, 6)

    mask = imageSource("..\mask2.png", end = c.frameCount - 1, fps = 18).convertToYV24
    mask = mask.levels(16, 1, 235, 0, 255, coring=false)

    b = c.crop(x, c.height - 350, 300, 350).extractY.convertToYV24

    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    b = b.turnRight
    b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
    b = b.turnLeft
    b = b.colorYUV(off_y = -2)
    c = c.deScratchBlock(in_mask = mask, in_block = b, x = x, w = 300, y = c.height - 350, h = 350, blurlen = 6, maxangle = 45., slope = false)

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
v97 = full.trim(5136, 5147)
v97 = v97.crop(left + 40, top + 0, right + 40, bot + 0)
v97 = v97.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v97.trim(2, 0)
v97 = v97.deScratchMask
v97 = v97.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v97 = v97.deScratchBlock(slope = false, x = v97.width - 200, y = 160, w = 200, h = 240)
v97 = v97.deScratchBlock(slope = false, x = v97.width - 200, y = 160, w = 200, h = 240)
#return v97.hist_levels.prefetch

v98 = full.trim(5148, 5152)
v98 = v98.crop(left + 40, top + 0, right + 40, bot + 0)
v98 = v98.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v98.trim(2, 0)
v98 = v98.deScratchMask
v98 = v98.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v98 = v98.deScratchBlock(slope = false, x = v98.width - 200, y = 160, w = 200, h = 240)
v98 = v98.deScratchBlock(slope = false, x = v98.width - 200, y = 160, w = 200, h = 240)
#return v98.hist_levels.prefetch

v99 = full.trim(5153, 5159)
v99 = v99.crop(left + 40, top + 0, right + 40, bot + 0)
v99 = v99.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v99.trim(2, 0)
v99 = v99.deScratchMask
v99 = v99.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v99 = v99.deScratchBlock(slope = false, x = v99.width - 200, y = 160, w = 200, h = 240)
v99 = v99.deScratchBlock(slope = false, x = v99.width - 200, y = 160, w = 200, h = 240)
#return v99.hist_levels.prefetch

v100 = full.trim(5160, 5247)
v100 = v100.crop(left + 70, top + 10, right + 70, bot + 10)
v100 = v100.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v100.trim(2, 0)
v100 = v100.deScratchMask
v100 = v100.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v100 = v100.deScratchBlock(slope = false, x = v100.width - 200, y = 160, w = 200, h = 240)
v100 = v100.deScratchBlock(slope = false, x = v100.width - 200, y = 160, w = 200, h = 240)
#return v100.hist_levels.autolevels.prefetch

v101 = full.trim(5248, 5367)
v101 = v101.crop(left + 70, top + 10, right + 70, bot + 10)
v101 = v101.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v101.trim(2, 0)
v101 = v101.deScratchMask
v101 = v101.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
#return v101.hist_levels.autolevels.prefetch

v102 = full.trim(5368, 5398)
v102 = v102.crop(left + 70, top + 10, right + 70, bot + 10)
v102 = v102.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v102.trim(2, v102.frameCount - 3) +\
       v102.trim(v102.frameCount - 2, 0).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false)
v102 = v102.deScratchMask
v102 = v102.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v102o = v102
v102o = v102
bh = 200
v102 = v102.crop(0, v102.height - bh, 0, 0)
v102 = v102.turn180
v102_m = v102.solid_mask(x = 1380, r = 160, fx = 16, fy = -0.5)
#return v102_m.turn180.interleave(v102.turn180)
v102 = v102.convertToRGB32(interlaced=false, matrix="PC.709")
v102 = v102.ExInpaint(mask = v102_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v102 = v102.convertToYV24(interlaced=false, matrix="PC.709")
v102 = v102.turn180
v102 = v102o.crop(0, 0, 0, -bh).stackVertical(v102)
v102 = v102o.trim(0, 16) + v102.trim(17, 0)
#return v102.hist_levels.autolevels.prefetch

v103 = full.trim(5399, 5410)
v103 = v103.crop(left + 70, top + 10, right + 70, bot + 10)
v103 = v103.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v103.trim(2, 0)
v103 = v103.trim(0, 1) +\
       v103.trim(2, -1).colorYUV(gain_y = 20) +\
       v103.trim(3, -1).colorYUV(gain_y = 40) +\
       v103.trim(4, -1).autolevels(gamma = 2.).colorYUV(gain_y = -50) +\
       v103.trim(5, -1).autolevels(gamma = 2.).colorYUV(gain_y = -50) +\
       v103.trim(6, -1).colorYUV(gain_y = 20) +\
       v103.trim(7, 0)
v103 = v103.deScratchMask
v103 = v103.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v103o = v103
bh = 200
v103 = v103.crop(0, v103.height - bh, 0, 0)
v103 = v103.turn180
v103_m = v103.solid_mask(x = 1400, r = 180, fx = 12, fy = -0.5)
#return v103_m.turn180.interleave(v103.turn180)
v103 = v103.convertToRGB32(interlaced=false, matrix="PC.709")
v103 = v103.ExInpaint(mask = v103_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v103 = v103.convertToYV24(interlaced=false, matrix="PC.709")
v103 = v103.turn180#.colorYUV(off_y = 20)
v103_1 = v103o.crop(0, 0, 0, -bh).stackVertical(v103)
bh = 280
v103 = v103o.crop(0, v103o.height - bh, 0, 0)
v103 = v103.turn180
v103_m = v103.solid_mask(x = 1420, r = 260, fx = 12, fy = 0)
#return v103_m.turn180.interleave(v103.turn180)
v103 = v103.convertToRGB32(interlaced=false, matrix="PC.709")
v103 = v103.ExInpaint(mask = v103_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v103 = v103.convertToYV24(interlaced=false, matrix="PC.709")
v103 = v103.turn180#.colorYUV(off_y = 20)
v103 = v103o.crop(0, 0, 0, -bh).stackVertical(v103)
v103 = v103_1.trim(0, 8) + v103.trim(9, 0)
#return v103.hist_levels.prefetch

v104 = full.trim(5411, 5444)
v104 = v104.crop(left + 70, top + 10, right + 70, bot + 10)
v104 = v104.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v104.trim(2, 0)
v104 = v104.trim(0, 2) +\
       v104.trim(3, -1).autolevels(gamma = 1.5).colorYUV(off_y = 8, gain_y = -90) +\
       v104.trim(4, -1).autolevels(gamma = 2.5).colorYUV(off_y = -24, gain_y = -50) +\
       v104.trim(5, -1).autolevels(gamma = 1.5).colorYUV(off_y = 8, gain_y = -90) +\
       v104.trim(6, 0)
v104 = v104.deScratchMask
v104 = v104.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v104o = v104
bh = 280
v104 = v104o.crop(0, v104o.height - bh, 0, 0)
v104 = v104.turn180
v104_m = v104.solid_mask(x = 1480, r = 260, fx = 24, fy = 0)
#return v104_m.turn180.interleave(v104.turn180)
v104 = v104.convertToRGB32(interlaced=false, matrix="PC.709")
v104 = v104.ExInpaint(mask = v104_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v104 = v104.convertToYV24(interlaced=false, matrix="PC.709")
v104 = v104.turn180#.colorYUV(off_y = 20)
v104 = v104o.crop(0, 0, 0, -bh).stackVertical(v104)
#return v104.colorYUV(gain_y = 80).hist_levels.prefetch

v105 = full.trim(5445, 5467)
v105 = v105.crop(left + 70, top + 10, right + 70, bot + 10)
v105 = v105.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v105.trim(2, v105.frameCount - 3) +\
       v105.trim(v105.frameCount - 2, 0).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false)
v105 = v105.trim(0, 2) +\
       v105.trim(3, -1).autolevels(gamma = 1.5).colorYUV(off_y = 8, gain_y = -90) +\
       v105.trim(4, -1).autolevels(gamma = 2.5).colorYUV(off_y = -24, gain_y = -50) +\
       v105.trim(5, -1).autolevels(gamma = 1.5).colorYUV(off_y = 8, gain_y = -90) +\
       v105.trim(6, 0)
v105 = v105.deScratchMask
#v105 = v105.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
#return v105.colorYUV(gain_y = 80).hist_levels.prefetch

v106 = full.trim(5468, 5476)
v106 = v106.crop(left + 70, top + 10, right + 70, bot + 10)
v106 = v106.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v106.trim(2, 0)
v106 = v106.trim(0, 1) +\
       v106.trim(2, -1).colorYUV(gain_y = 10) +\
       v106.trim(3, -1).colorYUV(gain_y = 20) +\
       v106.trim(4, 5).colorYUV(gain_y = 40) +\
       v106.trim(6, 7).colorYUV(gain_y = 20) +\
       v106.trim(8, 0)
v106 = v106.deScratchMask
v106 = v106.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v106o = v106
bh = 380
v106 = v106o.crop(0, v106o.height - bh, 0, 0)
v106 = v106.turn180
v106_m = v106.solid_mask(x = 1520, r = 360, fx = 48, fy = 0.05)
#return v106_m.turn180.interleave(v106.turn180)
v106 = v106.convertToRGB32(interlaced=false, matrix="PC.709")
v106 = v106.ExInpaint(mask = v106_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v106 = v106.convertToYV24(interlaced=false, matrix="PC.709")
v106 = v106.turn180#.colorYUV(off_y = 20)
v106 = v106o.crop(0, 0, 0, -bh).stackVertical(v106)
#return v106.colorYUV(gain_y = 80).hist_levels.prefetch

v107 = full.trim(5477, 5499)
v107 = v107.crop(left + 70, top + 10, right + 70, bot + 10)
v107 = v107.trim(0, -1).autolevels(gamma = 6.0).colorYUV(off_y = -200, gain_y = 300) +\
       v107.trim(1, -1).autolevels(gamma = 3.0).colorYUV(off_y = -90, gain_y = 100) +\
       v107.trim(2, -1).autolevels(gamma = 2.0).colorYUV(off_y = -40, gain_y = 20) +\
       v107.trim(3, -1).autolevels(gamma = 1.7).colorYUV(off_y = -24, gain_y = -14) +\
       v107.trim(4, -1).autolevels(gamma = 1.5).colorYUV(off_y = -16, gain_y = -30) +\
       v107.trim(5, -1).autolevels(gamma = 1.4).colorYUV(off_y = -8, gain_y = -40) +\
       v107.trim(6, -1).autolevels(gamma = 1.3).colorYUV(gain_y = -60) +\
       v107.trim(7, -1).colorYUV(gain_y = 20) +\
       v107.trim(8, -1).colorYUV(gain_y = 14) +\
       v107.trim(9, -1).colorYUV(gain_y = 10) +\
       v107.trim(10, 0)
v107 = v107.trim(0, 5).deScratchMask(dh_t = 20) +\
       v107.trim(6, -1).deScratchMask(x = 400, dh_t = 60) +\
       v107.trim(7, 8).deScratchMask(x = 400, dh_t = 80) +\
       v107.trim(9, -1).deScratchMask(x = 420, dh_t = 80) +\
       v107.trim(10, 0).deScratchMask(x = 430, dh_t = 100)
v107 = v107.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v107 = v107.deScratchBlock(slope = false, x = 300, y = v107.height - 450, w = 100, h = 450, ratio = 3)
v107 = v107.deScratchBlock(slope = false, x = 300, y = v107.height - 450, w = 100, h = 450)
v107 = v107.deScratchBlock(slope = false, x = 300, y = v107.height - 450, w = 100, h = 450, ratio = 3)
v107 = v107.deScratchBlock(slope = false, x = 300, y = v107.height - 450, w = 100, h = 450)
#return v107.colorYUV(gain_y = 80).hist_levels.prefetch

v108 = full.trim(5500, 5538)
v108 = v108.crop(left + 70, top + 10, right + 70, bot + 10)
v108 = v108.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v108.trim(2, 0)
#return v108.colorYUV(gain_y = 80).hist_levels.prefetch

v109 = full.trim(5539, 5572)
v109 = v109.crop(left + 70, top + 10, right + 70, bot + 10)
v109 = v109.trim(0, -1) +\
       v109.trim(1, -1).colorYUV(gain_y = -80) +\
       v109.trim(2, -1).colorYUV(gain_y = -70) +\
       v109.trim(3, -1).colorYUV(gain_y = -60) +\
       v109.trim(4, -1).colorYUV(gain_y = -50) +\
       v109.trim(5, -1).colorYUV(gain_y = -40) +\
       v109.trim(6, -1).colorYUV(gain_y = -20) +\
       v109.trim(7, -1).colorYUV(gain_y = -10) +\
       v109.trim(8, 0)
v109 = v109.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v109.trim(2, 0)
v109 = v109.turn180       
v109 = v109.deScratchMask(mask_file = "..\mask3.png", x = v109.width - 1060 - 300, do_crop = false)
v109 = v109.turn180       
v109 = v109.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v109 = v109.deScratchBlock(slope = false, x = 230, y = v109.height - 480, w = 130, h = 480)
v109 = v109.deScratchBlock(slope = false, x = 230, y = v109.height - 480, w = 130, h = 480, ratio = 3, minlen = 5)
v109 = v109.deScratchBlock(slope = false, x = 230, y = v109.height - 480, w = 130, h = 480)
v109 = v109.deScratchBlock(slope = false, x = 230, y = v109.height - 480, w = 130, h = 480, ratio = 3, minlen = 5)
#return v109.crop(1060, 1060, 300, 0)
#return v109.extractY.colorYUV(gain_y = 80).hist_levels.prefetch

v110 = full.trim(5573, 5588)
v110 = v110.crop(left + 70, top + 10, right + 70, bot + 10)
v110 = v110.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v110.trim(2, 0)
v110 = v110.turn180       
v110 = v110.deScratchMask(mask_file = "..\mask4.png", x = v110.width - 1060 - 300, do_crop = false)
v110 = v110.turn180       
v110 = v110.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
#return v110.crop(1360, 0, 400, 180)
v110 = v110.deScratchMask(mask_file = "..\mask5.png", x = 1360, do_crop = false)
v110o = v110
bh = 500
v110 = v110o.crop(0, v110o.height - bh, 0, 0)
v110 = v110.turn180
v110_m = v110.solid_mask(x = 1540, r = 494, fx = 48, fy = 0.2)
#return v110_m.turn180.interleave(v110.turn180)
v110 = v110.convertToRGB32(interlaced=false, matrix="PC.709")
v110 = v110.ExInpaint(mask = v110_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v110 = v110.convertToYV24(interlaced=false, matrix="PC.709")
v110 = v110.turn180#.colorYUV(off_y = 20)
v110 = v110o.crop(0, 0, 0, -bh).stackVertical(v110)
#return v110.crop(1060, 1020, 300, 0)
#return v110.colorYUV(gain_y = 80).hist_levels.prefetch

v111 = full.trim(5589, 5690)
v111 = v111.crop(left + 70, top + 10, right + 70, bot + 10)
v111 = v111.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v111.trim(2, 0)
#return v111.colorYUV(gain_y = 80).hist_levels.prefetch

v112 = full.trim(5691, 5721)
v112 = v112.crop(left + 70, top + 10, right + 70, bot + 10)
v112 = v112.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v112.trim(2, 0)
v112 = v112.trim(0, 4).deScratchMask(mask_file = "..\mask5.png", x = 1480, dh_t = 20, do_crop = false) +\
       v112.trim(5, 0).deScratchMask(mask_file = "..\mask5.png", x = 1360, do_crop = false)
v112 = v112.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v112o = v112
bh = 400
v112 = v112o.crop(0, 0, 0, bh)
v112_m = v112.solid_mask(x = 440, r = 280, fx = 50, fy = 0.2)
#return v112_m.interleave(v112)
v112 = v112.convertToRGB32(interlaced=false, matrix="PC.709")
v112 = v112.ExInpaint(mask = v112_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v112 = v112.convertToYV24(interlaced=false, matrix="PC.709")
v112 = v112.stackVertical(v112o.crop(0, bh, 0, 0))
v112 = v112.trim(0, 20) + v112o.trim(21, 0)
v112o = v112
bh = 200
v112 = v112o.crop(0, 0, 0, bh)
v112_m = v112.solid_mask(x = 360, r = 160, fx = 20, fy = -0.9)
#return v112_m.interleave(v112)
v112 = v112.convertToRGB32(interlaced=false, matrix="PC.709")
v112 = v112.ExInpaint(mask = v112_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v112 = v112.convertToYV24(interlaced=false, matrix="PC.709")
v112 = v112.stackVertical(v112o.crop(0, bh, 0, 0))
v112 = v112.trim(0, 22) + v112o.trim(23, 0)
#return v112.colorYUV(gain_y = 80).hist_levels.prefetch

v113 = full.trim(5722, 5769)
v113 = v113.crop(left + 70, top + 10, right + 70, bot + 10)
v113 = v113.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v113.trim(2, 0)
v113 = v113.deScratchMask(mask_file = "..\mask5.png", x = 1360, do_crop = false)
v113 = v113.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v113o = v113
bh = 400
v113 = v113o.crop(0, 0, 0, bh)
v113_m = v113.solid_mask(x = 430, r = 260, fx = 50, fy = 0.02)
#return v113_m.interleave(v113)
v113 = v113.convertToRGB32(interlaced=false, matrix="PC.709")
v113 = v113.ExInpaint(mask = v113_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v113 = v113.convertToYV24(interlaced=false, matrix="PC.709")
v113 = v113.stackVertical(v113o.crop(0, bh, 0, 0))
v113 = v113o.trim(0, 25) + v113.trim(26, 0)
#return v113.colorYUV(gain_y = 80).hist_levels.prefetch
v113o = v113
bh = 200
v113 = v113o.crop(0, 0, 0, bh)
v113_m = v113.solid_mask(x = 340, r = 150, fx = 20, fy = -1.0)
#return v113_m.interleave(v113)
v113 = v113.convertToRGB32(interlaced=false, matrix="PC.709")
v113 = v113.ExInpaint(mask = v113_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v113 = v113.convertToYV24(interlaced=false, matrix="PC.709")
v113 = v113.stackVertical(v113o.crop(0, bh, 0, 0))
#v113 = v113.trim(0, 22) + v113o.trim(23, 0)
#return v113.colorYUV(gain_y = 80).hist_levels.prefetch

v114 = full.trim(5770, 5784)
v114 = v114.crop(left + 70, top + 10, right + 70, bot + 10)
v114 = v114.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v114.trim(2, 0)
v114 = v114.deScratchMask(mask_file = "..\mask5.png", x = 1480, dh_t = 20, do_crop = false)
v114 = v114.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v114 = v114.extractY.convertToYV24       
v114o = v114
bh = 400
v114 = v114o.crop(0, 0, 0, bh)
v114_m = v114.solid_mask(x = 430, r = 260, fx = 50, fy = 0.02)
#return v114_m.interleave(v114)
v114 = v114.convertToRGB32(interlaced=false, matrix="PC.709")
v114 = v114.ExInpaint(mask = v114_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v114 = v114.convertToYV24(interlaced=false, matrix="PC.709")
v114 = v114.stackVertical(v114o.crop(0, bh, 0, 0))
#v114 = v114o.trim(0, 25) + v114.trim(26, 0)
#return v114.colorYUV(gain_y = 80).hist_levels.prefetch
v114o = v114
bh = 200
v114 = v114o.crop(0, 0, 0, bh)
v114_m = v114.solid_mask(x = 340, r = 150, fx = 20, fy = -1.0)
#return v114_m.interleave(v114)
v114 = v114.convertToRGB32(interlaced=false, matrix="PC.709")
v114 = v114.ExInpaint(mask = v114_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v114 = v114.convertToYV24(interlaced=false, matrix="PC.709")
v114 = v114.stackVertical(v114o.crop(0, bh, 0, 0))
#v114 = v114.trim(0, 22) + v114o.trim(23, 0)
#return v114.colorYUV(gain_y = 80).hist_levels.prefetch

v115 = full.trim(5785, 5824)
v115 = v115.crop(left + 70, top + 10, right + 70, bot + 10)
v115 = v115.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
#return v115.histogram.prefetch
v115 = v115.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v115.trim(2, 0)
v115 = v115.deScratchMask(mask_file = "..\mask5.png", x = 1440, do_crop = false)
v115o = v115
bh = 400
v115 = v115o.crop(0, 0, 0, bh)
v115_m = v115.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v115_m.interleave(v115)
v115 = v115.convertToRGB32(interlaced=false, matrix="PC.709")
v115 = v115.ExInpaint(mask = v115_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v115 = v115.convertToYV24(interlaced=false, matrix="PC.709")
v115 = v115.stackVertical(v115o.crop(0, bh, 0, 0))
#v115 = v115o.trim(0, 25) + v115.trim(26, 0)
#return v115.colorYUV(gain_y = 80).hist_levels.prefetch
v115o = v115
bh = 200
v115 = v115o.crop(0, 0, 0, bh)
v115_m = v115.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v115_m.interleave(v115)
v115 = v115.convertToRGB32(interlaced=false, matrix="PC.709")
v115 = v115.ExInpaint(mask = v115_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v115 = v115.convertToYV24(interlaced=false, matrix="PC.709")
v115 = v115.stackVertical(v115o.crop(0, bh, 0, 0))
#v115 = v115.trim(0, 22) + v115o.trim(23, 0)
v115o = v115
bh = 250
v115 = v115o.crop(0, 0, 0, bh)
v115_m = v115.solid_mask(x = 1000, r = 200, fx = 10, fy = 1.4)
#return v115_m.interleave(v115)
v115 = v115.convertToRGB32(interlaced=false, matrix="PC.709")
v115 = v115.ExInpaint(mask = v115_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v115 = v115.convertToYV24(interlaced=false, matrix="PC.709")
v115 = v115.stackVertical(v115o.crop(0, bh, 0, 0))
#return v115.histogram.prefetch
#return v115.colorYUV(gain_y = 80).hist_levels.prefetch

v116 = full.trim(5825, 5850)
v116 = v116.crop(left + 70, top + 10, right + 70, bot + 10)
v116 = v116.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
#return v116.histogram.prefetch
v116 = v116.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v116.trim(2, 0)
v116 = v116.deScratchMask(mask_file = "..\mask5.png", x = 1440, do_crop = false, dh_t = 20)
v116o = v116
bh = 400
v116 = v116o.crop(0, 0, 0, bh)
v116_m = v116.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v116_m.interleave(v116)
v116 = v116.convertToRGB32(interlaced=false, matrix="PC.709")
v116 = v116.ExInpaint(mask = v116_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v116 = v116.convertToYV24(interlaced=false, matrix="PC.709")
v116 = v116.stackVertical(v116o.crop(0, bh, 0, 0))
#v116 = v116o.trim(0, 25) + v116.trim(26, 0)
#return v116.colorYUV(gain_y = 80).hist_levels.prefetch
v116o = v116
bh = 200
v116 = v116o.crop(0, 0, 0, bh)
v116_m = v116.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v116_m.interleave(v116)
v116 = v116.convertToRGB32(interlaced=false, matrix="PC.709")
v116 = v116.ExInpaint(mask = v116_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v116 = v116.convertToYV24(interlaced=false, matrix="PC.709")
v116 = v116.stackVertical(v116o.crop(0, bh, 0, 0))
#v116 = v116.trim(0, 22) + v116o.trim(23, 0)
v116o = v116
bh = 250
v116 = v116o.crop(0, 0, 0, bh)
v116_m = v116.solid_mask(x = 970, r = 200, fx = 6, fy = 1.4)
#return v116_m.interleave(v116).prefetch
v116 = v116.convertToRGB32(interlaced=false, matrix="PC.709")
v116 = v116.ExInpaint(mask = v116_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v116 = v116.convertToYV24(interlaced=false, matrix="PC.709")
v116 = v116.stackVertical(v116o.crop(0, bh, 0, 0))
v116 = v116.trim(0, 14) + v116o.trim(15, 0)
#return v116.histogram.prefetch
#return v116.colorYUV(gain_y = 80).hist_levels.prefetch

v117 = full.trim(5851, 5859)
v117 = v117.crop(left + 70, top + 10, right + 70, bot + 10)
v117 = v117.extractY.convertToYV24       
#return v117.colorYUV(gain_y = 80).hist_levels.prefetch

v118 = full.trim(5860, 5910)
v118 = v118.crop(left + 70, top + 10, right + 70, bot + 10)
v118 = v118.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
       v118.trim(4, 0)
v118 = v118.deScratchMask(mask_file = "..\mask5.png", x = 1300, do_crop = false)
v118o = v118
bh = 400
v118 = v118o.crop(0, 0, 0, bh)
v118_m = v118.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v118_m.interleave(v118)
v118 = v118.convertToRGB32(interlaced=false, matrix="PC.709")
v118 = v118.ExInpaint(mask = v118_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v118 = v118.convertToYV24(interlaced=false, matrix="PC.709")
v118 = v118.stackVertical(v118o.crop(0, bh, 0, 0))
#v118 = v118o.trim(0, 25) + v118.trim(26, 0)
#return v118.colorYUV(gain_y = 80).hist_levels.prefetch
v118o = v118
bh = 200
v118 = v118o.crop(0, 0, 0, bh)
v118_m = v118.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v118_m.interleave(v118)
v118 = v118.convertToRGB32(interlaced=false, matrix="PC.709")
v118 = v118.ExInpaint(mask = v118_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v118 = v118.convertToYV24(interlaced=false, matrix="PC.709")
v118 = v118.stackVertical(v118o.crop(0, bh, 0, 0))
#return v118.colorYUV(gain_y = 80).hist_levels.prefetch

v119 = full.trim(5911, 5936)
v119 = v119.crop(left + 70, top + 10, right + 70, bot + 10)
v119 = v119.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v119.trim(3, 0)
v119 = v119.deScratchMask(mask_file = "..\mask5.png", x = 1460, do_crop = false, dh_t = 30)
v119 = v119.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v119o = v119
bh = 400
v119 = v119o.crop(0, 0, 0, bh)
v119_m = v119.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v119_m.interleave(v119)
v119 = v119.convertToRGB32(interlaced=false, matrix="PC.709")
v119 = v119.ExInpaint(mask = v119_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v119 = v119.convertToYV24(interlaced=false, matrix="PC.709")
v119 = v119.stackVertical(v119o.crop(0, bh, 0, 0))
#v119 = v119o.trim(0, 25) + v119.trim(26, 0)
#return v119.colorYUV(gain_y = 80).hist_levels.prefetch
v119o = v119
bh = 200
v119 = v119o.crop(0, 0, 0, bh)
v119_m = v119.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v119_m.interleave(v119)
v119 = v119.convertToRGB32(interlaced=false, matrix="PC.709")
v119 = v119.ExInpaint(mask = v119_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v119 = v119.convertToYV24(interlaced=false, matrix="PC.709")
v119 = v119.stackVertical(v119o.crop(0, bh, 0, 0))
#return v119.colorYUV(gain_y = 80).hist_levels.prefetch

v120 = full.trim(5937, 5960)
v120 = v120.crop(left + 70, top + 10, right + 70, bot + 10)
v120 = v120.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v120.trim(2, 0)
v120 = v120.deScratchMask(mask_file = "..\mask5.png", x = 1460, do_crop = false, dh_t = 30)
v120 = v120.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v120o = v120
bh = 400
v120 = v120o.crop(0, 0, 0, bh)
v120_m = v120.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v120_m.interleave(v120)
v120 = v120.convertToRGB32(interlaced=false, matrix="PC.709")
v120 = v120.ExInpaint(mask = v120_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v120 = v120.convertToYV24(interlaced=false, matrix="PC.709")
v120 = v120.stackVertical(v120o.crop(0, bh, 0, 0))
#v120 = v120o.trim(0, 25) + v120.trim(26, 0)
#return v120.colorYUV(gain_y = 80).hist_levels.prefetch
v120o = v120
bh = 200
v120 = v120o.crop(0, 0, 0, bh)
v120_m = v120.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v120_m.interleave(v120)
v120 = v120.convertToRGB32(interlaced=false, matrix="PC.709")
v120 = v120.ExInpaint(mask = v120_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v120 = v120.convertToYV24(interlaced=false, matrix="PC.709")
v120 = v120.stackVertical(v120o.crop(0, bh, 0, 0))
#return v120.colorYUV(gain_y = 80).hist_levels.prefetch

v121 = full.trim(5961, 5986)
v121 = v121.crop(left + 70, top + 10, right + 70, bot + 10)
v121 = v121.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).colorYUV(gain_y = 18) +\
       v121.trim(2, 0)
v121 = v121.deScratchMask(mask_file = "..\mask5.png", x = 1460, do_crop = false, dh_t = 30)
v121 = v121.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v121o = v121
bh = 400
v121 = v121o.crop(0, 0, 0, bh)
v121_m = v121.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v121_m.interleave(v121)
v121 = v121.convertToRGB32(interlaced=false, matrix="PC.709")
v121 = v121.ExInpaint(mask = v121_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v121 = v121.convertToYV24(interlaced=false, matrix="PC.709")
v121 = v121.stackVertical(v121o.crop(0, bh, 0, 0))
#v121 = v121o.trim(0, 25) + v121.trim(26, 0)
#return v121.colorYUV(gain_y = 80).hist_levels.prefetch
v121o = v121
bh = 200
v121 = v121o.crop(0, 0, 0, bh)
v121_m = v121.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v121_m.interleave(v121)
v121 = v121.convertToRGB32(interlaced=false, matrix="PC.709")
v121 = v121.ExInpaint(mask = v121_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v121 = v121.convertToYV24(interlaced=false, matrix="PC.709")
v121 = v121.stackVertical(v121o.crop(0, bh, 0, 0))
#return v121.colorYUV(gain_y = 80).hist_levels.prefetch

v122 = full.trim(5987, 6048)
v122 = v122.crop(left + 70, top + 10, right + 70, bot + 10)
v122 = v122.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v122.trim(2, 0)
v122 = v122.deScratchMask(mask_file = "..\mask5.png", x = 1460, do_crop = false, dh_t = 30)
v122 = v122.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v122o = v122
bh = 400
v122 = v122o.crop(0, 0, 0, bh)
v122_m = v122.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v122_m.interleave(v122)
v122 = v122.convertToRGB32(interlaced=false, matrix="PC.709")
v122 = v122.ExInpaint(mask = v122_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v122 = v122.convertToYV24(interlaced=false, matrix="PC.709")
v122 = v122.stackVertical(v122o.crop(0, bh, 0, 0))
#v122 = v122o.trim(0, 25) + v122.trim(26, 0)
#return v122.colorYUV(gain_y = 80).hist_levels.prefetch
v122o = v122
bh = 200
v122 = v122o.crop(0, 0, 0, bh)
v122_m = v122.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v122_m.interleave(v122)
v122 = v122.convertToRGB32(interlaced=false, matrix="PC.709")
v122 = v122.ExInpaint(mask = v122_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v122 = v122.convertToYV24(interlaced=false, matrix="PC.709")
v122 = v122.stackVertical(v122o.crop(0, bh, 0, 0))
#return v122.colorYUV(gain_y = 80).hist_levels.prefetch

v123 = full.trim(6049, 6199)
v123 = v123.crop(left + 70, top + 10, right + 70, bot + 10)
v123 = v123.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v123.trim(2, 0)
v123 = v123.deScratchMask(mask_file = "..\mask5.png", x = 1460, do_crop = false, dh_t = 30)
v123 = v123.deScratchMask2(x = 1380, maxwidth = 15, blurlen = 6)
v123o = v123
bh = 400
v123 = v123o.crop(0, 0, 0, bh)
v123_m = v123.solid_mask(x = 440, r = 260, fx = 90, fy = 0.02)
#return v123_m.interleave(v123)
v123 = v123.convertToRGB32(interlaced=false, matrix="PC.709")
v123 = v123.ExInpaint(mask = v123_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v123 = v123.convertToYV24(interlaced=false, matrix="PC.709")
v123 = v123.stackVertical(v123o.crop(0, bh, 0, 0))
#v123 = v123o.trim(0, 25) + v123.trim(26, 0)
#return v123.colorYUV(gain_y = 80).hist_levels.prefetch
v123o = v123
bh = 200
v123 = v123o.crop(0, 0, 0, bh)
v123_m = v123.solid_mask(x = 320, r = 100, fx = 10, fy = -1.2)
#return v123_m.interleave(v123)
v123 = v123.convertToRGB32(interlaced=false, matrix="PC.709")
v123 = v123.ExInpaint(mask = v123_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v123 = v123.convertToYV24(interlaced=false, matrix="PC.709")
v123 = v123.stackVertical(v123o.crop(0, bh, 0, 0))
#return v123.colorYUV(gain_y = 80).hist_levels.prefetch

v124 = full.trim(6200, 6304)
v124 = v124.crop(left + 70, top + 10, right + 70, bot + 10)
v124 = v124.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v124.trim(2, 0)
v124 = v124.deScratchMask(mask_file = "..\mask5.png", x = 1300, do_crop = false, dh_t = 0)
#return v124.colorYUV(gain_y = 80).hist_levels.prefetch

v125 = full.trim(6305, 6368)
v125 = v125.crop(left + 70, top + 10, right + 70, bot + 10)
v125 = v125.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v125.trim(2, 0)
#return v125.crop(1300, 0, 400, 300)       
v125 = v125.deScratchMask(mask_file = "..\mask5.png", x = 1300, do_crop = false, dh_t = 0)
v125 = v125.deScratchMask(mask_file = "..\mask6.png", x = 1300, do_crop = false, dh_t = 0)
#return v125.colorYUV(gain_y = 80).hist_levels.prefetch

v126 = full.trim(6369, 6395)
v126 = v126.crop(left + 70, top + 10, right + 70, bot + 10)
v126 = v126.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v126.trim(2, 0)
v126 = v126.extractY.convertToYV24       
#return v126.colorYUV(gain_y = 80).hist_levels.prefetch

v127 = full.trim(6396, 6428)
v127 = v127.crop(left + 70, top + 10, right + 70, bot + 10)
v127 = v127.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v127.trim(2, 0)
v127 = v127.extractY.convertToYV24       
#return v127.colorYUV(gain_y = 80).hist_levels.prefetch

# 5937, 5961, 5987, 6049, 6200, 6305, 6369, 6396, 6429, 6484, 6544, 6577, 6613, 6680, 6798, 6892, 7033, 7120, 7330, 7391, #140
v128 = full.trim(6429, 6483)
v128 = v128.crop(left + 70, top + 10, right + 70, bot + 10)
v128 = v128.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
       v128.trim(2, 0)
v128 = v128.extractY.convertToYV24       
#return v128.colorYUV(gain_y = 80).hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 97

v97 = LSMASHVideoSource(dst_dir + "v97f.mp4").ConvertToYV24()
b_ex = undefined
v97o = v97
v97 = v97.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v97i = v97
v97 = expr(v97.extractY, v97.extractU, v97.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v97 = v97.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v97a = v97i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v97i.interleave(v97).hist_levels.prefetch
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
v97 = v97.add_blank_audio
return v97.prefetch
#adjustframerate

v98 = LSMASHVideoSource(dst_dir + "v98f.mp4").ConvertToYV24()
b_ex = undefined
v98o = v98
v98 = v98.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v98i = v98
v98 = expr(v98.extractY, v98.extractU, v98.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v98 = v98.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v98a = v98i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v98i.interleave(v98).hist_levels.prefetch
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
v98 = v98.add_blank_audio
return v98.prefetch
#adjustframerate

v99 = LSMASHVideoSource(dst_dir + "v99f.mp4").ConvertToYV24()
b_ex = undefined
v99o = v99
v99 = v99.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v99i = v99
v99 = expr(v99.extractY, v99.extractU, v99.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v99 = v99.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v99a = v99i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v99i.interleave(v99).hist_levels.prefetch
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
v99 = v99.add_blank_audio
return v99.prefetch
#adjustframerate

v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
b_ex = undefined
v100o = v100
v100 = v100.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v100i = v100
v100 = expr(v100.extractY, v100.extractU, v100.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v100 = v100.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v100a = v100i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v100i.interleave(v100).hist_levels.prefetch
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate

v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
b_ex = undefined
v101o = v101
v101 = v101.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v101i = v101
v101 = expr(v101.extractY, v101.extractU, v101.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v101 = v101.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v101a = v101i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v101i.interleave(v101).hist_levels.prefetch
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate

v102 = LSMASHVideoSource(dst_dir + "v102f.mp4").ConvertToYV24()
b_ex = undefined
v102o = v102
v102 = v102.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v102i = v102
v102 = expr(v102.extractY, v102.extractU, v102.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v102 = v102.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v102a = v102i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v102i.interleave(v102).hist_levels.prefetch
v102 = v102.adjustSize
v102 = v102.assumeFPS(18)
v102 = v102.add_blank_audio
return v102.prefetch
#adjustframerate

v103 = LSMASHVideoSource(dst_dir + "v103f.mp4").ConvertToYV24()
b_ex = undefined
v103o = v103
v103 = v103.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v103i = v103
v103 = expr(v103.extractY, v103.extractU, v103.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v103 = v103.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v103a = v103i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v103i.interleave(v103).hist_levels.prefetch
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
v103 = v103.add_blank_audio
return v103.prefetch
#adjustframerate

v104 = LSMASHVideoSource(dst_dir + "v104f.mp4").ConvertToYV24()
b_ex = undefined
v104o = v104
v104 = v104.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v104i = v104
v104 = expr(v104.extractY, v104.extractU, v104.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v104 = v104.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v104a = v104i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v104i.interleave(v104).hist_levels.prefetch
v104 = v104.adjustSize
v104 = v104.assumeFPS(18)
v104 = v104.add_blank_audio
return v104.prefetch
#adjustframerate

v105 = LSMASHVideoSource(dst_dir + "v105f.mp4").ConvertToYV24()
b_ex = undefined
v105o = v105
v105 = v105.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v105i = v105
v105 = expr(v105.extractY, v105.extractU, v105.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v105 = v105.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v105a = v105i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v105i.interleave(v105).hist_levels.prefetch
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
v105 = v105.add_blank_audio
return v105.prefetch
#adjustframerate

v106 = LSMASHVideoSource(dst_dir + "v106f.mp4").ConvertToYV24()
b_ex = undefined
v106o = v106
v106 = v106.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v106i = v106
v106 = expr(v106.extractY, v106.extractU, v106.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v106 = v106.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v106a = v106i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v106i.interleave(v106).hist_levels.prefetch
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
v106 = v106.add_blank_audio
return v106.prefetch
#adjustframerate

v107 = LSMASHVideoSource(dst_dir + "v107f.mp4").ConvertToYV24()
b_ex = undefined
v107o = v107
v107 = v107.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v107i = v107
v107 = expr(v107.extractY, v107.extractU, v107.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v107 = v107.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.009, gamma=1.)
v107a = v107i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v107i.interleave(v107).hist_levels.prefetch
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
v107 = v107.add_blank_audio
return v107.prefetch
#adjustframerate

v108 = LSMASHVideoSource(dst_dir + "v108f.mp4").ConvertToYV24()
b_ex = undefined
v108o = v108
v108 = v108.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v108i = v108
v108 = expr(v108.extractY, v108.extractU, v108.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v108 = v108.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.009, gamma=1.)
v108a = v108i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v108i.interleave(v108).hist_levels.prefetch
v108 = v108.adjustSize
v108 = v108.assumeFPS(18)
v108 = v108.add_blank_audio
return v108.prefetch
#adjustframerate

v109 = LSMASHVideoSource(dst_dir + "v109f.mp4").ConvertToYV24()
b_ex = undefined
v109o = v109
v109 = v109.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v109i = v109
v109 = expr(v109.extractY, v109.extractU, v109.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v109 = v109.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.009, gamma=1.)
v109a = v109i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v109i.interleave(v109).hist_levels.prefetch
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
v109 = v109.add_blank_audio
return v109.prefetch
#adjustframerate

v110 = LSMASHVideoSource(dst_dir + "v110f.mp4").ConvertToYV24()
b_ex = undefined
v110o = v110
v110 = v110.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v110i = v110
v110 = expr(v110.extractY, v110.extractU, v110.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v110 = v110.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.009, gamma=1.)
v110a = v110i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v110 = v110i
#return v110i.interleave(v110).hist_levels.prefetch
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
v110 = v110.add_blank_audio
return v110.prefetch
#adjustframerate

v111 = LSMASHVideoSource(dst_dir + "v111f.mp4").ConvertToYV24()
v111 = v111.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v111o = v111
v111 = v111.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v111i = v111
v111 = expr(v111.extractY, v111.extractU, v111.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v111 = v111.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v111a = v111i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v111i.interleave(v111).hist_levels.prefetch
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
v111 = v111.add_blank_audio
return v111.prefetch
#adjustframerate

v112 = LSMASHVideoSource(dst_dir + "v112f.mp4").ConvertToYV24()
v112 = v112.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v112o = v112
v112 = v112.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v112i = v112
v112 = expr(v112.extractY, v112.extractU, v112.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v112 = v112.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v112a = v112i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v112i.interleave(v112).hist_levels.prefetch
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
v112 = v112.add_blank_audio
return v112.prefetch
#adjustframerate

v113 = LSMASHVideoSource(dst_dir + "v113f.mp4").ConvertToYV24()
v113 = v113.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v113o = v113
v113 = v113.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v113i = v113
v113 = expr(v113.extractY, v113.extractU, v113.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v113 = v113.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v113a = v113i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v113i.interleave(v113).hist_levels.prefetch
v113 = v113.adjustSize
v113 = v113.assumeFPS(18)
v113 = v113.add_blank_audio
return v113.prefetch
#adjustframerate

v114 = LSMASHVideoSource(dst_dir + "v114f.mp4").ConvertToYV24()
v114 = v114.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v114.histogram.prefetch
v114o = v114
v114 = v114.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v114i = v114
v114 = expr(v114.extractY, v114.extractU, v114.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v114 = v114.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v114a = v114i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v114i.interleave(v114).hist_levels.prefetch
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
v114 = v114.add_blank_audio
return v114.prefetch
#adjustframerate

v115 = LSMASHVideoSource(dst_dir + "v115f.mp4").ConvertToYV24()
v115 = v115.autolevels(input_low = 4, output_low = 0, input_high = 255, output_high = 251, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v115.histogram.prefetch
v115o = v115
v115 = v115.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v115i = v115
v115 = expr(v115.extractY, v115.extractU, v115.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v115 = v115.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v115a = v115i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v115i.interleave(v115).hist_levels.prefetch
v115 = v115.adjustSize
v115 = v115.assumeFPS(18)
v115 = v115.add_blank_audio
return v115.prefetch
#adjustframerate

v116 = LSMASHVideoSource(dst_dir + "v116f.mp4").ConvertToYV24()
b_ex = undefined
#return v116.histogram.prefetch
v116o = v116
v116 = v116.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v116i = v116
v116 = expr(v116.extractY, v116.extractU, v116.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v116 = v116.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v116a = v116i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v116i.interleave(v116).hist_levels.prefetch
v116 = v116.adjustSize
v116 = v116.assumeFPS(18)
v116 = v116.add_blank_audio
return v116.prefetch
#adjustframerate

v117 = LSMASHVideoSource(dst_dir + "v117f.mp4").ConvertToYV24()
b_ex = undefined
v117o = v117
v117 = v117.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v117i = v117
v117 = expr(v117.extractY, v117.extractU, v117.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v117 = v117.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v117a = v117i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v117i.interleave(v117).hist_levels.prefetch
v117 = v117.adjustSize
v117 = v117.assumeFPS(18)
v117 = v117.add_blank_audio
return v117.prefetch
#adjustframerate

v118 = LSMASHVideoSource(dst_dir + "v118f.mp4").ConvertToYV24()
b_ex = undefined
v118o = v118
v118 = v118.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v118i = v118
v118 = expr(v118.extractY, v118.extractU, v118.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v118 = v118.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v118a = v118i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v118i.interleave(v118).hist_levels.prefetch
v118 = v118.adjustSize
v118 = v118.assumeFPS(18)
v118 = v118.add_blank_audio
return v118.prefetch
#adjustframerate

v119 = LSMASHVideoSource(dst_dir + "v119f.mp4").ConvertToYV24()
b_ex = undefined
v119o = v119
v119 = v119.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v119i = v119
v119 = expr(v119.extractY, v119.extractU, v119.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v119 = v119.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v119a = v119i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v119i.interleave(v119).hist_levels.prefetch
v119 = v119.adjustSize
v119 = v119.assumeFPS(18)
v119 = v119.add_blank_audio
return v119.prefetch
#adjustframerate

v120 = LSMASHVideoSource(dst_dir + "v120f.mp4").ConvertToYV24()
b_ex = undefined
v120o = v120
v120 = v120.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v120i = v120
v120 = expr(v120.extractY, v120.extractU, v120.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v120 = v120.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v120a = v120i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v120i.interleave(v120).hist_levels.prefetch
v120 = v120.adjustSize
v120 = v120.assumeFPS(18)
v120 = v120.add_blank_audio
return v120.prefetch
#adjustframerate

v121 = LSMASHVideoSource(dst_dir + "v121f.mp4").ConvertToYV24()
b_ex = undefined
v121o = v121
v121 = v121.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v121i = v121
v121 = expr(v121.extractY, v121.extractU, v121.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v121 = v121.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v121a = v121i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v121i.interleave(v121).hist_levels.prefetch
v121 = v121.adjustSize
v121 = v121.assumeFPS(18)
v121 = v121.add_blank_audio
return v121.prefetch
#adjustframerate

v122 = LSMASHVideoSource(dst_dir + "v122f.mp4").ConvertToYV24()
b_ex = undefined
v122o = v122
v122 = v122.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v122i = v122
v122 = expr(v122.extractY, v122.extractU, v122.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v122 = v122.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v122a = v122i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v122i.interleave(v122).hist_levels.prefetch
v122 = v122.adjustSize
v122 = v122.assumeFPS(18)
v122 = v122.add_blank_audio
return v122.prefetch
#adjustframerate

v123 = LSMASHVideoSource(dst_dir + "v123f.mp4").ConvertToYV24()
b_ex = undefined
v123o = v123
v123 = v123.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v123i = v123
v123 = expr(v123.extractY, v123.extractU, v123.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v123 = v123.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v123a = v123i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v123i.interleave(v123).hist_levels.prefetch
v123 = v123.adjustSize
v123 = v123.assumeFPS(18)
v123 = v123.add_blank_audio
return v123.prefetch
#adjustframerate

v124 = LSMASHVideoSource(dst_dir + "v124f.mp4").ConvertToYV24()
b_ex = undefined
v124o = v124
v124 = v124.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v124i = v124
v124 = expr(v124.extractY, v124.extractU, v124.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v124 = v124.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v124a = v124i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v124i.interleave(v124).hist_levels.prefetch
v124 = v124.adjustSize
v124 = v124.assumeFPS(18)
v124 = v124.add_blank_audio
return v124.prefetch
#adjustframerate

v125 = LSMASHVideoSource(dst_dir + "v125f.mp4").ConvertToYV24()
v125 = v125.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v125o = v125
v125 = v125.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v125i = v125
v125 = expr(v125.extractY, v125.extractU, v125.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v125 = v125.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v125a = v125i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v125i.interleave(v125).hist_levels.prefetch
v125 = v125.adjustSize
v125 = v125.assumeFPS(18)
v125 = v125.add_blank_audio
return v125.prefetch
#adjustframerate

v126 = LSMASHVideoSource(dst_dir + "v126f.mp4").ConvertToYV24()
v126 = v126.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v126o = v126
v126 = v126.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v126i = v126
v126 = expr(v126.extractY, v126.extractU, v126.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v126 = v126.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v126a = v126i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v126i.interleave(v126).hist_levels.prefetch
v126 = v126.adjustSize
v126 = v126.assumeFPS(18)
v126 = v126.add_blank_audio
return v126.prefetch
#adjustframerate

v127 = LSMASHVideoSource(dst_dir + "v127f.mp4").ConvertToYV24()
v127 = v127.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v127o = v127
v127 = v127.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v127i = v127
v127 = expr(v127.extractY, v127.extractU, v127.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v127 = v127.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v127a = v127i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v127i.interleave(v127).hist_levels.prefetch
v127 = v127.adjustSize
v127 = v127.assumeFPS(18)
v127 = v127.add_blank_audio
return v127.prefetch
#adjustframerate

v128 = LSMASHVideoSource(dst_dir + "v128f.mp4").ConvertToYV24()
#v128 = v128.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v128 = v128.trim(105, -1).loop(v128.frameCount).crop(0, 0, -(v128.width - add_width), 0).stackHorizontal(v128)
#return v128.histogram.prefetch
v128o = v128
v128 = v128.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
#v128 = v128.AdjustColor(ou = -4, ov = -0, x=500, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v128.hist_levels.prefetch
#v128 = v128.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v128 = expr(v128.extractY, v128.extractU, v128.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v128i = v128
v128 = expr(v128.extractY, v128.extractU, v128.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v128 = v128.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v128a = v128i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v128 = v128.crop(add_width, 0, 0, 0)
#v128i = v128i.crop(add_width, 0, 0, 0)
#v128a = v128a.crop(add_width, 0, 0, 0)
#v128 = v128.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v128 = v128.colorYUV(off_u = +2, off_v = -0)
#v128 = v128i
#return v128i.interleave(v128).hist_levels.prefetch
v128 = v128.adjustSize
v128 = v128.assumeFPS(18)
v128 = v128.add_blank_audio
return v128.prefetch
#adjustframerate

#******
*/
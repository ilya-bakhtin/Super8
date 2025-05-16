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


function deScratchMask(clip c)
{
      mask = imageSource("..\mask1.png", end = c.frameCount - 1, fps = 18).convertToYV24
      mask = mask.levels(16, 1, 235, 0, 255, coring=false)

      b = c.crop(340, 0, 860, 400).extractY.convertToYV24
      b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
      b_r = b.crop(730, 0, 0, 0)
      b = b.crop(0, 0, 730, 0)
      b = b.turnLeft
      b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
      b = b.turnRight
      b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
      b = b.turnLeft
      b = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = 10, maxlen = 1000, blurlen = 6, maxangle = 45, modeY = 1)
      b = b.turnRight
      b = b.colorYUV(off_y = -4)
      b = b.stackHorizontal(b_r)
      c = c.deScratchBlock(in_mask = mask, in_block = b, x = 340, w = 860, h = 400, blurlen = 6, maxangle = 45., slope = false)

#      c = c.deScratchBlock(in_mask = mask, x = 340, w = 860, h = 400, blurlen = 6, maxangle = 45., slope = false)
#      mask = mask.crop(0, 0, 730, 0)
#      mask_l = mask.turnLeft
#      c = c.turnLeft
#      c = c.deScratchBlock(in_mask = mask_l, x = 0, w = 400, y = c.height - 340 - 730, h = 730, blurlen = 6, maxangle = 45., slope = false)
#      c = c.turnRight
#      c = c.deScratchBlock(in_mask = mask, x = 340, w = 730, h = 400, blurlen = 6, maxangle = 45., slope = false)
#      c = c.turnLeft
#      c = c.deScratchBlock(in_mask = mask_l, x = 0, w = 400, y = c.height - 340 - 730, h = 730, blurlen = 6, maxangle = 45., slope = false)
#      c = c.turnRight
      
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
    r = default(r, 40)

    x_s = Format("{}", x)
    fx_s = defined(fx) ? Format("{}", fx) : "1"
    r_s = Format("{}", r)
    fy_s = defined(fy) ? Format("{}", fy) : "0"

    exp = x_s + " mx^ " + r_s + " rr^ sx mx - dup mx^ sy " + fy_s + " * - dup * " + fx_s + " * sy sy * + rr rr * < 255 0 ?"
    return c.trim(0, -1).extractY.expr(exp).convertToYV24
}

/*
v65 = full.trim(4215, 4226)
v65 = v65.crop(left + 30, top + 0, right + 30, bot + 0)
v65 = v65.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
      v65.trim(3, -1).colorYUV(off_y = 8) +\
      v65.trim(4, -1).colorYUV(off_y = 4) +\
      v65.trim(5, 0)
v65 = v65.deScratchBlock
v65 = v65.deScratchMask2
#return v65.hist_levels

v66 = full.trim(4227, 4239)
v66 = v66.crop(left + 30, top + 0, right + 30, bot + 0)
v66 = v66.trim(0, 3).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
      v66.trim(4, 0)
v66 = v66.deScratchBlock
v66 = v66.trim(0, -1).deScratchBlock(x = 780, w = 40, h = 320, slope = false) +\
      v66.trim(1, 5) +\
      v66.trim(6, -1).deScratchBlock(x = 700, w = 60, h = 240, slope = false).deScratchBlock(x = 350, w = 100, h = 520) +\
      v66.trim(7, -1).deScratchBlock(x = 670, w = 40, h = 140, slope = false) +\
      v66.trim(8, 0).deScratchBlock(x = 640, w = 60, h = 120, slope = false)
#b = v66.crop(480, 0, 120, 120)
#return b.removeDirt      
#      deScratchBlock(x = 480, w = 120, h = 120, slope = false)
v66 = v66.deScratchMask2

v66o = v66
v66 = v66.crop(0, 0, 0, 80)
v66_m = v66.solid_mask(x = 538, r = 80, fx = 2)
v66 = v66.convertToRGB32(interlaced=false, matrix="PC.709")
v66 = v66.ExInpaint(mask = v66_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v66 = v66.convertToYV24(interlaced=false, matrix="PC.709")
v66 = v66.stackVertical(v66o.crop(0, 80, 0, 0))

#return v66.hist_levels

v67 = full.trim(4240, 4244)
v67 = v67.crop(left + 30, top + 0, right + 30, bot + 0)
v67 = v67.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
      v67.trim(3, -1).colorYUV(off_y = 6) +\
      v67.trim(4, 0)
v67 = v67.deScratchBlock.\
      deScratchBlock(x = 640, w = 60, h = 120, slope = false).deScratchBlock(x = 480, w = 120, h = 120, slope = false)
v67 = v67.trim(0, -1).deScratchBlock(x = 600, w = 40, h = 280, slope = false) +\
      v67.trim(1, 0)      
v67 = v67.deScratchMask2

v67o = v67
v67 = v67.crop(0, 0, 0, 80)
v67_m = v67.solid_mask(x = 538, r = 80, fx = 2)
v67 = v67.convertToRGB32(interlaced=false, matrix="PC.709")
v67 = v67.ExInpaint(mask = v67_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v67 = v67.convertToYV24(interlaced=false, matrix="PC.709")
v67 = v67.stackVertical(v67o.crop(0, 80, 0, 0))

#return v67.hist_levels

v68 = full.trim(4245, 4363)
v68 = v68.crop(left + 30, top + 0, right + 30, bot + 0)
v68 = v68.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
      v68.trim(3, 4).colorYUV(off_y = 6) +\
      v68.trim(5, 6) +\
      v68.trim(7, -1).colorYUV(off_y = -8) +\
      v68.trim(8, 11).deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false) +\
      v68.trim(12, v68.frameCount - 2) +\
      v68.trim(v68.frameCount - 2, 0).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(1, 0)
      
v68 = v68.deScratchBlock
v68 = v68.deScratchMask2

v68o = v68
v68 = v68.crop(0, 0, 0, 160)
v68_m = v68.solid_mask(x = 538, r = 80, fx = 2)
v68_m1 = v68.solid_mask(x = 690, r = 148, fx = 6)
v68 = v68.convertToRGB32(interlaced=false, matrix="PC.709")
v68 = v68.ExInpaint(mask = v68_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v68 = v68.ExInpaint(mask = v68_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
#return v68.interleave(v68_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
v68 = v68.convertToYV24(interlaced=false, matrix="PC.709")
v68 = v68.stackVertical(v68o.crop(0, 160, 0, 0))
#v68 = v68o.interleave(v68)
#return v68.hist_levels

v69 = full.trim(4364, 4378)
v69 = v69.crop(left + 30, top + 0, right + 30, bot + 0)
v69 = v69.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
      v69.trim(3, v69.frameCount - 2) +\
      v69.trim(v69.frameCount - 2, 0).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(1, 0)
v69 = v69.deScratchBlock
v69 = v69.deScratchMask2

v69o = v69
v69 = v69.crop(0, 0, 0, 160)
v69_m = v69.solid_mask(x = 538, r = 80, fx = 2)
v69_m1 = v69.solid_mask(x = 700, r = 138, fx = 6)
v69 = v69.convertToRGB32(interlaced=false, matrix="PC.709")
v69 = v69.ExInpaint(mask = v69_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v69 = v69.ExInpaint(mask = v69_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
#return v69.interleave(v69_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
v69 = v69.convertToYV24(interlaced=false, matrix="PC.709")
v69 = v69.stackVertical(v69o.crop(0, 160, 0, 0))
#v69 = v69o.interleave(v69)
#return v69.hist_levels

v70 = full.trim(4379, 4400)
v70 = v70.crop(left + 30, top + 0, right + 30, bot + 0)
v70 = v70.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v70.trim(3, v70.frameCount - 2) +\
      v70.trim(v70.frameCount - 2, 0).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(1, 0)
#      v70.trim(v70.frameCount - 1, 0).colorYUV(off_y = -20)
v70 = v70.deScratchBlock
v70 = v70.deScratchBlock(x = 440, w = 220, h = 120, slope = false)
v70 = v70.turnLeft
v70 = v70.deScratchBlock(x = 0, y = v70.height - 440 - 220, w = 120, h = 220, slope = false)
v70 = v70.deScratchBlock(x = 0, y = v70.height - 440 - 220, w = 120, h = 220, slope = false)
v70 = v70.turnRight
v70 = v70.deScratchMask2

v70o = v70
v70 = v70.crop(0, 0, 0, 160)
v70_m = v70.solid_mask(x = 538, r = 80, fx = 2)
v70_m1 = v70.solid_mask(x = 700, r = 138, fx = 6)
v70 = v70.convertToRGB32(interlaced=false, matrix="PC.709")
v70 = v70.ExInpaint(mask = v70_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v70 = v70.ExInpaint(mask = v70_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
#return v70.interleave(v70_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
v70 = v70.convertToYV24(interlaced=false, matrix="PC.709")
v70 = v70.stackVertical(v70o.crop(0, 160, 0, 0))
#return v70.hist_levels

v71 = full.trim(4401, 4524)
v71 = v71.crop(left + 30, top + 0, right + 30, bot + 0)
v71 = v71.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
      v71.trim(3, -1).colorYUV(off_y = 6) +\
      v71.trim(4, 0)
v71 = v71.deScratchBlock
v71 = v71.deScratchBlock(x = 440, w = 220, h = 120, slope = false)
v71 = v71.turnLeft
v71 = v71.deScratchBlock(x = 0, y = v71.height - 440 - 220, w = 120, h = 220, slope = false)
v71 = v71.deScratchBlock(x = 0, y = v71.height - 440 - 220, w = 120, h = 220, slope = false)
v71 = v71.turnRight
v71 = v71.deScratchMask2

v71o = v71
v71 = v71.crop(0, 0, 0, 160)
v71_m = v71.solid_mask(x = 520, r = 80, fx = 2)
v71_m1 = v71.solid_mask(x = 700, r = 138, fx = 6)
v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")
v71 = v71.ExInpaint(mask = v71_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v71 = v71.ExInpaint(mask = v71_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
#return v71.interleave(v71_m1.convertToRGB32(interlaced=false, matrix="PC.709")).prefetch
v71 = v71.convertToYV24(interlaced=false, matrix="PC.709")
v71 = v71.stackVertical(v71o.crop(0, 160, 0, 0))
v71_0 = v71

v71 = v71o
v71 = v71.crop(0, 0, 0, 160)
v71_m = v71.solid_mask(x = 520, r = 80, fx = 2)
#v71_m1 = v71.solid_mask(x = 700, r = 138, fx = 6)
v71_m1 = v71.solid_mask(x = 580, r = 120, fx = 1, fy = 0.9)
v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")
v71 = v71.ExInpaint(mask = v71_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v71 = v71.ExInpaint(mask = v71_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
#return v71.interleave(v71_m1.convertToRGB32(interlaced=false, matrix="PC.709")).prefetch
v71 = v71.convertToYV24(interlaced=false, matrix="PC.709")
v71 = v71.stackVertical(v71o.crop(0, 160, 0, 0))
v71 = v71_0.trim(0, 82) + v71o.trim(83, 109) + v71.trim(110, 0)
#return v71.hist_levels.prefetch

v72 = full.trim(4525, 4603)
v72 = v72.crop(left + 30, top + 0, right + 30, bot + 0)
v72 = v72.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v72.trim(3, 0)
v72 = v72.trim(0, 3) +\
      v72.trim(4, -1).colorYUV(off_y = 16) +\
      v72.trim(5, 6).colorYUV(off_y = 16, gain_y = 128) +\
      v72.trim(7, 12) +\
      v72.trim(13, 14).colorYUV(off_y = 16) +\
      v72.trim(15, 0)
v72 = v72.deScratchBlock
v72 = v72.deScratchMask2

v72o = v72
v72 = v72.crop(0, 0, 0, 160)
#v72_m = v72.solid_mask(x = 538, r = 80, fx = 2)
v72_m1 = v72.solid_mask(x = 580, r = 120, fx = 1, fy = 0.9)
v72 = v72.convertToRGB32(interlaced=false, matrix="PC.709")
#v72 = v72.ExInpaint(mask = v72_m.convertToRGB32(interlaced=false, matrix="PC.709"))
v72 = v72.ExInpaint(mask = v72_m1.convertToRGB32(interlaced=false, matrix="PC.709"))
#return v72.interleave(v72_m1.convertToRGB32(interlaced=false, matrix="PC.709")).prefetch
v72 = v72.convertToYV24(interlaced=false, matrix="PC.709")
v72 = v72.stackVertical(v72o.crop(0, 160, 0, 0))
#return v72.hist_levels.prefetch

v73 = full.trim(4605, 4610)#4713)
v73 = v73.crop(left + 30, top + 0, right + 30, bot + 0)
v73 = v73.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v73.trim(3, -1) +\
      v73.trim(4, -1).colorYUV(off_y = 16, gain_y = 32) +\
      v73.trim(5, -1).colorYUV(off_y = 32, gain_y = 128)
v73 = v73.deScratchBlock
v73 = v73.deScratchMask2
#return v73.hist_levels

v74 = full.trim(4611, 4713)
v74 = v74.crop(left + 30, top + 0, right + 30, bot + 0)
v74 = v74.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v74.trim(3, -1) +\
      v74.trim(4, -1).colorYUV(off_y = 16, gain_y = 32) +\
      v74.trim(5, -1).colorYUV(off_y = -32, gain_y = 512) +\
      v74.trim(6, -1).colorYUV(off_y = 16, gain_y = 128) +\
      v74.trim(7, 11) +\
      v74.trim(12, -1).colorYUV(off_y = 8, gain_y = 16) +\
      v74.trim(13, -1).colorYUV(off_y = 8, gain_y = 40) +\
      v74.trim(14, -1).colorYUV(off_y = 8, gain_y = 16) +\
      v74.trim(15, 0)
v74 = v74.deScratchBlock
v74 = v74.deScratchMask2
#return v74.hist_levels

v75 = full.trim(4714, 4773)
v75 = v75.crop(left + 30, top + 0, right + 30, bot + 0)
#v75 = v75.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
v75 = v75.trim(0, -1).colorYUV(off_y = -16, gain_y = -32) +\
      v75.trim(1, 2) +\
      v75.trim(3, -1).colorYUV(gain_y = 32) +\
      v75.trim(4, -1).colorYUV(gain_y = 60).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.1) +\
      v75.trim(5, -1).colorYUV(off_y = -16, gain_y = 160).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.3) +\
      v75.trim(6, -1).colorYUV(off_y = -16, gain_y = 80).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.3) +\
      v75.trim(7, 9) +\
      v75.trim(10, -1).colorYUV(gain_y = 12) +\
      v75.trim(11, -1).colorYUV(gain_y = 20) +\
      v75.trim(12, -1).colorYUV(gain_y = 30).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.1) +\
      v75.trim(13, -1).colorYUV(gain_y = 40).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.1) +\
      v75.trim(14, -1).colorYUV(gain_y = 30) +\
      v75.trim(15, 17) +\
      v75.trim(18, 0)
v75 = v75.deScratchBlock
v75o = v75
v75 = v75.deScratchBlock(x = 340, w = 860, h = 400, blurlen = 6, maxangle = 45., slope = false)
v75 = v75.turnLeft
v75 = v75.deScratchBlock(x = 0, w = 400, y = v75.height - 340 - 860, h = 860, blurlen = 6, maxangle = 45., slope = false)
v75 = v75.turnRight
v75 = v75.deScratchBlock(x = 340, w = 860, h = 400, blurlen = 6, maxangle = 45., slope = false)
v75 = v75.turnLeft
v75 = v75.deScratchBlock(x = 0, w = 400, y = v75.height - 340 - 860, h = 860, blurlen = 6, maxangle = 45., slope = false)
v75 = v75.turnRight
v75 = v75o.trim(0, 37) + v75.trim(38, 0)
v75 = v75.deScratchMask2
#return v75.hist_levels

v76 = full.trim(4774, 4806)
v76 = v76.crop(left + 30, top + 30, right + 30, bot + 30)
v76 = v76.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v76.trim(3, -1).colorYUV(gain_y = 12) +\
      v76.trim(4, -1).colorYUV(off_y = -8, gain_y = 96) +\
      v76.trim(5, -1).colorYUV(off_y = -55, gain_y = 240).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.7) +\
      v76.trim(6, -1).colorYUV(off_y = -24, gain_y = 96).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.3) +\
      v76.trim(7, 0)
#v76 = v76.deScratchMask
v76o = v76
v76 = v76.deScratchBlock(x = 340, w = 860, h = 400, blurlen = 6, maxangle = 45., slope = false)
v76 = v76.turnLeft
v76 = v76.deScratchBlock(x = 0, w = 400, y = v76.height - 340 - 860, h = 860, blurlen = 6, maxangle = 45., slope = false)
v76 = v76.turnRight
v76 = v76.deScratchBlock(x = 340, w = 860, h = 400, blurlen = 6, maxangle = 45., slope = false)
v76 = v76.turnLeft
v76 = v76.deScratchBlock(x = 0, w = 400, y = v76.height - 340 - 860, h = 860, blurlen = 6, maxangle = 45., slope = false)
v76 = v76.turnRight
#v76 = v76o.interleave(v76)
v76 = v76.deScratchMask2(x = 1420)
#return v76.hist_levels

v77 = full.trim(4807, 4837)
v77 = v77.crop(left + 50, top + 30, right + 50, bot + 30)
#v77 = v77.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#      v77.trim(3, 0)
v77 = v77.trim(0, -1).colorYUV(gain_y = -32) +\
      v77.trim(1, 2) +\
      v77.trim(3, -1).colorYUV(gain_y = 16) +\
      v77.trim(4, -1).colorYUV(gain_y = 39) +\
      v77.trim(5, -1).colorYUV(gain_y = 60) +\
      v77.trim(6, 0)
v77 = v77.deScratchMask
v77 = v77.deScratchMask2(x = 1420)
#return v77.hist_levels

v78 = full.trim(4838, 4872)
v78 = v78.crop(left + 50, top + 20, right + 50, bot + 20)
#v78 = v78.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
#      v78.trim(3, 0)
v78 = v78.trim(0, -1).colorYUV(gain_y = -40) +\
      v78.trim(1, 2) +\
      v78.trim(3, -1).colorYUV(gain_y = 16) +\
      v78.trim(4, -1).colorYUV(gain_y = 39) +\
      v78.trim(5, -1).colorYUV(gain_y = 60).\
          autolevels(autolevel = false, input_low = 0, output_low = 0, input_high = 255, output_high = 255, gamma = 1.1) +\
      v78.trim(6, 0)
#v78 = v78.deScratchBlock
v78 = v78.deScratchMask
v78 = v78.deScratchMask2(x = 1420)
#return v78.hist_levels

v79 = full.trim(4873, 4888)
v79 = v79.crop(left + 50, top + 0, right + 50, bot + 0)
#v79 = v79.trim(0, 2).deflickOverlappedBck(step = 100, toward_darkest = true, right2left = false) +\
#      v79.trim(3, 0)
v79 = v79.trim(0, -1).colorYUV(gain_y = -50) +\
      v79.trim(1, 0)
#v79 = v79.deScratchBlock
v79 = v79.deScratchMask
v79 = v79.deScratchMask2(x = 1420)
#return v79.hist_levels

v80 = full.trim(4889, 4900)
v80 = v80.crop(left + 30, top + 0, right + 30, bot + 0)
v80 = v80.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v80.trim(2, 0)
#v80 = v80.deScratchBlock
v80 = v80.deScratchMask
#return v80.hist_levels

v81 = full.trim(4901, 4908)
v81 = v81.crop(left + 30, top + 0, right + 30, bot + 0)
v81 = v81.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v81.trim(2, 0)
#v81 = v81.deScratchBlock
v81 = v81.deScratchMask
#return v81.hist_levels

v82 = full.trim(4909, 4915)
v82 = v82.crop(left + 30, top + 0, right + 30, bot + 0)
v82 = v82.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v82.trim(2, 0)
#v82 = v82.deScratchBlock
v82 = v82.deScratchMask
v82 = v82.deScratchMask2(x = 1420)
#return v82.hist_levels

v83 = full.trim(4916, 4919)
v83 = v83.crop(left + 30, top + 0, right + 30, bot + 0)
v83 = v83.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v83.trim(3, 0)
v83 = v83.deScratchMask
#return v83.hist_levels

v84 = full.trim(4920, 4923)
v84 = v84.crop(left + 30, top + 0, right + 30, bot + 0)
v84 = v84.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v84.trim(3, 0)
v84 = v84.deScratchMask
#return v84.hist_levels

v85 = full.trim(4924, 4930)
v85 = v85.crop(left + 50, top + 0, right + 50, bot + 0)
v85 = v85.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v85.trim(3, 0)
v85 = v85.deScratchMask
v85 = v85.deScratchMask2(x = 1400)
#return v85.hist_levels

v86 = full.trim(4931, 4950)
v86 = v86.crop(left + 50, top + 0, right + 50, bot + 0)
v86 = v86.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v86.trim(2, 0)
v86 = v86.deScratchBlock(slope = false, x = v86.width - 200, y = 160, w = 200, h = 240)
v86 = v86.turnLeft
v86 = v86.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v86 = v86.turnRight
v86 = v86.deScratchBlock(slope = false, x = v86.width - 200, y = 160, w = 200, h = 240)
v86 = v86.turnLeft
v86 = v86.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v86 = v86.turnRight
v86 = v86.deScratchMask
v86 = v86.deScratchMask2(x = 1400)
#return v86.hist_levels

v87 = full.trim(4951, 4960)
v87 = v87.crop(left + 50, top + 0, right + 50, bot + 0)
v87 = v87.trim(0, 2).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v87.trim(3, 0)
v87 = v87.deScratchMask
v87 = v87.deScratchMask2(x = 1400)
v87 = v87.deScratchBlock(slope = false, x = v87.width - 200, y = 160, w = 200, h = 240)
v87 = v87.turnLeft
v87 = v87.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v87 = v87.turnRight
v87 = v87.deScratchBlock(slope = false, x = v87.width - 200, y = 160, w = 200, h = 240)
v87 = v87.turnLeft
v87 = v87.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v87 = v87.turnRight
#return v87.hist_levels

v88 = full.trim(4961, 4967)
v88 = v88.crop(left + 50, top + 0, right + 50, bot + 0)
v88 = v88.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v88.trim(2, 0)
v88 = v88.deScratchMask
v88 = v88.deScratchMask2(x = 1400)
v88 = v88.deScratchBlock(slope = false, x = v88.width - 200, y = 160, w = 200, h = 240)
v88 = v88.turnLeft
v88 = v88.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v88 = v88.turnRight
v88 = v88.deScratchBlock(slope = false, x = v88.width - 200, y = 160, w = 200, h = 240)
v88 = v88.turnLeft
v88 = v88.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v88 = v88.turnRight
#return v88.hist_levels

v89 = full.trim(4968, 4970)
v89 = v89.crop(left + 50, top + 0, right + 50, bot + 0)
v89 = v89.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v89.trim(2, 0)
v89 = v89.deScratchMask
v89 = v89.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v89 = v89.deScratchBlock(slope = false, x = v89.width - 200, y = 160, w = 200, h = 240)
v89 = v89.turnLeft
v89 = v89.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v89 = v89.turnRight
v89 = v89.deScratchBlock(slope = false, x = v89.width - 200, y = 160, w = 200, h = 240)
v89 = v89.turnLeft
v89 = v89.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v89 = v89.turnRight
#return v89.hist_levels.prefetch

v90 = full.trim(4971, 4988)
v90 = v90.crop(left + 50, top + 0, right + 50, bot + 0)
v90 = v90.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v90.trim(2, 0)
v90 = v90.deScratchMask
v90 = v90.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v90 = v90.deScratchBlock(slope = false, x = v90.width - 200, y = 160, w = 200, h = 240)
v90 = v90.turnLeft
v90 = v90.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v90 = v90.turnRight
v90 = v90.deScratchBlock(slope = false, x = v90.width - 200, y = 160, w = 200, h = 240)
v90 = v90.turnLeft
v90 = v90.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v90 = v90.turnRight
#return v90.hist_levels

v91 = full.trim(4989, 5022)
v91 = v91.crop(left + 30, top + 0, right + 30, bot + 0)
v91 = v91.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v91.trim(2, 0)
v91 = v91.deScratchMask
v91 = v91.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v91 = v91.deScratchBlock(slope = false, x = v91.width - 200, y = 160, w = 200, h = 240)
v91 = v91.turnLeft
v91 = v91.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v91 = v91.turnRight
v91 = v91.deScratchBlock(slope = false, x = v91.width - 200, y = 160, w = 200, h = 240)
v91 = v91.turnLeft
v91 = v91.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v91 = v91.turnRight
#return v91.hist_levels.prefetch

v92 = full.trim(5023, 5031)
v92 = v92.crop(left + 30, top + 0, right + 30, bot + 0)
v92 = v92.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v92.trim(2, 0)
v92 = v92.deScratchMask
v92 = v92.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v92 = v92.deScratchBlock(slope = false, x = v92.width - 200, y = 160, w = 200, h = 240)
v92 = v92.turnLeft
v92 = v92.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v92 = v92.turnRight
v92 = v92.deScratchBlock(slope = false, x = v92.width - 200, y = 160, w = 200, h = 240)
v92 = v92.turnLeft
v92 = v92.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v92 = v92.turnRight
#return v92.hist_levels.prefetch

v93 = full.trim(5032, 5074)
v93 = v93.crop(left + 30, top + 0, right + 30, bot + 0)
v93 = v93.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v93.trim(2, 0)
v93 = v93.deScratchMask
v93 = v93.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v93 = v93.deScratchBlock(slope = false, x = v93.width - 200, y = 160, w = 200, h = 240)
v93 = v93.turnLeft
v93 = v93.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v93 = v93.turnRight
v93 = v93.deScratchBlock(slope = false, x = v93.width - 200, y = 160, w = 200, h = 240)
v93 = v93.turnLeft
v93 = v93.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v93 = v93.turnRight
#return v93.hist_levels.prefetch

v94 = full.trim(5075, 5091)
v94 = v94.crop(left + 40, top + 0, right + 40, bot + 0)
#v94 = v94.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
#      v94.trim(2, 0)
v94 = v94.trim(0, 1) +\
      v94.trim(2, -1).colorYUV(off_y = 8) +\
      v94.trim(3, -1).colorYUV(off_y = 16) +\
      v94.trim(4, -1).\
          autolevels(filterRadius = 1, ignore_low = 0.1, gamma = 5.7).\
          colorYUV(off_y = 0, gain_y = -40) +\
      v94.trim(5, -1).\
          autolevels(filterRadius = 1, ignore_low = 0.01, minRng = 0, gamma = 5.7).\
          colorYUV(off_y = -60, gain_y = 0) +\
      v94.trim(6, -1).\
          autolevels(filterRadius = 1, gamma = 7.7).\
          colorYUV(off_y = -320, gain_y = 320) +\
      v94.trim(7, -1).\
          autolevels(filterRadius = 1, gamma = 1.7).\
          colorYUV(off_y = 20, gain_y = -40) +\
      v94.trim(8, 9) +\
      v94.trim(10, -1).colorYUV(off_y = 8) +\
      v94.trim(11, -1).colorYUV(off_y = 12, gain_y = 40) +\
      v94.trim(12, -1).\
          autolevels(filterRadius = 1, gamma = 2.5).\
          colorYUV(off_y = 0, gain_y = -20) +\
      v94.trim(13, -1).\
          autolevels(filterRadius = 1, ignore_low = 0.05, minRng = 0, gamma = 3.5).\
          colorYUV(off_y = 0, gain_y = -10) +\
      v94.trim(14, -1).\
          autolevels(filterRadius = 1, ignore_low = 0.01, minRng = 0, gamma = 3.5).\
          colorYUV(off_y = -40, gain_y = -10) +\
      v94.trim(15, -1) +\
      v94.trim(16, 0).colorYUV(off_y = 0, gain_y = -16)
v94 = v94.deScratchMask
v94 = v94.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v94 = v94.deScratchBlock(slope = false, x = v94.width - 200, y = 160, w = 200, h = 240)
v94 = v94.turnLeft
v94 = v94.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v94 = v94.turnRight
v94 = v94.deScratchBlock(slope = false, x = v94.width - 200, y = 160, w = 200, h = 240)
v94 = v94.turnLeft
v94 = v94.deScratchBlock(slope = false, x = 160, y = 0, w = 240, h = 200)
v94 = v94.turnRight
#return v94.hist_levels.prefetch

v95 = full.trim(5092, 5115)
v95 = v95.crop(left + 40, top + 0, right + 40, bot + 0)
v95 = v95.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v95.trim(2, 0)
v95 = v95.deScratchMask
v95 = v95.deScratchBlock(slope = false, x = v95.width - 200, y = 160, w = 200, h = 240)
v95 = v95.deScratchBlock(slope = false, x = v95.width - 200, y = 160, w = 200, h = 240)
#return v95.hist_levels.prefetch

# 4889, 4901, 4909, 4916, 4920, 4924, 4931, 4951, 4961, 4968, 4971, 4989, 5023, 5032, 5075, 5092, 5116, 5136, 5148, 5153, #100
v96 = full.trim(5116, 5135)
v96 = v96.crop(left + 40, top + 0, right + 40, bot + 0)
v96 = v96.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) +\
      v96.trim(2, 0)
v96 = v96.deScratchMask
v96 = v96.deScratchMask2(x = 1400, maxwidth = 15, blurlen = 6)
v96 = v96.deScratchBlock(slope = false, x = v96.width - 200, y = 160, w = 200, h = 240)
v96 = v96.deScratchBlock(slope = false, x = v96.width - 200, y = 160, w = 200, h = 240)
#return v96.hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 65

v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
b_ex = undefined
v65o = v65
v65 = v65.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v65i = v65
v65 = expr(v65.extractY, v65.extractU, v65.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v65 = v65.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v65a = v65i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v65i.interleave(v65).hist_levels.prefetch
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate

v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
b_ex = undefined
v66o = v66
v66 = v66.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v66i = v66
v66 = expr(v66.extractY, v66.extractU, v66.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v66 = v66.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v66a = v66i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v66i.interleave(v66).hist_levels.prefetch
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate

v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
#v67 = v67.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v67o = v67
v67 = v67.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v67i = v67
v67 = expr(v67.extractY, v67.extractU, v67.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v67 = v67.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v67a = v67i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v67i.interleave(v67).hist_levels.prefetch
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
b_ex = undefined
v68o = v68
v68 = v68.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v68i = v68
v68 = expr(v68.extractY, v68.extractU, v68.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v68 = v68.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v68a = v68i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v68i.interleave(v68).hist_levels.prefetch
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate

v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
b_ex = undefined
v69o = v69
v69 = v69.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v69i = v69
v69 = expr(v69.extractY, v69.extractU, v69.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v69 = v69.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v69a = v69i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v69i.interleave(v69).hist_levels.prefetch
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
b_ex = undefined
v70o = v70
v70 = v70.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v70i = v70
v70 = expr(v70.extractY, v70.extractU, v70.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v70 = v70.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v70a = v70i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v70i.interleave(v70).hist_levels.prefetch
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate

v71 = LSMASHVideoSource(dst_dir + "v71f.mp4").ConvertToYV24()
b_ex = undefined
v71o = v71
v71 = v71.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v71i = v71
v71 = expr(v71.extractY, v71.extractU, v71.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v71 = v71.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v71a = v71i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v71i.interleave(v71).hist_levels.prefetch
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
v71 = v71.add_blank_audio
return v71.prefetch
#adjustframerate

v72 = LSMASHVideoSource(dst_dir + "v72f.mp4").ConvertToYV24()
b_ex = undefined
v72o = v72
v72 = v72.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v72i = v72
v72 = expr(v72.extractY, v72.extractU, v72.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v72 = v72.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v72a = v72i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v72i.interleave(v72).hist_levels.prefetch
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
v72 = v72.add_blank_audio
return v72.prefetch
#adjustframerate

v73 = LSMASHVideoSource(dst_dir + "v73f.mp4").ConvertToYV24()
b_ex = undefined
v73o = v73
v73 = v73.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v73i = v73
v73 = expr(v73.extractY, v73.extractU, v73.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v73 = v73.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v73a = v73i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v73i.interleave(v73).hist_levels.prefetch
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
v73 = v73.add_blank_audio
return v73.prefetch
#adjustframerate

v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
b_ex = undefined
v74o = v74
v74 = v74.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v74i = v74
v74 = expr(v74.extractY, v74.extractU, v74.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v74 = v74.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v74a = v74i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v74i.interleave(v74).hist_levels.prefetch
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
b_ex = undefined
v75o = v75
v75 = v75.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v75i = v75
v75 = expr(v75.extractY, v75.extractU, v75.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v75 = v75.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v75a = v75i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v75i.interleave(v75).hist_levels.prefetch
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

v76 = LSMASHVideoSource(dst_dir + "v76f.mp4").ConvertToYV24()
b_ex = undefined
v76o = v76
v76 = v76.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v76i = v76
v76 = expr(v76.extractY, v76.extractU, v76.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v76 = v76.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v76a = v76i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v76i.interleave(v76).hist_levels.prefetch
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
v76 = v76.add_blank_audio
return v76.prefetch
#adjustframerate

v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
b_ex = undefined
v77o = v77
v77 = v77.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v77i = v77
v77 = expr(v77.extractY, v77.extractU, v77.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v77 = v77.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v77a = v77i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v77i.interleave(v77).hist_levels.prefetch
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate

v78 = LSMASHVideoSource(dst_dir + "v78f.mp4").ConvertToYV24()
b_ex = undefined
v78o = v78
v78 = v78.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v78i = v78
v78 = expr(v78.extractY, v78.extractU, v78.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v78 = v78.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v78a = v78i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v78i.interleave(v78).hist_levels.prefetch
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
v78 = v78.add_blank_audio
return v78.prefetch
#adjustframerate

v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
b_ex = undefined
v79o = v79
v79 = v79.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v79i = v79
v79 = expr(v79.extractY, v79.extractU, v79.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v79 = v79.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v79a = v79i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v79i.interleave(v79).hist_levels.prefetch
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate

v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
b_ex = undefined
v80o = v80
v80 = v80.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v80i = v80
v80 = expr(v80.extractY, v80.extractU, v80.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v80 = v80.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v80a = v80i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v80i.interleave(v80).hist_levels.prefetch
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate

v81 = LSMASHVideoSource(dst_dir + "v81f.mp4").ConvertToYV24()
b_ex = undefined
v81o = v81
v81 = v81.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v81i = v81
v81 = expr(v81.extractY, v81.extractU, v81.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v81 = v81.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v81a = v81i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v81i.interleave(v81).hist_levels.prefetch
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
v81 = v81.add_blank_audio
return v81.prefetch
#adjustframerate

v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
b_ex = undefined
v82o = v82
v82 = v82.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v82i = v82
v82 = expr(v82.extractY, v82.extractU, v82.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v82 = v82.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v82a = v82i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v82i.interleave(v82).hist_levels.prefetch
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate

v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
b_ex = undefined
v83o = v83
v83 = v83.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v83i = v83
v83 = expr(v83.extractY, v83.extractU, v83.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v83 = v83.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v83a = v83i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v83i.interleave(v83).hist_levels.prefetch
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate

v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
b_ex = undefined
v84o = v84
v84 = v84.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v84i = v84
v84 = expr(v84.extractY, v84.extractU, v84.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v84 = v84.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v84a = v84i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v84i.interleave(v84).hist_levels.prefetch
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate

v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
b_ex = undefined
v85o = v85
v85 = v85.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v85i = v85
v85 = expr(v85.extractY, v85.extractU, v85.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v85 = v85.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v85a = v85i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v85i.interleave(v85).hist_levels.prefetch
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate

v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
b_ex = undefined
v86o = v86
v86 = v86.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v86i = v86
v86 = expr(v86.extractY, v86.extractU, v86.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v86 = v86.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v86a = v86i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v86i.interleave(v86).hist_levels.prefetch
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate

v87 = LSMASHVideoSource(dst_dir + "v87f.mp4").ConvertToYV24()
b_ex = undefined
v87o = v87
v87 = v87.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v87i = v87
v87 = expr(v87.extractY, v87.extractU, v87.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v87 = v87.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v87a = v87i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v87i.interleave(v87).hist_levels.prefetch
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
v87 = v87.add_blank_audio
return v87.prefetch
#adjustframerate

v88 = LSMASHVideoSource(dst_dir + "v88f.mp4").ConvertToYV24()
b_ex = undefined
v88o = v88
v88 = v88.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v88i = v88
v88 = expr(v88.extractY, v88.extractU, v88.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v88 = v88.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v88a = v88i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v88i.interleave(v88).hist_levels.prefetch
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
v88 = v88.add_blank_audio
return v88.prefetch
#adjustframerate

v89 = LSMASHVideoSource(dst_dir + "v89f.mp4").ConvertToYV24()
b_ex = undefined
v89o = v89
v89 = v89.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v89i = v89
v89 = expr(v89.extractY, v89.extractU, v89.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v89 = v89.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v89a = v89i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v89i.interleave(v89).hist_levels.prefetch
v89 = v89.adjustSize
v89 = v89.assumeFPS(18)
v89 = v89.add_blank_audio
return v89.prefetch
#adjustframerate

v90 = LSMASHVideoSource(dst_dir + "v90f.mp4").ConvertToYV24()
b_ex = undefined
v90o = v90
v90 = v90.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v90i = v90
v90 = expr(v90.extractY, v90.extractU, v90.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v90 = v90.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v90a = v90i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v90i.interleave(v90).hist_levels.prefetch
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
v90 = v90.add_blank_audio
return v90.prefetch
#adjustframerate

v91 = LSMASHVideoSource(dst_dir + "v91f.mp4").ConvertToYV24()
b_ex = undefined
v91o = v91
v91 = v91.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v91i = v91
v91 = expr(v91.extractY, v91.extractU, v91.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v91 = v91.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v91a = v91i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v91i.interleave(v91).hist_levels.prefetch
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
v91 = v91.add_blank_audio
return v91.prefetch
#adjustframerate

v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
b_ex = undefined
v92o = v92
v92 = v92.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v92i = v92
v92 = expr(v92.extractY, v92.extractU, v92.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v92 = v92.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v92a = v92i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v92i.interleave(v92).hist_levels.prefetch
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate

v93 = LSMASHVideoSource(dst_dir + "v93f.mp4").ConvertToYV24()
b_ex = undefined
v93o = v93
v93 = v93.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v93i = v93
v93 = expr(v93.extractY, v93.extractU, v93.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v93 = v93.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v93a = v93i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v93i.interleave(v93).hist_levels.prefetch
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
v93 = v93.add_blank_audio
return v93.prefetch
#adjustframerate

v94 = LSMASHVideoSource(dst_dir + "v94f.mp4").ConvertToYV24()
b_ex = undefined
v94o = v94
v94 = v94.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v94i = v94
v94 = expr(v94.extractY, v94.extractU, v94.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v94 = v94.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v94a = v94i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v94i.interleave(v94).hist_levels.prefetch
v94 = v94.adjustSize
v94 = v94.assumeFPS(18)
v94 = v94.add_blank_audio
return v94.prefetch
#adjustframerate

v95 = LSMASHVideoSource(dst_dir + "v95f.mp4").ConvertToYV24()
b_ex = undefined
v95o = v95
v95 = v95.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v95i = v95
v95 = expr(v95.extractY, v95.extractU, v95.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v95 = v95.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v95a = v95i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v95i.interleave(v95).hist_levels.prefetch
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
v95 = v95.add_blank_audio
return v95.prefetch
#adjustframerate

v96 = LSMASHVideoSource(dst_dir + "v96f.mp4").ConvertToYV24()
#v96 = v96.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v96 = v96.trim(105, -1).loop(v96.frameCount).crop(0, 0, -(v96.width - add_width), 0).stackHorizontal(v96)
#return v96.histogram.prefetch
v96o = v96
v96 = v96.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
#v96 = v96.AdjustColor(ou = -4, ov = -0, x=500, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v96.hist_levels.prefetch
#v96 = v96.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v96 = expr(v96.extractY, v96.extractU, v96.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v96i = v96
v96 = expr(v96.extractY, v96.extractU, v96.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v96 = v96.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v96a = v96i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v96 = v96.crop(add_width, 0, 0, 0)
#v96i = v96i.crop(add_width, 0, 0, 0)
#v96a = v96a.crop(add_width, 0, 0, 0)
#v96 = v96.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v96 = v96.colorYUV(off_u = +2, off_v = -0)
#v96 = v96i
#return v96i.interleave(v96).hist_levels.prefetch
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
v96 = v96.add_blank_audio
return v96.prefetch
#adjustframerate

#******
*/
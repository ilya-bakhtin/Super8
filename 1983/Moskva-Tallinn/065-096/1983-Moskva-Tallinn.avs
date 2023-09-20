SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

#LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

LSMASHVideoSource("F:\Media\video\Super8\Sources\1983\S8.Res2K43.Aspect43In43.Speed18Fps-1.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 372, 638, 1006, 1178, 1409, 1509, 1612, 1677, 1767, 1869, 2076, 2193, 2311, 2536, 2588, 2889, 3415, 3522, 3725, 3833,      #20
# 3987, 4060, 4182, 4230, 4297, 4459, 4534, 4586, 4851, 4921, 5082, 5152, 5220, 5272, 5589, 5817, 5867, 6136, 6304, 6455,       #40
# 6641, 6781, 6954, 7064, 7098, 7180, 7304, 7411, 7482, 7693, 7881, 8003, 8186, 8326, 8529, 8599, 8855, 8928, 9012, 9274,       #60
# 9483, 9619, 9685, 10012, 10107, 10148, 10193, 10317, 10677, 10785, 10903, 11239, 11456, 11567, 11603, 11688, 11766, 11934,    #78
#drop trim(11567, 11602)
# 12146, 12278, 12471, 12636, 12824, 13008, 13238, 13358, 13470, 13601, 13838, 14120, 14291, 14380, 14405, 14470, 14541, 14606, #96
# 14682, 14750, 14815

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

left = 56
top = 94
right = -104
bot = -100
/*
v65 = full.trim(10012, 10106)
v65 = v65.crop(left + 30, top + 0, right + 30, bot + 0)

v65 = v65.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v65.deflickOverlapped(width = 1000, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v65 = v65.correct_left_side(width = 400)
#return v65.prefetch

v66 = full.trim(10107, 10147)
v66 = v66.crop(left + 30, top + 0, right + 30, bot + 0)
v66 = v66.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v66.deflickOverlapped(width = 1000, step = 200, radius = 10, toward_darkest = true, right2left = true).trim(1, 7) +\
      v66.deflickOverlapped(width = v66.width, step = 200, radius = 10, toward_darkest = true, right2left = true).trim(8, 0)
v66 = v66.correct_left_side(width = 400)
#return v66.prefetch

v67 = full.trim(10148, 10192)
v67 = v67.crop(left + 30, top + 0, right + 30, bot + 0)
v67 = v67.correct_left_side(width = 400)
v67 = v67.correct_left_side(width = 200)
#return v67.prefetch

v68 = full.trim(10193, 10316)
v68 = v68.crop(left + 30, top + 0, right + 30, bot + 0)
v68 = v68.correct_left_side(width = 400).\
          correct_left_side(width = 200).trim(0, 37) + v68.trim(38, 0)
#return v68.prefetch

v69 = full.trim(10317, 10676)
v69 = v69.crop(left + 30, top + 0, right + 30, bot + 0)
v69 = v69.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v69.trim(1, 0)
#return v69.prefetch

v70 = full.trim(10677, 10784)
v70 = v70.crop(left + 30, top + 0, right + 30, bot + 0)
v70 = v70.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v70.trim(1, 0)
#return v70.prefetch

v71 = full.trim(10785, 10902)
v71 = v71.crop(left + 30, top + 0, right + 30, bot + 0)
v71 = v71.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v71.trim(1, 0)
#return v71.prefetch

v72 = full.trim(10903, 11238)
v72 = v72.crop(left + 30, top + 0, right + 30, bot + 0)
v72 = v72.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v72.trim(1, 0)
#return v72.prefetch

v73 = full.trim(11239, 11455)
v73 = v73.crop(left + 30, top + 0, right + 30, bot + 0)
v73 = v73.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v73.trim(1, 0)
#return v73.prefetch

v74 = full.trim(11456, 11566)
v74 = v74.crop(left + 30, top + 0, right + 30, bot + 0)
v74 = v74.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v74.trim(1, 0)
#return v74.prefetch

#v75 = full.trim(11567, 11602)
v75 = full.trim(11603, 11687)
v75 = v75.crop(left + 30, top + 0, right + 30, bot + 0)
#return v75.prefetch

v76 = full.trim(11688, 11765)
v76 = v76.crop(left + 30, top + 0, right + 30, bot + 0)
v76 = v76.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v76.trim(1, 0)
#return v76.prefetch

v77 = full.trim(11766, 11933)
v77 = v77.crop(left + 30, top + 0, right + 30, bot + 0)
v77 = v77.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v77.trim(1, 0)
#return v77.prefetch

v78 = full.trim(11934, 12145)
v78 = v78.crop(left + 30, top + 0, right + 30, bot + 0)
v78 = v78.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v78.trim(1, 0)
v78 = v78.trim(0, 1) +\
      v78.trim(1, 3).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
      v78.trim(3, 0)
v78 = v78.trim(0, 38) +\
      v78.deflickOverlapped(width = 1000, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(39, 51) +\
      v78.trim(52, 71) +\
      v78.deflickOverlapped(step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 400).trim(72, 90) +\
      v78.trim(91, 164) +\
      v78.correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100).trim(165, 176) +\
      v78.deflickOverlapped(width = 800, step = 200, radius = 9, toward_darkest = true, right2left = true).\
          correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100).trim(177, 0)
#return v78.prefetch

v79 = full.trim(12146, 12277)
v79 = v79.crop(left + 30, top + 0, right + 30, bot + 0)
v79 = v79.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) + v79.trim(1, 0)
#return v79.prefetch

v80 = full.trim(12278, 12470)
v80 = v80.crop(left + 30, top + 0, right + 30, bot + 0)
v80 = v80.deflickOverlapped(step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100).trim(0, 69) +\
      v80.trim(70, 0)
#return v80.prefetch

v81 = full.trim(12471, 12635)
v81 = v81.crop(left + 30, top + 0, right + 30, bot + 0)
v81 = v81.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v81.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
          correct_left_side(width = 100).trim(1, 0)
#return v81.prefetch

v82 = full.trim(12636, 12823)
v82 = v82.crop(left + 30, top + 0, right + 30, bot + 0)
v82 = v82.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v82.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v82.prefetch

v83 = full.trim(12824, 13007)
v83 = v83.crop(left + 30, top + 0, right + 30, bot + 0)
v83 = v83.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v83.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v83.prefetch

v84 = full.trim(13008, 13237)
v84 = v84.crop(left + 30, top + 0, right + 30, bot + 0)
v84 = v84.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v84.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v84.prefetch

v85 = full.trim(13238, 13357)
v85 = v85.crop(left + 30, top + 0, right + 30, bot + 0)
v85 = v85.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v85.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v85.prefetch

v86 = full.trim(13358, 13469)
v86 = v86.crop(left + 30, top + 0, right + 30, bot + 0)
v86 = v86.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v86.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v86.prefetch

v87 = full.trim(13470, 13600)
v87 = v87.crop(left + 30, top + 0, right + 30, bot + 0)
v87 = v87.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v87.deflickOverlapped(width = 400, step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v87.prefetch

v88 = full.trim(13601, 13837)
v88 = v88.crop(left + 30, top + 0, right + 30, bot + 0)
v88 = v88.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v88.deflickOverlapped(width = 400, step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v88.prefetch

v89 = full.trim(13838, 14119)
v89 = v89.crop(left + 30, top + 0, right + 30, bot + 0)
v89 = v89.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v89.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v89.prefetch

v90 = full.trim(14120, 14290)
v90 = v90.crop(left + 30, top + 0, right + 30, bot + 0)
v90 = v90.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v90.deflickOverlapped(width = 400, step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 0)
#return v90.prefetch

v91 = full.trim(14291, 14379)
v91 = v91.crop(left + 30, top + 0, right + 30, bot + 0)
v91 = v91.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v91.deflickOverlapped(width = 400, step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(1, 65) +\
      v91.deflickOverlapped(step = 200, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200).trim(66, 0)
#return v91.prefetch

v92 = full.trim(14380, 14404)
v92 = v92.crop(left + 30, top + 0, right + 30, bot + 0)
v92 = v92.deflickOverlapped(step = 400, radius = 7, toward_darkest = true, right2left = true).\
          correct_left_side(width = 200)
#return v92.prefetch

v93 = full.trim(14405, 14469)
v93 = v93.crop(left + 30, top + 0, right + 30, bot + 0)
v93 = v93.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v93.trim(1, 0)
v93 = v93.correct_left_side(width = 200).correct_left_side(width = 100)
#return v93.prefetch

v94 = full.trim(14470, 14540)
v94 = v94.crop(left + 30, top + 0, right + 30, bot + 0)
v94 = v94.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v94.trim(1, 0)
#return v94.prefetch

v95 = full.trim(14541, 14605)
v95 = v95.crop(left + 30, top + 0, right + 30, bot + 0)
v95 = v95.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v95.trim(1, 0)
#return v95.prefetch

v96 = full.trim(14606, 14681)
v96 = v96.crop(left + 30, top + 0, right + 30, bot + 0)
v96 = v96.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v96.trim(1, 0)
#return v96.prefetch

#global filter16 = true
*/
import("..\common.avs")

/*

#******

# 65

v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v65 = v65.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v65 = v65.colorYUV(off_u = +4, off_v = -4)
v65 = v65.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate

v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
v66 = v66.colorYUV(off_y = -16)
v66 = v66.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate

v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
v67 = v67.AdjustColor(ou = +24, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true)
v67 = v67.colorYUV(off_u = +4, off_v = -4)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v68 = v68.AdjustColor(ou = +16, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v68 = v68.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate

v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
v69 = v69.colorYUV(off_y = -20)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v69 = v69.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v69 = v69.colorYUV(off_u = +4, off_v = -4)
v69 = v69.ConvertToRGB()
v69 = Expr(v69.ExtractR, v69.ExtractG, v69.ExtractB, "x", "y", b_ex, format = "RGBP")
v69 = v69.ConvertToYV24()
v69 = v69.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.5)#, input_low=16, output_high=235, autolevel=false)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
v70 = v70.colorYUV(off_y = -16)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v70 = v70.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v70 = v70.colorYUV(off_u = +4, off_v = +4)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate

v71 = LSMASHVideoSource(dst_dir + "v71f.mp4").ConvertToYV24()
v71 = v71.colorYUV(off_y = -16)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v71 = v71.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v71 = v71.colorYUV(off_u = +6, off_v = -4)
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
v71 = v71.add_blank_audio
return v71.prefetch
#adjustframerate

v72 = LSMASHVideoSource(dst_dir + "v72f.mp4").ConvertToYV24()
v72 = v72.colorYUV(off_y = -16)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v72 = v72.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
v72 = v72.add_blank_audio
return v72.prefetch
#adjustframerate

v73 = LSMASHVideoSource(dst_dir + "v73f.mp4").ConvertToYV24()
v73 = v73.colorYUV(off_y = -16)
b_ex = undefined
v73 = v73.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v73 = v73.colorYUV(off_u = +6, off_v = -6)
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
v73 = v73.add_blank_audio
return v73.prefetch
#adjustframerate

v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
v74 = v74.colorYUV(off_y = -24)
b_ex = undefined
v74 = v74.AdjustColor(ou = +20, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v74 = v74.colorYUV(off_u = +8, off_v = -6)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
v75 = v75.colorYUV(off_y = -16)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v75 = v75.AdjustColor(ou = +20, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v75 = v75.animate(32, 37, "gamma_f_dr", 1.3, 0.5).trim(0, 41) +\
      v75.animate(42, 44, "gamma_f_dr", 0.8, 1.0).trim(42, 0)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

v76 = LSMASHVideoSource(dst_dir + "v76f.mp4").ConvertToYV24()
b_ex = undefined
v76 = v76.AdjustColor(ou = +20, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
v76 = v76.add_blank_audio
return v76.prefetch
#adjustframerate

v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
v77 = v77.colorYUV(off_y = -16)
b_ex = undefined
v77 = v77.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v77 = v77.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.1)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate

v78 = LSMASHVideoSource(dst_dir + "v78f.mp4").ConvertToYV24()
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v78 = v78.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
v78 = v78.add_blank_audio
return v78.prefetch
#adjustframerate

v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
b_ex = undefined
v79 = v79.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate

v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
v80 = v80.colorYUV(off_y = -16)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v80 = v80.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v80 = v80.colorYUV(off_u = +8, off_v = -6)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate

v81 = LSMASHVideoSource(dst_dir + "v81f.mp4").ConvertToYV24()
v81 = v81.colorYUV(off_y = -16)
b_ex = undefined
v81 = v81.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v81 = v81.colorYUV(off_u = +8, off_v = -8)
v81 = v81.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
v81 = v81.add_blank_audio
return v81.prefetch
#adjustframerate

v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v82 = v82.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate

v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
b_ex = undefined
v83 = v83.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v83 = v83.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate

v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
b_ex = undefined
v84 = v84.AdjustColor(ou = +16, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v84 = v84.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate

v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
b_ex = undefined
v85 = v85.AdjustColor(ou = +16, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v85 = v85.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate

v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
v86 = v86.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true)
v86 = v86.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate

v87 = LSMASHVideoSource(dst_dir + "v87f.mp4").ConvertToYV24()
v87 = v87.colorYUV(off_y = -8)
b_ex = undefined
v87 = v87.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v87 = v87.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
v87 = v87.add_blank_audio
return v87.prefetch
#adjustframerate

v88 = LSMASHVideoSource(dst_dir + "v88f.mp4").ConvertToYV24()
v88 = v88.colorYUV(off_y = -8)
b_ex = undefined
v88 = v88.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v88 = v88.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
v88 = v88.add_blank_audio
return v88.prefetch
#adjustframerate

v89 = LSMASHVideoSource(dst_dir + "v89f.mp4").ConvertToYV24()
b_ex = undefined
v89 = v89.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v89 = v89.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v89 = v89.adjustSize
v89 = v89.assumeFPS(18)
v89 = v89.add_blank_audio
return v89.prefetch
#adjustframerate

v90 = LSMASHVideoSource(dst_dir + "v90f.mp4").ConvertToYV24()
v90 = v90.colorYUV(off_y = -8)
b_ex = undefined
v90 = v90.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v90 = v90.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
v90 = v90.add_blank_audio
return v90.prefetch
#adjustframerate

v91 = LSMASHVideoSource(dst_dir + "v91f.mp4").ConvertToYV24()
v91 = v91.colorYUV(off_y = -8)
b_ex = undefined
v91 = v91.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v91 = v91.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
v91 = v91.add_blank_audio
return v91.prefetch
#adjustframerate

v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
b_ex = undefined
v92 = v92.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v92 = v92.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate

v93 = LSMASHVideoSource(dst_dir + "v93f.mp4").ConvertToYV24()
v93 = v93.colorYUV(off_y = -20)
b_ex = undefined
v93 = v93.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v93 = v93.colorYUV(off_u = +8, off_v = -8)
v93 = v93.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
v93 = v93.add_blank_audio
return v93.prefetch
#adjustframerate

v94 = LSMASHVideoSource(dst_dir + "v94f.mp4").ConvertToYV24()
v94 = v94.colorYUV(off_y = -20)
b_ex = undefined
v94 = v94.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v94 = v94.colorYUV(off_u = +8, off_v = -8)
v94 = v94.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v94 = v94.adjustSize
v94 = v94.assumeFPS(18)
v94 = v94.add_blank_audio
return v94.prefetch
#adjustframerate

v95 = LSMASHVideoSource(dst_dir + "v95f.mp4").ConvertToYV24()
v95 = v95.colorYUV(off_y = -20)
b_ex = undefined
v95 = v95.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v95 = v95.colorYUV(off_u = +8, off_v = -8)
v95 = v95.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
v95 = v95.add_blank_audio
return v95.prefetch
#adjustframerate

v96 = LSMASHVideoSource(dst_dir + "v96f.mp4").ConvertToYV24()
v96 = v96.colorYUV(off_y = -20)
b_ex = undefined
v96 = v96.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v96 = v96.colorYUV(off_u = +8, off_v = -8)
v96 = v96.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
v96 = v96.add_blank_audio
return v96.prefetch
#adjustframerate

#******

*/
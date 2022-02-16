SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("L:\Mov\8mm film 2048x1536 18Fps.mov")
assumefps(18)

full = last

crop(36, 88, -48, -62)

w = width
h = height
w = w*960/h
h = 960

#spline64Resize(w, h)
#return last.autolevels(filterRadius=0, ignore_high=0.0003).histogram("levels").Prefetch(6)

# 8, 52, 91, 147, 182, 203, 256, 307, 348, 391, 418, 452, 494, 550, 582, 621, 691, 758, 788, 792, 830, 871, 920, 979, 1015, 1076,
# 1126, 1252, 1329, 1407, 1497, 1625, 1717, 1799, 1867, 1914, 1958, 2052, 2121, 2182, 2246, 2290, 2329, 2442, 2479, 2517, 2585,
# 2669, 2719, 2777, 2833, 2935, 2992, 3106, 3208, 3272, 3331, 3387, 3457, 3509, 3577, 3597, 3640, 3686, 3729, 3785, 3825, 3887,
# 3944, 3991, 4042, 4073, 4123, 4152, 4358, 4394, 4475, 4645, 4676, 4733, 4760, 4814, 4888, 4921, 4986, 5040, 5098, 5182, 5218,
# 5297, 5327, 5346, 5420, 5463, 5493, 5550, 5607, 5650, 5709, 5773, 5813, 5855, 5894, 5968, 6063, 6104, 6146, 6181, 6374, 6441,
# 6612, 6699, 6890, 7054, 7093, 7241, 7251, 7323, 7385, 7448, 7525, 7571, 7604, 7629, 7693, 7765, 7940, 8046, 8204, 8459, 8608,
# 8899, 9032, 9197, 9371, 9466, 9642, 9643, 9930, 10023, 10096, 10318, 10817, 10865, 10961, 11110, 11181, 11300, 11542, 11694,

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v096 = full.trim(5650, 5708).crop(54, 112, -50, -46)
v097 = full.trim(5709, 5772).crop(54, 112, -50, -56)
v098 = full.trim(5773, 5812).crop(54, 112, -50, -56)
v099 = full.trim(5813, 5854).crop(54, 110, -50, -60)
v100 = full.trim(5855, 5893).crop(54, 106, -50, -64)
v101 = full.trim(5894, 5967).crop(58, 112, -50, -60)
v102 = full.trim(5968, 6062).crop(58, 112, -50, -56)
v103 = full.trim(6063, 6103).crop(58, 112, -50, -56)
v104 = full.trim(6104, 6145).crop(58, 116, -50, -56)
v105 = full.trim(6146, 6180).crop(58, 112, -50, -56)
v106 = full.trim(6181, 6373).crop(60, 112, -56, -66)
v107 = full.trim(6374, 6440).crop(58, 116, -50, -56)
v108 = full.trim(6441, 6611).crop(58, 116, -50, -56)
v109 = full.trim(6612, 6698).crop(58, 116, -50, -56)
v110 = full.trim(6699, 6889).crop(58, 116, -50, -56)
v111 = full.trim(6890, 7053).crop(58, 116, -50, -56)
v112 = full.trim(7054, 7092-7).crop(58, 116, -50, -56)
v113 = full.trim(7093, 7240).crop(58, 116, -50, -56)
#v114 = full.trim(7241, 7250).crop(58, 122, -50, -36)
v114 = full.trim(7251, 7322).crop(58, 102, -50, -66)
v115 = full.trim(7323, 7384).crop(60, 108, -50, -66)
v116 = full.trim(7385, 7447).crop(58, 116, -50, -56)
v117 = full.trim(7448, 7524).crop(58, 112, -50, -56)
v118 = full.trim(7525, 7570).crop(58, 102, -50, -70)
v119 = full.trim(7571, 7603).crop(60, 114, -50, -60)#.autolevels(minRng=0, ignore_low=0.3, ignore_high=0.001)
v120 = full.trim(7604, 7628).crop(60, 114, -50, -60)#.autolevels(minRng=0, ignore_low=0.3, ignore_high=0.001)
v121 = full.trim(7629, 7692-19).crop(58, 106, -50, -66)
#v122 = full.trim(7693, 7764).crop(58, 122, -50, -36)
v122 = full.trim(7767, 7767).crop(60, 46, -48, -126) +\
       full.trim(7768, 7768).crop(60, 66, -48, -106) +\
       full.trim(7769, 7939).crop(60, 116, -48, -56)
v123 = full.trim(7940, 8045).crop(58, 112, -50, -56)
v124 = full.trim(8046, 8203).crop(58, 112, -50, -56)
v125 = full.trim(8204, 8458).crop(58, 112, -50, -56)
v126 = full.trim(8459, 8607).crop(58, 112, -50, -56)
v127 = full.trim(8608, 8898).crop(58, 112, -50, -56)
v128 = full.trim(8899, 9031).crop(58, 106, -50, -66)
#return src.adjustBorders.info.prefetch(4)
#return v128.adjustSize.adjustBorders.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

#******

# 97

/*
v97 = LWLibavVideoSource(source_dir + "v097f.avi", cache=false).ConvertToYV24()
v97 = v97.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v97 = v97.colorYUV(off_u=14, off_v=-14, gamma_y=64)
return v97.prefetch(6)
#adjustframerate

v98 = LWLibavVideoSource(source_dir + "v098f.avi", cache=false).ConvertToYV24()
v98 = v98.colorYUV(off_y=16)
v98 = v98.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v98 = v98.colorYUV(off_u=6, off_v=-6, gamma_y=0)
v98 = v98.autolevels(gamma=1.3)
return v98.prefetch(6)
#adjustframerate

v99 = LWLibavVideoSource(source_dir + "v099f.avi", cache=false).ConvertToYV24()
v99 = v99.colorYUV(off_y=16)
v99 = v99.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v99 = v99.colorYUV(off_u=0, off_v=0, gamma_y=32)
v99 = v99.autolevels(gamma=1.3)
return v99.prefetch(6)
#adjustframerate

v100 = LWLibavVideoSource(source_dir + "v100f.avi", cache=false).ConvertToYV24()
v100 = v100.colorYUV(off_y=-4, gain_y=-16)
v100 = v100.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v100 = v100.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v100.prefetch(6)
#adjustframerate

v101 = LWLibavVideoSource(source_dir + "v101f.avi", cache=false).ConvertToYV24()
v101 = v101.AdjustColor(ou=-4, ov=2, x=10, y=200, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v101 = v101.colorYUV(off_u=-4, off_v=0, gamma_y=16)
return v101.prefetch(6)
#adjustframerate

v102 = LWLibavVideoSource(source_dir + "v102f.avi", cache=false).ConvertToYV24()
v102 = v102.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v102 = v102.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v102.prefetch(6)
#adjustframerate

v103 = LWLibavVideoSource(source_dir + "v103f.avi", cache=false).ConvertToYV24()
v103 = v103.colorYUV(off_y=-20)
v103 = v103.AdjustColor(ou=-4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v103 = v103.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v103.prefetch(6)
#adjustframerate

v104 = LWLibavVideoSource(source_dir + "v104f.avi", cache=false).ConvertToYV24()
v104 = v104.AdjustColor(ou=-4, ov=2, x=10, y=100, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v104 = v104.colorYUV(off_u=0, off_v=-4, gamma_y=0)
return v104.prefetch(6)
#adjustframerate

v105 = LWLibavVideoSource(source_dir + "v105f.avi", cache=false).ConvertToYV24()
v105 = v105.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v105 = v105.colorYUV(off_u=8, off_v=-6, gamma_y=0)
return v105.prefetch(6)
#adjustframerate

v106 = LWLibavVideoSource(source_dir + "v106f.avi", cache=false).ConvertToYV24()
v106 = v106.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v106 = v106.colorYUV(off_u=0, off_v=-4, gamma_y=16)
return v106.prefetch(6)
#adjustframerate

v107 = LWLibavVideoSource(source_dir + "v107f.avi", cache=false).ConvertToYV24()
v107 = v107.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v107 = v107.colorYUV(off_u=0, off_v=-4, gamma_y=16)
return v107.prefetch(6)
#adjustframerate

v108 = LWLibavVideoSource(source_dir + "v108f.avi", cache=false).ConvertToYV24()
v108 = v108.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.3, hi_th=0.001, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v108 = v108.colorYUV(off_u=4, off_v=-6, gamma_y=0)
return v108.prefetch(6)
#adjustframerate

v109 = LWLibavVideoSource(source_dir + "v109f.avi", cache=false).ConvertToYV24()
v109 = v109.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v109 = v109.colorYUV(off_u=2, off_v=-4, gamma_y=0)
return v109.prefetch(6)
#adjustframerate

v110 = LWLibavVideoSource(source_dir + "v110f.avi", cache=false).ConvertToYV24()
v110 = v110.autolevels
v110 = v110.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v110 = v110.colorYUV(off_u=2, off_v=-4, gamma_y=0)
return v110.prefetch(6)
#adjustframerate

v111 = LWLibavVideoSource(source_dir + "v111f.avi", cache=false).ConvertToYV24()
v111 = v111.autolevels
v111 = v111.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v111 = v111.colorYUV(off_u=2, off_v=-4, gamma_y=0)
return v111.prefetch(6)
#adjustframerate

v112 = LWLibavVideoSource(source_dir + "v112f.avi", cache=false).ConvertToYV24()
v112 = v112.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v112 = v112.colorYUV(off_u=2, off_v=-4, gamma_y=0)
return v112.prefetch(6)
#adjustframerate

v113 = LWLibavVideoSource(source_dir + "v113f.avi", cache=false).ConvertToYV24()
v113 = v113.autolevels
v113 = v113.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v113 = v113.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v113.prefetch(6)
#adjustframerate

v114 = LWLibavVideoSource(source_dir + "v114f.avi", cache=false).ConvertToYV24()
v114 = v114.autolevels
v114 = v114.AdjustColor(ou=-8, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=1.5, red=1, grn=1, blu=1, gam_mac=true)
#v114 = v114.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v114.prefetch(6)
#adjustframerate

v115 = LWLibavVideoSource(source_dir + "v115f.avi", cache=false).ConvertToYV24()
v115 = v115.colorYUV(off_y=8)
v115 = v115.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=1.5, red=1, grn=1, blu=1, gam_mac=true)
v115 = v115.colorYUV(off_u=12, off_v=-12, gamma_y=0)
return v115.prefetch(6)
#adjustframerate

v116 = LWLibavVideoSource(source_dir + "v116f.avi", cache=false).ConvertToYV24()
v116 = v116.autolevels(minRng=0)
v116 = v116.AdjustColor(ou=4, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v116 = v116.colorYUV(off_u=4, off_v=-4, gamma_y=0)
return v116.prefetch(6)
#adjustframerate

v117 = LWLibavVideoSource(source_dir + "v117f.avi", cache=false).ConvertToYV24()
v117 = v117.autolevels()
v117 = v117.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v117 = v117.colorYUV(off_u=4, off_v=-4, gamma_y=0)
return v117.prefetch(6)
#adjustframerate

v118 = LWLibavVideoSource(source_dir + "v118f.avi", cache=false).ConvertToYV24()
v118 = v118.autolevels.tweak(sat=1.5, coring=false)
#v118 = v118.AdjustColor(ou=4, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red=1, grn=1, blu=1, gam_mac=false)
v118 = v118.colorYUV(off_u=6, off_v=-2, gamma_y=0)
return v118.prefetch(6)
#adjustframerate

v119 = LWLibavVideoSource(source_dir + "v119f.avi", cache=false).ConvertToYV24()
v119 = v119.autolevels(minRng=0, gamma=0.2)
v119 = v119.AdjustColor(ou=10, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
return v119.prefetch(6)
#adjustframerate

v120 = LWLibavVideoSource(source_dir + "v120f.avi", cache=false).ConvertToYV24()
v120 = v120.autolevels(minRng=0, gamma=0.15)
#v120 = v120.ColorYUV(autowhite=true)
#v120 = v120.tweak(sat=2, coring=false)
v120 = v120.AdjustColor(ou=10, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v120 = v120.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v120.prefetch(6)
#adjustframerate

v121 = LWLibavVideoSource(source_dir + "v121f.avi", cache=false).ConvertToYV24()
v121 = v121.ColorYUV(off_y = 8)
v121 = v121.AdjustColor(ou=-2, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0., hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v121 = v121.colorYUV(off_u=0, off_v=0, gamma_y=16)
#v121 = v121.applyGradationCurves(lumaPoints="0,0, 16,16, 17,18, 19,21, 20,23, 21,25, 22,25, 23,25, 24,25, 25,25, 30,30, 40,40, 100,100, 235,235, 255,255")
return v121.prefetch(6)
#adjustframerate

v122 = LWLibavVideoSource(source_dir + "v122f.avi", cache=false).ConvertToYV24()
v122 = v122.autolevels(minRng=0)
v122 = v122.AdjustColor(ou=-2, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v122 = v122.autolevels(gamma=1.2)
#v122 = v122.colorYUV(off_u=0, off_v=0, gamma_y=128)
return v122.prefetch(6)
#adjustframerate

v123 = LWLibavVideoSource(source_dir + "v123f.avi", cache=false).ConvertToYV24()
v123 = v123.autolevels(minRng=0)
v123 = v123.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)#,\
#                        greenPoints="0,0, 16,16, 90,100, 235,235, 255,255")
v123 = v123.colorYUV(off_u=6, off_v=-6, gamma_y=0)
#v123 = v123.colorYUV(autowhite=true)
v123 = v123.autolevels(gamma=1.5)
return v123.prefetch(6)
#adjustframerate

v124 = LWLibavVideoSource(source_dir + "v124f.avi", cache=false).ConvertToYV24()
v124 = v124.autolevels(minRng=0)
v124 = v124.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v124 = v124.colorYUV(off_u=-6, off_v=-0, gamma_y=0)
#v124 = v124.colorYUV(autowhite=true)
v124 = v124.autolevels(gamma=1.3)
return v124.prefetch(6)
#adjustframerate

v125 = LWLibavVideoSource(source_dir + "v125f.avi", cache=false).ConvertToYV24()
v125 = v125.autolevels(minRng=0)
v125 = v125.autolevels(ignore_low=0, ignore_high=0)
v125 = v125.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v125 = v125.colorYUV(off_u=-6, off_v=-0, gamma_y=0)
v125 = v125.autolevels(minRng=0, gamma=0.7)
return v125.prefetch(6)
#adjustframerate

v126 = LWLibavVideoSource(source_dir + "v126f.avi", cache=false).ConvertToYV24()
v126 = v126.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v126 = v126.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v126 = v126.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v126.prefetch(6)
#adjustframerate

v127 = LWLibavVideoSource(source_dir + "v127f.avi", cache=false).ConvertToYV24()
v127 = v127.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v127 = v127.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v127 = v127.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v127.prefetch(6)
#adjustframerate

v128 = LWLibavVideoSource(source_dir + "v128f.avi", cache=false).ConvertToYV24()
v128 = v128.colorYUV(off_y=10)
v128 = v128.AdjustColor(ou=-0, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#return v128.histogram("levels").prefetch(6)
#v128 = v128.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
v128 = v128.adjustBorders
return v128.prefetch(6)
#adjustframerate
*/

#******

function adjustBorders(clip c)
{
    ref_w = src.width
    ref_h = src.height
    ref_w = ref_w*1080/ref_h
    rem = ref_w % 16
    ref_w = (rem == 0) ? ref_w : ref_w + 16 - rem
    ref_h = 1080

    w = c.width
    h = c.height
    w = w*1080/h
    h = 1080

    c = c.height == h ? c : c.spline64Resize(w, h)

    assert(ref_w >= w, "ref_w < w")

    return ref_w == w ? c : c.addBorders(0, 0, ref_w - w, 0)
}

function adjustSize(clip c)
{
    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

#    return c.spline64Resize(w, h)
    return c.gaussResize(w, h)
}

function Curves(clip c, string "bluePoints", string "greenPoints")
{
    return StrLen(bluePoints) == 0 && StrLen(greenPoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints, greenPoints=greenPoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac",\
                     string "bluePoints", string "greenPoints", float "sat")
{
    ou = Default(ou, 0)
    ov = Default(ov, 0)
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)
    x = Default(x, 20)
    y = Default(y, 20)
    w = Default(w, -20)
    h = Default(h, -20)
    lo_th = Default(lo_th, 0)
    hi_th = Default(hi_th, 0.1)
    scale = Default(scale, 2)
    gam_mac = Default(gam_mac, true)
    lock_chan = Default(lock_chan, 1)
    bluePoints = Default(bluePoints, "")
    greenPoints = Default(greenPoints, "")
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints=bluePoints, greenPoints=greenPoints).\
       ConvertToYV24() : c

    c = sat == 1 ? c : c.tweak(sat=sat, coring=false)

#    c = c.AdjustDiv2(1, 2)

    return c
}

function AdjustColorWB(clip c, y_gamma)
{
    c = c.tweak(sat=0, coring=false)
    c = c.Filter()
    c = c.ColorYUV(autogain=true, gamma_y = y_gamma)

    return c
}

function Filter_0(clip c)
{
    bsize = 8
    over = 4
    chrom = true
    hp = 16
    vp = 16
    search_v = 3
    dct_v = 1

    super = c.MSuper(pel=1, sharp=1, hpad=hp, vpad=vp, rfilter=4)
#return super.info

    backward_vec1 = MAnalyse(super, isb = true, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec2 = MAnalyse(super, isb = true, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec3 = MAnalyse(super, isb = true, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec1 = MAnalyse(super, isb = false, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec2 = MAnalyse(super, isb = false, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec3 = MAnalyse(super, isb = false, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
#    return c.MDegrain2(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,thSAD=4000)
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=400)
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c", int "dct", int "tr", bool "RefineMotion", bool "contrasharp",\
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter", float "fft_sharp")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)
    dct = default(dct, 0)
    tr = default(tr, 9)
    RefineMotion = default(RefineMotion, true)
    contrasharp = default(contrasharp, true)
    truemotion = default(truemotion, true)
    fft_sharp = default(fft_sharp, 0)

    new_w = (c.width + 15) / 16
    new_w = new_w * 16
    new_h = (c.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - c.height
    dw = new_w - c.width
    c = c.addBorders(0, 0, dw, dh)

    c = filter16 ? c.convertBits(16) : c
#c = c.Spline64Resize(960, 720)
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, prefilter=prefilter, contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = (sigma_y == 0 && fft_sharp == 0) ?\
                       c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6, sharpen=fft_sharp)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

#c = c.SincResize(1440, 1080)
    c = filter16 ? c.convertBits(8) : c

    return c.crop(0,0,-dw,-dh)
}

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p",\
                         int "Dct", int "DctRe", int "MaskThr", int "MaskOcc", int "SkipThr", bool "Stp", int "BlendRatio")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1,\
                             blksize=blksize_p, Dct=Dct, DctRe=DctRe, MaskThr=MaskThr,\
                             MaskOcc=MaskOcc, SkipThr=SkipThr, Stp=Stp, BlendRatio=BlendRatio)#, stp=false)
    return c
}

function RemoveDirt(clip input, bool "_grey", int "repmode")
{
    new_w = (input.width + 15) / 16
    new_w = new_w * 16
    new_h = (input.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - input.height
    dw = new_w - input.width
    input = input.addBorders(0, 0, dw, dh)

    _grey=default(_grey, false)
	repmode=default(repmode, 16)
	clmode=17
	clensed=Clense(input, grey=_grey, cache=4)
	sbegin = ForwardClense(input, grey=_grey, cache=-1)
	send = BackwardClense(input, grey=_grey, cache=-1)
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=true), input, mode=repmode, modeU = _grey ? -1 : repmode )
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
    return corrected.crop(0,0,-dw,-dh)
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}
/*
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/
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
w = w*900/h
h = 900
#gaussResize(w, h)
#return last.autolevels(filterRadius=0, ignore_high=0.0003).histogram("levels").Prefetch(4)

# 8, 52, 91, 147, 182, 203, 256, 307, 348, 391, 418, 452, 494, 550, 582, 621, 691, 758, 788, 792, 830, 871, 920, 979, 1015, 1076,
# 1126, 1252, 1329, 1407, 1497, 1625, 1717, 1799, 1867, 1914, 1958, 2052, 2121, 2182, 2246, 2290, 2329, 2442, 2479, 2517, 2585,
# 2669, 2719, 2777, 2833, 2935, 2992, 3106, 3208, 3272, 3331, 3387, 3457, 3509, 3577, 3597, 3640, 3686, 3729, 3785, 3825, 3887,
# 3944, 3991, 4042, 4073, 4123, 4152, 4358, 4394, 4475, 4645, 4676, 4733, 4760, 4814, 4888, 4921, 4986, 5040, 5098, 5182, 5218,
# 5297, 5327, 5346, 5420, 5463, 5493, 5550, 5607, 5650, 5709, 5773, 5813, 5855, 5894, 5968, 6063, 6104, 6146, 6181, 6374, 6441,
# 6612, 6699, 6890, 7054, 7093, 7241, 7251, 7323, 7385, 7448, 7525, 7571, 7604, 7629, 7693, 7765, 7940, 8046, 8204, 8459, 8608,
# 8899, 9032, 9197, 9371, 9466, 9642, 9643, 9930, 10023, 10096, 10318, 10817, 10865, 10961, 11110, 11181, 11300, 11542, 11694,
# 12195, 12240, 12534, 12719, 12927, 13087, 13118, 13145, 13171, 13217, 13257, 13317, 13393, 13651, 13719, 13909, 13934, 14161,
# 14169, 14362, 14428, 14472, 14626, 14771, 14789, 15054, 15093, 15231, 15287, 15340, 15368, 15647, 15581, 15676, 15775, 15942,

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v128 = full.trim(8899, 9031).crop(58, 106, -50, -66)
v129 = full.trim(9032, 9196).crop(58, 106, -48, -64)
v130 = full.trim(9197, 9370).crop(58, 106, -48, -64)
v131 = full.trim(9371, 9465).crop(58, 106, -48, -64)
v132 = full.trim(9466, 9641).crop(58, 106, -48, -64)
v133 = full.trim(9643, 9929).crop(60, 108, -52, -66)
v134 = full.trim(9930, 10022).crop(60, 108, -52, -66)
v135 = full.trim(10023, 10095).crop(60, 108, -52, -66)
v136 = full.trim(10096, 10317).crop(60, 108, -52, -66)
v137 = full.trim(10318, 10816).crop(60, 108, -52, -66)
v138 = full.trim(10817, 10864).crop(60, 108, -52, -66)
#v139 = full.trim(10865, 10960).crop(58, 106, -48, -64)
#v139 = full.trim(10961, 11109).crop(58, 106, -48, -64)
v139 = full.trim(11110, 11180).crop(48, 90, -78, -90)
v140 = full.trim(11181, 11299).crop(52, 90, -68, -90)
v141 = full.trim(11300, 11541).crop(52, 90, -68, -90)
v142 = full.trim(11542, 11693).crop(52, 90, -68, -90)
v143 = full.trim(11694, 12194).crop(52, 106, -68, -74)
v144 = full.trim(12195, 12239).crop(52, 106, -68, -74)
v145 = full.trim(12240, 12533).crop(52, 106, -68, -74)
v146 = full.trim(12534, 12718).crop(52, 106, -68, -74)
v147 = full.trim(12719, 12926).crop(52, 106, -68, -74)
v148 = full.trim(12927, 13086).crop(52, 106, -68, -74)
v149 = full.trim(13087, 13117).crop(52, 106, -68, -74)
v150 = full.trim(13118, 13144).crop(52, 106, -68, -74)
v151 = full.trim(13145, 13170).crop(52, 106, -68, -74)
v152 = full.trim(13171, 13216).crop(52, 106, -68, -74)
v153 = full.trim(13217, 13256-2).crop(52, 106, -68, -74)
#v154 = full.trim(13257, 13316).crop(52, 106, -68, -74)
v154 = full.trim(13317, 13392).crop(72, 106, -58, -74)
v155 = full.trim(13393, 13650).crop(72, 106, -58, -74)
v156 = full.trim(13651, 13718).crop(72, 106, -58, -74)
v157 = full.trim(13719, 13908).crop(72, 106, -58, -74)
v158 = full.trim(13909, 13933-1).crop(72, 106, -58, -74)
v159 = full.trim(13934, 14160).crop(72, 106, -58, -74)
#v160 = full.trim(14161, 14168).crop(72, 106, -58, -74)
v160 = full.trim(14169, 14361).crop(66, 90, -58, -90)
#return src.adjustBorders.info.prefetch(4)
#return v160.adjustSize.adjustBorders.gaussResize(1280, 900).prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

#******

/*
# 129

v129 = LWLibavVideoSource(source_dir + "v129f.avi", cache=false).ConvertToYV24()
v129 = v129.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v129 = v129.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v129 = v129.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v129 = v129.adjustBorders
return v129.prefetch(6)
#adjustframerate

v130 = LWLibavVideoSource(source_dir + "v130f.avi", cache=false).ConvertToYV24()
v130 = v130.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v130 = v130.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v130 = v130.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v130 = v130.adjustBorders
return v130.prefetch(6)
#adjustframerate

v131 = LWLibavVideoSource(source_dir + "v131f.avi", cache=false).ConvertToYV24()
v131 = v131.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v131 = v131.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v131 = v131.colorYUV(off_u=-4, off_v=-4)
v131 = v131.adjustBorders
return v131.prefetch(6)
#adjustframerate

v132 = LWLibavVideoSource(source_dir + "v132f.avi", cache=false).ConvertToYV24()
v132 = v132.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v132 = v132.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v132 = v132.colorYUV(off_u=-2, off_v=-2)
v132 = v132.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v132 = v132.adjustBorders
return v132.prefetch(6)
#adjustframerate

v133 = LWLibavVideoSource(source_dir + "v133f.avi", cache=false).ConvertToYV24()
v133 = v133.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v133 = v133.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v133 = v133.adjustBorders
return v133.prefetch(6)
#adjustframerate

v134 = LWLibavVideoSource(source_dir + "v134f.avi", cache=false).ConvertToYV24()
v134 = v134.colorYUV(off_y=12)
v134 = v134.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v134 = v134.adjustBorders
return v134.prefetch(6)
#adjustframerate

v135 = LWLibavVideoSource(source_dir + "v135f.avi", cache=false).ConvertToYV24()
v135 = v135.colorYUV(off_y=12)
v135 = v135.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v135 = v135.adjustBorders
return v135.prefetch(6)
#adjustframerate

v136 = LWLibavVideoSource(source_dir + "v136f.avi", cache=false).ConvertToYV24()
v136 = v136.colorYUV(off_y=12)
v136 = v136.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v136 = v136.adjustBorders
return v136.prefetch(6)
#adjustframerate

v137 = LWLibavVideoSource(source_dir + "v137f.avi", cache=false).ConvertToYV24()
v137 = v137.colorYUV(off_y=12)
v137 = v137.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v137 = v137.adjustBorders
return v137.prefetch(6)
#adjustframerate

v138 = LWLibavVideoSource(source_dir + "v138f.avi", cache=false).ConvertToYV24()
v138 = v138.colorYUV(off_y=6)
v138 = v138.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v138 = v138.colorYUV(off_u=-4, off_v=0)
v138 = v138.adjustBorders
return v138.prefetch(6)
#adjustframerate

v139 = LWLibavVideoSource(source_dir + "v139f.avi", cache=false).ConvertToYV24()
v139 = v139.colorYUV(off_y=6)
v139 = v139.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v139 = v139.adjustBorders
return v139.prefetch(6)
#adjustframerate

v140 = LWLibavVideoSource(source_dir + "v140f.avi", cache=false).ConvertToYV24()
v140 = v140.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v140 = v140.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v140 = v140.adjustBorders
return v140.prefetch(6)
#adjustframerate

v141 = LWLibavVideoSource(source_dir + "v141f.avi", cache=false).ConvertToYV24()
v141 = v141.colorYUV(off_y=12)
v141 = v141.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v141 = v141.adjustBorders
return v141.prefetch(6)
#adjustframerate

v142 = LWLibavVideoSource(source_dir + "v142f.avi", cache=false).ConvertToYV24()
v142 = v142.colorYUV(off_y=12)
v142 = v142.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v142 = v142.colorYUV(off_u=-2, off_v=2)
v142 = v142.adjustBorders
return v142.prefetch(6)
#adjustframerate

v143 = LWLibavVideoSource(source_dir + "v143f.avi", cache=false).ConvertToYV24()
v143 = v143.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v143 = v143.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v143 = v143.colorYUV(off_u=-2, off_v=2)
v143 = v143.adjustBorders
return v143.prefetch(6)
#adjustframerate

v144 = LWLibavVideoSource(source_dir + "v144f.avi", cache=false).ConvertToYV24()
v144 = v144.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v144 = v144.adjustBorders
return v144.prefetch(6)
#adjustframerate

v145 = LWLibavVideoSource(source_dir + "v145f.avi", cache=false).ConvertToYV24()
v145 = v145.colorYUV(off_y=6)
v145 = v145.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v145 = v145.adjustBorders
return v145.prefetch(6)
#adjustframerate

v146 = LWLibavVideoSource(source_dir + "v146f.avi", cache=false).ConvertToYV24()
v146 = v146.colorYUV(off_y=6)
v146 = v146.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v146 = v146.colorYUV(off_u=-2, off_v=2)
v146 = v146.adjustBorders
return v146.prefetch(6)
#adjustframerate

v147 = LWLibavVideoSource(source_dir + "v147f.avi", cache=false).ConvertToYV24()
v147 = v147.colorYUV(off_y=6)
v147 = v147.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v147 = v147.adjustBorders
return v147.prefetch(6)
#adjustframerate

v148 = LWLibavVideoSource(source_dir + "v148f.avi", cache=false).ConvertToYV24()
v148 = v148.colorYUV(off_y=6)
v148 = v148.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v148 = v148.adjustBorders
return v148.prefetch(6)
#adjustframerate

v149 = LWLibavVideoSource(source_dir + "v149f.avi", cache=false).ConvertToYV24()
v149 = v149.colorYUV(off_y=6)
v149 = v149.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v149 = v149.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.7)
v149 = v149.adjustBorders
return v149.prefetch(6)
#adjustframerate

v150 = LWLibavVideoSource(source_dir + "v150f.avi", cache=false).ConvertToYV24()
v150 = v150.colorYUV(off_y=6)
v150 = v150.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v150 = v150.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v150 = v150.adjustBorders
return v150.prefetch(6)
#adjustframerate

v151 = LWLibavVideoSource(source_dir + "v151f.avi", cache=false).ConvertToYV24()
v151 = v151.colorYUV(off_y=6)
v151 = v151.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v151 = v151.adjustBorders
return v151.prefetch(6)
#adjustframerate

v152 = LWLibavVideoSource(source_dir + "v152f.avi", cache=false).ConvertToYV24()
v152 = v152.colorYUV(off_y=6)
v152 = v152.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v152 = v152.adjustBorders
return v152.prefetch(6)
#adjustframerate

v153 = LWLibavVideoSource(source_dir + "v153f.avi", cache=false).ConvertToYV24()
v153 = v153.colorYUV(off_y=6)
v153 = v153.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v153 = v153.adjustBorders
return v153.prefetch(6)
#adjustframerate

v154 = LWLibavVideoSource(source_dir + "v154f.avi", cache=false).ConvertToYV24()
v154 = v154.colorYUV(off_y=6)
v154 = v154.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v154 = v154.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v154 = v154.adjustBorders
return v154.prefetch(6)
#adjustframerate

v155 = LWLibavVideoSource(source_dir + "v155f.avi", cache=false).ConvertToYV24()
v155 = v155.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v155 = v155.colorYUV(off_u=-2, off_v=2)
v155 = v155.adjustBorders
return v155.prefetch(6)
#adjustframerate

v156 = LWLibavVideoSource(source_dir + "v156f.avi", cache=false).ConvertToYV24()
v156 = v156.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.5, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v156 = v156.colorYUV(off_u=-2, off_v=2)
v156 = v156.adjustBorders
return v156.prefetch(6)
#adjustframerate

v157 = LWLibavVideoSource(source_dir + "v157f.avi", cache=false).ConvertToYV24()
v157 = v157.colorYUV(off_y=6)
v157 = v157.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v157 = v157.colorYUV(off_u=-2, off_v=2)
v157 = v157.adjustBorders
return v157.prefetch(6)
#adjustframerate

v158 = LWLibavVideoSource(source_dir + "v158f.avi", cache=false).ConvertToYV24()
v158 = v158.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v158 = v158.colorYUV(off_u=-2, off_v=2)
v158 = v158.adjustBorders
return v158.prefetch(6)
#adjustframerate

v159 = LWLibavVideoSource(source_dir + "v159f.avi", cache=false).ConvertToYV24()
v159 = v159.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v159 = v159.colorYUV(off_u=-2, off_v=2)
v159 = v159.adjustBorders
return v159.prefetch(6)
#adjustframerate

v160 = LWLibavVideoSource(source_dir + "v160f.avi", cache=false).ConvertToYV24()
#v160 = v160.colorYUV(off_y=6)
v160 = v160.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v160 = v160.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v160 = v160.colorYUV(off_u=-2, off_v=2)
#v160 = v160.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
#return v160.histogram("levels").prefetch(6)
v160 = v160.adjustBorders
return v160.prefetch(6)
#adjustframerate

#******

*/

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

    return c.gaussResize(w, h)
}

function Curves(clip c, string "bluePoints")
{
    return StrLen(bluePoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "bluePoints", float "sat")
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
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints = bluePoints).\
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

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
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
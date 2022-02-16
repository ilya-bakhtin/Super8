SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("K:\Media\Video\Super8\8mm film 2048x1536 18Fps.mov")
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
# 14169, 14362, 14428, 14472, 14626, 14771, 14789, 15054, 15093, 15231, 15287, 15340, 15368, 15467, 15581, 15676, 15775, 15942,
# 16014, 16045, 16084, 16203, 16299, 16367, 16523, 16583, 16689, 16746, 16834, 16873, 17022, 17160, 17181, 17257, 17322, 17614,
# 18072, 18211, 18329, 18434, the end

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

#v160 = full.trim(14169, 14361).crop(66, 90, -58, -90)
v161 = full.trim(14362, 14427).crop(66, 94, -58, -90)
v162 = full.trim(14428, 14471).crop(66, 94, -58, -90)
v163 = full.trim(14472, 14625).crop(66, 94, -58, -90)
v164 = full.trim(14626, 14770).crop(66, 94, -58, -90)
v165 = full.trim(14771, 14788).crop(66, 94, -58, -90)
v166 = full.trim(14789, 15053).crop(66, 94, -58, -90)
v167 = full.trim(15054, 15092).crop(66, 94, -58, -90)
v168 = full.trim(15093, 15230).crop(66, 94, -58, -90)
v169 = full.trim(15231, 15286).crop(66, 94, -58, -90)
v170 = full.trim(15287, 15339).crop(66, 94, -58, -90)
v171 = full.trim(15340, 15366).crop(66, 94, -58, -90)
#v172 = full.trim(15368, 15466).crop(66, 94, -58, -90)
#v172 = full.trim(15467, 15580).crop(66, 94, -58, -90)
#v172 = full.trim(15581, 15675).crop(66, 94, -58, -90)
v172 = full.trim(15676, 15774).crop(66, 94, -58, -90)
v173 = full.trim(15775, 15941).crop(66, 94, -58, -90)
v174 = full.trim(15942, 16013).crop(50, 90, -58, -80)
v175 = full.trim(16014, 16044).crop(50, 90, -58, -80)
v176 = full.trim(16045, 16083).crop(50, 90, -58, -80)
v177 = full.trim(16084, 16202).crop(50, 90, -58, -80)
v178 = full.trim(16203, 16298).crop(50, 90, -58, -80)
v179 = full.trim(16299, 16366).crop(50, 90, -58, -80)
v180 = full.trim(16367, 16522).crop(50, 90, -58, -80)
v181 = full.trim(16523, 16582).crop(50, 90, -58, -80)
v182 = full.trim(16583, 16688).crop(50, 90, -60, -82)
v183 = full.trim(16689, 16745).crop(50, 96, -66, -82)
v184 = full.trim(16746, 16833).crop(50, 90, -58, -80)
v185 = full.trim(16834, 16872).crop(50, 90, -58, -80)
v186 = full.trim(16873, 17021).crop(50, 90, -58, -80)
v187 = full.trim(17022, 17159).crop(50, 90, -58, -80)
v188 = full.trim(17160, 17180).crop(50, 90, -58, -80)
v189 = full.trim(17181, 17256).crop(50, 90, -58, -80)
v190 = full.trim(17257, 17321).crop(50, 90, -58, -80)
v191 = full.trim(17322, 17613).crop(50, 90, -58, -80)
v192 = full.trim(17614, 18071).crop(50, 90, -58, -80)
#return v192.adjustSize.adjustBorders.prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*
#******

# 161

v161 = LWLibavVideoSource(source_dir + "v161f.avi", cache=false).ConvertToYV24()
v161 = v161.colorYUV(off_y=4)
v161 = v161.AdjustColor(ou=2, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v161 = v161.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.7)
v161 = v161.adjustBorders
return v161.prefetch(6)
#adjustframerate

v162 = LWLibavVideoSource(source_dir + "v162f.avi", cache=false).ConvertToYV24()
v162 = v162.AdjustColor(ou=-3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v162 = v162.adjustBorders
return v162.prefetch(6)
#adjustframerate

v163 = LWLibavVideoSource(source_dir + "v163f.avi", cache=false).ConvertToYV24()
v163 = v163.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v163 = v163.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v163 = v163.adjustBorders
return v163.prefetch(6)
#adjustframerate

v164 = LWLibavVideoSource(source_dir + "v164f.avi", cache=false).ConvertToYV24()
v164 = v164.colorYUV(off_y=6)
v164 = v164.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v164 = v164.adjustBorders
return v164.prefetch(6)
#adjustframerate

v165 = LWLibavVideoSource(source_dir + "v165f.avi", cache=false).ConvertToYV24()
v165 = v165.colorYUV(off_y=6)
v165 = v165.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v165 = v165.adjustBorders
return v165.prefetch(6)
#adjustframerate

v166 = LWLibavVideoSource(source_dir + "v166f.avi", cache=false).ConvertToYV24()
v166 = v166.autolevels(minRng=0, ignore_low=0, ignore_high=0.001)
v166 = v166.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v166 = v166.adjustBorders
return v166.prefetch(6)
#adjustframerate

v167 = LWLibavVideoSource(source_dir + "v167f.avi", cache=false).ConvertToYV24()
v167 = v167.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v167 = v167.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v167 = v167.adjustBorders
return v167.prefetch(6)
#adjustframerate

v168 = LWLibavVideoSource(source_dir + "v168f.avi", cache=false).ConvertToYV24()
v168 = v168.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v168 = v168.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v168 = v168.colorYUV(off_u=-2, off_v=2)
v168 = v168.adjustBorders
return v168.prefetch(6)
#adjustframerate

v169 = LWLibavVideoSource(source_dir + "v169f.avi", cache=false).ConvertToYV24()
v169 = v169.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v169 = v169.colorYUV(off_u=-2, off_v=2)
v169 = v169.adjustBorders
return v169.prefetch(6)
#adjustframerate

v170 = LWLibavVideoSource(source_dir + "v170f.avi", cache=false).ConvertToYV24()
v170 = v170.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v170 = v170.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v170 = v170.colorYUV(off_u=-2, off_v=2)
v170 = v170.adjustBorders
return v170.prefetch(6)
#adjustframerate

v171 = LWLibavVideoSource(source_dir + "v171f.avi", cache=false).ConvertToYV24()
v171 = v171.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v171 = v171.colorYUV(off_u=-2, off_v=2)
v171 = v171.adjustBorders
return v171.prefetch(6)
#adjustframerate

v172 = LWLibavVideoSource(source_dir + "v172f.avi", cache=false).ConvertToYV24()
v172 = v172.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v172 = v172.colorYUV(off_u=-2, off_v=2)
v172 = v172.adjustBorders
return v172.prefetch(6)
#adjustframerate

v173 = LWLibavVideoSource(source_dir + "v173f.avi", cache=false).ConvertToYV24()
v173 = v173.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v173 = v173.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v173 = v173.adjustBorders
return v173.prefetch(6)
#adjustframerate

v174 = LWLibavVideoSource(source_dir + "v174f.avi", cache=false).ConvertToYV24()
v174 = v174.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v174 = v174.AdjustColor(ou=3, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v174 = v174.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v174 = v174.adjustBorders
return v174.prefetch(6)
#adjustframerate

v175 = LWLibavVideoSource(source_dir + "v175f.avi", cache=false).ConvertToYV24()
v175 = v175.colorYUV(off_y=-3)
v175 = v175.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2.5, red=1, grn=1, blu=1, gam_mac=true)
v175 = v175.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v175 = v175.adjustBorders
return v175.prefetch(6)
#adjustframerate

v176 = LWLibavVideoSource(source_dir + "v176f.avi", cache=false).ConvertToYV24()
v176 = v176.colorYUV(off_y=6)
v176 = v176.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v176 = v176.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.7)
v176 = v176.adjustBorders
return v176.prefetch(6)
#adjustframerate

v177 = LWLibavVideoSource(source_dir + "v177f.avi", cache=false).ConvertToYV24()
v177 = v177.colorYUV(off_y=6)
v177 = v177.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v177 = v177.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v177 = v177.adjustBorders
return v177.prefetch(6)
#adjustframerate

v178 = LWLibavVideoSource(source_dir + "v178f.avi", cache=false).ConvertToYV24()
v178 = v178.AdjustColor(ou=3, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v178 = v178.adjustBorders
return v178.prefetch(6)
#adjustframerate

v179 = LWLibavVideoSource(source_dir + "v179f.avi", cache=false).ConvertToYV24()
v179 = v179.AdjustColor(ou=3, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v179 = v179.adjustBorders
return v179.prefetch(6)
#adjustframerate

v180 = LWLibavVideoSource(source_dir + "v180f.avi", cache=false).ConvertToYV24()
v180 = v180.AdjustColor(ou=3, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v180 = v180.adjustBorders
return v180.prefetch(6)
#adjustframerate

v181 = LWLibavVideoSource(source_dir + "v181f.avi", cache=false).ConvertToYV24()
v181 = v181.AdjustColor(ou=3, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v181 = v181.adjustBorders
return v181.prefetch(6)
#adjustframerate

v182 = LWLibavVideoSource(source_dir + "v182f.avi", cache=false).ConvertToYV24()
v182 = v182.colorYUV(off_y=6)
v182 = v182.AdjustColor(ou=6, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v182 = v182.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v182 = v182.adjustBorders
return v182.prefetch(6)
#adjustframerate

v183 = LWLibavVideoSource(source_dir + "v183f.avi", cache=false).ConvertToYV24()
v183 = v183.AdjustColor(ou=6, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red=1, grn=1, blu=1, gam_mac=true)
v183 = v183.colorYUV(off_u=-2, off_v=2)
v183 = v183.adjustBorders
return v183.prefetch(6)
#adjustframerate

v184 = LWLibavVideoSource(source_dir + "v184f.avi", cache=false).ConvertToYV24()
v184 = v184.autolevels(minRng=0, ignore_low=0, ignore_high=0.003)
v184 = v184.AdjustColor(ou=6, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v184 = v184.colorYUV(off_u=-2, off_v=2)
v184 = v184.adjustBorders
return v184.prefetch(6)
#adjustframerate

v185 = LWLibavVideoSource(source_dir + "v185f.avi", cache=false).ConvertToYV24()
v185 = v185.autolevels(minRng=0, ignore_low=0, ignore_high=0.003)
v185 = v185.AdjustColor(ou=6, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v185 = v185.colorYUV(off_u=-2, off_v=2)
v185 = v185.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v185 = v185.adjustBorders
return v185.prefetch(6)
#adjustframerate

v186 = LWLibavVideoSource(source_dir + "v186f.avi", cache=false).ConvertToYV24()
v186 = v186.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v186 = v186.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v186 = v186.colorYUV(off_u=-2, off_v=2)
v186 = v186.adjustBorders
return v186.prefetch(6)
#adjustframerate

v187 = LWLibavVideoSource(source_dir + "v187f.avi", cache=false).ConvertToYV24()
v187 = v187.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v187 = v187.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v187 = v187.colorYUV(off_u=-2, off_v=2)
v187 = v187.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v187 = v187.adjustBorders
return v187.prefetch(6)
#adjustframerate

v188 = LWLibavVideoSource(source_dir + "v188f.avi", cache=false).ConvertToYV24()
v188 = v188.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v188 = v188.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v188 = v188.colorYUV(off_u=-2, off_v=2)
v188 = v188.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v188 = v188.adjustBorders
return v188.prefetch(6)
#adjustframerate

v189 = LWLibavVideoSource(source_dir + "v189f.avi", cache=false).ConvertToYV24()
v189 = v189.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v189 = v189.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v189 = v189.colorYUV(off_u=-2, off_v=4)
v189 = v189.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v189 = v189.adjustBorders
return v189.prefetch(6)
#adjustframerate

v190 = LWLibavVideoSource(source_dir + "v190f.avi", cache=false).ConvertToYV24()
v190 = v190.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v190 = v190.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v190 = v190.colorYUV(off_u=-2, off_v=4)
v190 = v190.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v190 = v190.adjustBorders
return v190.prefetch(6)
#adjustframerate

v191 = LWLibavVideoSource(source_dir + "v191f.avi", cache=false).ConvertToYV24()
v191 = v191.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v191 = v191.colorYUV(off_u=-2, off_v=4)
v191 = v191.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v191 = v191.adjustBorders
return v191.prefetch(6)
#adjustframerate

v192 = LWLibavVideoSource(source_dir + "v192f.avi", cache=false).ConvertToYV24()
#v192 = v192.colorYUV(off_y=6)
#v192 = v192.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v192 = v192.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
#v192 = v192.colorYUV(off_u=-2, off_v=4)
v192 = v192.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
#return v192.histogram("levels").prefetch(6)
v192 = v192.adjustBorders
return v192.prefetch(6)
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
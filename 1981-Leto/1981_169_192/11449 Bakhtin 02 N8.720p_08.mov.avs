SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

#LoadPlugin("D:\Program Files (x86)\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\1981\11449 Bakhtin 02 cast1 N8.720p.mov")
assumefps(18)

#c1 = LSMASHVideoSource("E:\media\video\Super8\11449 Digitalizace\11449 Bakhtin 01 cast1 S8.720p.mov")
#c1 = c1.assumefps(18)
#c1 = c1.crop(140,4,-140,-4)
#b = BlankClip(c1, length=3000, color=$000000)

#FlipVertical.Reverse()

crop(146,0,-190,-0)
#return last

# 428, 431, 676, 823, 889, 944, 999, 1060, 1121, 1145, 1286, 1563, 1696, 1946, 2051, 2124, 2211, 2386, 2417, 2454, 2493, 2676, 2751, 3017, 3223,
# 3416, 3598, 3749, 3875, 3899, 4085, 4245, 4437, 4461, 4496, 4701, 4940, 5042, 5065, 5116, 5182, 5468, 5525, 5740, 5754, 5946, 6070, 6179, 6292,
# 6493, 6711, 6942, 6979, 7075, 7295, 7489, 7619, 7747, 7785, 7813, 7931, 7988, 8116, 8200, 8207, 8352, 8496, 8632, 8803, 8991, 9177, 9381, 9578,
# 9633, 9715, 9806, 9892, 10060, 10188, 10367, 10512, 10672, 10820, 10902, 11032, 11120, 11295, 11470, 11551, 11653, 11701, 11842, 11936, 12119, 12176,
# 12228, 12414, 12611, 12691, 12826, 13046, 13130, 13302, 13464, 13548, 13638, 13887, 14003, 14112, 14115, 14122, 14194, 14256, 14455, 14719,
# 14752, 15032, 15368, 15599, 15675, 15714, 15807, 15900, 15930, 16015, 16113, 16155, 16241, 16274, 16330, 16349, 16423, 16463, 16651, 16899, 17071,
# 17145, 17198, 17266, 17407, 17499, 17581, 17699, 17764, 17830, 17947, 18086, 18093, 18317, 18558, 18689, 19040, 19375, 19516, 19531, 19680, 19844,
# 19862, 19907, 19917, 19942, 19974, 20078, 20174, 20239, 20279, 20334, 20424, 20560, 20710, 20848, 20960, 21019, 21119, 21206, 21267, 21294, 21437,
# 21559, 21756, 21938, 22019, 22175, 22227, 22242, 22292, 22329, 22376, 22561, 22637, 22733, 22797, 22877, 22968, 23112, 23223, 23686, 23784,
# 23873, 23937, 24000, 24127, 24244, 24386, 24581, 24769, 24933, 25089, 25267, 25310, 25401, 25533, 25581, 25727, 25894, 26048, 26200, 26308, 26501, 26556, 26687,
# 26964, 27081, 27297, 27390, 27534, 27571, 27656, 27729, 27917, 27964, 28559, 28616, 28679, 28904, 28953, 29025, 29086, 29162, 29241, 29245,
# 29307, 29457, 29624, 29638, 29769,

global src = last
#return last

#v24 = src.trim(22878, 22966)
v169 = src.trim(22969, 23110).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v170 = src.trim(23113, 23220)
v170_0 = v170.trim(0, 45)#.crop(0,0,-18,-32)
v170_0 = v170_0.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_r = 18, border_b=32, filterRadius = 0, minRng=0)
v170_1 = v170.trim(46, 64)#.crop(0,0,-4,-28)
v170_1 = v170_1.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_r = 4, border_b=28, filterRadius = 0, minRng=0)
v170_2 = v170.trim(65, 0)#.crop(0,0,-12,-16)
v170_2 = v170_2.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_r = 12, border_b=16, filterRadius = 0, minRng=0)
v170 = v170_0.adjustBorders + v170_1.adjustBorders + v170_2.adjustBorders

v171 = src.trim(23224, 23683).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, border_b=100, filterRadius = 0, minRng=0)
v172 = src.trim(23686, 23783).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v173 = src.trim(23785, 23872).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v174 = src.trim(23874, 23936).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v175 = src.trim(23938, 23988).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v176 = src.trim(24001, 24126).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v177 = src.trim(24128, 24241).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v178 = src.trim(24244, 24385).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v179 = src.trim(24387, 24580)
v179a = v179.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v179 = v179a.trim(0, 83) + v179.trim(84, 97).tweak(bright = -120, cont = 2, sat = 1.3, coring = false) +\
       v179a.trim(98, 150) + v179.trim(151, 0).tweak(cont = 1.4, sat = 1.3, coring = false)

v180 = src.trim(24582, 24647) + src.trim(24649, 24764)
v180 = v180.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v181 = src.trim(24769, 24932).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v182 = src.trim(24934, 25088).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v183 = src.trim(25090, 25265).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v184 = src.trim(25268, 25309).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v185 = src.trim(25311, 25400).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v186 = src.trim(25402, 25531).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v187 = src.trim(25534, 25580).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v188 = src.trim(25582, 25726)
v188a = v188.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v188 = v188.tweak(bright= -70, cont=1.8, sat=1.8)#.interleave(v188a).histogram("levels")

v189 = src.trim(25728, 25892).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v190 = src.trim(25896, 26047).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v191 = src.trim(26049, 26198).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v192 = src.trim(26200, 26305).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30

global filter16 = true

/*

v169 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v169f.avi").ConvertToYV24()
v169 = v169.AdjustColor(ou=8, ov=0, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.88, gam_mac=true)
v169 = v169.convertToYV12
v169 = v169.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v169 = v169.removeDirt
v169 = v169.UnsharpMask(strength=300, radius=3, threshold=1)
#return v169.histogram("levels").prefetch(6)
return v169.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

function p3_170(clip c)
{
    c = c.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.9, gam_mac=true)
    c = c.convertToYV12
    c = c.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
    c = c.removeDirt
    c = c.UnsharpMask(strength=300, radius=5, threshold=1)
    return c
}
v170 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v170f.avi").ConvertToYV24()
v170_0 = v170.trim(0, 45).crop(0,0,-18,-32)
v170_0 = v170_0.p3_170
v170_1 = v170.trim(46, 64).crop(0,0,-4,-28)
v170_1 = v170_1.p3_170
v170_2 = v170.trim(65, 0).crop(0,0,-12,-16)
v170_2 = v170_2.p3_170
v170 = v170_0.adjustBorders + v170_1.adjustBorders + v170_2.adjustBorders
#v170 = v170.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.9, gam_mac=true)
#v170 = v170.convertToYV12
#v170 = v170.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=true, sigma_y=0, sigma_c=0)
#v170 = v170.removeDirt
#return v170.histogram("levels").prefetch(6)
return v170.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

function p3_171(clip c)
{
    c = c.AdjustColor(ou=2, ov=2, lo_th=0.1, hi_th=0.1, x=200, sat=1.5, red = 1, blu = 1, gam_mac=true)
    c = c.convertToYV12
    c = c.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
    c = c.removeDirt
    c = c.UnsharpMask(strength=300, radius=5, threshold=1)
    return c
}
v171 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v171f.avi").ConvertToYV24()
v171_0 = v171.trim(0, 44).p3_171
v171_1 = v171.trim(45, 100).crop(0,0,0,-32).p3_171
v171_2 = v171.trim(101, 114).p3_171
v171_3 = v171.trim(115, 127).crop(0,0,0,-8).p3_171
v171_4 = v171.trim(128, 358).p3_171
v171_5 = v171.trim(359, 384).crop(0,0,0,-16).p3_171
v171_6 = v171.trim(385, 0).p3_171
v171 = v171_0.adjustBorders + v171_1.adjustBorders + v171_2.adjustBorders + v171_3.adjustBorders + v171_4.adjustBorders + v171_5.adjustBorders + v171_6.adjustBorders
#v171 = v171.p3_171
#v171 = v171.AdjustColor(ou=2, ov=2, lo_th=0.1, hi_th=0.1, sat=1.5, red = 1, blu = 1, gam_mac=true)
#v171 = v171.convertToYV12
#v171 = v171.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=true, sigma_y=0, sigma_c=0)
#v171 = v171.removeDirt
#return v171.histogram("levels").prefetch(6)
return v171.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v172 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v172f.avi").ConvertToYV24()
v172 = v172.AdjustColor(ou=6, ov=-4, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.9, gam_mac=true)
v172 = v172.convertToYV12
v172 = v172.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v172 = v172.removeDirt
v172 = v172.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.5)
v172 = v172.UnsharpMask(strength=300, radius=3, threshold=1)
#return v172.histogram("levels").prefetch(6)
return v172.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v173 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v173f.avi").ConvertToYV24()
v173 = v173.AdjustColor(ou=8, ov=-6, lo_th=0.1, hi_th=0.1, sat=1.8, blu = 0.9, gam_mac=true)
v173 = v173.convertToYV12
v173 = v173.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v173 = v173.removeDirt
v173 = v173.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v173 = v173.UnsharpMask(strength=300, radius=3, threshold=1)
#return v173.histogram("levels").prefetch(6)
return v173.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v174 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v174f.avi").ConvertToYV24()
#174 v6 = v6.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v174 = v174.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.9, gam_mac=true)
v174 = v174.convertToYV12
v174 = v174.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v174 = v174.removeDirt
v174 = v174.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v174 = v174.UnsharpMask(strength=300, radius=3, threshold=1)
#return v174.histogram("levels").prefetch(6)
return v174.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v175 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v175f.avi").ConvertToYV24()
#175 v7 = v7.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v175 = v175.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.9, gam_mac=true)
v175 = v175.convertToYV12
v175 = v175.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v175 = v175.removeDirt
v175 = v175.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v175 = v175.UnsharpMask(strength=300, radius=3, threshold=1)
#return v175.histogram("levels").prefetch(6)
return v175.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v176 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v176f.avi").ConvertToYV24()
#176 v8 = v8.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v176 = v176.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.9, gam_mac=true)
v176 = v176.convertToYV12
v176 = v176.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v176 = v176.removeDirt
v176 = v176.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v176 = v176.UnsharpMask(strength=300, radius=3, threshold=1)
#return v176.histogram("levels").prefetch(6)
return v176.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v177 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v177f.avi").ConvertToYV24()
#177 v9 = v9.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v177 = v177.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.9, gam_mac=true)
v177 = v177.convertToYV12
v177 = v177.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v177 = v177.removeDirt
v177 = v177.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v177 = v177.UnsharpMask(strength=300, radius=3, threshold=1)
#return v177.histogram("levels").prefetch(6)
return v177.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v178 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v178f.avi").ConvertToYV24()
#178 v10 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v178 = v178.AdjustColor(ou=4, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.98, gam_mac=true)
v178 = v178.convertToYV12
v178 = v178.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v178 = v178.removeDirt
v178 = v178.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v178 = v178.UnsharpMask(strength=300, radius=3, threshold=1)
#return v178.histogram("levels").prefetch(6)
return v178.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#******

# 179

v179 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v179f.avi").ConvertToYV24()
#179 v11 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v179 = v179.AdjustColor(ou=4, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.98, gam_mac=true)
v179 = v179.convertToYV12
v179_0 = v179.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v179_1 = v179.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v179 = v179_0.trim(0, 150) + v179_1.trim(151, 0)
v179 = v179.removeDirt
v179 = v179.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v179 = v179.UnsharpMask(strength=300, radius=3, threshold=1)
#return v179.histogram("levels").prefetch(6)
return v179.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v180 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v180f.avi").ConvertToYV24()
#180 v12 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v180 = v180.AdjustColor(ou=6, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.98, gam_mac=true)
v180 = v180.convertToYV12
v180 = v180.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v180 = v180.removeDirt
v180 = v180.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v180 = v180.UnsharpMask(strength=300, radius=3, threshold=1)
#return v180.histogram("levels").prefetch(6)
return v180.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v181 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v181f.avi").ConvertToYV24()
#181 v13 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v181 = v181.AdjustColor(ou=8, ov=-6, lo_th=0.2, hi_th=0.2, sat=3, red = 0.98, blu = 1, gam_mac=true)
v181 = v181.convertToYV12
v181 = v181.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v181 = v181.removeDirt
v181 = v181.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.5)
v181 = v181.UnsharpMask(strength=300, radius=3, threshold=1)
#return v181.histogram("levels").prefetch(6)
return v181.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v182 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v182f.avi").ConvertToYV24()
#182 v14 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v182 = v182.AdjustColor(ou=8, ov=-6, lo_th=0.1, hi_th=0.1, sat=3, red = 0.98, blu = 1, gam_mac=true)
v182 = v182.convertToYV12
v182 = v182.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v182 = v182.removeDirt
v182 = v182.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.5)
v182 = v182.UnsharpMask(strength=300, radius=3, threshold=1)
#return v182.histogram("levels").prefetch(6)
return v182.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v183 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v183f.avi").ConvertToYV24()
#183 v15 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v183 = v183.AdjustColor(ou=8, ov=-6, lo_th=0.1, hi_th=0.1, sat=2.8, red = 0.98, blu = 1, gam_mac=true)
v183 = v183.convertToYV12
v183 = v183.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v183 = v183.removeDirt
v183 = v183.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v183 = v183.UnsharpMask(strength=300, radius=3, threshold=1)
#return v183.histogram("levels").prefetch(6)
return v183.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v184 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v184f.avi").ConvertToYV24()
#184 v16 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v184 = v184.AdjustColor(ou=6, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2.5, red = 0.98, blu = 1, gam_mac=true)
v184 = v184.convertToYV12
v184 = v184.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v184 = v184.removeDirt
v184 = v184.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v184 = v184.UnsharpMask(strength=300, radius=3, threshold=1)
#return v184.histogram("levels").prefetch(6)
return v184.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v185 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v185f.avi").ConvertToYV24()
#185 v17 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v185 = v185.AdjustColor(ou=6, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2.5, red = 0.98, blu = 1, gam_mac=true)
v185 = v185.convertToYV12
v185 = v185.Filter(th_SAD=180, th_SADC=180, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v185 = v185.removeDirt
v185 = v185.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v185 = v185.UnsharpMask(strength=300, radius=3, threshold=1)
#return v185.histogram("levels").prefetch(6)
return v185.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v186 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v186f.avi").ConvertToYV24()
#186 v18 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v186 = v186.AdjustColor(ou=6, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2.5, red = 0.98, blu = 1, gam_mac=true)
v186 = v186.convertToYV12
v186 = v186.Filter(th_SAD=150, th_SADC=150, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v186 = v186.removeDirt
v186 = v186.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v186 = v186.UnsharpMask(strength=300, radius=3, threshold=1)
#return v186.histogram("levels").prefetch(6)
return v186.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v187 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v187f.avi").ConvertToYV24()
#187 v19 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v187 = v187.AdjustColor(ou=16, ov=-6, x=10, lo_th=0.1, hi_th=0.1, sat=2.5, red = 0.98, blu = 1.02, gam_mac=true)
v187 = v187.convertToYV12
v187 = v187.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v187 = v187.removeDirt
v187 = v187.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v187 = v187.UnsharpMask(strength=300, radius=3, threshold=1)
#return v187.histogram("levels").prefetch(6)
return v187.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v188 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v188f.avi").ConvertToYV24()
#188 v20 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v188 = v188.AdjustColor(ou=12, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=3, red = 0.96, blu = 1.02, gam_mac=true)
v188 = v188.convertToYV12
v188 = v188.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v188 = v188.removeDirt
v188 = v188.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.5)
v188 = v188.UnsharpMask(strength=300, radius=5, threshold=1)
#return v188.histogram("levels").prefetch(6)
return v188.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v189 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v189f.avi").ConvertToYV24()
#189 v21 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v189 = v189.AdjustColor(ou=12, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2, red = 0.98, blu = 1, gam_mac=true)
v189 = v189.convertToYV12
v189 = v189.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v189 = v189.removeDirt
v189 = v189.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v189 = v189.UnsharpMask(strength=300, radius=5, threshold=1)
#return v189.histogram("levels").prefetch(6)
return v189.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v190 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v190f.avi").ConvertToYV24()
#190 v22 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v190 = v190.AdjustColor(ou=12, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2, red = 0.97, blu = 1, gam_mac=true)
v190 = v190.convertToYV12
v190 = v190.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v190 = v190.removeDirt
v190 = v190.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v190 = v190.UnsharpMask(strength=300, radius=5, threshold=1)
#return v190.histogram("levels").prefetch(6)
return v190.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v191 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v191f.avi").ConvertToYV24()
#191 v23 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v191 = v191.AdjustColor(ou=12, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2, red = 0.97, blu = 1.01, gam_mac=true)
v191 = v191.convertToYV12
v191 = v191.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v191 = v191.removeDirt
v191 = v191.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v191 = v191.UnsharpMask(strength=300, radius=5, threshold=1)
#return v191.histogram("levels").prefetch(6)
return v191.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v192 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v192f.avi").ConvertToYV24()
#192 v23 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v192 = v192.AdjustColor(ou=12, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2, red = 0.97, blu = 1, gam_mac=true)
v192 = v192.convertToYV12
v192 = v192.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v192 = v192.removeDirt
v192 = v192.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.1)
v192 = v192.UnsharpMask(strength=300, radius=5, threshold=1)
#return v192.histogram("levels").prefetch(6)
return v192.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#******

*/
function adjustBorders(clip c)
{
    return src.height == c.height && src.width == c.width ? c : c.addBorders(0, 0, src.width - c.width, src.height - c.height)
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
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)
#    dct = default(dct, 0)
    tr = default(tr, 9)
    RefineMotion = default(RefineMotion, true)
    contrasharp = default(contrasharp, true)
    truemotion = default(truemotion, true)

    c = filter16 ? c.convertBits(16) : c
#c = c.Spline64Resize(960, 720)
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, prefilter=prefilter, contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = sigma_y == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

#c = c.SincResize(1440, 1080)
    c = filter16 ? c.convertBits(8) : c

    return c
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
dh = src.height - input.height
dw = src.width - input.width
input = input.adjustBorders
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
#169 v1 = v1.AdjustColor(8, 0, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#170 v2 = v2.AdjustColor(8, -4, -32, 2, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#171 v3 = v3.AdjustColor(2, 0, 0, 1.5, red_mul = 0.94, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#172 v4 = v4.AdjustColor(6, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#173 v5 = v5.AdjustColor(6, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#174 v6 = v6.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#175 v7 = v7.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#176 v8 = v8.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#177 v9 = v9.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#178 v10 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#179 v11 = v11.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#180 v12 = v12.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#181 v13 = v13.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#182 v14 = v14.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#183 v15 = v15.AdjustColor(6, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#184 v16 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#185 v17 = v17.AdjustColor(6, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#186 v18 = v18.AdjustColor(6, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#187 v19 = v19.AdjustColor(6, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(6, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(6, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = v22.AdjustColor(6, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = v23.AdjustColor(6, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v24 = v24.AdjustColor(8, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
ConvertToYV12
Prefetch(6)
*/
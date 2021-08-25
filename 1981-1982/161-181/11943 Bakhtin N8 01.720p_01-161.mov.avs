SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\11943 Bakhtin N8 01.720p.mov")
assumefps(18)

crop(145,0,-175,-0)

# 4, 285, 295, 355, 440, 469, 509, 584, 634, 734, 814, 833, 886, 931, 979, 1020, 1126, 1176, 1193, 1340, 1482, 1570, 1615, 1697,
# 1739, 1790, 1876, 1913, 1991, 2157, 2222, 2290, 2330, 2365, 2457, 2497, 2569, 2623, 2686, 2757, 2814, 2895, 2969, 3030, 3078,
# 3158, 3214, 3239, 3545, 3639, 3778, 4185, 4394, 4562, 4743, 4875, 5011, 5141, 5501, 5676, 5905, 5970, 6476, 6739, 6753, 6859,
# 7001, 7120, 7188, 7326, 7438, 7585, 7701, 8043, 8253, 8373, 8655, 8839, 9074, 9082, 9171, 9296, 9472, 9681, 9772, 9989, 10196,
# 10302, 10475, 10622, 10704, 10794, 11030, 11295, 11388, 11399, 11656, 11857, 12054, 12266, 12442, 12547, 12783, 13047, 13218,
# 13418, 13501, 13543, 13630, 13713, 13755, 13803, 13877, 13888, 13941, 14109, 14259, 14372, 14483, 14557, 14622, 14702, 14775,
# 14843, 15064, 15122, 15126, 15148, 15175, 15209, 15258, 15289, 15354, 15485, 15536, 15708, 15813, 15921, 16019, 16123, 16142,
# 16172, 16212, 16243, 16292, 16313, 16327, 16342, 16371, 16417, 16445, 16668, 16761, 16880, 17218, 17515, 17622, 17765, 17966,
# 18070, 18115, 18253, 18354, 18423, 18512, 18582, 18670, 18762, 18944, 18997, 19269, 19437, 19516, 19856, 20132, 20248, 20447,
# 20532, 20780, 20871, 20966, 21069

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v160 = src.trim(18071, 18114).crop(0, 0, -12, 0)
v161 = src.trim(18115, 18252).crop(0, 0, -12, 0)
v162 = src.trim(18254, 18353).crop(0, 0, -12, 0)
v163 = src.trim(18354, 18422).crop(0, 0, -12, 0)
v164 = src.trim(18423, 18511).crop(0, 0, -12, 0)
v165 = src.trim(18513, 18581)#.crop(0, 0, -12, 0)
v166 = src.trim(18582, 18669)#.crop(0, 0, -12, 0)
v167 = src.trim(18670, 18761)#.crop(0, 0, -12, 0)
v168 = src.trim(18763, 18943)#.crop(0, 0, -12, 0)
v169 = src.trim(18945, 18996)#.crop(0, 0, -12, 0)
v170 = src.trim(18997, 19268)#.crop(0, 0, -12, 0)
v171 = src.trim(19269, 19436)#.crop(0, 0, -12, 0)
v172 = src.trim(19437, 19515).crop(0, 0, -16, 0)
v173 = src.trim(19516, 19855)#.crop(0, 0, -16, 0)
v174 = src.trim(19857, 20131).crop(0, 0, -12, 0)
v175 = src.trim(20132, 20247).crop(0, 0, -12, 0)
v176 = src.trim(20249, 20446)#.crop(0, 0, -12, 0)
v177 = src.trim(20448, 20530)#.crop(0, 0, -12, 0)
v178 = src.trim(20533, 20779).crop(0, 0, -12, 0)
v179 = src.trim(20781, 20870)#.crop(0, 0, -12, 0)
v180 = src.trim(20871, 20965)#.crop(0, 0, -12, 0)
v181 = src.trim(20966, 21068)#.crop(0, 0, -12, 0)
#return v181.autolevels(minRng=0, filterRadius=0, border_l=100)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

#******

# 161

/*
v161 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v161f.avi").ConvertToYV24()
br_w = 400
br_c = v161.width - br_w
br = v161.trim(89, 89).loop(v161.frameCount).crop(br_c, 0, 0, 0)
v161 = v161.stackHorizontal(br)
v161 = v161.AdjustColor(ou=8, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.2, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v161 = v161.crop(0, 0, -br_w, 0)
v161 = v161.colorYUV(off_u=-6, off_v=-6)
v161 = v161.autolevels(gamma=1.2, minRng=0)
v161 = v161.convertToYV12
v161 = v161.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v161 = v161.removeDirt
v161 = v161.UnsharpMask(strength=300, radius=3, threshold=1)
v161 = v161.adjustBorders
return v161.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v162 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v162f.avi").ConvertToYV24()
v162 = v162.AdjustColor(ou=8, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v162 = v162.colorYUV(off_u=-6, off_v=-6)
v162 = v162.autolevels(gamma=1.2, minRng=0)
v162 = v162.convertToYV12
v162 = v162.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v162 = v162.removeDirt
v162 = v162.UnsharpMask(strength=300, radius=3, threshold=1)
v162 = v162.adjustBorders
return v162.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v163 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v163f.avi").ConvertToYV24()
v163 = v163.AdjustColor(ou=8, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v163 = v163.colorYUV(off_u=-6, off_v=-6)
v163 = v163.autolevels(gamma=1.2, minRng=0)
v163 = v163.convertToYV12
v163 = v163.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v163 = v163.removeDirt
v163 = v163.UnsharpMask(strength=300, radius=3, threshold=1)
v163 = v163.adjustBorders
v163 = v163.trim(1, 0)
return v163.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v164 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v164f.avi").ConvertToYV24()
v164 = v164.AdjustColor(ou=8, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v164 = v164.colorYUV(off_u=-6, off_v=-6)
v164 = v164.autolevels(gamma=1.2, minRng=0)
v164 = v164.convertToYV12
v164 = v164.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v164 = v164.removeDirt
v164 = v164.UnsharpMask(strength=300, radius=3, threshold=1)
v164 = v164.adjustBorders
return v164.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v165 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v165f.avi").ConvertToYV24()
v165 = v165.AdjustColor(ou=8, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v165 = v165.colorYUV(off_u=-6, off_v=-6)
v165 = v165.autolevels(gamma=1.2, minRng=0)
v165 = v165.convertToYV12
v165 = v165.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v165 = v165.removeDirt
v165 = v165.UnsharpMask(strength=300, radius=3, threshold=1)
v165 = v165.adjustBorders
return v165.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v166 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v166f.avi").ConvertToYV24()
v166 = v166.AdjustColor(ou=8, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v166 = v166.colorYUV(off_u=-6, off_v=-6)
v166 = v166.autolevels(gamma=1.2, minRng=0)
v166 = v166.convertToYV12
v166 = v166.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v166 = v166.removeDirt
v166 = v166.UnsharpMask(strength=300, radius=3, threshold=1)
v166 = v166.adjustBorders
v166 = v166.trim(0, v166.frameCount - 4)
return v166.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v167 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v167f.avi").ConvertToYV24()
v167 = v167.AdjustColor(ou=8, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v167 = v167.colorYUV(off_u=-6, off_v=-6)
v167 = v167.autolevels(gamma=1.2, minRng=0)
v167 = v167.convertToYV12
v167 = v167.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v167 = v167.removeDirt
v167 = v167.UnsharpMask(strength=300, radius=3, threshold=1)
v167 = v167.adjustBorders
return v167.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v168 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v168f.avi").ConvertToYV24()
v168 = v168.AdjustColor(ou=8, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v168 = v168.colorYUV(off_u=-4, off_v=-4)
v168 = v168.autolevels(gamma=1.2, minRng=0)
v168 = v168.convertToYV12
v168 = v168.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v168 = v168.removeDirt
v168 = v168.UnsharpMask(strength=300, radius=3, threshold=1)
v168 = v168.adjustBorders
return v168.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v169 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v169f.avi").ConvertToYV24()
v169 = v169.AdjustColor(ou=8, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v169 = v169.colorYUV(off_u=-2, off_v=-2)
v169 = v169.autolevels(gamma=1.2, minRng=0)
v169 = v169.convertToYV12
v169 = v169.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v169 = v169.removeDirt
v169 = v169.UnsharpMask(strength=300, radius=3, threshold=1)
v169 = v169.adjustBorders
return v169.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v170 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v170f.avi").ConvertToYV24()
v170 = v170.trim(1, 0)
v170 = v170.AdjustColor(ou=2, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v170 = v170.colorYUV(off_u=-2, off_v=-2)
v170 = v170.autolevels(gamma=1.2, minRng=0)
v170 = v170.convertToYV12
v170 = v170.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v170 = v170.removeDirt
v170 = v170.UnsharpMask(strength=300, radius=3, threshold=1)
v170 = v170.adjustBorders
return v170.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v171 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v171f.avi").ConvertToYV24()
v171 = v171.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v171 = v171.colorYUV(off_u=-2, off_v=-2)
v171 = v171.autolevels(gamma=1.2, minRng=0)
v171 = v171.convertToYV12
v171 = v171.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v171 = v171.removeDirt
v171 = v171.UnsharpMask(strength=300, radius=3, threshold=1)
v171 = v171.adjustBorders
return v171.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v172 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v172f.avi").ConvertToYV24()
v172 = v172.AdjustColor(ou=-2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=false)
v172 = v172.colorYUV(off_u=-2, off_v=-2)
v172 = v172.autolevels(gamma=1.2, minRng=0, ignore_low=0, ignore_high=0)
v172 = v172.convertToYV12
v172 = v172.Filter(th_SAD=1200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v172 = v172.removeDirt
v172 = v172.UnsharpMask(strength=300, radius=3, threshold=1)
v172 = v172.adjustBorders
return v172.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v173 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v173f.avi").ConvertToYV24()
br_h = 100
br_c = v161.height - br_h
br = v173.trim(135, 135).loop(v173.frameCount).crop(0, 0, 0, -br_c)
v173 = br.stackVertical(v173)
v173 = v173.AdjustColor(ou=4, ov=-6, x=10, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v173 = v173.crop(0, br_h, 0, 0)
v173 = v173.colorYUV(off_u=-4, off_v=-4)
v173 = v173.autolevels(gamma=1.2, minRng=0)
v173 = v173.convertToYV12
v173 = v173.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v173 = v173.removeDirt
v173 = v173.UnsharpMask(strength=300, radius=3, threshold=1)
v173 = v173.adjustBorders
return v173.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v174 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v174f.avi").ConvertToYV24()
v174 = v174.AdjustColor(ou=4, ov=-6, x=10, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v174 = v174.colorYUV(off_u=-6, off_v=-4)
v174 = v174.autolevels(gamma=1.2, minRng=0)
v174 = v174.convertToYV12
v174 = v174.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v174 = v174.removeDirt
v174 = v174.UnsharpMask(strength=300, radius=3, threshold=1)
v174 = v174.adjustBorders
return v174.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v175 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v175f.avi").ConvertToYV24()
v175 = v175.AdjustColor(ou=4, ov=-6, x=10, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v175 = v175.colorYUV(off_u=-6, off_v=-4)
v175 = v175.autolevels(gamma=1.2, minRng=0)
v175 = v175.convertToYV12
v175 = v175.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v175 = v175.removeDirt
v175 = v175.UnsharpMask(strength=300, radius=3, threshold=1)
v175 = v175.adjustBorders
return v175.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v176 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v176f.avi").ConvertToYV24()
v176 = v176.AdjustColor(ou=4, ov=-6, x=10, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v176 = v176.colorYUV(off_u=-6, off_v=-4)
v176 = v176.autolevels(gamma=1.2, minRng=0)
v176 = v176.convertToYV12
v176 = v176.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v176 = v176.removeDirt
v176 = v176.UnsharpMask(strength=300, radius=3, threshold=1)
v176 = v176.adjustBorders
return v176.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v177 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v177f.avi").ConvertToYV24()
v177 = v177.AdjustColor(ou=4, ov=-6, x=400, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v177 = v177.colorYUV(off_u=-6, off_v=-4)
v177 = v177.autolevels(gamma=1.2, minRng=0)
v177 = v177.convertToYV12
v177 = v177.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v177 = v177.removeDirt
v177 = v177.UnsharpMask(strength=300, radius=3, threshold=1)
v177 = v177.adjustBorders
return v177.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v178 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v178f.avi").ConvertToYV24()
v178 = v178.AdjustColor(ou=14, ov=-10, x=400, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v178 = v178.colorYUV(off_u=-6, off_v=-4)
#v178 = v178.autolevels(gamma=1.2, minRng=0)
v178 = v178.convertToYV12
v178 = v178.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v178 = v178.removeDirt
v178 = v178.UnsharpMask(strength=300, radius=3, threshold=1)
v178 = v178.adjustBorders
return v178.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v179 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v179f.avi").ConvertToYV24()
v179 = v179.AdjustColor(ou=8, ov=-10, x=400, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v179 = v179.colorYUV(off_u=-4, off_v=-2)
v179 = v179.autolevels(gamma=1.2, minRng=0)
v179 = v179.convertToYV12
v179 = v179.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v179 = v179.removeDirt
v179 = v179.UnsharpMask(strength=300, radius=3, threshold=1)
v179 = v179.adjustBorders
return v179.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v180 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v180f.avi").ConvertToYV24()
v180 = v180.AdjustColor(ou=8, ov=-10, x=400, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v180 = v180.colorYUV(off_u=-4, off_v=-2)
v180 = v180.autolevels(gamma=1.2, minRng=0)
v180 = v180.convertToYV12
v180 = v180.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v180 = v180.removeDirt
v180 = v180.UnsharpMask(strength=300, radius=3, threshold=1)
v180 = v180.adjustBorders
return v180.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v181 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v181f.avi").ConvertToYV24()
v181 = v181.AdjustColor(ou=8, ov=-10, x=400, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v181 = v181.colorYUV(off_u=-4, off_v=-2)
v181 = v181.autolevels(gamma=1.2, minRng=0)
v181 = v181.convertToYV12
v181 = v181.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v181 = v181.removeDirt
v181 = v181.UnsharpMask(strength=300, radius=3, threshold=1)
v181 = v181.adjustBorders
return v181.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/

#******

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
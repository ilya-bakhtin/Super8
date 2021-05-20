SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("fft3dfilter", 2)
SetFilterMTMode("LSMASHVideoSource", 3)
SetFilterMTMode("LWLibavVideoSource", 3)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("Reverse", 3)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

src1 = LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02 cast 1.720p.mov")
src2 = LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02 cast 2.720p.mov")
last = src1 + src2
assumefps(18)

#crop(146,0,-190,-0)
crop(146,0,-224,-0)
#return last

# 196, 258, 326, 589, 685, 842, 955, 1065, 1285, 1357, 1494, 1554, 1675, 1796, 1917, 2107, 2183, 2242, 2284, 2354, 2376, 2424,
# 2489, 2515, 2576, 2850, 2982, 3046, 3231, 3276, 3435, 3620, 3815, 3996, 4049, 4062, 4103, 4150, 4180, 4257, 4475, 4604, 4766,
# 4906, 5007, 5104, 5292, 5359, 5516, 5556, 5652, 5686, 5766, 5773, 5891, 5995, 6152, 6218, 6283, 6464, 6831, 6840, 6940, 7173
# 7372, 7684, 7725, 7751, 7787, 7836, 7850, 8001, 8200, 8336, 8387, 8484, 8568, 8640, 8646, 8724, 8872, 9000, 9083, 9228, 9320,
# 9464, 9621, 9753, 10072, 10125, 10186, 10313, 10396, 10562, 10684, 10854, 10985, 11207, 11369, 11573, 11713, 11820, 11993,
# 12076, 12086, 12088, 12090, 12141, 12159, 12222, 12376, 12534, 12681, 12756, 12855, 12984, 13294, 13558, 13567, 13689, 13864,
# 14043, 14270, 14348, 14476, 14547, 14645, 14816, 14906, 15315, 15518, 15569, 15631, 15688, 15826, 16074, 16343, 16900, 17081,
# 17186, 17342, 17552, 17699, 18021, 18263, 18542, 18819, 18985, 19171, 19254, 19742, 19851, 19973, 20117, 20242, 20359, 20409,
# 20464, 20569, 20612, 20714, 20839, 20948, 21025, 21171, 21183, 21291, 21531, 21583

global src = last
#return last.ColorYUV(autogain=true)

#v112 = src.trim(14348, 14475)
v113 = src.trim(14481, 14545).crop(0,0,-8,0)#.autolevels(ignore_low=0.003, ignore_high=0.003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v114 = src.trim(14548, 14644).crop(0,0,-24,-32)
v115 = src.trim(14645, 14815).crop(0,0,-16,0)
v116 = src.trim(14816, 14905).crop(0,0,-16,0)
v117 = src.trim(14906, 15314).crop(0,0,-16,0)
v118 = src.trim(15315, 15517).crop(0,0,-24,0)
v119 = src.trim(15519, 15568).crop(0,0,-32,0)
v120 = src.trim(15570, 15630)
v120 = (v120.trim(0,25) + v120.trim(27, 0)).crop(0,0,-36,0)
v121 = src.trim(15633, 15687)
v121 = (v121.trim(0, 26) + v121.trim(28, 35) + v121.trim(37, 0)).crop(0,0,-32,0)
v122 = src.trim(15717, 15825).crop(0,0,-24,0)
v123 = src.trim(15827, 16073).crop(0,0,-24,-24)
#v124.0 = src.trim(16074, 16342)
v124 = src.trim(16344, 16899).crop(0,0,-24,0)
v125 = src.trim(16901, 17080).crop(0,0,-24,0)
v126 = src.trim(17081, 17185).crop(0,0,-24,0)
#v127.0 = src.trim(17186, 17341)
v127 = src.trim(17342, 17551).crop(0,0,-28,0)
v128 = src.trim(17552, 17698).crop(0,0,-24,0)
v129 = src.trim(17699, 18020).crop(0,0,-24,0)
v130 = src.trim(18021, 18262).crop(0,0,-16,0)
v131 = src.trim(18263, 18541).crop(0,0,-24,0)
v132 = src.trim(18542, 18818).crop(0,0,-24,-16)
v133 = src.trim(18819, 18984)
v133 = (v133.trim(0, 50) + v133.trim(52, 93) + v133.trim(95, 0)).crop(0,0,-24,0)
v134 = src.trim(18986, 19170)
v135 = src.trim(19171, 19253).crop(0,0,-24,0)
v136 = src.trim(19552, 19741).crop(0,0,-32,-16)
v137 = src.trim(19743, 19850).crop(0,0,-20,0)
v138 = src.trim(19851, 19972).crop(0,0,-16,-16)
v139 = src.trim(19973, 20116).crop(0,0,-16,-32)
v140 = src.trim(20160, 20241).crop(0,0,-16,-32)

#return v140.autolevels(minRng=0).\
#.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, sigma2=10, sigma3=10, sigma4=40, plane=4).\
#extractY.prefetch(6)
#return v144#.autolevels#.ColorYUV(autogain=true)

global filter16 = true

#v137 = v137#.tweak(cont = 1.5, coring = false)
#return v137#.histogram("levels")

v138 = v138.tweak(cont = 1.5, coring = false)
#v138 = v138.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
#v138 = v138.Filter_0
#v138 = v138.extractY.autolevels(filterRadius = 0, minRng=0)
#return v138#.histogram("levels")

v139 = v139.tweak(cont = 1.5, coring = false)
#v139 = v139.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
#v139 = v139.Filter_0
#v139 = v139.extractY.autolevels(filterRadius = 0, minRng=0)
return v139#.histogram("levels")

/*
v137 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-137.mov.avi").ConvertToYV24()
v138 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-138.mov.avi").ConvertToYV24()
v139 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-139.mov.avi").ConvertToYV24()
v140 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-140.mov.avi").ConvertToYV24()

#return v12.ExtractY.autolevels.prefetch(6)

#******

# 113

v113 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-113.mov.avi").ConvertToYV24()
v113 = v113.AdjustColor(ou=2, ov=-6, sat=2, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.8, blu=0.9, gam_mac=true)#.RemoveDirt
v113 = v113.autolevels(gamma=2, ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v113 = v113.convertToYV12
v113 = v113.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=24)
#v = v113.extractV
#return v113.extractU.stackhorizontal(v).prefetch(6)
return v113.prefetch(6)

v113 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v113.avi")#.ConvertToYV24()
v113 = v113.Filter(th_SAD=1000, th_SADC=000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=20, sigma_c=0)
v113 = v113.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v113 = v113.autolevels(autolevel=true, gamma=1.2, filterRadius = 0, minRng=0)#.autolevels(filterRadius = 0, minRng=0)
#v113 = v113.aWarpSharp2(thresh=128, blur=5, depth=24)
#v113 = v113.colorYUV(off_u = -8, off_v = -8)
#v = v113.extractV
#return v113.extractU.stackhorizontal(v).prefetch(6)
v113 = v113.adjustBorders
return v113.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v114 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-114.mov.avi").ConvertToYV24()
v114 = v114.autolevels(gamma=1.5, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
#v114 = v114.AdjustColor(ou=4, ov=-6, sat=2, red=1, blu=1, x=0, w=0)
v114 = v114.convertToYV12
v114 = v114.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=16)
#v = v114.extractV
#return v114.extractU.stackhorizontal(v).prefetch(6)
#return v114.histogram("levels").prefetch(6)
return v114.prefetch(6)

v114 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v114.avi")#.ConvertToYV24()
v114 = v114.Filter(th_SAD=1000, th_SADC=000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=1, sigma_c=0)
v114 = v114.AdjustColor(ou=4, ov=-6, sat=2.2, red=0.96, blu=0.88, x=0, w=0)
v114 = v114.ConvertToYV12.UnsharpMask(strength=300, radius=1, threshold=1)
v114 = v114.autolevels(autolevel=true, gamma=1.3, filterRadius = 0, minRng=0)#.autolevels(filterRadius = 0, minRng=0)
#return v114.histogram("levels").prefetch(6)
v114 = v114.adjustBorders
return v114.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v115 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-115.mov.avi").ConvertToYV24()
v115 = v115.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v115 = v115.convertToYV12
v115 = v115.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
#v = v115.extractV
#return v115.extractU.stackhorizontal(v).prefetch(6)
return v115.prefetch(6)

v115 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v115.avi")#.ConvertToYV24()
v115 = v115.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v115 = v115.AdjustColor(ou=11, ov=-11, sat=2, red=1, blu=0.92, lo_th=0.1, hi_th=0.2, gam_mac=true)
v115 = v115.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v115 = v115.adjustBorders
return v115.assumefps(12).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v116 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-116.mov.avi").ConvertToYV24()
v116 = v116.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v116 = v116.convertToYV12
v116 = v116.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
#v = v116.extractV
#return v116.extractU.stackhorizontal(v).prefetch(6)
return v116.prefetch(6)

v116 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v116.avi")#.ConvertToYV24()
v116 = v116.AdjustColor(ou=8, ov=-12, sat=2.2, red=1, blu=1, gam_mac=true)
v116 = v116.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=1, sigma_c=0)
v116 = v116.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v116 = v116.autolevels(autolevel=true, gamma=1.2, filterRadius = 0, minRng=0)
v116 = v116.colorYUV(off_u=2, off_v=-2)
#return v116.histogram("levels").prefetch(6)
v116 = v116.adjustBorders
return v116.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v117 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-117.mov.avi").ConvertToYV24()
#v117 = v117.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v117 = v117.convertToYV12
v117 = v117.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
#return v117.histogram("levels").prefetch(6)
#v = v117.extractV
#return v117.extractU.stackhorizontal(v).prefetch(6)
return v117.prefetch(6)

v117 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v117.avi")#.ConvertToYV24()
v117 = v117.AdjustColor(ou=8, ov=-6, sat=2, red=1, blu=1)
v117 = v117.removeDirt
v117 = v117.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v117 = v117.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v117 = v117.autolevels(autolevel=true, gamma=1.2, filterRadius = 0, minRng=0)
v117 = v117.tweak(sat=1.2, coring=false).colorYUV(off_u=-3)
#return v117.histogram("levels").prefetch(6)
v117 = v117.adjustBorders
return v117.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v118 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-118.mov.avi").ConvertToYV24()
v118 = v118.trim(0,100)
v118 = v118.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v118 = v118.convertToYV12
v118 = v118.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v118.prefetch(6)

v118 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v118.avi")#.ConvertToYV24()
v118 = v118.AdjustColor(ou=8, ov=-6, sat=2, red=1, blu=0.94)
v118 = v118.removeDirt
v118 = v118.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v118 = v118.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
#v118 = v118.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
#return v118.histogram("levels").prefetch(6)
v118 = v118.adjustBorders
return v118.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v119 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-119.mov.avi").ConvertToYV24()
v119 = v119.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v119 = v119.convertToYV12
v119 = v119.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v119.prefetch(6)

v119 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v119.avi")#.ConvertToYV24()
v119 = v119.AdjustColor(ou=8, ov=-10, sat=2.2, red=1, blu=0.9, gam_mac=true)
v119 = v119.removeDirt
v119 = v119.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v119 = v119.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v119 = v119.autolevels(gamma=1.2, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v119.histogram("levels").prefetch(6)
v119 = v119.adjustBorders
return v119.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v120 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-120.mov.avi").ConvertToYV24()
v120 = v120.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v120 = v120.convertToYV12
v120 = v120.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v120.prefetch(6)

v120 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v120.avi")#.ConvertToYV24()
v120 = v120.AdjustColor(ou=8, ov=-10, sat=2.5, red=1, blu=0.88, gam_mac=true)
v120 = v120.removeDirt
v120 = v120.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v120 = v120.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v120 = v120.autolevels(gamma=1.5, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v120.histogram("levels").prefetch(6)
v120 = v120.adjustBorders
return v120.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v121 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-121.mov.avi").ConvertToYV24()
v121 = v121.autolevels(gamma=1.3, ignore_low=0.000, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
v121 = v121.convertToYV12
v121 = v121.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v121.prefetch(6)

v121 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v121.avi")#.ConvertToYV24()
v121 = v121.AdjustColor(ou=8, ov=-10, sat=2.5, red=1, blu=0.85, gam_mac=true)
v121 = v121.removeDirt
v121 = v121.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=3, sigma_c=0)
v121 = v121.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v121 = v121.autolevels(gamma=1.2, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v121.histogram("levels").prefetch(6)
v121 = v121.adjustBorders
return v121.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v122 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-122.mov.avi").ConvertToYV24()
v122 = v122.autolevels(gamma=1.3, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v122 = v122.convertToYV12
v122 = v122.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v122.prefetch(6)

v122 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v122.avi")#.ConvertToYV24()
v122 = v122.AdjustColor(ou=8, ov=-10, sat=2.2, red=1, blu=0.92, gam_mac=true)
v122 = v122.removeDirt
v122 = v122.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v122 = v122.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v122 = v122.autolevels(gamma=1.2, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v122.histogram("levels").prefetch(6)
v122 = v122.adjustBorders
return v122.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v123 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-123.mov.avi").ConvertToYV24()
v123 = v123.crop(0,0,0,-4)
v123 = v123.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v123 = v123.convertToYV12
v123 = v123.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v123.prefetch(6)

v123 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v123.avi")#.ConvertToYV24()
v123 = v123.AdjustColor(ou=4, ov=-10, sat=2.5, lo_th=0.1, red=1, blu=1, gam_mac=true)
v123 = v123.colorYUV(off_u=2, off_v=-2)
#return v123.histogram("levels").prefetch(6)
v123 = v123.convertToYV12
v123 = v123.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v123 = v123.removeDirt
v123 = v123.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v123 = v123.autolevels(gamma=1, ignore_low=0.003, ignore_high=0.003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v123.histogram("levels").prefetch(6)
v123 = v123.adjustBorders
return v123.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

function v124_p1(clip c)
{
    c = c.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
    c = c.convertToYV12
    c = c.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                 truemotion=false, sigma_y=0, sigma_c=0)
    return c
}
v124 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-124.mov.avi").ConvertToYV24()
v124_0 = v124.trim(0, 42).crop(0,0,0,-70)
v124_1 = v124.trim(43, 223)
v124_2 = v124.trim(224, 243).crop(0,0,0,-64)
v124_3 = v124.trim(244, 0)
#v124 = v124.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v124 = v124_0.v124_p1.adjustBorders + v124_1.v124_p1.adjustBorders + v124_2.v124_p1.adjustBorders + v124_3.v124_p1.adjustBorders
return v124.prefetch(6)

v124 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v124.avi")#.ConvertToYV24()
v124_0 = v124.trim(0, 42).crop(0,0,0,-70)
v124_1 = v124.trim(43, 223)
v124_2 = v124.trim(224, 243).crop(0,0,0,-64)
v124_3 = v124.trim(244, 0)
function v124_p2(clip c, float "sigma_y")
{
    sigma_y = Default(sigma_y, 0)
    c = c.AdjustColor(ou=6, ov=-10, sat=2.5, red=1, blu=1, gam_mac=true)
    c = c.convertToYV12
    c = c.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=sigma_y, sigma_c=0)
    c = c.removeDirt
    c = c.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
    return c
}
v124 = v124_0.v124_p2(sigma_y=3).adjustBorders + v124_1.v124_p2(sigma_y=3).adjustBorders +\
       v124_2.v124_p2(sigma_y=3).adjustBorders + v124_3.v124_p2(sigma_y=0).adjustBorders
#return v124.histogram("levels").prefetch(6)
return v124.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-125.mov.avi").ConvertToYV24()
v125 = v125.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v125 = v125.convertToYV12
v125 = v125.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v125.prefetch(6)

v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v125.avi")#.ConvertToYV24()
v125 = v125.AdjustColor(ou=6, ov=-10, sat=2.5, lo_th=0.2, hi_th=0.3, red=1, blu=1, gam_mac=true)
#v125 = v125.colorYUV(off_u=6, off_v=-6)
v125 = v125.convertToYV12
v125 = v125.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v125 = v125.removeDirt
v125 = v125.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v125 = v125.autolevels(gamma=1.1, ignore_low=0.003, ignore_high=0.003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v125.histogram("levels").prefetch(6)
v125 = v125.adjustBorders
return v125.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v126 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-126.mov.avi").ConvertToYV24()
v126 = v126.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v126 = v126.convertToYV12
v126 = v126.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v126.prefetch(6)

v126 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v126.avi")#.ConvertToYV24()
v126 = v126.AdjustColor(ou=6, ov=-10, sat=2.2, lo_th=0, hi_th=0.2, red=1, blu=1, gam_mac=true)
v126 = v126.convertToYV12
v126 = v126.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v126 = v126.removeDirt
v126 = v126.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v126 = v126.autolevels(gamma=1, ignore_low=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v126.histogram("levels").prefetch(6)
v126 = v126.adjustBorders
return v126.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v127 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-127.mov.avi").ConvertToYV24()
v127 = v127.autolevels(gamma=1, ignore_low=0.000, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v127 = v127.convertToYV12
v127 = v127.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v127.prefetch(6)

v127 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v127.avi")#.ConvertToYV24()
v127 = v127.AdjustColor(ou=6, ov=-10, sat=2, lo_th=0.2, hi_th=0.2, red=1, blu=1, gam_mac=true)
v127 = v127.colorYUV(off_u=-6, off_v=2)
v127 = v127.convertToYV12
v127 = v127.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=3, sigma_c=0)
v127 = v127.removeDirt
v127 = v127.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v127 = v127.autolevels(gamma=1.5, ignore_low=0.0003, ignore_high=0.003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v127.histogram("levels").prefetch(6)
v127 = v127.adjustBorders
return v127.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v128 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-128.mov.avi").ConvertToYV24()
#v128 = v128.autolevels(gamma=1, ignore_low=0.000, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v128 = v128.ColorYUV(gain_y=64)
#v128 = v128.Filter_0
#v128 = v128.convertToYV12
#v128 = v128.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
#                   truemotion=true, sigma_y=0, sigma_c=0)
#v128 = v128.AdjustColor(ou=4, ov=-6, sat=2.5, lo_th=0.2, hi_th=0.2, red=1, blu=0.9, gam_mac=true)
#AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=0.9)
#v128 = v128.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0)
#v128 = v128.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0)
#v128 = v128.autolevels(ignore=0.0001, gamma=1.5)
v128 = v128.convertToYV12
v128 = v128.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=true, sigma_y=0, sigma_c=0)
return v128.prefetch(6)

v128 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v128.avi")#.ConvertToYV24()
v128 = v128.AdjustColor(ou=4, ov=-6, sat=2.5, lo_th=0.2, hi_th=0.2, red=1, blu=0.96, gam_mac=true)
#v128 = v128.colorYUV(off_u=-6, off_v=2)
v128 = v128.convertToYV12
v128 = v128.Filter(th_SAD=00, th_SADC=00, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=6, sigma_c=12)
v128 = v128.removeDirt
#v128 = v128.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v128 = v128.autolevels(gamma=1.5, ignore_low=0.0001, ignore_high=0.0001, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v128.histogram("levels").prefetch(6)
v128 = v128.adjustBorders
return v128.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v129 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-129.mov.avi").ConvertToYV24()
v129 = v129.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v129 = v129.convertToYV12
v129 = v129.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v129.prefetch(6)

v129 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v129.avi")#.ConvertToYV24()
v129 = v129.AdjustColor(ou=4, ov=-6, sat=2.5, lo_th=0.2, red=1, blu=0.9)
v129 = v129.convertToYV12
v129 = v129.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v129 = v129.removeDirt
v129 = v129.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v129 = v129.autolevels(gamma=1.3, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v129.histogram("levels").prefetch(6)
v129 = v129.adjustBorders
return v129.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v130 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-130.mov.avi").ConvertToYV24()
v130 = v130.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v130 = v130.convertToYV12
v130 = v130.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v130.prefetch(6)

v130 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v130.avi")#.ConvertToYV24()
v130 = v130.AdjustColor(ou=6, ov=-16, lo_th=0.2, hi_th=0.2, sat=2.2, red=1, blu=0.9, gam_mac=true)
v130 = v130.convertToYV12
v130 = v130.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v130 = v130.removeDirt
v130 = v130.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v130 = v130.autolevels(gamma=1.3, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v130.histogram("levels").prefetch(6)
v130 = v130.adjustBorders
return v130.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
function v131_p1(clip c)
{
    c = c.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
    c = c.convertToYV12
#    c = c.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
#                 truemotion=false, sigma_y=0, sigma_c=6)
    return c
}
v131 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-131.mov.avi").ConvertToYV24()
v131_0 = v131.trim(0, 202)
v131_1 = v131.trim(204, 209).crop(0,0,0,-10)
v131_2 = v131.trim(210, 238)
v131_3 = v131.trim(239, 264).crop(0,0,0,-24)
v131_4 = v131.trim(265, 0)
v131 = v131_0.v131_p1.adjustBorders + v131_1.v131_p1.adjustBorders +\
       v131_2.v131_p1.adjustBorders + v131_3.v131_p1.adjustBorders + v131_4.v131_p1.adjustBorders
v131 = v131.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=6)
return v131.prefetch(6)
/*
function v131_p2(clip c, float "sigma_y")
{
    sigma_y = Default(sigma_y, 0)
    c = c.AdjustColor(ou=8, ov=-12, lo_th=0.2, hi_th=0.2, lock_chan=1, sat=2.2, red=1, grn=0.96, blu=0.9, gam_mac=true)
    c = c.colorYUV(off_u=-2)
    return c
}
function v131_p3(clip c, float "sigma_y")
{
    c = c.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
    c = c.autolevels(gamma=1.4, ignore_low=0.03, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
    return c
}
v131 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v131.avi")#.ConvertToYV24()
v131 = v131.trim(0, 202) + v131.trim(202, -1) + v131.trim(203, 0)
v131_0 = v131.trim(0, 202)
v131_1 = v131.trim(204, 209).crop(0,0,0,-10)
v131_2 = v131.trim(210, 238)
v131_3 = v131.trim(239, 264).crop(0,0,0,-24)
v131_4 = v131.trim(265, 0)
v131 = v131_0.v131_p2.adjustBorders + v131_1.v131_p2.adjustBorders +\
       v131_2.v131_p2.adjustBorders + v131_3.v131_p2.adjustBorders + v131_4.v131_p2.adjustBorders
v131 = v131.convertToYV12
v131 = v131.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v131 = v131.removeDirt
v131 = v131.trim(0, 202) + v131.trim(202, -1) + v131.trim(203, 0)
v131_0 = v131.trim(0, 202)
v131_1 = v131.trim(204, 209).crop(0,0,0,-10)
v131_2 = v131.trim(210, 238)
v131_3 = v131.trim(239, 264).crop(0,0,0,-24)
v131_4 = v131.trim(265, 0)
v131 = v131_0.v131_p3.adjustBorders + v131_1.v131_p3.adjustBorders +\
       v131_2.v131_p3.adjustBorders + v131_3.v131_p3.adjustBorders + v131_4.v131_p3.adjustBorders
#return v131.histogram("levels").prefetch(6)
return v131.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v132 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-132.mov.avi")
#v132 = v132.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v132 = v132.convertToYV12
v132 = v132.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v132.prefetch(6)

v132 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v132.avi")#.ConvertToYV24()
v132 = v132.AdjustColor(ou=6, ov=-10, sat=2.5, red=1, blu=0.9, gam_mac=true)
#v132 = v132.colorYUV(off_u=-5, off_v=-10)
v132 = v132.convertToYV12
v132 = v132.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v132 = v132.removeDirt
v132 = v132.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v132 = v132.autolevels(gamma=1.3, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v132.histogram("levels").prefetch(6)
v132 = v132.adjustBorders
return v132.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v133 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-133.mov.avi").ConvertToYV24()
v133 = v133.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v133 = v133.convertToYV12
v133 = v133.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v133.prefetch(6)

v133 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v133.avi")#.ConvertToYV24()
v133 = v133.AdjustColor(ou=10, ov=-14, sat=2.5, red=1.2, blu=0.9, gam_mac=true)
v133 = v133.convertToYV12
v133 = v133.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v133 = v133.removeDirt
v133 = v133.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v133 = v133.autolevels(gamma=1.2, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v133.histogram("levels").prefetch(6)
v133 = v133.adjustBorders
return v133.assumefps(18).AdjustFrameRate(preset_p = "slowest").trim(0, 65).prefetch(12)

v134 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-134.mov.avi").ConvertToYV24()
v134 = v134.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v134 = v134.convertToYV12
v134 = v134.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=6)
return v134.prefetch(6)

v134 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v134.avi")#.ConvertToYV24()
v134 = v134.AdjustColor(ou=4, ov=-8, sat=2, lo_th=0.2, hi_th=0.2, red=1, blu=0.9, gam_mac=true)
v134 = v134.convertToYV12
v134 = v134.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v134 = v134.removeDirt
v134 = v134.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v134 = v134.autolevels(gamma=1.4, ignore_low=0.03, ignore_high=0.03, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v134.histogram("levels").prefetch(6)
v134 = v134.adjustBorders
return v134.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v135 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-135.mov.avi").ConvertToYV24()
v135 = v135.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v135 = v135.convertToYV12
v135 = v135.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=6)
return v135.prefetch(6)

v135 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v135.avi")#.ConvertToYV24()
v135 = v135.AdjustColor(ou=4, ov=-8, sat=2, lo_th=0.2, hi_th=0.2, red=1, blu=0.9, gam_mac=true)
v135 = v135.convertToYV12
v135 = v135.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v135 = v135.removeDirt
v135 = v135.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v135 = v135.autolevels(gamma=1.4, ignore_low=0.03, ignore_high=0.03, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v135.histogram("levels").prefetch(6)
v135 = v135.adjustBorders
return v135.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v136 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-136.mov.avi").ConvertToYV24()
v136 = v136.autolevels(gamma=1, ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 10, minRng=0, autolevel=true)
v136 = v136.convertToYV12
v136 = v136.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=6)
return v136.prefetch(6)

v136 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\v136.avi")#.ConvertToYV24()
v136 = v136.AdjustColor(ou=6, ov=-14, sat=2, lo_th=0.1, hi_th=0.1, red=0.94, blu=1, gam_mac=true)
v136 = v136.convertToYV12
v136 = v136.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v136 = v136.removeDirt
v136 = v136.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v136 = v136.autolevels(gamma=1, ignore_low=0.003, ignore_high=0.003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v136.histogram("levels").prefetch(6)
v136 = v136.adjustBorders
return v136.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#******

*/

function merge16(clip c, frame)
{
m0 = c.trim(frame+0,-1).merge(c.trim(frame+1,-1))
m1 = c.trim(frame+2,-1).merge(c.trim(frame+3,-1))
m2 = c.trim(frame+4,-1).merge(c.trim(frame+5,-1))
m3 = c.trim(frame+6,-1).merge(c.trim(frame+7,-1))
m4 = c.trim(frame+8,-1).merge(c.trim(frame+9,-1))
m5 = c.trim(frame+10,-1).merge(c.trim(frame+11,-1))
m6 = c.trim(frame+12,-1).merge(c.trim(frame+13,-1))
m7 = c.trim(frame+14,-1).merge(c.trim(frame+15,-1))
m01 = m0.merge(m1)
m23 = m2.merge(m3)
m45 = m4.merge(m5)
m67 = m6.merge(m7)
m0123 = m01.merge(m23)
m4567 = m45.merge(m67)
return m0123.merge(m4567).autolevels()
}

function adjustBorders(clip c, int "w")
{
    w = Default(w, src.width)
    return src.height == c.height && w == c.width ? c : c.addBorders(0, 0, w - c.width, src.height - c.height)
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
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=4000)
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c", int "dct", int "tr", bool "RefineMotion", bool "contrasharp",\
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion")
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

dh = src.height - c.height
dw = 912 - c.width
c = c.adjustBorders(w = 912)

    c = filter16 ? c.convertBits(16) : c
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, prefilter=2, contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = sigma_y == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

    c = filter16 ? c.convertBits(8) : c

c = c.crop(0,0,-dw,-dh)

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
dw = 912 - input.width
input = input.adjustBorders(w = 912)
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
v144 = v144.ColorYUV(gain_y=128).AdjustColor(1, -7, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,64)
return v144.Prefetch(6)


v113 = v113.AdjustColor(2, -6, 0, 2, red_mul=0.8, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,8,0)

v114 = v114.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 3, red_mul=0.96, blu_mul=0.88).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,32)

v115 = v115.ColorYUV(gain_y=64).AdjustColor(8, -6, 0, 2, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.2).\
      assumefps(12).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

v116 = v116.ColorYUV(gain_y=64).AdjustColor(6, -8, 0, 2.2, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

last = v113+v114+v115+v116
ConvertToYV12()
return Prefetch(6)


v117 = v117.AdjustColor(8, -6, 0, 2, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

v118 = v118.trim(0,100).ColorYUV(gain_y=128).AdjustColor(8, -6, 0, 2.5, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v119 = v119.ColorYUV(gain_y=128).AdjustColor(8, -6, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,32,0)

v120 = v120.ColorYUV(gain_y=256).AdjustColor(8, -6, 0, 3, red_mul=1, blu_mul=0.88).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,36,0)

last = v117+v118+v119+v120
ConvertToYV12()
return Prefetch(6)


v121 = v121.ColorYUV(gain_y=256).AdjustColor(8, -6, 0, 3, red_mul=1, blu_mul=0.88).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,32,0)

v122 = v122.ColorYUV(gain_y=128).AdjustColor(8, -6, 0, 2.5, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v123 = v123.crop(0,0,0,-4).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=0.98).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels().\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,28)

v124_0 = v124.trim(0, 42).crop(0,0,0,-70)
v124_1 = v124.trim(43, 223)
v124_2 = v124.trim(224, 243).crop(0,0,0,-64)
v124_3= v124.trim(244, 0)

v124_0 = v124_0.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.2)
v124_1 = v124_1.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.2)
v124_2 = v124_2.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.2)
v124_3 = v124_3.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.2)

v124 = v124_0.AddBorders(0,0,0,70) + v124_1 + v124_2.AddBorders(0,0,0,64) + v124_3

v124 = v124.assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

last = v121+v122+v123+v124
ConvertToYV12()
return Prefetch(6)


v125 = v125.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v126 = v126.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(ignore=0.0001, gamma=1.2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v127 = v127.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.0001, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,28,0)

v128 = v128.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.0001, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

last = v125+v126+v127+v128
ConvertToYV12()
return Prefetch(6)


v129 = v129.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v130 = v130.ColorYUV(gain_y=64).AdjustColor(4, -8, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

v131_0 = v131.trim(0, 202)
v131_1 = v131.trim(204, 209).crop(0,0,0,-10)
v131_2 = v131.trim(210, 238)
v131_3 = v131.trim(239, 264).crop(0,0,0,-24)
v131_4 = v131.trim(265, 0)

v131_0 = v131_0.ColorYUV(gain_y=64).AdjustColor(4, -8, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5)

v131_1 = v131_1.ColorYUV(gain_y=64).AdjustColor(4, -8, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5)

v131_2 = v131_2.ColorYUV(gain_y=64).AdjustColor(4, -8, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5)

v131_3 = v131_3.ColorYUV(gain_y=64).AdjustColor(4, -8, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5)

v131_4 = v131_4.ColorYUV(gain_y=64).AdjustColor(4, -8, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5)

v131 = v131_0 + v131_1.AddBorders(0,0,0,10) + v131_2 + v131_3.AddBorders(0,0,0,24) + v131_4
v131 = v131.assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v132 = v132.ColorYUV(gain_y=64).AdjustColor(4, -6, 0, 2.5, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,16)

last = v129+v130+v131+v132
ConvertToYV12()
return Prefetch(6)


v133 = v133.ColorYUV(gain_y=64).AdjustColor(6, -10, 0, 2.5, red_mul=1.2, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)
v133 = v133.trim(0, 65)

v134 = v134.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,24,0)

v135 = v135.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=1, blu_mul=0.9).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v136 = v136.ColorYUV(gain_y=256).AdjustColor(2, -6, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5).\
      assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,32,16)

last = v133+v134+v135+v136
ConvertToYV12()
return Prefetch(6)


v137 = v137.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.92, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,20,0)

v138 = v138.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,16)

v139 = v139.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.9, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,32)

v140 = v140.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.9, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,32)

last = v137+v138+v139+v140
ConvertToYV12()
return Prefetch(6)
*/

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
assumefps(18)

trim(1, 21373)

crop(240, 0, -240, 0)

Spline64resize(960, 720)
src = last

#return last

# 59, 214, 251, 291, 389, 484, 571, 623, 668, 777, 985, 1139, 1189, 1236, 1459, 1538, 1781, 2018, 2075, 2311, 2361, 2476,
# 2751, 2803, 2882, 3086, 3191, 3227, 3362, 3447, 3702, 3736, 3920, 4143, 4195, 4381, 4623, 4701, 4738, 5017, 5075, 5284,
# 5378, 5586, 5722, 5846, 6151, 6320, 6501, 6582, 6703, 6797, 6806, 6910, 6992, 7165, 7378, 7556, 7673, 7818, 8043, 8186,
# 8364, 8482, 8646, 8841, 9019, 9217, 9419, 9663, 9988, 10219, 10408, 10606, 10614, 10814, 10886, 11185, 11354, 11423,
# 11674, 11750, 11843, 11965, 12197, 12282, 12511, 12691, 12751, 12894, 13008, 13157, 13349, 13528, 13622, 13683, 13801, 14126,
# 14360, 14448, 14511, 14626, 14789, 14959, 15100, 15381, 15523, 15641, 15925, 16109, 16294, 16598, 16765, 16777, 16795,
# 16920, 17110, 17214, 17307, 17393, 17483, 17616, 17689, 17829, 17939, 18162, 18169, 18450, 18471, 18698, 18769, 18850,
# 18938, 18985, 18995, 19101, 19375, 19510, 19608, 19715, 19904, 19921, 20008, 20128, 20161, 20230, 20311, 20493, 20597,
# 20685, 20760, 20810, 20923, 20932, 21001, 21230, 21325, 21373

#v099 = src.trim(14960, 15099).autolevels(ignore=0.0003, filterRadius = 0)
v100 = src.trim(15100, 15380).autolevels(ignore=0.0003, filterRadius = 0)
v101 = src.trim(15382, 15522).autolevels(ignore=0.0003, filterRadius = 0)
v102 = src.trim(15523, 15640).autolevels(ignore=0.0003, filterRadius = 0)
v103 = src.trim(15642, 15924).autolevels(ignore=0.0003, filterRadius = 0)
v104 = src.trim(15925, 16108).autolevels(ignore=0.0003, filterRadius = 0)
v105 = src.trim(16109, 16292).autolevels(ignore=0.0003, filterRadius = 0)
v106 = src.trim(16295, 16597).autolevels(ignore=0.0003, filterRadius = 0)
v107 = src.trim(16598, 16764).autolevels(ignore=0.0003, filterRadius = 0)
#v108 = src.trim(16765, 16776).autolevels(ignore=0.0003, filterRadius = 0)
#v108 = src.trim(16777, 16794).autolevels(ignore=0.0003, filterRadius = 0)
v108 = src.trim(16795, 16919).autolevels(ignore=0.0003, filterRadius = 0)
v109 = src.trim(16920, 17109).autolevels(ignore=0.0003, filterRadius = 0)
v110 = src.trim(17110, 17213).autolevels(ignore=0.0003, filterRadius = 0)
v111 = src.trim(17215, 17306).autolevels(ignore=0.0003, filterRadius = 0)
v112 = src.trim(17307 ,17392).autolevels(ignore=0.0003, filterRadius = 0)
v113 = src.trim(17393, 17482).autolevels(ignore=0.0003, filterRadius = 0)
v114 = src.trim(17483, 17615).autolevels(ignore=0.0003, filterRadius = 0)
v115 = src.trim(17616, 17688).autolevels(ignore=0.0003, filterRadius = 0)
v116 = src.trim(17689, 17828).autolevels(ignore=0.0003, filterRadius = 0)
v117 = src.trim(17829, 17938).autolevels(ignore=0.0003, filterRadius = 0)
v118 = src.trim(17939, 18161).autolevels(ignore=0.0003, filterRadius = 0)
#v119 = src.trim(18162, 18168).autolevels(ignore=0.0003, filterRadius = 0)
v119 = src.trim(18169, 18449).autolevels(ignore=0.0003, filterRadius = 0)
v120 = src.trim(18450, 18470).autolevels(ignore=0.0003, filterRadius = 0)
v121 = src.trim(18471, 18697).autolevels(ignore=0.0003, filterRadius = 0)
v122 = src.trim(18698, 18768).autolevels(ignore=0.0003, filterRadius = 0)
v123 = src.trim(18769, 18848).autolevels(ignore=0.0003, filterRadius = 0)
v124 = src.trim(18850, 18937).autolevels(ignore=0.0003, border_l=250, filterRadius = 0)
v125 = src.trim(18938, 18984).autolevels(ignore=0.0003, filterRadius = 0)
v126 = src.trim(18985, 18994).autolevels(ignore=0.0003, filterRadius = 0)
v127 = src.trim(18995, 19100).autolevels(ignore=0.0003, filterRadius = 0)
#v128 = src.trim(19101, 19374).autolevels(ignore_low=0.00003, ignore_high=0.0003, border_l=250, filterRadius = 0)
v128 = src.trim(19101, 19201).autolevels(ignore_low=0.00003, ignore_high=0.0003, border_l=250, filterRadius = 0)
v129 = src.trim(19202, 19274).autolevels(ignore_low=0.00003, ignore_high=0.0003, border_l=250, filterRadius = 0)
v130 = src.trim(19275, 19374).autolevels(ignore=0.0003, filterRadius = 0)
v131 = src.trim(19377, 19509).autolevels(ignore=0.0003, filterRadius = 0)
v132 = src.trim(19510, 19607).autolevels(ignore=0.0003, filterRadius = 0)
#return v132.histogram("levels")

#v099 = v099.Filter(th_SAD = 1200, th_SADC=1200)
/*
v100 = v100.Filter
v101 = v101.Filter
v102 = v102.Filter
v103 = v103.Filter
v104 = v104.Filter
v105 = v105.Filter
v106 = v106.Filter
v107 = v107.Filter
*/
v108 = v108.Filter
/*
v109 = v109.Filter
v110 = v110.Filter
v111 = v111.Filter
v112 = v112.Filter
v113 = v113.Filter
v114 = v114.Filter
*/
v115 = v115.Filter
/*
v116 = v116.Filter
v117 = v117.Filter
v118 = v118.Filter
v119 = v119.Filter
v120 = v120.Filter
v121 = v121.Filter
v122 = v122.Filter
v123 = v123.Filter
v124 = v124.Filter(th_SAD = 1200, th_SADC=1200)
v125 = v125.Filter(th_SAD = 1200, th_SADC=1200)
v126 = v126.Filter(th_SAD = 1200, th_SADC=1200)
v127 = v127.Filter(th_SAD = 1200, th_SADC=1200)
v128 = v128.Filter(th_SAD = 1200, th_SADC=1200)
*/
v129 = v129.Filter(th_SAD = 1200, th_SADC=1200)
/*
v130 = v130.Filter(th_SAD = 1200, th_SADC=1200)
v131 = v131.Filter(th_SAD = 1200, th_SADC=1200)
v132 = v132.Filter(th_SAD = 1200, th_SADC=1200)
*/
#return v132.prefetch(6)

v100 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_004_100.avi").ConvertToYV24()
v101 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_101.avi").ConvertToYV24()
v101 = v101.trim(1, 0)
v102 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_102.avi").ConvertToYV24()
v102 = v102.trim(1, 0)
v103 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_103.avi").ConvertToYV24()
v104 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_104.avi").ConvertToYV24()
v105 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_105.avi").ConvertToYV24()
v105 = v105.trim(1, 0)
v106 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_106.avi").ConvertToYV24()
v107 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_107.avi").ConvertToYV24()
# v108 as is
v109 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_109.avi").ConvertToYV24()
v110 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_110.avi").ConvertToYV24()
v111 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_111.avi").ConvertToYV24()
v112 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_112.avi").ConvertToYV24()
v113 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_113.avi").ConvertToYV24()
v114 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_114.avi").ConvertToYV24()
# v115 as is
v116 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_116.avi").ConvertToYV24()
v117 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_117.avi").ConvertToYV24()
v118 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_118.avi").ConvertToYV24()
v119 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_119.avi").ConvertToYV24()
v120 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_120.avi").ConvertToYV24()
v121 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_121.avi").ConvertToYV24()
v122 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_122.avi").ConvertToYV24()
v123 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_123.avi").ConvertToYV24()
v124 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_124.avi").ConvertToYV24()
v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_125.avi").ConvertToYV24()
v126 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_126.avi").ConvertToYV24()
v127 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_127.avi").ConvertToYV24()
v128 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_128.avi").ConvertToYV24()
# v129 as is
v130 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_130.avi").ConvertToYV24()
v131 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_131.avi").ConvertToYV24()
v132 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_100\1983_720_132.avi").ConvertToYV24()

v100 = v100.AdjustColor(ou=10, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v100 = v100.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.2).AdjustFrameRate(preset_p = "slowest")

v101 = v101.AdjustColor(ou=17, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v101 = v101.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v102 = v102.AdjustColor(ou=17, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v102 = v102.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v103 = v103.AdjustColor(ou=17, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=0.95, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v103 = v103.RemoveDirt.assumefps(18).autogamma(ignore=0.0002).AdjustFrameRate(preset_p = "slowest")

v104 = v104.AdjustColor(ou=12, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1.02, grn=1, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v104 = v104.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.2).AdjustFrameRate(preset_p = "slowest")

v105 = v105.AdjustColor(ou=12, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v105 = v105.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v106 = v106.AdjustColor(ou=12, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=200, red=1, grn=0.95, blu=0.95, gam_mac=true).tweak(sat=1.8, coring=false)
v106 = v106.RemoveDirt.assumefps(18).autogamma(ignore=0.0002).AdjustFrameRate(preset_p = "slowest")

v107 = v107.AdjustColor(ou=12, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=400, red=1, grn=1, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v107 = v107.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v108 = v108.AdjustColor(ou=17, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=480, red=1, grn=1, blu=0.95, gam_mac=true).tweak(sat=2, coring=false)
v108 = v108.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v109 = v109.AdjustColor(ou=7, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v109 = v109.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v110 = v110.AdjustColor(ou=17, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1.04, grn=1, blu=0.92, gam_mac=true).tweak(sat=2, coring=false)
v110 = v110.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v111 = v111.AdjustColor(ou=17, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=0.92, gam_mac=true).tweak(sat=2, coring=false)
v111 = v111.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v112 = v112.AdjustColor(ou=15, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=0.92, gam_mac=true).tweak(sat=2, coring=false)
v112 = v112.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v113 = v113.AdjustColor(ou=10, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v113 = v113.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v114 = v114.AdjustColor(ou=10, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=0.92, gam_mac=true).tweak(sat=2, coring=false)
v114 = v114.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v115 = v115.AdjustColor(ou=17, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=0.92, gam_mac=true).tweak(sat=2, coring=false)
v115 = v115.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v116 = v116.AdjustColor(ou=17, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v116 = v116.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v117 = v117.AdjustColor(ou=22, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=0.92, gam_mac=true).tweak(sat=2, coring=false)
v117 = v117.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v118 = v118.AdjustColor(ou=22, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=0.9, gam_mac=true).tweak(sat=2, coring=false)
v118 = v118.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v119 = v119.AdjustColor(ou=17, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=0.95, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v119 = v119.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v120 = v120.AdjustColor(ou=17, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=150, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v120 = v120.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v121 = v121.AdjustColor(ou=17, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=350, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v121 = v121.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v122 = v122.AdjustColor(ou=25, ov=-14, lo_th=0.1, hi_th=0.1, lock_chan=0, x=350, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v122 = v122.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v123 = v123.AdjustColor(ou=25, ov=-14, lo_th=0.1, hi_th=0.1, lock_chan=0, x=350, red=1, grn=1, blu=0.9, gam_mac=true).tweak(sat=2, coring=false)
v123 = v123.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v124 = v124.AdjustColor(ou=20, ov=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, x=350, red=0.96, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v124 = v124.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.5).AdjustFrameRate(preset_p = "slowest")

v125 = v125.AdjustColor(ou=20, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=10, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v125 = v125.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.5).AdjustFrameRate(preset_p = "slowest")

v126 = v126.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v126 = v126.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.8).AdjustFrameRate(preset_p = "slowest")

v127 = v127.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=0.96, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v127 = v127.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.8).AdjustFrameRate(preset_p = "slowest")

v128 = v128.AdjustColor(ou=15, ov=-2, lo_th=0.0, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=0.96, gam_mac=true).tweak(sat=1.5, coring=false)
v128 = v128.RemoveDirt.assumefps(18).autolevels(ignore = 0.0002, border_l = 150, gamma = 1.8).AdjustFrameRate(preset_p = "slowest")

v129 = v129.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=0.96, gam_mac=true).tweak(sat=2, coring=false)
v129 = v129.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v130 = v130.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v130 = v130.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v131 = v131.AdjustColor(ou=15, ov=-2, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=0.94, gam_mac=true).tweak(sat=1.5, coring=false)
v131 = v131.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v132 = v132.AdjustColor(ou=25, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v132 = v132.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

#last = v132
last = v100+v101+v102+v103+v104+v105+v106+v107+v108+v109+v110+v111+v112+v113+v114+v115+v116+\
       v117+v118+v119+v120+v121+v122+v123+v124+v125+\
       v126+v127+v128+v129+v130+v131+v132

#histogram("levels")
ConvertToYV12
Prefetch(6)

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "lock_chan", bool "gam_mac")
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
    gam_mac = Default(gam_mac, true)
    lock_chan = Default(lock_chan, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=2, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       ConvertToYV24() : c

#    c = c.AdjustDiv2(1, 2)

    return c
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)

    c = c.SMDegrain(tr=9, thSAD=th_SAD, thSADC=th_SADC, RefineMotion=true, prefilter=2)
    c = c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6).\
          fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

    return c
}

function AdjustDiv2(clip c, int level, int "max_level", float "red", float "grn", float "blu")
{
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)

    max_level = Default(max_level, 4)

    left = c.crop(0, 0, -c.width/2, 0)
    right = c.crop(c.width - c.width/2, 0, 0, 0)

    level = level + 1

    left = level < max_level ? left.AdjustDiv2(level, max_level, red, grn, blu) :\
    left.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    right =  level < max_level ? right.AdjustDiv2(level, max_level, red, grn, blu) :\
    right.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    return left.stackhorizontal(right)
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
    _grey=default(_grey, false)
	repmode=default(repmode, 16)
	clmode=17
	clensed=Clense(input, grey=_grey, cache=4)
	sbegin = ForwardClense(input, grey=_grey, cache=-1)
	send = BackwardClense(input, grey=_grey, cache=-1)
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=true), input, mode=repmode, modeU = _grey ? -1 : repmode ) 
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
    return corrected
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}

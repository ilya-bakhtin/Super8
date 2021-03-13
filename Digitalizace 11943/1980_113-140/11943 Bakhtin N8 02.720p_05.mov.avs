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

src = last
#return last.ColorYUV(autogain=true)

#v112 = src.trim(14348, 14475)
v113 = src.trim(14481, 14545).crop(0,0,-8,0)
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

#return v140.autolevels.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, sigma2=10, sigma3=40, sigma4=40, plane=4).prefetch(6)
#return v144#.autolevels#.ColorYUV(autogain=true)

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

v113 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-113.mov.avi").ConvertToYV24()
v114 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-114.mov.avi").ConvertToYV24()
v115 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-115.mov.avi").ConvertToYV24()
v116 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-116.mov.avi").ConvertToYV24()
v117 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-117.mov.avi").ConvertToYV24()
v118 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-118.mov.avi").ConvertToYV24()
v119 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-119.mov.avi").ConvertToYV24()
v120 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-120.mov.avi").ConvertToYV24()
v121 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-121.mov.avi").ConvertToYV24()
v122 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-122.mov.avi").ConvertToYV24()
v123 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-123.mov.avi").ConvertToYV24()
v124 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-124.mov.avi").ConvertToYV24()
v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-125.mov.avi").ConvertToYV24()
v126 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-126.mov.avi").ConvertToYV24()
v127 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-127.mov.avi").ConvertToYV24()
v128 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-128.mov.avi").ConvertToYV24()
v129 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-129.mov.avi").ConvertToYV24()
v130 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-130.mov.avi").ConvertToYV24()
v131 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-131.mov.avi").ConvertToYV24()
#v132 as is
v133 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-133.mov.avi").ConvertToYV24()
v134 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-134.mov.avi").ConvertToYV24()
v135 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-135.mov.avi").ConvertToYV24()
v136 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-136.mov.avi").ConvertToYV24()
v137 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-137.mov.avi").ConvertToYV24()
v138 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-138.mov.avi").ConvertToYV24()
v139 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-139.mov.avi").ConvertToYV24()
v140 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_113-140\11943 Bakhtin N8 02.720p_05-140.mov.avi").ConvertToYV24()

#return v12.ExtractY.autolevels.prefetch(6)

function AdjustColor(clip c, u, v, y_gamma, sat_mul, float "red_mul", float "grn_mul", float "blu_mul",\
                     bool "fft3d", int "sigma_y", int "sigma_c", bool "a_gamma", int "fft_bw", int "fft_bh")
{
    fft3d = Default(fft3d, false)
    fft_bw = Default(fft_bw, 32)
    fft_bh = Default(fft_bh, 32)
    sigma_y = Default(sigma_y, 40)
    sigma_c = Default(sigma_c, 80)
    a_gamma = Default(a_gamma, false)

    red_mul = Default(red_mul, 1)
    grn_mul = Default(grn_mul, 1)
    blu_mul = Default(blu_mul, 1)

    c = fft3d ? c : c.Filter()
#c = c.BicubicSharp(r = 5, edges = 0.5, str = 2, mode = 1)
    c = c.ColorYUV(off_u=u, off_v=v) # , gamma_y = y_gamma)
#return c.histogram("levels")
    c = c.ConvertToRGB()
    c = c.GamMac(LockChan=1, Scale=2, loTh=0.2, hiTh=0.2, RedMul=red_mul, GrnMul=grn_mul, BluMul=blu_mul, verbosity=5, show=false)
    c = c.ConvertToYV24()

    c = fft3d ? c.fft3dfilter(bw=fft_bw, bh=fft_bh, ow=fft_bw/2, oh=fft_bh/2, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6).\
                  fft3dfilter(bw=fft_bw, bh=fft_bh, ow=fft_bw/2, oh=fft_bh/2, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6) : c
    c = a_gamma ? c.autogamma() : c.ColorYUV(off_u=0, off_v=0, gamma_y = y_gamma)

    c = c.tweak(sat=sat_mul, coring=false)
    return c
}

function AdjustColorWB(clip c, y_gamma)
{
    c = c.tweak(sat=0, coring=false)
    c = c.Filter()
    c = c.ColorYUV(autogain=true, gamma_y = y_gamma)

    return c
}

function Filter(clip c)
{
    bsize = 8
    over = 4
    chrom = true
    hp = 16
    vp = 16
    search_v = 3
    dct_v = 1

    super = c.MSuper(pel=1, sharp=1, hpad=hp, vpad=vp, rfilter=4)
    backward_vec1 = MAnalyse(super, isb = true, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec2 = MAnalyse(super, isb = true, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec3 = MAnalyse(super, isb = true, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec1 = MAnalyse(super, isb = false, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec2 = MAnalyse(super, isb = false, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec3 = MAnalyse(super, isb = false, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
#    return c.MDegrain2(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,thSAD=4000)
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=4000)
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

function AdjustFrameRate1(clip c)
{
super_params="{pel:2,gpu:1}"

analyse_params="""{block:{w:32,h:32,overlap:2}, 
	main:{levels:4,search:{distance:-20, coarse:{distance:-10}}},
	refine:[{thsad:200}]}"""

smoothfps_params="{rate:{num:24,den:1,abs:true},algo:23,cubic:1,mask:{cover:50,area:50},light:{}}"

#c = c.ConvertToYV12().ColorYUV(off_y = -128, gain_y = 255)
c = c.ConvertToYV12().AddBorders(0, 64, 0, 64)

    super = c.SVSuper(super_params)
    vectors = SVAnalyse(super, analyse_params)

    c = c.SVSmoothFps(super, vectors, smoothfps_params, mt=6)
    return c.crop(0, 64, 0, -64).ConvertToYV24()
}
/*
v144 = v144.ColorYUV(gain_y=128).AdjustColor(1, -7, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,64)
return v144.Prefetch(6)
*/
/*
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
*/
/*
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
*/
/*
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
*/
/*
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
*/
/*
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
*/
/*
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
*/
/*
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

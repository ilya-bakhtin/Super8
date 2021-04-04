SetFilterMTMode("DEFAULT_MT_MODE", 3)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

#LoadPlugin("D:\Program Files (x86)\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("E:\media\video\Super8\11449 Digitalizace\11449 Bakhtin 02 cast1 N8.720p.mov")
assumefps(18)

src2 = LSMASHVideoSource("E:\media\video\Super8\11449 Digitalizace\11449 Bakhtin 02 cast2 N8.720p.mov")
src2 = src2.assumefps(18)

src3 = LSMASHVideoSource("E:\media\video\Super8\11449 Digitalizace\11449 Bakhtin 02 cast3 N8.720p.mov")
src3 = src3.assumefps(18)

crop(146,0,-190,-0)
#return last

src2 = src2.crop(146,0,-190,-0)
#return src2

src3 = src3.crop(146,0,-190,-0)
#return src3

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
# 26964, 27081, 27297, 27390, 27534, 27571, 27656, 27729, 27757, 27917, 27964, 28559, 28616, 28679, 28904, 28953, 29025, 29086, 29162, 29241, 29245,
# 29307, 29457, 29624, 29638, 29769,

#cast2
# 4, 105, 111, 148, 192,

#cast3
# 1, 14, 63, 178, 250, 304, 476, 550, 592, 639, 669, 711, 896, 968, 1042, 1316

src = last
#return last

#v24 = src.trim(29162, 29237)
v1 = src.trim(29246, 29306)
v2 = src.trim(29308, 29455)
v3 = src.trim(29458, 29621)
v4 = src.trim(29639, 29767)
v5 = src2.trim(4, 103)
v6 = src2.trim(112, 147)
v7 = src2.trim(149, 192)
v8 = src3.trim(1, 13)
v9 = src3.trim(15, 62)
v10 = src3.trim(64, 177)
v11 = src3.trim(179, 249)
v12 = src3.trim(251, 303)
v13 = src3.trim(305, 474)
v14 = src3.trim(477, 549)
v15 = src3.trim(601, 637)
v16 = src3.trim(640, 668)
v17 = src3.trim(670, 704)
v18 = src3.trim(712, 894)
v19 = src3.trim(897, 967)
v20 = src3.trim(969, 1040)
v21 = src3.trim(1043, 1314)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

function AdjustColor(clip c, u, v, y_gamma, sat_mul, float "red_mul", float "grn_mul", float "blu_mul")
{
    red_mul = Default(red_mul, 1)
    grn_mul = Default(grn_mul, 1)
    blu_mul = Default(blu_mul, 1)

    c = c.Filter()
c = c.BicubicSharp(r = 5, edges = 0.5, str = 2, mode = 1)
    c = c.ColorYUV(off_u=u, off_v=v) # , gamma_y = y_gamma)
#return c.histogram("levels")
    c = c.ConvertToRGB()
    c = c.GamMac(LockChan=1, Scale=2, loTh=0.2, hiTh=0.2, RedMul=red_mul, GrnMul=grn_mul, BluMul=blu_mul, verbosity=5, show=false)
    c = c.ConvertToYV24()
    c = c.ColorYUV(off_u=0, off_v=0, gamma_y = y_gamma)
    c = c.tweak(sat=sat_mul)

    return c
}

function AdjustColorWB(clip c, y_gamma)
{
    c = c.tweak(sat=0)
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
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=400)
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

v1 = v1.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v2 = v2.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v3 = v3.AdjustColor(8, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v4 = v4.AdjustColor(8, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustColor(8, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v6 = v6.AdjustColor(12, -16, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v7 = v7.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v10 = v10.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v12 = v12.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v13 = v13.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(20).AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v15 = v15.AdjustColor(16, -12, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v16 = v16.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustColor(12, -10, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustColor(16, -10, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(16, -8, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(22, -12, -32, 1.5, red_mul = 0.96, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30
#last = v21
Prefetch(6)
return last

SetFilterMTMode("DEFAULT_MT_MODE", 3)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\users\ilx\wrk\video\11449 Bakhtin 01 cast2 S8.720p.mov")
assumefps(18)

c1 = LSMASHVideoSource("D:\users\ilx\wrk\video\11449 Bakhtin 01 cast1 S8.720p.mov")
c1 = c1.assumefps(18)
c1 = c1.crop(140,4,-140,-4)
b = BlankClip(c1, length=3000, color=$000000)

#FlipVertical.Reverse()

crop(140,4,-140,-4)
#return last

# 0, 452, 847, 971, 1140, 1254, 1431, 1552, 1687, 1793, 1876, 2042, 2181, 2384, 2398, 2420, 2445, 2617, 2682,
# 2795, 2886, 2986, 3082, 3157, 3290, 3451, 3488, 3661, 3684, 3813, 3874, 4010, 4135, 4279, 4423, 4544, 4611,
# 4718, 4923, 4933, 5051, 5208, 5299, 5409, 5507, 5790, 5824, 5897, 5958, 6059, 6165, 6297, 6481, 6571, 6577,
# 6680, 6748, 6824, 6871, 6991, 7125, 7177, 7261, 7304, 7395, 7522, 7629, 7708, 7729, 7740, 7778, 7815, 7864,
# 8019, 8177, 8265, 8423, 8475, 8601, 8689, 8827, 8834, 8886, 9064, 9207, 9289, 9346, 9395, 9603, 9614, 9653,
# 9673, 9729, 9817, 9918, 9972, 10002, 10013, 10146, 10189, 10198, 10272, 10362, 10417, 10433, 10495, 10596,
# 10649, 10687, 10701, 10725, 10821, 10874, 11037, 11157, 11281, 11421, 11455, 11561, 11657, 11764, 11846, 11939,
# 11968, 12041, 12161, 12211, 12323, 12338, 12390, 12581, 12665, 12711, 12758, 12932, 13788, 13939, 14050, 14074,
# 14099, 14140, 14174, 14219, 14317, 14408, 14480, 14650, 14936, 15065, 15188, 15328, 15654, 15665, 15706, 15776,
# 15798, 15857, 15918, 15929,
# 16142, 16368, 16388, 16559, 16675, 16797, 17119, 17294, 17390, 17487, 17569, 17676, 18156, 18444, 18632, 18897,
# 19024, 19121, 19287, 19449, 19570, 19658, 21678, 21710, 21773, 21783, 22000, 22246, 22399, 22513, 22653, 22741,
# 22851, 22917, 23103, 23254, 23434, 23514, 23571, 23631, 23792, 23949, 24079, 24130, 24246, 24333, 24441, 24489,
# 24601, 24694, 

last = last.trim(0, 11296) + b.trim(0, 36) + last.trim(11297, 12009) + b.trim(0, -1) + last.trim(12010, 0)
src = last
#return last

c1 = b.trim(0, 32) + c1.trim(0, 4194) + c1.trim(4200, 4923) + b.trim(0, -1) + c1.trim(4924, 8049) + c1.trim(8053, 9720) + b.trim(0, 5) + c1.trim(9721, 12214) + b.trim(0, 3) + c1.trim(12215, 0)
#return c1
#return last.stackhorizontal(c1)
#return last.stackvertical(c1)
#return last.subtract(c1)

#v24 = src.trim(18444, 18631)
v1 = src.trim(18632, 18895).crop(0,0,0,-4).addborders(0,0,0,4)
v2 = src.trim(18898, 19023).crop(0,0,0,-4).addborders(0,0,0,4)
v3 = src.trim(19025, 19119).crop(0,0,0,-2).addborders(0,0,0,2)
v4 = src.trim(19121, 19286).crop(0,0,0,-4).addborders(0,0,0,4)
v5 = src.trim(19287, 19447).crop(0,0,0,-4).addborders(0,0,0,4)
v6 = src.trim(19450, 19568).crop(0,0,0,-4).addborders(0,0,0,4)
v7 = src.trim(19574, -1) + src.trim(19576, 19595)
v8 = src.trim(19598, 19605) + src.trim(19607, 19610)
v9 = src.trim(19617, 19629) + src.trim(19632, 19642) + src.trim(19644, -1) + src.trim(19646, 19657)
#v10 = src.trim(19658, 21677)
#v10 = src.trim(21678, 21709)
v10 = src.trim(21714, 21715) + src.trim(21718, 21726)
v11 = src.trim(21736, 21772)
#v12 = src.trim(21773, 21782)
v12 = src.trim(21798, 21805) + src.trim(21807, 21835) + src.trim(21837, 21886) + src.trim(21888, 21941) + src.trim(21943, 21998)
v13 = src.trim(22001, 22004) + src.trim(22006, 22007)
v14 = src.trim(22009, 22010) + src.trim(22012, 22245)
v15 = src.trim(22255, 22380)
v16 = src.trim(22383, 22398)
v17 = src.trim(22405, 22428) + src.trim(22430, 22446)
v18 = src.trim(22447, 22506)
v19 = src.trim(22514, 22651)
v20 = src.trim(22654, 22740)
v21 = src.trim(22743, 22849)
v22 = src.trim(22851, 22916)
v23 = src.trim(22917, 23102)
v24 = src.trim(23103, 23253)
#return v20.coloryuv(autogain=true, autowhite=true).tweak(sat=2).prefetch(6)
#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
return v3

function AdjustColor(clip c, u, v, y_gamma, sat_mul, float "red_mul", float "grn_mul", float "blu_mul", int "lock_c", bool "sharp")
{
    red_mul = Default(red_mul, 1)
    grn_mul = Default(grn_mul, 1)
    blu_mul = Default(blu_mul, 1)
    lock_c = Default(lock_c, 1)
    sharp = Default(sharp, true)

    c = c.Filter()
    c = c.ColorYUV(off_u=u, off_v=v) # , gamma_y = y_gamma)
#return c.histogram("levels")
    c = c.ConvertToRGB()
    c = c.GamMac(LockChan=lock_c, Scale=2, loTh=0.2, hiTh=0.2, RedMul=red_mul, GrnMul=grn_mul, BluMul=blu_mul, verbosity=5, show=false)
    c = c.ConvertToYV24()
    c = c.ColorYUV(off_u=0, off_v=0, gamma_y = y_gamma)
    c = c.tweak(sat=sat_mul)
    c = sharp ? c.BicubicSharp(r = 2, edges = 0.5, str = 2, mode = 1) : c

    return c
}

function AdjustColorWB(clip c, y_gamma, bool "sharp")
{
    sharp = Default(sharp, true)

    c = c.tweak(sat=0)
    c = c.Filter()
    c = c.ColorYUV(autogain=true, gamma_y = y_gamma)
    c = sharp ? c.BicubicSharp(r = 2, edges = 0.5, str = 2, mode = 1) : c

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
#return c
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

v1 = v1.AdjustColor(4, -4, 0, 2, red_mul = 0.92, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v2 = v2.AdjustColor(6, -6, 0, 2, red_mul = 1, grn_mul = 1, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v3 = v3.AdjustColor(4, -6, 32, 2, red_mul = 0.8, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v4 = v4.AdjustColor(4, -6, 0, 1.8, red_mul = 0.98, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustColor(6, -8, 32, 1.8, red_mul = 1, grn_mul = 1, blu_mul = 1).assumefps(12).AdjustFrameRate(preset_p = "slowest", output_p = "auto")
v6 = v6.AdjustColor(6, -6, 32, 1.8, red_mul = 1, grn_mul = 1, blu_mul = 1).assumefps(12).AdjustFrameRate(preset_p = "slowest")
v7 = v7.AdjustColorWB(0).assumefps(12).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustColorWB(0).assumefps(12).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustColorWB(0).assumefps(12).AdjustFrameRate(preset_p = "slowest")
v10 = v10.AdjustColorWB(0).assumefps(12).AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustColorWB(0).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v12 = v12.AdjustColorWB(32).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v13 = v13.AdjustColorWB(32).assumefps(12).AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustColorWB(32).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v15 = v15.AdjustColorWB(32).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v16 = v16.AdjustColorWB(32).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustColorWB(32).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustColorWB(0).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustColor(4, -4, 0, 1.8, red_mul = 1, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(4, -4, 0, 1.8, red_mul = 1, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(2, -4, 0, 1.8, red_mul = 1, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = v22.AdjustColor(2, -4, 0, 1.8, red_mul = 1, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = v23.AdjustColor(4, -4, 32, 1.8, red_mul = 1, grn_mul = 1, blu_mul = 1).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v24 = v24.AdjustColor(4, -4, 32, 1.8, red_mul = 0.98, grn_mul = 1, blu_mul = 1).assumefps(16).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
Prefetch(6)
return last

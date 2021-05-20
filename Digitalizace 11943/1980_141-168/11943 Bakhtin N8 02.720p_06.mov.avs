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

#v140 = src.trim(20160, 20241).crop(0,0,-16,-32)
v141 = src.trim(20242, 20358).crop(0,0,-16,-64)
v142 = src.trim(20359, 20408).crop(0,0,-16,-16)
v143 = src.trim(20409, 20463).crop(0,16,-16,-36)
#v144.0 = src.trim(20464, 20568)
#v144.1 = src.trim(20569, 20611)
v144 = src.trim(20612, 20713).crop(0,0,-16,-64)
v145 = src.trim(20717, 20838).crop(0,0,-16,-64)
#v146.0 = src.trim(20839, 20947)
v146 = src.trim(20949, 21024)
v146 = (v146.trim(0, 58) + v146.trim(60, 0)).crop(0,0,-16,-32)
v147 = src.trim(21025, 21170).crop(0,0,-16,-32)
#v148.0 = src.trim(21172, 21182)
v148 = src.trim(21183, 21290).crop(0,0,-16,-32)
v149 = src.trim(21297, 21503).crop(0,0,-16,0)
#v150 = src.trim(21531, 21583)
global filter16 = true

#return v140.autolevels.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, sigma2=10, sigma3=40, sigma4=40, plane=4).prefetch(6)
#return v150.autolevels#.ColorYUV(autogain=true)
#******

# 113

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

v141 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-141.mov.avi").ConvertToYV24()
v142 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-142.mov.avi").ConvertToYV24()
v143 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-143.mov.avi").ConvertToYV24()
v144 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-144.mov.avi").ConvertToYV24()
v145 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-145.mov.avi").ConvertToYV24()
v146 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-146.mov.avi").ConvertToYV24()
v147 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-147.mov.avi").ConvertToYV24()
v148 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-148.mov.avi").ConvertToYV24()
v149 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_141-168\11943 Bakhtin N8 02.720p_06-149.mov.avi").ConvertToYV24()

#return v12.ExtractY.autolevels.prefetch(6)
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
v149 = v149.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.9, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)
return v149.Prefetch(6)

v141 = v141.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,64)

v142 = v142.ColorYUV(gain_y=128).AdjustColor(1, -7, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,16)

v143 = v143.ColorYUV(gain_y=128).AdjustColor(1, -7, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,16,16,36)

v144 = v144.ColorYUV(gain_y=128).AdjustColor(1, -7, 0, 3, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,64)

last = v141+v142+v143+v144
ConvertToYV12()
return Prefetch(6)


v145 = v145.ColorYUV(gain_y=256).AdjustColor(1, -7, 0, 4, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,64)

v146 = v146.ColorYUV(gain_y=128).AdjustColor(1, -7, 0, 4, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,32)

v147 = v147.ColorYUV(gain_y=128).AdjustColor(4, -7, 0, 4, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,32)

v148 = v148.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 5, red_mul=0.94, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,32)

v149 = v149.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.9, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.004, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

last = v145+v146+v147+v148+v149
ConvertToYV12()
return Prefetch(6)
*/
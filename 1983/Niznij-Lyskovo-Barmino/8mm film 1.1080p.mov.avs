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

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
crop(240, 0, -240, 0)
#crop(500, 500, -500, -500)
#trim(12693, 12750)
#trim(10221, 10408)
trim(10409, 10606)

#return last#.ConvertToRGB.extractB

#r = PointResize(720, 540).Spline64Resize(1440, 1080, src_top=0.25)
r = Spline64Resize(720, 540).Spline64Resize(1440, 1080)

#return last.subtract(r).ColorYUV(off_y = -94).ColorYUV(gain_y = 768).histogram().prefetch(6)

#last = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\1983\stab.avi").ConvertToYV24

#v1 = Filter()
v1 = last.TemporalDegrain(degrain=3, SAD1=1000, SAD2=1000)
#v1 = last.TemporalDegrain2(degrainTR=3)
#v2 = last.TemporalDegrain2(degrainTR=3, ppSAD1=600, ppSAD2=600, postFFT=0, fftThreads=6, postSigma=40)
#return v1.interleave(v2).prefetch(6)

autolevels(ignore=0)#, filterRadius = 0)
#return histogram("levels")

v1 = last#.SMDegrain(tr=9, thSAD=1000) #, ppSAD1=60, ppSAD2=60, postFFT=0, fftThreads=6, postSigma=40)
v2 = last.SMDegrain(tr=9, thSAD=1200, thSADC=1200, RefineMotion=true, prefilter=2)
#return v2.prefetch(6)
#return v1.interleave(v2).prefetch(6)
last=v2
#return autolevels(ignore=0, border = 500, filterRadius = 0, debug=true).histogram("levels").prefetch(6)

ColorYUV(off_u=20, off_v=-15)

ConvertToRGB()
GamMac(LockChan=1, Scale=2, loTh=0.2, hiTh=0, RedMul=1, BluMul=0.9, verbosity=5, show=false)
ConvertToYV24()

sigma_y = 8
sigma_c = 8

fft = fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6).\
fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)
last = fft
autolevels(ignore=0.0001, filterRadius = 0, autolevel=true, gamma=1.5)
#ColorYUV(gamma_y=256)

tweak(sat=2, coring=false)

#return last.interleave(fft.autolevels(ignore=0, filterRadius = 0, autolevel=true, gamma=1.5).tweak(sat=2, coring=false))

#histogram("levels")
#histogram()

#Spline64resize(960, 720)#.histogram("levels")

preset_p = "Slowest"
output_p = "Flow"
blksize_p = 24
assumeFPS(18)
FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
trim(2, 255)
Prefetch(12)

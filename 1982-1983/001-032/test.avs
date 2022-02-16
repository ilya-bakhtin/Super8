SetFilterMTMode("Deshaker", MT_SERIALIZED)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("8mm film 2048x1536 18Fps.mov.avs")

#return v1

#source_dir = "d:\Users\ilx\wrk\video\Super8\1982\001-032\"

#config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|2|30|300|4|" + source_dir + "v1.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"
#          1 2  3 4 5 6 7 8   9  10 11 12 13 14  15 16 1718192021 22  23 24 25                                                      2627282930313233343536373839 40 41     42    43 4445 46 4748495051525354 55  56 57 585960 61   62  63 646566  67
config = "19|2|30|4|1|0|1|0|640|480|0|1|100|100|100|100|4|1|0|2|8|30|300|4|d:\\Users\\ilx\\wrk\\video\\Super8\\1982\\001-032\\v1.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|0.0015|0.0015|1|1|30|30|0|0|0|0|1|1|1|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff"

#        "19|2|30|4|1|0|1|0|640|480|1|2|100|100|100|100|4|1|0|2|8|30|300|4|C:\\Users\\ilx\\AppData\\Local\\Deshaker\\Deshaker.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|5|15|0|0|30|30|0|0|0|0|1|1|0|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff");
#        "19|2|30|4|1|0|1|0|640|480|1|2|100|100|100|100|4|1|1|2|8|30|300|4|C:\\Users\\ilx\\AppData\\Local\\Deshaker\\Deshaker.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|5|15|1|1|30|30|0|0|0|0|1|1|0|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff");
#        "19|2|30|4|1|0|1|0|640|480|1|2|100|100|100|100|4|1|1|2|8|30|300|4|C:\\Users\\ilx\\AppData\\Local\\Deshaker\\Deshaker.log|0|0|0|0|0|0|0|0|0|0|0|0|0|1|15|15|5|15|0|0|30|30|0|0|0|0|1|1|0|10|1000|1|88|1|1|20|5000|100|20|1|0|ff00ff");

global filter16 = false

v1 = v1.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
               truemotion=false, sigma_y=0, sigma_c=0, prefilter=2)

v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")
v1 = v1.Deshaker(config).trim(30, 0)
v1 = v1.convertToYV24(interlaced=false, matrix="PC.709")

return v1.prefetch(6)

v01 = LWLibavVideoSource("d:\users\ilx\wrk\video\Super8\1982\001-032\v1.avi").convertToYV24

return v1.interleave(v01)

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

SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("M:\Media\video\Super8\1983-1984\8mm - 1.Res2K43.Aspect43In43.Speed18Fps.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 147, 344, 584,  709, 1184, 1454, 1570, 1696, 1772, 2070, 2257, 2407, 2590, 2689, 2784, 2873, 2949, 3043, 3116, 3291, #20
# 3585, 3804, 4228, 4466, 4519, 4592, 4840, 4907, 4933, 5017, 5086, 5285, 5336, 5384, 5393, 5443, 5456, 5515, 5527, 5558, #40

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

left = 56
top = 94
right = -100
bot = -98

v1 = full.trim(0, 146)
v1 = v1.animate(0, 18, "crop", 0, top + 20, 0, bot + 20, 0, top, 0, bot)
v1 = v1.animate(0, 2, "crop", left + 12, 0, right + 12, 0, left, 0, right, 0)

v2 = full.trim(147, 343)
v2 = v2.crop(left + 10, top, right + 10, bot)

v3 = full.trim(344, 583)
v3 = v3.crop(left, top, right, bot)

v4 = full.trim(584, 708)
v4 = v4.crop(left, top, right, bot)

v5 = full.trim(709, 1183)
v5 = v5.crop(left, top, right, bot)

v6 = full.trim(1184, 1453)
v6 = v6.crop(left + 10, top, right + 10, bot)

v7 = full.trim(1454, 1569)
v7 = v7.crop(left + 10, top + 10, right + 10, bot + 10)

v8 = full.trim(1570, 1695)
v8 = v8.crop(left + 10, top + 10, right + 10, bot + 10)

v9 = full.trim(1696, 1771)
v9 = v9.animate(0, 3, "crop", left + 10, top + 4, right + 10, bot + 4, left + 10, top - 14, right + 10, bot - 14).trim(0, 3) +\
     v9.animate(3, 5, "crop", left + 10, top - 14, right + 10, bot - 14, left + 10, top + 10, right + 10, bot + 10).trim(4, 0)

v10 = full.trim(1772, 2068)
v10 = v10.animate(293, 296, "crop", left + 10, top + 0, right + 10, bot + 0, left + 10, top + 30, right + 10, bot + 30)

v11 = full.trim(2070, 2256)
v11 = v11.animate(2, 6, "crop", left + 0, top + 10, right + 0, bot + 10, left + 10, top + 10, right + 10, bot + 10)

v12 = full.trim(2257, 2406)
v12 = v12.crop(left + 20, top + 10, right + 20, bot + 10)

v13 = full.trim(2407, 2589)
v13 = v13.crop(left + 20, top + 0, right + 20, bot + 0)

v14 = full.trim(2590, 2688)
v14 = v14.crop(left + 20, top + 0, right + 20, bot + 0)

v15 = full.trim(2689, 2783)
v15 = v15.crop(left + 20, top + 0, right + 20, bot + 0)

v16 = full.trim(2784, 2872)
v16 = v16.crop(left + 20, top + 0, right + 20, bot + 0)

v17 = full.trim(2873, 2948)
v17 = v17.crop(left + 20, top + 0, right + 20, bot + 0)

v18 = full.trim(2949, 3042)
v18 = v18.crop(left + 20, top + 0, right + 20, bot + 0)

v19 = full.trim(3043, 3115)
v19 = v19.crop(left + 20, top + 0, right + 20, bot + 0)

v20 = full.trim(3116, 3290)
v20 = v20.crop(left + 20, top + 0, right + 20, bot + 0)

v21 = full.trim(3291, 3584)
v21 = v21.crop(left + 20, top + 0, right + 20, bot + 0)

v22 = full.trim(3585, 3803)
v22 = v22.crop(left + 20, top - 10, right + 20, bot - 10)

v23 = full.trim(3804, 4226)
v23 = v23.crop(left + 20, top - 10, right + 20, bot - 10)

v24 = full.trim(4228, 4465)
v24 = v24.animate(0, 1, "crop", 0, top - 30, 0, bot - 30, 0, top - 50, 0, bot - 50).trim(0, 1) +\
      v24.animate(2, 4, "crop", 0, top - 60, 0, bot - 60, 0, top - 30, 0, bot - 30).trim(2, 87) +\
      v24.animate(88, 89, "crop", 0, top - 30, 0, bot - 30, 0, top + 30, 0, bot + 30).trim(88, 89) +\
      v24.animate(93, 94, "crop", 0, top - 10, 0, bot - 10, 0, top - 30, 0, bot - 30).trim(90, 163) +\
      v24.animate(164, 165, "crop", 0, top - 30, 0, bot - 30, 0, top + 10, 0, bot + 10).trim(164, 165) +\
      v24.animate(166, 170, "crop", 0, top + 0, 0, bot + 0, 0, top - 30, 0, bot - 30).trim(166, 219) +\
      v24.animate(220, 221, "crop", 0, top - 30, 0, bot - 30, 0, top + 10, 0, bot + 10).trim(220, 222) +\
      v24.animate(223, 225, "crop", 0, top + 10, 0, bot + 10, 0, top - 30, 0, bot - 30).trim(223, 0)

v24 = v24.animate(6, 8, "crop", left + 20, 0, right + 20, 0, left + 10, 0, right + 10, 0).trim(0, 8) +\
      v24.animate(8, 18,"crop", left + 10, 0, right + 10, 0, left + 20, 0, right + 20, 0).trim(9, 35) +\
      v24.animate(36, 43,"crop", left + 20, 0, right + 20, 0, left + 0, 0, right + 0, 0).trim(36, 42) +\
      v24.animate(43, 53,"crop", left + 0, 0, right + 0, 0, left + 20, 0, right + 20, 0).trim(43, 82) +\
      v24.animate(83, 92,"crop", left + 20, 0, right + 20, 0, left - 20, 0, right - 20, 0).trim(83, 92) +\
      v24.animate(92, 93,"crop", left - 20, 0, right - 20, 0, left + 20, 0, right + 20, 0).trim(93, 99) +\
      v24.animate(100, 101,"crop", left + 20, 0, right + 20, 0, left - 0, 0, right - 0, 0).trim(100, 102) +\
      v24.animate(103, 109,"crop", left - 0, 0, right - 0, 0, left + 20, 0, right + 20, 0).trim(103, 115) +\
      v24.animate(116, 124,"crop", left + 20, 0, right + 20, 0, left - 20, 0, right - 20, 0).trim(116, 124) +\
      v24.animate(125, 130,"crop", left - 20, 0, right - 20, 0, left + 20, 0, right + 20, 0).trim(125, 158) +\
      v24.animate(159, 168,"crop", left + 20, 0, right + 20, 0, left - 20, 0, right - 20, 0).trim(159, 167) +\
      v24.animate(168, 169,"crop", left - 20, 0, right - 20, 0, left + 20, 0, right + 20, 0).trim(168, 175) +\
      v24.animate(176, 178,"crop", left + 20, 0, right + 20, 0, left - 0, 0, right - 0, 0).trim(176, 177) +\
      v24.animate(178, 182,"crop", left - 0, 0, right - 0, 0, left + 20, 0, right + 20, 0).trim(178, 0)

v25 = full.trim(4466, 4518)
v25 = v25.crop(left + 20, top - 10, right + 20, bot - 10)

v26 = full.trim(4519, 4591)
v26 = v26.crop(left + 20, top - 20, right + 20, bot - 20)

v27 = full.trim(4593, 4839)

v27 = v27.animate(208, 210, "crop", 0, top - 30, 0, bot - 30, 0, top + 20, 0, bot + 20).trim(0, 209) +\
      v27.animate(210, 212, "crop", 0, top + 20, 0, bot + 20, 0, top - 0, 0, bot - 0).trim(210, 213) +\
      v27.animate(214, 215, "crop", 0, top - 0, 0, bot - 0, 0, top - 10, 0, bot - 10).trim(214, 216) +\
      v27.animate(217, 218, "crop", 0, top - 10, 0, bot - 10, 0, top - 20, 0, bot - 20).trim(217, 217) +\
      v27.animate(218, 219, "crop", 0, top - 20, 0, bot - 20, 0, top - 10, 0, bot - 10).trim(218, 218) +\
      v27.animate(219, 220, "crop", 0, top - 10, 0, bot - 10, 0, top - 30, 0, bot - 30).trim(219, 219) +\
      v27.animate(220, 221, "crop", 0, top - 30, 0, bot - 30, 0, top - 10, 0, bot - 10).trim(220, 224) +\
      v27.animate(225, 229, "crop", 0, top - 10, 0, bot - 10, 0, top - 30, 0, bot - 30).trim(225, 228) +\
      v27.animate(229, 230, "crop", 0, top - 30, 0, bot - 30, 0, top - 10, 0, bot - 10).trim(229, 230) +\
      v27.animate(231, 233, "crop", 0, top - 10, 0, bot - 10, 0, top - 30, 0, bot - 30).trim(231, 232) +\
      v27.animate(233, 236, "crop", 0, top - 30, 0, bot - 30, 0, top - 10, 0, bot - 10).trim(233, 235) +\
      v27.animate(236, 239, "crop", 0, top - 10, 0, bot - 10, 0, top - 0, 0, bot - 0).trim(236, 239) +\
      v27.animate(240, 241, "crop", 0, top - 0, 0, bot - 0, 0, top - 10, 0, bot - 10).trim(240, 240) +\
      v27.animate(241, 242, "crop", 0, top - 10, 0, bot - 10, 0, top + 10, 0, bot + 10).trim(241, 241) +\
      v27.animate(242, 243, "crop", 0, top + 10, 0, bot + 10, 0, top - 0, 0, bot - 0).trim(242, 0)

v27 = v27.animate(122, 127, "crop", left + 10, 0, right + 10, 0, left + 20, 0, right + 20, 0).trim(0, 126) +\
      v27.animate(127, 134, "crop", left + 20, 0, right + 20, 0, left + 10, 0, right + 10, 0).trim(127, 202) +\
      v27.animate(203, 205, "crop", left + 10, 0, right + 10, 0, left +  0, 0, right +  0, 0).trim(203, 204) +\
      v27.animate(205, 207, "crop", left +  0, 0, right +  0, 0, left + 10, 0, right + 10, 0).trim(205, 208) +\
      v27.animate(209, 215, "crop", left + 10, 0, right + 10, 0, left + 100, 0, right + 100, 0).trim(209, 214) +\
      v27.animate(215, 221, "crop", left + 100, 0, right + 100, 0, left + 10, 0, right + 10, 0).trim(215, 221) +\
      v27.animate(222, 225, "crop", left + 10, 0, right + 10, 0, left - 10, 0, right - 10, 0).trim(222, 224) +\
      v27.animate(225, 226, "crop", left - 10, 0, right - 10, 0, left + 30, 0, right + 30, 0).trim(225, 236) +\
      v27.animate(237, 239, "crop", left + 30, 0, right + 30, 0, left - 10, 0, right - 10, 0).trim(237, 239) +\
      v27.animate(240, 241, "crop", left - 10, 0, right - 10, 0, left + 30, 0, right + 30, 0).trim(240, 240) +\
      v27.animate(241, 246, "crop", left + 30, 0, right + 30, 0, left - 20, 0, right - 20, 0).trim(241, 0)

v28 = full.trim(4840, 4906)
v28 = v28.crop(left + 20, top - 20, right + 20, bot - 20)

v29 = full.trim(4907, 4932)
v29 = v29.crop(left + 20, top - 20, right + 20, bot - 20)

v30 = full.trim(4933, 5015)
v30 = v30.animate(63, 67, "crop", left + 20, top - 20, right + 20, bot - 20, left + 40, top - 20, right + 40, bot - 20).trim(0, 67) +\
      v30.animate(71, 73, "crop", left + 40, top - 20, right + 40, bot - 20, left + 20, top - 20, right + 20, bot - 20).trim(68, 0)

v31 = full.trim(5018, 5085)
v31 = v31.animate(29, 30, "crop", left + 20, top - 30, right + 20, bot - 30, left + 30, top - 30, right + 30, bot - 30).trim(0, 30) +\
      v31.animate(31, 33, "crop", left + 30, top - 30, right + 30, bot - 30, left + 20, top - 30, right + 20, bot - 30).trim(31, 59) +\
      v31.animate(60, 67, "crop", left + 20, top - 30, right + 20, bot - 30, left + 60, top - 30, right + 60, bot - 30).trim(60, 0)

v32 = full.trim(5086, 5284)
v32 = v32.animate(78, 80, "crop", 0, top - 30, 0, bot - 30, 0, top + 40, 0, bot + 40).trim(0, 82) +\
      v32.animate(83, 84, "crop", 0, top + 40, 0, bot + 40, 0, top - 30, 0, bot - 30).trim(83, 195) +\
      v32.animate(196, 198, "crop", 0, top - 30, 0, bot - 30, 0, top - 10, 0, bot - 10).trim(196, 0)

v32 = v32.animate(76, 83, "crop", left + 20, 0, right + 20, 0, left + 70, 0, right + 70, 0).trim(0, 82) +\
      v32.animate(83, 86, "crop", left + 70, 0, right + 70, 0, left + 20, 0, right + 20, 0).trim(83, 86) +\
      v32.animate(87, 91, "crop", left + 20, 0, right + 20, 0, left + 10, 0, right + 10, 0).trim(87, 90) +\
      v32.animate(91, 103, "crop", left + 10, 0, right + 10, 0, left + 20, 0, right + 20, 0).trim(91, 188) +\
      v32.animate(189, 191, "crop", left + 20, 0, right + 20, 0, left - 10, 0, right - 10, 0).trim(189, 190) +\
      v32.animate(191, 198, "crop", left - 10, 0, right - 10, 0, left + 10, 0, right + 10, 0).trim(191, 0)

# 189, 191, 198

#return v1.adjustBorders.prefetch
#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return v32.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 24

v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
v24 = v24.AdjustColor(ou=-4, ov=+0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v24 = v24.colorYUV(off_u=-6, off_v=0)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate

v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
v25 = v25.AdjustColor(ou=-4, ov=+4, x=100, y=10, w=-10, h=-400, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v25 = v25.colorYUV(off_u=-6, off_v=0)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
v26 = v26.AdjustColor(ou=-4, ov=+4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v26 = v26.colorYUV(off_u=-2, off_v=0)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
v27 = v27.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v27 = v27.colorYUV(off_u=-4, off_v=-2)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
v28 = v28.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, gam_mac=true)
v28 = v28.colorYUV(off_u=-6, off_v=-4)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate

v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
v29 = v29.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v29 = v29.colorYUV(off_u=-4, off_v=-0)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
v30 = v30.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, gam_mac=true)
v30 = v30.colorYUV(off_u=-4, off_v=-4)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate

v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
v31 = v31.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, gam_mac=true)
v31 = v31.colorYUV(off_u=-4, off_v=-2)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate

v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
#v32 = v32.colorYUV(off_y=6)
#v32 = v32.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v32 = v32.AdjustColor(ou=+2, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.0001, lock_chan=0, sat=1.7, gam_mac=true)
v32 = v32.colorYUV(off_u=-4, off_v=+2)
v32 = v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
#return v32.histogram("levels").prefetch
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

#******

*/

function adjustBorders(clip c)
{
    ref_w = src.width
    ref_h = src.height
    ref_w = ref_w*1080/ref_h
    rem = ref_w % 16
    ref_w = (rem == 0) ? ref_w : ref_w + 16 - rem
    ref_h = 1080

    w = c.width
    h = c.height
    w = w*1080/h
    h = 1080

    c = c.height == h ? c : c.spline64Resize(w, h)

    assert(ref_w >= w, "ref_w < w")

    return ref_w == w ? c : c.addBorders(0, 0, ref_w - w, 0)
}

function adjustSize(clip c)
{
    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

    return c.gaussResize(w, h)
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
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode ).crop(0,0,-dw,-dh)
}

function gamma(clip c, int "gamma")
{
    return c.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=gamma/1000.0)
}

function color_uv(clip c, int off_u, int off_v)
{
    return c.colorYUV(off_u = off_u, off_v = off_v)
}


function PrepareMask(clip c, int "off_y", float "ignore_low", float "ignore_high", int "mask_tolerance", int "border_r", int "border_b")
{
    mask_w = 192
    mask_h = 128

    off_y=default(off_y, 0)
    ignore_low=default(ignore_low, 0.2)
    ignore_high=default(ignore_high, 0.1)
    mask_tolerance=default(mask_tolerance, 100)
    border_r=default(border_r, 0)
    border_b=default(border_b, 0)

#    c = c.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%

    mask = c.crop(0, 0, mask_w, mask_h).\
             colorYUV(off_y = off_y, autowhite=true).extractY.\
             autoLevels(ignore_low=ignore_low, ignore_high=ignore_high, filterRadius=0, minRng=0, border_r=border_r, border_b=border_b, debug=false)

    mask = mask.addBorders(0, 0, c.width - mask_w, c.height - mask_h)
    mask = mask.letterbox(0, c.height - mask_h, 0, c.width - mask_w, color = $ffffff)
    mask = mask.ConvertToPlanarRGBA()
#return mask
    mask = mask.expr("sx 40 < sy 0 == & 0 x ?")
#return mask.ConvertToRGB
    mask = mask.ColorKeyMask($000000, mask_tolerance).Invert("A").showAlpha.convertToRGB32
#return mask
    return mask.MaskUpdate.Spline64Resize(c.width + 288, c.height + 216).crop(0, 0, -288, -216) # 120%
#    return mask.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%
}

function add_blank_audio(clip v)
{
    a = BlankClip(v, audio_rate = 48000, channels = 2).killVideo
    v = v.audioDub(a)
    return v
}
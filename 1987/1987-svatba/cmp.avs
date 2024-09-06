v0 = LSMASHVideoSource("E:\media\video\Super8\Sources\1987\10657 Bakhtin 01 S8.720p.mov").assumefps(18)
#return v0

v1 = LSMASHVideoSource("F:\media\video\Super8\Sources\1987\01.Res2K43.Aspect43In43.Speed18Fps.mov").assumefps(18)
v2 = LSMASHVideoSource("F:\media\video\Super8\Sources\1987\02.Res2K43.Aspect43In43.Speed18Fps.mov").assumefps(18)
v1 = v1.trim(0, 5552) + v2.trim(4, 0)

v0 = v0.trim(4509, 0)
v0 = v0.crop(160, 0, -160, 0)
v0 = v0.addBorders(40, 15, 0, 15)
v0 = v0.spline64Resize(1280, 960)
v0 = v0.histogram("levels")

v1 = v1.trim(4560, 0)
v1 = v1.crop(70, 68, -122, -76)
v1 = v1.autolevels(input_low=0, output_low=10, input_high=255, output_high=230)
v1 = v1.gaussResize(1280, 960, p = 10)
#v1 = v1.spline64Resize(1280, 960)
v1 = v1.histogram("levels")

v0 = v0.ConvertToYV12.autolevels(minRng=0, border_t = 200)
#v1 = v1.autolevels#(gamma=1.5)#0.7)
v1 = v1.colorYUV(off_u = -0, off_v = 4).tweak(sat = 1.5, coring = false)
v1 = v1.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)

return v0.interleave(v1)

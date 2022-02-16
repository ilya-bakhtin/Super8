LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v145 = LWLibavVideoSource(source_dir + "v145rc.avi", cache=false)
v145 = v145.convertToYV24(interlaced=false)

v145 = v145.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v145 = v145.removeDirt
v145 = v145.convertToYV12
v145 = v145.UnsharpMask(strength=300, radius=5, threshold=1)
v145 = v145.adjustBorders
v145 = v145.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v145.Prefetch(12)


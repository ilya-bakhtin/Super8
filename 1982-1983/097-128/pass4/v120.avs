LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v120 = LWLibavVideoSource(source_dir + "v120rc.avi", cache=false)
v120 = v120.convertToYV24(interlaced=false)

v120 = v120.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v120 = v120.removeDirt
v120 = v120.convertToYV12
v120 = v120.UnsharpMask(strength=300, radius=5, threshold=1)
v120 = v120.adjustBorders
v120 = v120.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v120.Prefetch(12)


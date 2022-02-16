LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v44 = LWLibavVideoSource(source_dir + "v44rc.avi", cache=false)
v44 = v44.convertToYV24(interlaced=false)

v44 = v44.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v44 = v44.removeDirt
v44 = v44.convertToYV12
v44 = v44.UnsharpMask(strength=300, radius=5, threshold=1)
v44 = v44.adjustBorders
v44 = v44.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v44.Prefetch(12)


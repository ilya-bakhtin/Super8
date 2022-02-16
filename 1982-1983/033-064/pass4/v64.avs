LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v64 = LWLibavVideoSource(source_dir + "v64rc.avi", cache=false)
v64 = v64.convertToYV24(interlaced=false)

v64 = v64.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v64 = v64.removeDirt
v64 = v64.convertToYV12
v64 = v64.UnsharpMask(strength=300, radius=5, threshold=1)
v64 = v64.adjustBorders
v64 = v64.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v64.Prefetch(12)


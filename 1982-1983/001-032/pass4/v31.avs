LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v31 = LWLibavVideoSource(source_dir + "v31rc.avi", cache=false)
v31 = v31.convertToYV24(interlaced=false)

v31 = v31.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v31 = v31.removeDirt
v31 = v31.convertToYV12
v31 = v31.UnsharpMask(strength=300, radius=5, threshold=1)
v31 = v31.adjustBorders
v31 = v31.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v31.Prefetch(12)


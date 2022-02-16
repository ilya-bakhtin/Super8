LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v169 = LWLibavVideoSource(source_dir + "v169rc.avi", cache=false)
v169 = v169.convertToYV24(interlaced=false)

v169 = v169.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v169 = v169.removeDirt
v169 = v169.convertToYV12
v169 = v169.UnsharpMask(strength=300, radius=5, threshold=1)
v169 = v169.adjustBorders
v169 = v169.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v169.Prefetch(12)


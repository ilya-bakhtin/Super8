LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v152 = LWLibavVideoSource(source_dir + "v152rc.avi", cache=false)
v152 = v152.convertToYV24(interlaced=false)

v152 = v152.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v152 = v152.removeDirt
v152 = v152.convertToYV12
v152 = v152.UnsharpMask(strength=300, radius=5, threshold=1)
v152 = v152.adjustBorders
v152 = v152.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v152.Prefetch(12)


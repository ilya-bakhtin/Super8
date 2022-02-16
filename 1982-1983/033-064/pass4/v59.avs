LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v59 = LWLibavVideoSource(source_dir + "v59rc.avi", cache=false)
v59 = v59.convertToYV24(interlaced=false)

v59 = v59.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v59 = v59.removeDirt
v59 = v59.convertToYV12
v59 = v59.UnsharpMask(strength=300, radius=5, threshold=1)
v59 = v59.adjustBorders
v59 = v59.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v59.Prefetch(12)


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v18 = LWLibavVideoSource(source_dir + "v18rc.avi", cache=false)
v18 = v18.convertToYV24(interlaced=false)

v18 = v18.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v18 = v18.removeDirt
v18 = v18.convertToYV12
v18 = v18.UnsharpMask(strength=300, radius=5, threshold=1)
v18 = v18.adjustBorders
v18 = v18.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v18.Prefetch(12)


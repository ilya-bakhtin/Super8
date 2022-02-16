LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v8 = LWLibavVideoSource(source_dir + "v8rc.avi", cache=false)
v8 = v8.convertToYV24(interlaced=false)

v8 = v8.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v8 = v8.removeDirt
v8 = v8.convertToYV12
v8 = v8.UnsharpMask(strength=300, radius=5, threshold=1)
v8 = v8.adjustBorders
v8 = v8.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v8.Prefetch(12)


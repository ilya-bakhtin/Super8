LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v72 = LWLibavVideoSource(source_dir + "v72rc.avi", cache=false)
v72 = v72.convertToYV24(interlaced=false)

v72 = v72.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v72 = v72.removeDirt
v72 = v72.convertToYV12
v72 = v72.UnsharpMask(strength=300, radius=5, threshold=1)
v72 = v72.adjustBorders
v72 = v72.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v72.Prefetch(12)


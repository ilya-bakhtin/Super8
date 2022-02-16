LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v194 = LWLibavVideoSource(source_dir + "v194rc.avi", cache=false)
v194 = v194.convertToYV24(interlaced=false)

v194 = v194.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v194 = v194.removeDirt
v194 = v194.convertToYV12
v194 = v194.UnsharpMask(strength=300, radius=5, threshold=1)
v194 = v194.adjustBorders
v194 = v194.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v194.Prefetch(12)


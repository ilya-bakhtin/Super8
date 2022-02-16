LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v134 = LWLibavVideoSource(source_dir + "v134rc.avi", cache=false)
v134 = v134.convertToYV24(interlaced=false)

v134 = v134.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v134 = v134.removeDirt
v134 = v134.convertToYV12
v134 = v134.UnsharpMask(strength=300, radius=5, threshold=1)
v134 = v134.adjustBorders
v134 = v134.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v134.Prefetch(12)


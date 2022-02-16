LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v189 = LWLibavVideoSource(source_dir + "v189rc.avi", cache=false)
v189 = v189.convertToYV24(interlaced=false)

v189 = v189.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v189 = v189.removeDirt
v189 = v189.convertToYV12
v189 = v189.UnsharpMask(strength=300, radius=5, threshold=1)
v189 = v189.adjustBorders
v189 = v189.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v189.Prefetch(12)


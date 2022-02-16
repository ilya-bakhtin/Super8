LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v191 = LWLibavVideoSource(source_dir + "v191rc.avi", cache=false)
v191 = v191.convertToYV24(interlaced=false)

v191 = v191.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v191 = v191.removeDirt
v191 = v191.convertToYV12
v191 = v191.UnsharpMask(strength=300, radius=5, threshold=1)
v191 = v191.adjustBorders
v191 = v191.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v191.Prefetch(12)


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v105 = LWLibavVideoSource(source_dir + "v105rc.avi", cache=false)
v105 = v105.convertToYV24(interlaced=false)

v105 = v105.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v105 = v105.removeDirt
v105 = v105.convertToYV12
v105 = v105.UnsharpMask(strength=300, radius=5, threshold=1)
v105 = v105.adjustBorders
v105 = v105.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v105.Prefetch(12)


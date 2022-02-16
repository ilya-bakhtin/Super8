LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v61 = LWLibavVideoSource(source_dir + "v61rc.avi", cache=false)
v61 = v61.convertToYV24(interlaced=false)

v61 = v61.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v61 = v61.removeDirt
v61 = v61.convertToYV12
v61 = v61.UnsharpMask(strength=300, radius=5, threshold=1)
v61 = v61.adjustBorders
v61 = v61.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v61.Prefetch(12)


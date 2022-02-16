LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v47 = LWLibavVideoSource(source_dir + "v47rc.avi", cache=false)
v47 = v47.convertToYV24(interlaced=false)

v47 = v47.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v47 = v47.removeDirt
v47 = v47.convertToYV12
v47 = v47.UnsharpMask(strength=300, radius=5, threshold=1)
v47 = v47.adjustBorders
v47 = v47.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v47.Prefetch(12)


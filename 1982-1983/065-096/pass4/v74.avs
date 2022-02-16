LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v74 = LWLibavVideoSource(source_dir + "v74rc.avi", cache=false)
v74 = v74.convertToYV24(interlaced=false)

v74 = v74.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v74 = v74.removeDirt
v74 = v74.convertToYV12
v74 = v74.UnsharpMask(strength=300, radius=5, threshold=1)
v74 = v74.adjustBorders
v74 = v74.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v74.Prefetch(12)


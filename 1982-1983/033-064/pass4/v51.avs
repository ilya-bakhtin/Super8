LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v51 = LWLibavVideoSource(source_dir + "v51rc.avi", cache=false)
v51 = v51.convertToYV24(interlaced=false)

v51 = v51.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v51 = v51.removeDirt
v51 = v51.convertToYV12
v51 = v51.UnsharpMask(strength=300, radius=5, threshold=1)
v51 = v51.adjustBorders
v51 = v51.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v51.Prefetch(12)


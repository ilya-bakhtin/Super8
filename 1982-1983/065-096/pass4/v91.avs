LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v91 = LWLibavVideoSource(source_dir + "v91rc.avi", cache=false)
v91 = v91.convertToYV24(interlaced=false)

v91 = v91.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v91 = v91.removeDirt
v91 = v91.convertToYV12
v91 = v91.UnsharpMask(strength=300, radius=5, threshold=1)
v91 = v91.adjustBorders
v91 = v91.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v91.Prefetch(12)


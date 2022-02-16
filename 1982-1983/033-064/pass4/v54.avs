LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v54 = LWLibavVideoSource(source_dir + "v54rc.avi", cache=false)
v54 = v54.convertToYV24(interlaced=false)

v54 = v54.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v54 = v54.removeDirt
v54 = v54.convertToYV12
v54 = v54.UnsharpMask(strength=300, radius=5, threshold=1)
v54 = v54.adjustBorders
v54 = v54.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v54.Prefetch(12)


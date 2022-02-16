LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v124 = LWLibavVideoSource(source_dir + "v124rc.avi", cache=false)
v124 = v124.convertToYV24(interlaced=false)

v124 = v124.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v124 = v124.removeDirt
v124 = v124.convertToYV12
v124 = v124.UnsharpMask(strength=300, radius=5, threshold=1)
v124 = v124.adjustBorders
v124 = v124.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v124.Prefetch(12)


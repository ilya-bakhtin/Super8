LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v94 = LWLibavVideoSource(source_dir + "v94rc.avi", cache=false)
v94 = v94.convertToYV24(interlaced=false)

v94 = v94.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v94 = v94.removeDirt
v94 = v94.convertToYV12
v94 = v94.UnsharpMask(strength=300, radius=5, threshold=1)
v94 = v94.adjustBorders
v94 = v94.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v94.Prefetch(12)


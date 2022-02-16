LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v190 = LWLibavVideoSource(source_dir + "v190rc.avi", cache=false)
v190 = v190.convertToYV24(interlaced=false)

v190 = v190.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v190 = v190.removeDirt
v190 = v190.convertToYV12
v190 = v190.UnsharpMask(strength=300, radius=5, threshold=1)
v190 = v190.adjustBorders
v190 = v190.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v190.Prefetch(12)


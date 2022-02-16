LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v153 = LWLibavVideoSource(source_dir + "v153rc.avi", cache=false)
v153 = v153.convertToYV24(interlaced=false)

v153 = v153.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v153 = v153.removeDirt
v153 = v153.convertToYV12
v153 = v153.UnsharpMask(strength=300, radius=5, threshold=1)
v153 = v153.adjustBorders
v153 = v153.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v153.Prefetch(12)


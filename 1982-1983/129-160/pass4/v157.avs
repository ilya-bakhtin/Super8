LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v157 = LWLibavVideoSource(source_dir + "v157rc.avi", cache=false)
v157 = v157.convertToYV24(interlaced=false)

v157 = v157.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v157 = v157.removeDirt
v157 = v157.convertToYV12
v157 = v157.UnsharpMask(strength=300, radius=5, threshold=1)
v157 = v157.adjustBorders
v157 = v157.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v157.Prefetch(12)


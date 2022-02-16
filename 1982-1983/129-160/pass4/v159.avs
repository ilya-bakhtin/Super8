LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v159 = LWLibavVideoSource(source_dir + "v159rc.avi", cache=false)
v159 = v159.convertToYV24(interlaced=false)

v159 = v159.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v159 = v159.removeDirt
v159 = v159.convertToYV12
v159 = v159.UnsharpMask(strength=300, radius=5, threshold=1)
v159 = v159.adjustBorders
v159 = v159.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v159.Prefetch(12)


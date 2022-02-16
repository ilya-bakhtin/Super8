LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v102 = LWLibavVideoSource(source_dir + "v102rc.avi", cache=false)
v102 = v102.convertToYV24(interlaced=false)

v102 = v102.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v102 = v102.removeDirt
v102 = v102.convertToYV12
v102 = v102.UnsharpMask(strength=300, radius=5, threshold=1)
v102 = v102.adjustBorders
v102 = v102.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v102.Prefetch(12)


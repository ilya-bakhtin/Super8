LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v170 = LWLibavVideoSource(source_dir + "v170rc.avi", cache=false)
v170 = v170.convertToYV24(interlaced=false)

v170 = v170.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v170 = v170.removeDirt
v170 = v170.convertToYV12
v170 = v170.UnsharpMask(strength=300, radius=5, threshold=1)
v170 = v170.adjustBorders
v170 = v170.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v170.Prefetch(12)


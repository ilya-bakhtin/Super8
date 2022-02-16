LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v175 = LWLibavVideoSource(source_dir + "v175rc.avi", cache=false)
v175 = v175.convertToYV24(interlaced=false)

v175 = v175.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v175 = v175.removeDirt
v175 = v175.convertToYV12
v175 = v175.UnsharpMask(strength=300, radius=5, threshold=1)
v175 = v175.adjustBorders
v175 = v175.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v175.Prefetch(12)


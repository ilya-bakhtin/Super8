LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v158 = LWLibavVideoSource(source_dir + "v158rc.avi", cache=false)
v158 = v158.convertToYV24(interlaced=false)

v158 = v158.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v158 = v158.removeDirt
v158 = v158.convertToYV12
v158 = v158.UnsharpMask(strength=300, radius=5, threshold=1)
v158 = v158.adjustBorders
v158 = v158.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v158.Prefetch(12)


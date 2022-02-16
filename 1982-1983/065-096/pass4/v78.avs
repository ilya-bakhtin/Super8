LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v78 = LWLibavVideoSource(source_dir + "v78rc.avi", cache=false)
v78 = v78.convertToYV24(interlaced=false)

v78 = v78.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v78 = v78.removeDirt
v78 = v78.convertToYV12
v78 = v78.UnsharpMask(strength=300, radius=5, threshold=1)
v78 = v78.adjustBorders
v78 = v78.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v78.Prefetch(12)


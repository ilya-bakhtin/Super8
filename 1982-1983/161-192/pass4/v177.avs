LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v177 = LWLibavVideoSource(source_dir + "v177rc.avi", cache=false)
v177 = v177.convertToYV24(interlaced=false)

v177 = v177.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v177 = v177.removeDirt
v177 = v177.convertToYV12
v177 = v177.UnsharpMask(strength=300, radius=5, threshold=1)
v177 = v177.adjustBorders
v177 = v177.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v177.Prefetch(12)


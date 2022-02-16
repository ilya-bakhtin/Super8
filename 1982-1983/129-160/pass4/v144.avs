LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v144 = LWLibavVideoSource(source_dir + "v144rc.avi", cache=false)
v144 = v144.convertToYV24(interlaced=false)

v144 = v144.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v144 = v144.removeDirt
v144 = v144.convertToYV12
v144 = v144.UnsharpMask(strength=300, radius=5, threshold=1)
v144 = v144.adjustBorders
v144 = v144.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v144.Prefetch(12)


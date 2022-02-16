LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v81 = LWLibavVideoSource(source_dir + "v81rc.avi", cache=false)
v81 = v81.convertToYV24(interlaced=false)

v81 = v81.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v81 = v81.removeDirt
v81 = v81.convertToYV12
v81 = v81.UnsharpMask(strength=300, radius=5, threshold=1)
v81 = v81.adjustBorders
v81 = v81.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v81.Prefetch(12)


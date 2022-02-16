LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v161 = LWLibavVideoSource(source_dir + "v161rc.avi", cache=false)
v161 = v161.convertToYV24(interlaced=false)

v161 = v161.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v161 = v161.removeDirt
v161 = v161.convertToYV12
v161 = v161.UnsharpMask(strength=300, radius=5, threshold=1)
v161 = v161.adjustBorders
v161 = v161.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v161.Prefetch(12)


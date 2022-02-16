LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v184 = LWLibavVideoSource(source_dir + "v184rc.avi", cache=false)
v184 = v184.convertToYV24(interlaced=false)

v184 = v184.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v184 = v184.removeDirt
v184 = v184.convertToYV12
v184 = v184.UnsharpMask(strength=300, radius=5, threshold=1)
v184 = v184.adjustBorders
v184 = v184.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v184.Prefetch(12)


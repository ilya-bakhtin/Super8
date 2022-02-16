LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v67 = LWLibavVideoSource(source_dir + "v67rc.avi", cache=false)
v67 = v67.convertToYV24(interlaced=false)

v67 = v67.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v67 = v67.removeDirt
v67 = v67.convertToYV12
v67 = v67.UnsharpMask(strength=300, radius=5, threshold=1)
v67 = v67.adjustBorders
v67 = v67.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v67.Prefetch(12)


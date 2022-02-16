LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v53 = LWLibavVideoSource(source_dir + "v53rc.avi", cache=false)
v53 = v53.convertToYV24(interlaced=false)

v53 = v53.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v53 = v53.removeDirt
v53 = v53.convertToYV12
v53 = v53.UnsharpMask(strength=300, radius=5, threshold=1)
v53 = v53.adjustBorders
v53 = v53.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v53.Prefetch(12)


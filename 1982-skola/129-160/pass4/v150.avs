LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v150 = LWLibavVideoSource(source_dir + "v150rc.avi", cache=false)
v150 = v150.convertToYV24(interlaced=false)

v150 = v150.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v150 = v150.removeDirt
v150 = v150.convertToYV12
v150 = v150.UnsharpMask(strength=400, radius=7, threshold=1)
v150 = v150.adjustBorders
#v150 = v150.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v150 = v150.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v150.Prefetch(12)


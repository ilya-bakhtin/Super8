LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v68 = LWLibavVideoSource(source_dir + "v68rc.avi", cache=false)
v68 = v68.convertToYV24(interlaced=false)

v68 = v68.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v68 = v68.removeDirt
v68 = v68.convertToYV12
v68 = v68.UnsharpMask(strength=400, radius=7, threshold=1)
v68 = v68.adjustBorders
#v68 = v68.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v68 = v68.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v68.Prefetch(12)


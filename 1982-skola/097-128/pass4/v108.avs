LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v108 = LWLibavVideoSource(source_dir + "v108rc.avi", cache=false)
v108 = v108.convertToYV24(interlaced=false)

v108 = v108.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v108 = v108.removeDirt
v108 = v108.convertToYV12
v108 = v108.UnsharpMask(strength=400, radius=7, threshold=1)
v108 = v108.adjustBorders
#v108 = v108.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v108 = v108.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v108.Prefetch(12)


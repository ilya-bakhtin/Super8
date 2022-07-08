LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v152 = LWLibavVideoSource(source_dir + "v152rc.avi", cache=false)
v152 = v152.convertToYV24(interlaced=false)

v152 = v152.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v152 = v152.removeDirt
v152 = v152.convertToYV12
v152 = v152.UnsharpMask(strength=400, radius=7, threshold=1)
v152 = v152.adjustBorders
#v152 = v152.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v152 = v152.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v152.Prefetch(12)


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v121 = LWLibavVideoSource(source_dir + "v121rc.avi", cache=false)
v121 = v121.convertToYV24(interlaced=false)

v121 = v121.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v121 = v121.removeDirt
v121 = v121.convertToYV12
v121 = v121.UnsharpMask(strength=400, radius=7, threshold=1)
v121 = v121.adjustBorders
#v121 = v121.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v121 = v121.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v121.Prefetch(12)


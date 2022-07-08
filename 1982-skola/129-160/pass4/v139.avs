LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v139 = LWLibavVideoSource(source_dir + "v139rc.avi", cache=false)
v139 = v139.convertToYV24(interlaced=false)

v139 = v139.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v139 = v139.removeDirt
v139 = v139.convertToYV12
v139 = v139.UnsharpMask(strength=400, radius=7, threshold=1)
v139 = v139.adjustBorders
#v139 = v139.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v139 = v139.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v139.Prefetch(12)


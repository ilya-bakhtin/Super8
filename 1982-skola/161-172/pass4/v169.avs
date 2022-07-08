LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v169 = LWLibavVideoSource(source_dir + "v169rc.avi", cache=false)
v169 = v169.convertToYV24(interlaced=false)

v169 = v169.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v169 = v169.removeDirt
v169 = v169.convertToYV12
v169 = v169.UnsharpMask(strength=400, radius=7, threshold=1)
v169 = v169.adjustBorders
#v169 = v169.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v169 = v169.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v169.Prefetch(12)


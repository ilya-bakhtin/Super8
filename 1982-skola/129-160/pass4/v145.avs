LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v145 = LWLibavVideoSource(source_dir + "v145rc.avi", cache=false)
v145 = v145.convertToYV24(interlaced=false)

v145 = v145.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v145 = v145.removeDirt
v145 = v145.convertToYV12
v145 = v145.UnsharpMask(strength=400, radius=7, threshold=1)
v145 = v145.adjustBorders
#v145 = v145.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v145 = v145.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v145.Prefetch(12)


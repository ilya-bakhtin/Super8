LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v135 = LWLibavVideoSource(source_dir + "v135rc.avi", cache=false)
v135 = v135.convertToYV24(interlaced=false)

v135 = v135.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v135 = v135.removeDirt
v135 = v135.convertToYV12
v135 = v135.UnsharpMask(strength=400, radius=7, threshold=1)
v135 = v135.adjustBorders
#v135 = v135.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v135 = v135.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v135.Prefetch(12)


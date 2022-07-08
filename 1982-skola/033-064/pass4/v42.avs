LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v42 = LWLibavVideoSource(source_dir + "v42rc.avi", cache=false)
v42 = v42.convertToYV24(interlaced=false)

v42 = v42.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v42 = v42.removeDirt
v42 = v42.convertToYV12
v42 = v42.UnsharpMask(strength=400, radius=7, threshold=1)
v42 = v42.adjustBorders
#v42 = v42.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v42 = v42.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v42.Prefetch(12)


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v59 = LWLibavVideoSource(source_dir + "v59rc.avi", cache=false)
v59 = v59.convertToYV24(interlaced=false)

v59 = v59.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v59 = v59.removeDirt
v59 = v59.convertToYV12
v59 = v59.UnsharpMask(strength=400, radius=7, threshold=1)
v59 = v59.adjustBorders
#v59 = v59.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v59 = v59.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v59.Prefetch(12)


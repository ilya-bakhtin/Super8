LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v132 = LWLibavVideoSource(source_dir + "v132rc.avi", cache=false)
v132 = v132.convertToYV24(interlaced=false)

v132 = v132.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v132 = v132.removeDirt
v132 = v132.convertToYV12
v132 = v132.UnsharpMask(strength=400, radius=7, threshold=1)
v132 = v132.adjustBorders
#v132 = v132.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v132 = v132.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v132.Prefetch(12)


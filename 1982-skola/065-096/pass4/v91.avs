LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v91 = LWLibavVideoSource(source_dir + "v91rc.avi", cache=false)
v91 = v91.convertToYV24(interlaced=false)

v91 = v91.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v91 = v91.removeDirt
v91 = v91.convertToYV12
v91 = v91.UnsharpMask(strength=400, radius=7, threshold=1)
v91 = v91.adjustBorders
#v91 = v91.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v91 = v91.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v91.Prefetch(12)


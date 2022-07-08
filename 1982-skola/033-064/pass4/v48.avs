LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v48 = LWLibavVideoSource(source_dir + "v48rc.avi", cache=false)
v48 = v48.convertToYV24(interlaced=false)

v48 = v48.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v48 = v48.removeDirt
v48 = v48.convertToYV12
v48 = v48.UnsharpMask(strength=400, radius=7, threshold=1)
v48 = v48.adjustBorders
#v48 = v48.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v48 = v48.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v48.Prefetch(12)


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v54 = LWLibavVideoSource(source_dir + "v54rc.avi", cache=false)
v54 = v54.convertToYV24(interlaced=false)

v54 = v54.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v54 = v54.removeDirt
v54 = v54.convertToYV12
v54 = v54.UnsharpMask(strength=400, radius=7, threshold=1)
v54 = v54.adjustBorders
#v54 = v54.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v54 = v54.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v54.Prefetch(12)


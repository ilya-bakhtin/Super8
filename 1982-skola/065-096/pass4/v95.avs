LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v95 = LWLibavVideoSource(source_dir + "v95rc.avi", cache=false)
v95 = v95.convertToYV24(interlaced=false)

v95 = v95.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v95 = v95.removeDirt
v95 = v95.convertToYV12
v95 = v95.UnsharpMask(strength=400, radius=7, threshold=1)
v95 = v95.adjustBorders
#v95 = v95.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v95 = v95.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v95.Prefetch(12)


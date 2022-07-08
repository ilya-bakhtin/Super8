LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v107 = LWLibavVideoSource(source_dir + "v107rc.avi", cache=false)
v107 = v107.convertToYV24(interlaced=false)

v107 = v107.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v107 = v107.removeDirt
v107 = v107.convertToYV12
v107 = v107.UnsharpMask(strength=400, radius=7, threshold=1)
v107 = v107.adjustBorders
#v107 = v107.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v107 = v107.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v107.Prefetch(12)


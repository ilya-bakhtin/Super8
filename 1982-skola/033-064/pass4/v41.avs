LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v41 = LWLibavVideoSource(source_dir + "v41rc.avi", cache=false)
v41 = v41.convertToYV24(interlaced=false)

v41 = v41.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v41 = v41.removeDirt
v41 = v41.convertToYV12
v41 = v41.UnsharpMask(strength=400, radius=7, threshold=1)
v41 = v41.adjustBorders
#v41 = v41.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v41 = v41.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v41.Prefetch(12)


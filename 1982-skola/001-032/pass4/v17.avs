LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v17 = LWLibavVideoSource(source_dir + "v17rc.avi", cache=false)
v17 = v17.convertToYV24(interlaced=false)

v17 = v17.Filter(th_SAD=200, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v17 = v17.removeDirt
v17 = v17.convertToYV12
v17 = v17.UnsharpMask(strength=400, radius=7, threshold=1)
v17 = v17.adjustBorders
#v17 = v17.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v17.Prefetch(12)


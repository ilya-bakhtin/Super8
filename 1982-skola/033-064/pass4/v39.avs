LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v39 = LWLibavVideoSource(source_dir + "v39rc.avi", cache=false)
v39 = v39.convertToYV24(interlaced=false)

v39 = v39.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v39 = v39.removeDirt
v39 = v39.convertToYV12
v39 = v39.UnsharpMask(strength=400, radius=7, threshold=1)
v39 = v39.adjustBorders
#v39 = v39.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v39 = v39.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v39.Prefetch(12)


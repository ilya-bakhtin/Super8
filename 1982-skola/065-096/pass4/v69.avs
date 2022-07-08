LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v69 = LWLibavVideoSource(source_dir + "v69rc.avi", cache=false)
v69 = v69.convertToYV24(interlaced=false)

v69 = v69.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v69 = v69.removeDirt
v69 = v69.convertToYV12
v69 = v69.UnsharpMask(strength=400, radius=7, threshold=1)
v69 = v69.adjustBorders
#v69 = v69.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v69 = v69.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v69.Prefetch(12)


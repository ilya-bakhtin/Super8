LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v130 = LWLibavVideoSource(source_dir + "v130rc.avi", cache=false)
v130 = v130.convertToYV24(interlaced=false)

v130 = v130.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v130 = v130.removeDirt
v130 = v130.convertToYV12
v130 = v130.UnsharpMask(strength=400, radius=7, threshold=1)
v130 = v130.adjustBorders
#v130 = v130.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v130 = v130.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v130.Prefetch(12)


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v65 = LWLibavVideoSource(source_dir + "v65rc.avi", cache=false)
v65 = v65.convertToYV24(interlaced=false)

v65 = v65.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v65 = v65.removeDirt
v65 = v65.convertToYV12
v65 = v65.UnsharpMask(strength=400, radius=7, threshold=1)
v65 = v65.adjustBorders
#v65 = v65.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v65 = v65.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v65.Prefetch(12)


LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v100 = LWLibavVideoSource(source_dir + "v100rc.avi", cache=false)
v100 = v100.convertToYV24(interlaced=false)

v100 = v100.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v100 = v100.removeDirt
v100 = v100.convertToYV12
v100 = v100.UnsharpMask(strength=400, radius=7, threshold=1)
v100 = v100.adjustBorders
#v100 = v100.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v100 = v100.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v100.Prefetch(12)


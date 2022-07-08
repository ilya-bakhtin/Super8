LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v56 = LWLibavVideoSource(source_dir + "v56rc.avi", cache=false)
v56 = v56.convertToYV24(interlaced=false)

v56 = v56.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v56 = v56.removeDirt
v56 = v56.convertToYV12
v56 = v56.UnsharpMask(strength=400, radius=7, threshold=1)
v56 = v56.adjustBorders
#v56 = v56.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v56 = v56.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v56.Prefetch(12)


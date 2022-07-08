LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v35 = LWLibavVideoSource(source_dir + "v35rc.avi", cache=false)
v35 = v35.convertToYV24(interlaced=false)

v35 = v35.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v35 = v35.removeDirt
v35 = v35.convertToYV12
v35 = v35.UnsharpMask(strength=400, radius=7, threshold=1)
v35 = v35.adjustBorders
#v35 = v35.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v35 = v35.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v35.Prefetch(12)


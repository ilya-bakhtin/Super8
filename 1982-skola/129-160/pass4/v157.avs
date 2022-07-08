LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v157 = LWLibavVideoSource(source_dir + "v157rc.avi", cache=false)
v157 = v157.convertToYV24(interlaced=false)

v157 = v157.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v157 = v157.removeDirt
v157 = v157.convertToYV12
v157 = v157.UnsharpMask(strength=400, radius=7, threshold=1)
v157 = v157.adjustBorders
#v157 = v157.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v157 = v157.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v157.Prefetch(12)


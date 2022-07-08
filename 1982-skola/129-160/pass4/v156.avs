LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v156 = LWLibavVideoSource(source_dir + "v156rc.avi", cache=false)
v156 = v156.convertToYV24(interlaced=false)

v156 = v156.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v156 = v156.removeDirt
v156 = v156.convertToYV12
v156 = v156.UnsharpMask(strength=400, radius=7, threshold=1)
v156 = v156.adjustBorders
#v156 = v156.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v156 = v156.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v156.Prefetch(12)


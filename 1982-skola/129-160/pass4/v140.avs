LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v140 = LWLibavVideoSource(source_dir + "v140rc.avi", cache=false)
v140 = v140.convertToYV24(interlaced=false)

v140 = v140.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v140 = v140.removeDirt
v140 = v140.convertToYV12
v140 = v140.UnsharpMask(strength=400, radius=7, threshold=1)
v140 = v140.adjustBorders
#v140 = v140.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v140 = v140.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v140.Prefetch(12)


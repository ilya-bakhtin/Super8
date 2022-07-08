LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v36 = LWLibavVideoSource(source_dir + "v36rc.avi", cache=false)
v36 = v36.convertToYV24(interlaced=false)

v36 = v36.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v36 = v36.removeDirt
v36 = v36.convertToYV12
v36 = v36.UnsharpMask(strength=400, radius=7, threshold=1)
v36 = v36.adjustBorders
#v36 = v36.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v36 = v36.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v36.Prefetch(12)


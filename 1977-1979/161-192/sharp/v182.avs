import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v182 = LSMASHVideoSource(dst_dir + "v182rc.mp4")

v182 = v182.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v182 = v182.convertToYV12(interlaced=false)

v182 = v182.UnsharpMask(strength=500, radius=5, threshold=1)
v182 = v182.adjustBorders

va = BlankClip(v182, audio_rate = 48000, channels = 2).killVideo
v182 = v182.audioDub(va)

return v182.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v205 = LSMASHVideoSource(dst_dir + "v205rc.mp4")

v205 = v205.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v205 = v205.convertToYV12(interlaced=false)

v205 = v205.UnsharpMask(strength=500, radius=5, threshold=1)
v205 = v205.adjustBorders

va = BlankClip(v205, audio_rate = 48000, channels = 2).killVideo
v205 = v205.audioDub(va)

return v205.Prefetch


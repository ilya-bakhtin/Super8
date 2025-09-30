import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v146 = LSMASHVideoSource(dst_dir + "v146rc.mp4")

v146 = v146.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v146 = v146.convertToYV12(interlaced=false)

v146 = v146.UnsharpMask(strength=500, radius=5, threshold=1)
v146 = v146.adjustBorders

va = BlankClip(v146, audio_rate = 48000, channels = 2).killVideo
v146 = v146.audioDub(va)

return v146.Prefetch


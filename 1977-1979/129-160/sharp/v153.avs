import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v153 = LSMASHVideoSource(dst_dir + "v153rc.mp4")

v153 = v153.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v153 = v153.convertToYV12(interlaced=false)

v153 = v153.UnsharpMask(strength=500, radius=5, threshold=1)
v153 = v153.adjustBorders

va = BlankClip(v153, audio_rate = 48000, channels = 2).killVideo
v153 = v153.audioDub(va)

return v153.Prefetch


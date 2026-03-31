import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v349 = LSMASHVideoSource(dst_dir + "v349rc.mp4")

v349 = v349.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v349 = v349.convertToYV12(interlaced=false)

v349 = v349.UnsharpMask(strength=500, radius=5, threshold=1)
v349 = v349.adjustBorders

va = BlankClip(v349, audio_rate = 48000, channels = 2).killVideo
v349 = v349.audioDub(va)

return v349.Prefetch


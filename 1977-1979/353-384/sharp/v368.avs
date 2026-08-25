import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v368 = LSMASHVideoSource(dst_dir + "v368rc.mp4")

v368 = v368.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v368 = v368.convertToYV12(interlaced=false)

v368 = v368.UnsharpMask(strength=500, radius=5, threshold=1)
v368 = v368.adjustBorders

va = BlankClip(v368, audio_rate = 48000, channels = 2).killVideo
v368 = v368.audioDub(va)

return v368.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v217 = LSMASHVideoSource(dst_dir + "v217rc.mp4")

v217 = v217.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v217 = v217.convertToYV12(interlaced=false)

v217 = v217.UnsharpMask(strength=500, radius=5, threshold=1)
v217 = v217.adjustBorders

va = BlankClip(v217, audio_rate = 48000, channels = 2).killVideo
v217 = v217.audioDub(va)

return v217.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v92 = LSMASHVideoSource(dst_dir + "v92rc.mp4")

v92 = v92.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v92 = v92.convertToYV12(interlaced=false)

v92 = v92.UnsharpMask(strength=500, radius=5, threshold=1)
v92 = v92.adjustBorders

va = BlankClip(v92, audio_rate = 48000, channels = 2).killVideo
v92 = v92.audioDub(va)

return v92.Prefetch


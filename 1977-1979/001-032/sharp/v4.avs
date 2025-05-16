import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v4 = LSMASHVideoSource(dst_dir + "v4rc.mp4")

v4 = v4.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v4 = v4.convertToYV12(interlaced=false)

v4 = v4.UnsharpMask(strength=500, radius=5, threshold=1)
v4 = v4.adjustBorders

va = BlankClip(v4, audio_rate = 48000, channels = 2).killVideo
v4 = v4.audioDub(va)

return v4.Prefetch


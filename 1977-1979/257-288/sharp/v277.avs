import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v277 = LSMASHVideoSource(dst_dir + "v277rc.mp4")

v277 = v277.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v277 = v277.convertToYV12(interlaced=false)

v277 = v277.UnsharpMask(strength=500, radius=5, threshold=1)
v277 = v277.adjustBorders

va = BlankClip(v277, audio_rate = 48000, channels = 2).killVideo
v277 = v277.audioDub(va)

return v277.Prefetch


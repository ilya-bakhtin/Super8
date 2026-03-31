import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v263 = LSMASHVideoSource(dst_dir + "v263rc.mp4")

v263 = v263.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v263 = v263.convertToYV12(interlaced=false)

v263 = v263.UnsharpMask(strength=500, radius=5, threshold=1)
v263 = v263.adjustBorders

va = BlankClip(v263, audio_rate = 48000, channels = 2).killVideo
v263 = v263.audioDub(va)

return v263.Prefetch


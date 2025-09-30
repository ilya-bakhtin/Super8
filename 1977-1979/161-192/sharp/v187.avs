import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v187 = LSMASHVideoSource(dst_dir + "v187rc.mp4")

v187 = v187.Filter(th_SAD=400, th_SADC=400, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v187 = v187.convertToYV12(interlaced=false)

v187 = v187.UnsharpMask(strength=500, radius=5, threshold=1)
v187 = v187.adjustBorders

va = BlankClip(v187, audio_rate = 48000, channels = 2).killVideo
v187 = v187.audioDub(va)

return v187.Prefetch


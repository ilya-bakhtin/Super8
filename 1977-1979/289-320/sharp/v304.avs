import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v304 = LSMASHVideoSource(dst_dir + "v304rc.mp4")

v304 = v304.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v304 = v304.convertToYV12(interlaced=false)

v304 = v304.UnsharpMask(strength=500, radius=5, threshold=1)
v304 = v304.adjustBorders

va = BlankClip(v304, audio_rate = 48000, channels = 2).killVideo
v304 = v304.audioDub(va)

return v304.Prefetch


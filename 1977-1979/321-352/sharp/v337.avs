import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v337 = LSMASHVideoSource(dst_dir + "v337rc.mp4")

v337 = v337.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v337 = v337.convertToYV12(interlaced=false)

v337 = v337.UnsharpMask(strength=500, radius=5, threshold=1)
v337 = v337.adjustBorders

va = BlankClip(v337, audio_rate = 48000, channels = 2).killVideo
v337 = v337.audioDub(va)

return v337.Prefetch


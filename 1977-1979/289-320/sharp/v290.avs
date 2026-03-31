import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v290 = LSMASHVideoSource(dst_dir + "v290rc.mp4")

v290 = v290.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v290 = v290.convertToYV12(interlaced=false)

v290 = v290.UnsharpMask(strength=500, radius=5, threshold=1)
v290 = v290.adjustBorders

va = BlankClip(v290, audio_rate = 48000, channels = 2).killVideo
v290 = v290.audioDub(va)

return v290.Prefetch


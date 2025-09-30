import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v190 = LSMASHVideoSource(dst_dir + "v190rc.mp4")

v190 = v190.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v190 = v190.convertToYV12(interlaced=false)

v190 = v190.UnsharpMask(strength=500, radius=5, threshold=1)
v190 = v190.adjustBorders

va = BlankClip(v190, audio_rate = 48000, channels = 2).killVideo
v190 = v190.audioDub(va)

return v190.Prefetch


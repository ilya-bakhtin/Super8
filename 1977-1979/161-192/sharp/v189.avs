import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v189 = LSMASHVideoSource(dst_dir + "v189rc.mp4")

v189 = v189.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v189 = v189.convertToYV12(interlaced=false)

v189 = v189.UnsharpMask(strength=500, radius=5, threshold=1)
v189 = v189.adjustBorders

va = BlankClip(v189, audio_rate = 48000, channels = 2).killVideo
v189 = v189.audioDub(va)

return v189.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v171 = LSMASHVideoSource(dst_dir + "v171rc.mp4")

v171 = v171.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v171 = v171.convertToYV12(interlaced=false)

v171 = v171.UnsharpMask(strength=500, radius=5, threshold=1)
v171 = v171.adjustBorders

va = BlankClip(v171, audio_rate = 48000, channels = 2).killVideo
v171 = v171.audioDub(va)

return v171.Prefetch


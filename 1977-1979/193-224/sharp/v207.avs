import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v207 = LSMASHVideoSource(dst_dir + "v207rc.mp4")

v207 = v207.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v207 = v207.convertToYV12(interlaced=false)

v207 = v207.UnsharpMask(strength=500, radius=5, threshold=1)
v207 = v207.adjustBorders

va = BlankClip(v207, audio_rate = 48000, channels = 2).killVideo
v207 = v207.audioDub(va)

return v207.Prefetch


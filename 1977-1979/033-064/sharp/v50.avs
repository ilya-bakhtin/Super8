import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v50 = LSMASHVideoSource(dst_dir + "v50rc.mp4")

v50 = v50.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v50 = v50.convertToYV12(interlaced=false)

v50 = v50.UnsharpMask(strength=500, radius=5, threshold=1)
v50 = v50.adjustBorders

va = BlankClip(v50, audio_rate = 48000, channels = 2).killVideo
v50 = v50.audioDub(va)

return v50.Prefetch


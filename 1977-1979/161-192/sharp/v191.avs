import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v191 = LSMASHVideoSource(dst_dir + "v191rc.mp4")

v191 = v191.Filter(th_SAD=400, th_SADC=400, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v191 = v191.convertToYV12(interlaced=false)

v191 = v191.UnsharpMask(strength=500, radius=5, threshold=1)
v191 = v191.adjustBorders

va = BlankClip(v191, audio_rate = 48000, channels = 2).killVideo
v191 = v191.audioDub(va)

return v191.Prefetch


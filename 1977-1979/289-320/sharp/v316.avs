import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v316 = LSMASHVideoSource(dst_dir + "v316rc.mp4")

v316 = v316.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v316 = v316.convertToYV12(interlaced=false)

v316 = v316.UnsharpMask(strength=500, radius=5, threshold=1)
v316 = v316.adjustBorders

va = BlankClip(v316, audio_rate = 48000, channels = 2).killVideo
v316 = v316.audioDub(va)

return v316.Prefetch


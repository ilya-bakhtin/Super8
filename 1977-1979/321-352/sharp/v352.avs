import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v352 = LSMASHVideoSource(dst_dir + "v352rc.mp4")

v352 = v352.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v352 = v352.convertToYV12(interlaced=false)

v352 = v352.UnsharpMask(strength=500, radius=5, threshold=1)
v352 = v352.adjustBorders

va = BlankClip(v352, audio_rate = 48000, channels = 2).killVideo
v352 = v352.audioDub(va)

return v352.Prefetch


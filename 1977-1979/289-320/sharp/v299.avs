import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v299 = LSMASHVideoSource(dst_dir + "v299rc.mp4")

v299 = v299.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v299 = v299.convertToYV12(interlaced=false)

v299 = v299.UnsharpMask(strength=500, radius=5, threshold=1)
v299 = v299.adjustBorders

va = BlankClip(v299, audio_rate = 48000, channels = 2).killVideo
v299 = v299.audioDub(va)

return v299.Prefetch


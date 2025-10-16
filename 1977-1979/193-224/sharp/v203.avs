import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v203 = LSMASHVideoSource(dst_dir + "v203rc.mp4")

v203 = v203.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v203 = v203.convertToYV12(interlaced=false)

v203 = v203.UnsharpMask(strength=500, radius=5, threshold=1)
v203 = v203.adjustBorders

va = BlankClip(v203, audio_rate = 48000, channels = 2).killVideo
v203 = v203.audioDub(va)

return v203.Prefetch


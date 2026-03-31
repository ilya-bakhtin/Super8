import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v280 = LSMASHVideoSource(dst_dir + "v280rc.mp4")

v280 = v280.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v280 = v280.convertToYV12(interlaced=false)

v280 = v280.UnsharpMask(strength=500, radius=5, threshold=1)
v280 = v280.adjustBorders

va = BlankClip(v280, audio_rate = 48000, channels = 2).killVideo
v280 = v280.audioDub(va)

return v280.Prefetch


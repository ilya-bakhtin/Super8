import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v266 = LSMASHVideoSource(dst_dir + "v266rc.mp4")

v266 = v266.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v266 = v266.convertToYV12(interlaced=false)

v266 = v266.UnsharpMask(strength=500, radius=5, threshold=1)
v266 = v266.adjustBorders

va = BlankClip(v266, audio_rate = 48000, channels = 2).killVideo
v266 = v266.audioDub(va)

return v266.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v358 = LSMASHVideoSource(dst_dir + "v358rc.mp4")

v358 = v358.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v358 = v358.convertToYV12(interlaced=false)

v358 = v358.UnsharpMask(strength=500, radius=5, threshold=1)
v358 = v358.adjustBorders

va = BlankClip(v358, audio_rate = 48000, channels = 2).killVideo
v358 = v358.audioDub(va)

return v358.Prefetch


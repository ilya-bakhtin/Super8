import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v296 = LSMASHVideoSource(dst_dir + "v296rc.mp4")

v296 = v296.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v296 = v296.convertToYV12(interlaced=false)

v296 = v296.UnsharpMask(strength=500, radius=5, threshold=1)
v296 = v296.adjustBorders

va = BlankClip(v296, audio_rate = 48000, channels = 2).killVideo
v296 = v296.audioDub(va)

return v296.Prefetch


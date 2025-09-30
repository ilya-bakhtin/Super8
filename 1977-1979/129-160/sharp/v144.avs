import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v144 = LSMASHVideoSource(dst_dir + "v144rc.mp4")

v144 = v144.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v144 = v144.convertToYV12(interlaced=false)

v144 = v144.UnsharpMask(strength=500, radius=5, threshold=1)
v144 = v144.adjustBorders

va = BlankClip(v144, audio_rate = 48000, channels = 2).killVideo
v144 = v144.audioDub(va)

return v144.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v334 = LSMASHVideoSource(dst_dir + "v334rc.mp4")

v334 = v334.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v334 = v334.convertToYV12(interlaced=false)

v334 = v334.UnsharpMask(strength=500, radius=5, threshold=1)
v334 = v334.adjustBorders

va = BlankClip(v334, audio_rate = 48000, channels = 2).killVideo
v334 = v334.audioDub(va)

return v334.Prefetch


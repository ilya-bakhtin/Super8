import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v371 = LSMASHVideoSource(dst_dir + "v371rc.mp4")

v371 = v371.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v371 = v371.convertToYV12(interlaced=false)

v371 = v371.UnsharpMask(strength=500, radius=5, threshold=1)
v371 = v371.adjustBorders

va = BlankClip(v371, audio_rate = 48000, channels = 2).killVideo
v371 = v371.audioDub(va)

return v371.Prefetch


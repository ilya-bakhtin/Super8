import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v40 = LSMASHVideoSource(dst_dir + "v40rc.mp4")

v40 = v40.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v40 = v40.convertToYV12(interlaced=false)

v40 = v40.UnsharpMask(strength=500, radius=5, threshold=1)
v40 = v40.adjustBorders

va = BlankClip(v40, audio_rate = 48000, channels = 2).killVideo
v40 = v40.audioDub(va)

return v40.Prefetch


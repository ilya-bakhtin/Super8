import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v356 = LSMASHVideoSource(dst_dir + "v356rc.mp4")

v356 = v356.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v356 = v356.convertToYV12(interlaced=false)

v356 = v356.UnsharpMask(strength=500, radius=5, threshold=1)
v356 = v356.adjustBorders

va = BlankClip(v356, audio_rate = 48000, channels = 2).killVideo
v356 = v356.audioDub(va)

return v356.Prefetch


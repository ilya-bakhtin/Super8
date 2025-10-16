import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v201 = LSMASHVideoSource(dst_dir + "v201rc.mp4")

v201 = v201.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v201 = v201.convertToYV12(interlaced=false)

v201 = v201.UnsharpMask(strength=500, radius=5, threshold=1)
v201 = v201.adjustBorders

va = BlankClip(v201, audio_rate = 48000, channels = 2).killVideo
v201 = v201.audioDub(va)

return v201.Prefetch


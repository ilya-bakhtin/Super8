import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v193 = LSMASHVideoSource(dst_dir + "v193rc.mp4")

v193 = v193.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v193 = v193.convertToYV12(interlaced=false)

v193 = v193.UnsharpMask(strength=500, radius=5, threshold=1)
v193 = v193.adjustBorders

va = BlankClip(v193, audio_rate = 48000, channels = 2).killVideo
v193 = v193.audioDub(va)

return v193.Prefetch


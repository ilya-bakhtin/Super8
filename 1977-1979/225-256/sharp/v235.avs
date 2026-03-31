import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v235 = LSMASHVideoSource(dst_dir + "v235rc.mp4")

v235 = v235.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v235 = v235.convertToYV12(interlaced=false)

v235 = v235.UnsharpMask(strength=500, radius=5, threshold=1)
v235 = v235.adjustBorders

va = BlankClip(v235, audio_rate = 48000, channels = 2).killVideo
v235 = v235.audioDub(va)

return v235.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v177 = LSMASHVideoSource(dst_dir + "v177rc.mp4")

v177 = v177.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v177 = v177.convertToYV12(interlaced=false)

v177 = v177.UnsharpMask(strength=500, radius=5, threshold=1)
v177 = v177.adjustBorders

va = BlankClip(v177, audio_rate = 48000, channels = 2).killVideo
v177 = v177.audioDub(va)

return v177.Prefetch


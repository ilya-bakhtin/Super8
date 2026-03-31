import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v228 = LSMASHVideoSource(dst_dir + "v228rc.mp4")

v228 = v228.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v228 = v228.convertToYV12(interlaced=false)

v228 = v228.UnsharpMask(strength=500, radius=5, threshold=1)
v228 = v228.adjustBorders

va = BlankClip(v228, audio_rate = 48000, channels = 2).killVideo
v228 = v228.audioDub(va)

return v228.Prefetch


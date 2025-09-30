import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v181 = LSMASHVideoSource(dst_dir + "v181rc.mp4")

v181 = v181.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v181 = v181.convertToYV12(interlaced=false)

v181 = v181.UnsharpMask(strength=500, radius=5, threshold=1)
v181 = v181.adjustBorders

va = BlankClip(v181, audio_rate = 48000, channels = 2).killVideo
v181 = v181.audioDub(va)

return v181.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v271 = LSMASHVideoSource(dst_dir + "v271rc.mp4")

v271 = v271.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v271 = v271.convertToYV12(interlaced=false)

v271 = v271.UnsharpMask(strength=500, radius=5, threshold=1)
v271 = v271.adjustBorders

va = BlankClip(v271, audio_rate = 48000, channels = 2).killVideo
v271 = v271.audioDub(va)

return v271.Prefetch


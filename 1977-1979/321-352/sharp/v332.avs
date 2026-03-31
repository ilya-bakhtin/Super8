import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v332 = LSMASHVideoSource(dst_dir + "v332rc.mp4")

v332 = v332.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v332 = v332.convertToYV12(interlaced=false)

v332 = v332.UnsharpMask(strength=500, radius=5, threshold=1)
v332 = v332.adjustBorders

va = BlankClip(v332, audio_rate = 48000, channels = 2).killVideo
v332 = v332.audioDub(va)

return v332.Prefetch


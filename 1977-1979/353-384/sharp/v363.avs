import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v363 = LSMASHVideoSource(dst_dir + "v363rc.mp4")

v363 = v363.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v363 = v363.convertToYV12(interlaced=false)

v363 = v363.UnsharpMask(strength=500, radius=5, threshold=1)
v363 = v363.adjustBorders

va = BlankClip(v363, audio_rate = 48000, channels = 2).killVideo
v363 = v363.audioDub(va)

return v363.Prefetch


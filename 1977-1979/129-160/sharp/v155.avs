import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v155 = LSMASHVideoSource(dst_dir + "v155rc.mp4")

v155 = v155.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v155 = v155.convertToYV12(interlaced=false)

v155 = v155.UnsharpMask(strength=500, radius=5, threshold=1)
v155 = v155.adjustBorders

va = BlankClip(v155, audio_rate = 48000, channels = 2).killVideo
v155 = v155.audioDub(va)

return v155.Prefetch


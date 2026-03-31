import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v230 = LSMASHVideoSource(dst_dir + "v230rc.mp4")

v230 = v230.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v230 = v230.convertToYV12(interlaced=false)

v230 = v230.UnsharpMask(strength=500, radius=5, threshold=1)
v230 = v230.adjustBorders

va = BlankClip(v230, audio_rate = 48000, channels = 2).killVideo
v230 = v230.audioDub(va)

return v230.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v355 = LSMASHVideoSource(dst_dir + "v355rc.mp4")

v355 = v355.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v355 = v355.convertToYV12(interlaced=false)

v355 = v355.UnsharpMask(strength=500, radius=5, threshold=1)
v355 = v355.adjustBorders

va = BlankClip(v355, audio_rate = 48000, channels = 2).killVideo
v355 = v355.audioDub(va)

return v355.Prefetch


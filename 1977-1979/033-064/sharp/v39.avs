import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v39 = LSMASHVideoSource(dst_dir + "v39rc.mp4")

v39 = v39.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v39 = v39.convertToYV12(interlaced=false)

v39 = v39.UnsharpMask(strength=500, radius=5, threshold=1)
v39 = v39.adjustBorders

va = BlankClip(v39, audio_rate = 48000, channels = 2).killVideo
v39 = v39.audioDub(va)

return v39.Prefetch


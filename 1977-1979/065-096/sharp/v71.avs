import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v71 = LSMASHVideoSource(dst_dir + "v71rc.mp4")

v71 = v71.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v71 = v71.convertToYV12(interlaced=false)

v71 = v71.UnsharpMask(strength=500, radius=5, threshold=1)
v71 = v71.adjustBorders

va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

return v71.Prefetch


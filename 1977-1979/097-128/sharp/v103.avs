import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v103 = LSMASHVideoSource(dst_dir + "v103rc.mp4")

v103 = v103.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v103 = v103.convertToYV12(interlaced=false)

v103 = v103.UnsharpMask(strength=500, radius=5, threshold=1)
v103 = v103.adjustBorders

va = BlankClip(v103, audio_rate = 48000, channels = 2).killVideo
v103 = v103.audioDub(va)

return v103.Prefetch


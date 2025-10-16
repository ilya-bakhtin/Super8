import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v211 = LSMASHVideoSource(dst_dir + "v211rc.mp4")

v211 = v211.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v211 = v211.convertToYV12(interlaced=false)

v211 = v211.UnsharpMask(strength=500, radius=5, threshold=1)
v211 = v211.adjustBorders

va = BlankClip(v211, audio_rate = 48000, channels = 2).killVideo
v211 = v211.audioDub(va)

return v211.Prefetch


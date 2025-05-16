import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v116 = LSMASHVideoSource(dst_dir + "v116rc.mp4")

v116 = v116.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v116 = v116.convertToYV12(interlaced=false)

v116 = v116.UnsharpMask(strength=500, radius=5, threshold=1)
v116 = v116.adjustBorders

va = BlankClip(v116, audio_rate = 48000, channels = 2).killVideo
v116 = v116.audioDub(va)

return v116.Prefetch


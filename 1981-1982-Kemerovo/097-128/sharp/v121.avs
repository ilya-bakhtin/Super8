import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v121 = LSMASHVideoSource(dst_dir + "v121rc.mp4")

v121 = v121.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v121 = v121.convertToYV12(interlaced=false)

v121 = v121.UnsharpMask(strength=500, radius=5, threshold=1)
v121 = v121.adjustBorders

va = BlankClip(v121, audio_rate = 48000, channels = 2).killVideo
v121 = v121.audioDub(va)

return v121.Prefetch


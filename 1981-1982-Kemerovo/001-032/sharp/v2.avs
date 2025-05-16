import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v2 = LSMASHVideoSource(dst_dir + "v2rc.mp4")

v2 = v2.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v2 = v2.convertToYV12(interlaced=false)

v2 = v2.UnsharpMask(strength=500, radius=5, threshold=1)
v2 = v2.adjustBorders

va = BlankClip(v2, audio_rate = 48000, channels = 2).killVideo
v2 = v2.audioDub(va)

return v2.Prefetch


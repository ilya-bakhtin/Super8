import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v84 = LSMASHVideoSource(dst_dir + "v84rc.mp4")

v84 = v84.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v84 = v84.convertToYV12(interlaced=false)

v84 = v84.UnsharpMask(strength=500, radius=5, threshold=1)
v84 = v84.adjustBorders

va = BlankClip(v84, audio_rate = 48000, channels = 2).killVideo
v84 = v84.audioDub(va)

return v84.Prefetch


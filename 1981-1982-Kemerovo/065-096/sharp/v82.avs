import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v82 = LSMASHVideoSource(dst_dir + "v82rc.mp4")

v82 = v82.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v82 = v82.convertToYV12(interlaced=false)

v82 = v82.UnsharpMask(strength=500, radius=5, threshold=1)
v82 = v82.adjustBorders

va = BlankClip(v82, audio_rate = 48000, channels = 2).killVideo
v82 = v82.audioDub(va)

return v82.Prefetch


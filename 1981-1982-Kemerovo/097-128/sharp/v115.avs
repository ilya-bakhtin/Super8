import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v115 = LSMASHVideoSource(dst_dir + "v115rc.mp4")

v115 = v115.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v115 = v115.convertToYV12(interlaced=false)

v115 = v115.UnsharpMask(strength=500, radius=5, threshold=1)
v115 = v115.adjustBorders

va = BlankClip(v115, audio_rate = 48000, channels = 2).killVideo
v115 = v115.audioDub(va)

return v115.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v109 = LSMASHVideoSource(dst_dir + "v109rc.mp4")

v109 = v109.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v109 = v109.convertToYV12(interlaced=false)

v109 = v109.UnsharpMask(strength=500, radius=5, threshold=1)
v109 = v109.adjustBorders

va = BlankClip(v109, audio_rate = 48000, channels = 2).killVideo
v109 = v109.audioDub(va)

return v109.Prefetch


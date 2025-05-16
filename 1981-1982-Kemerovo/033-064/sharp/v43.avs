import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v43 = LSMASHVideoSource(dst_dir + "v43rc.mp4")

v43 = v43.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v43 = v43.convertToYV12(interlaced=false)

v43 = v43.UnsharpMask(strength=500, radius=5, threshold=1)
v43 = v43.adjustBorders

va = BlankClip(v43, audio_rate = 48000, channels = 2).killVideo
v43 = v43.audioDub(va)

return v43.Prefetch


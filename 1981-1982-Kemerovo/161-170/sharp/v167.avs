import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v167 = LSMASHVideoSource(dst_dir + "v167rc.mp4")

v167 = v167.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v167 = v167.convertToYV12(interlaced=false)

v167 = v167.UnsharpMask(strength=500, radius=5, threshold=1)
v167 = v167.adjustBorders

va = BlankClip(v167, audio_rate = 48000, channels = 2).killVideo
v167 = v167.audioDub(va)

return v167.Prefetch


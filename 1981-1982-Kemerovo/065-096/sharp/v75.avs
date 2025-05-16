import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v75 = LSMASHVideoSource(dst_dir + "v75rc.mp4")

v75 = v75.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v75 = v75.convertToYV12(interlaced=false)

v75 = v75.UnsharpMask(strength=500, radius=5, threshold=1)
v75 = v75.adjustBorders

va = BlankClip(v75, audio_rate = 48000, channels = 2).killVideo
v75 = v75.audioDub(va)

return v75.Prefetch


import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v163 = LSMASHVideoSource(dst_dir + "v163rc.mp4")

v163 = v163.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v163 = v163.convertToYV12(interlaced=false)

v163 = v163.UnsharpMask(strength=500, radius=5, threshold=1)
v163 = v163.adjustBorders

va = BlankClip(v163, audio_rate = 48000, channels = 2).killVideo
v163 = v163.audioDub(va)

return v163.Prefetch


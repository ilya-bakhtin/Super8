import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v320 = LSMASHVideoSource(dst_dir + "v320rc.mp4")

v320 = v320.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v320 = v320.convertToYV12(interlaced=false)

v320 = v320.UnsharpMask(strength=500, radius=5, threshold=1)
v320 = v320.adjustBorders

va = BlankClip(v320, audio_rate = 48000, channels = 2).killVideo
v320 = v320.audioDub(va)

return v320.Prefetch


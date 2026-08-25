import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v379 = LSMASHVideoSource(dst_dir + "v379rc.mp4")

v379 = v379.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v379 = v379.convertToYV12(interlaced=false)

v379 = v379.UnsharpMask(strength=500, radius=5, threshold=1)
v379 = v379.adjustBorders

va = BlankClip(v379, audio_rate = 48000, channels = 2).killVideo
v379 = v379.audioDub(va)

return v379.Prefetch


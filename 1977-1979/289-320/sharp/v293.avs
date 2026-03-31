import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v293 = LSMASHVideoSource(dst_dir + "v293rc.mp4")

v293 = v293.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v293 = v293.convertToYV12(interlaced=false)

v293 = v293.UnsharpMask(strength=500, radius=5, threshold=1)
v293 = v293.adjustBorders

va = BlankClip(v293, audio_rate = 48000, channels = 2).killVideo
v293 = v293.audioDub(va)

return v293.Prefetch

